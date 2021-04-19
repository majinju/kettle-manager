package com.iflytek.qb.yxjk;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.pentaho.di.trans.TransMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.JsonResult;
import com.iflytek.qb.util.StringUtil;

public class Fwqjk extends YxjkRunBase{
	private static final String PARAM_TIMEOUT = "超时时长";
	private static final String PARAM_PINGTIMES = "请求次数";
	private static final String SQL_QUERYFWQ = "查询服务器的配置信息sql";
	
	@Override
	public JsonResult test(Object[] outputRow) {
		String jtrw = outputRow[getFieldIndex(JKRW_JTRW)].toString();
		String rwdj = outputRow[getFieldIndex(JKRW_RWDJ)].toString();
		JSONObject obj = YxjkInit.jkdb.findFirst(configInfo.getString(SQL_QUERYFWQ), jtrw);
		String ip = obj.getString("ip");
		if(StringUtil.isNotBlank(ip)){
			boolean state = ping(ip,configInfo.getInteger(PARAM_PINGTIMES),configInfo.getInteger(PARAM_TIMEOUT));
			if(!state){
				return JsonResult.error("监测到IP："+ip+" 网络不通", obj, rwdj);
			}
		}else{
			return JsonResult.error("服务器监控"+outputRow[getFieldIndex(JKRW_RWMC)].toString()+"中服务器IP地址未配置！", obj, rwdj);
		}
		return JsonResult.success("",obj);
	}
	
	/**
	 * 能否ping通IP地址
	 * @param server IP地址
	 * @param timeout 超时时长
	 * @return true能ping通
	 */
	public boolean pingServer(String server, int timeout) {
       BufferedReader in = null;
       Runtime r = Runtime.getRuntime();
       String pingCommand = "ping " + server + " -n 1 -w " + timeout;
       try {
           Process p = r.exec(pingCommand);
           if (p == null) {
               return false;
           }
           in = new BufferedReader(new InputStreamReader(p.getInputStream()));
           String line = null;
           while ((line = in.readLine()) != null) {
               if (line.startsWith("Reply from")) {
                   return true;
               }
           }
       } catch (Exception ex) {
           ex.printStackTrace();
           return false;
       } finally {
           try {
               in.close();
           } catch (IOException e) {
               e.printStackTrace();
           }
       }
       return false;
	}
	
	/**
	 * ping服务器
	 * @param ipAddress ip地址
	 * @param pingTimes 请求次数
	 * @param timeOut 超时时长
	 * @return
	 */
	public boolean ping(String ipAddress, int pingTimes, int timeOut) {
        BufferedReader in = null;  
        Runtime r = Runtime.getRuntime();  // 将要执行的ping命令,此命令是windows格式的命令  
        String osName = System.getProperty("os.name");//获取操作系统类型
        String pingCommand = "";
        if(osName.toLowerCase().contains("linux")){
        	pingCommand = "ping -c " + pingTimes + " -i 0" + ipAddress;
        }else{ 
        	pingCommand = "ping " + ipAddress + " -n " + pingTimes + " -w " + timeOut; 
        }
        //String pingCommand = "ping " + ipAddress + " -n " + pingTimes    + " -w " + timeOut;  
        try {   // 执行命令并获取输出  
            Process p = r.exec(pingCommand);   
            if (p == null) {    
                return false;   
            }
            // 逐行检查输出,计算类似出现=23ms TTL=62字样的次数  
            in = new BufferedReader(new InputStreamReader(p.getInputStream()));
            int connectedCount = 0;   
            String line = null;   
            while ((line = in.readLine()) != null) {
                connectedCount += getCheckResult(line);   
            }   
            // 如果出现类似=23ms TTL=62这样的字样,出现的次数=测试次数则返回真  
            return connectedCount == pingTimes;  
        } catch (Exception ex) {
        	// 出现异常则返回假  
            ex.printStackTrace();   
            return false;  
        } finally {   
            try {    
                in.close();   
            } catch (IOException e) {    
                e.printStackTrace();   
            }  
        }
    }
	
    //若line含有=18ms TTL=16字样,说明已经ping通,返回1,否則返回0.
    private int getCheckResult(String line) {
        Pattern pattern = Pattern.compile("(\\d+ms)(\\s+)(TTL=\\d+)", Pattern.CASE_INSENSITIVE);  
        Matcher matcher = pattern.matcher(line);  
        while (matcher.find()) {
            return 1;
        }
        return 0; 
    }


	@Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        params.put(PARAM_TIMEOUT, "2000");
        params.put(PARAM_PINGTIMES, "50");
        params.put(SQL_QUERYFWQ, "select * from SYS_QX_FWQ where id = ? ");
		return JSON.toJSONString(params, true);
	}

}
