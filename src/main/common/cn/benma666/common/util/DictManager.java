
package cn.benma666.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.benma666.common.iframe.BasicObject;
import cn.benma666.db.Db;
import cn.benma666.myutils.PageInfo;

import com.alibaba.fastjson.JSONObject;

/**
 * 字典管理 <br/>
 * date: 2016年6月12日 <br/>
 * @author jingma
 * @version 
 */
public class DictManager extends BasicObject{
    
    private static Log log = LogFactory.getLog(DictManager.class);
    
    /**
    * 字典缓存
    */
    private static Map<String,List<JSONObject>> dictCache = new HashMap<String, List<JSONObject>>();
    
    /**
     * Creates a new instance of DictManager.
     */
    public DictManager() {
    }
    
    /**
    * 初始化 <br/>
    * @author jingma
    */
    public void init(){
    	//人工清理缓存，不需要自动清理
//    	timingClearDict();
    }
    
    /**
    * 定时清理字典缓存 <br/>
    * @author jingma
    */
    public static void timingClearDict(){
        new Thread(new Runnable() {
            public void run() {
                while(true){
                	clearDict();
                    try {
                        Thread.sleep(30*60*1000);
                    } catch (InterruptedException e) {
                        log.info("清理字典缓存等待失败", e);
                    }
                }
            }
        }).start();
    }
    /**
    * 清理字典缓存 <br/>
    * @author jingma
    */
    public static void clearDict(){
        dictCache.clear();
    }
    /**
    * 清理字典缓存-按字典类别清理 <br/>
    * @author jingma
    */
    public static void clearDict(String zdlb){
        dictCache.remove(zdlb);
    }

    /**
    * 根据字典类别得到该类别字典的查询SQL <br/>
    * @author jingma
    * @param zdlb 字典类别
    * @return 该类别字典的查询SQL
    */
    public static JSONObject zdlbToSql(String zdlb) {
        String defaultVal = "select dm,mc,px,ms||jp||qp as search_key from t_sys_zd_tyzd where zdlb='"
                +zdlb+"' and isdel='"+UtilConst.WHETHER_FALSE+"'";
        String result = zdlb;
        JSONObject zdlbObj = new JSONObject();
        //如果不是select开头的，则判断为使用同一字典方式。
        if(StringUtil.isNotBlank(zdlb)&&!zdlb.toLowerCase().startsWith("select")){
            try {
                zdlbObj = db.findFirst(
                        "select lbsql,cache from t_sys_zd_tyzd t "
                        + "where t.zdlb='ZDLB' and isdel=? and t.dm=?", 
                        new Object[]{UtilConst.WHETHER_FALSE, zdlb});
                String lbsql = zdlbObj.getString("lbsql");
                if(lbsql==null||StringUtil.isBlank(lbsql.toString())){
                    result = defaultVal;
                }else{
                    result = lbsql.toString();
                }
            } catch (Exception e) {
                log.debug("获取类别的sql失败:"+zdlb, e);
                //解析中报错时，采用默认查询语句
                result = defaultVal;
            }
        }
        zdlbObj.put("lbsql", result);
        return zdlbObj;
    }

    /**
     * 获取字典列表 <br/>
     * @author jingma
     * @param zdlb 字典类别
     * @return 字典列表
     */
    public static List<JSONObject> zdList(String zdlb){
        List<JSONObject> result = dictCache.get(zdlb);
        result = commonZdList(zdlb, result);
        return result;
    }


    /**
     * 根据以前的zdList 抽取方法 以前的zdList 保持原来逻辑不变
     * @param zdlb 字典类别
     * @param result List
     * @return List
     */
    private static List<JSONObject> commonZdList(String zdlb, List<JSONObject> result) {
        if(result==null){
            JSONObject zdlbObj = zdlbToSql(zdlb);
            String expStr = zdlbObj.getString("lbsql");
            String[] exps = parseDictExp(expStr);
            result = Db.use(exps[1]).find(
                    "select * from ("+exps[0]+") order by px,dm");
            if (zdlbObj.getBooleanValue("cache")) {
                dictCache.put(zdlb, result);
            }
        }
        return result;
    }

    /**
    * 获取字典值 <br/>
    * @author jingma
    * @param zdlb 字典类别
    * @param dm 键
    * @return 值
    */
    public static String zdMcByDm(String zdlb,String dm){
        List<JSONObject> list = zdList(zdlb);
        for(JSONObject zdObj:list){
            if(dm.equals(zdObj.get("dm"))){
                return zdObj.get("mc").toString();
            }
        }
        return dm;
    }

    /**
     * 获取字典值 采用otherParam过滤结果 主要是为了处理dm 在list集合中不唯一的bug
     * otherParam参数暂时支持传递一个参数 如果需要处理多个参数请修改下面方法的逻辑
     *
     * @author xuanyang
     * @param zdlb 字典类别
     * @param dm 代码
     * @param otherParam 其他参数 格式 key=value  eg: sjdx=zhcxtest
     *
     * @return 值
     */
    public static String zdMcByDm(String zdlb, String dm, String otherParam){
        List<JSONObject> list = zdList(zdlb);
        for(JSONObject zdObj:list){
            if(dm.equals(zdObj.get("dm"))){
                return zdObj.get("mc").toString();
            }
        }
        return dm;
    }

    /**
     * 根据字典值获取代码
     * @author junli15
     * @param zdlb 字典类别
     * @param mc 值
     * @return 值
     */
     public static String zdDmByMc(String zdlb,String mc){
         List<JSONObject> list = zdList(zdlb);
         for(JSONObject zdObj:list){
             if(mc.equals(zdObj.get("mc"))){
                 return zdObj.get("dm").toString();
             }
         }
         return mc;
     }
    
    /**
     * 获取字典值,其中dm用逗号隔开 <br/>
     * @author jingma
     * @param zdlb 字典类别
     * @param dm 键
     * @return 值
     */
     public static String zdMcByMoreDm(String zdlb,String dm){
         List<JSONObject> list = zdList(zdlb);
         if(StringUtils.isNotEmpty(dm)){
        	   String[] strings = dm.split(",");
               String mc = "";
               for(int i=0;i<strings.length;i++){
              	 for(JSONObject zdObj:list){
                       if(strings[i].equals(zdObj.get("dm"))){
                      	 if("".equals(mc)){
                      		 mc = zdObj.get("mc").toString();
                      	 }else{
                      		 mc += "," + zdObj.get("mc").toString();
                      	 }
                       }
                   }
               }
               if("".equals(mc)){
              	 mc = dm;
               }
               return mc;
         }
         return "";
     }
    
    /**
    * 字典搜索 <br/>
    * @author jingma
    * @param page
    * @param zdlb
    * @param searchKey
    * @return
    */
    public static PageInfo<JSONObject> zdSearch(PageInfo<JSONObject> page,JSONObject t){
    	String zdlb = t.getJSONObject("map").getString("zdlb");
    	String searchKey = t.getJSONObject("map").getString("searchKey");
    	String otherParam = t.getJSONObject("map").getString("otherParam");

        JSONObject zdlbObj = zdlbToSql(zdlb);
        String expStr = zdlbObj.getString("lbsql");
        String[] exps = parseDictExp(expStr);
        String sql = "select * from ("+exps[0]+") t where lower(dm||mc||search_key) like ?";
    	if(StringUtil.isNotBlank(otherParam)){
    		sql += " and "+otherParam;
    	}
    	sql += " order by px,dm";
        page = Db.use(exps[1]).queryPage(page, sql.toString(),
                new Object[]{StringUtil.buildDBLike(searchKey).toLowerCase()});
        return page;
    }

    /**
    * 解析字典sql字符串 <br/>
    * @author jingma
    * @param exp
    * @return 0:sql,1:ds
    */
    public static String[] parseDictExp(String exp){
        if(StringUtil.isBlank(exp)){
            return null;
        }
        String[] result = new String[2];
        String[] strs = exp.split(";");
        result[0] = strs[0];
        if(strs.length>1){
            result[1] = strs[1].substring(3);
        }else{
            result[1] = "default";
        }
        return result;
    }

    /**
    * 列表转Map <br/>
    * @author jingma
    * @param list 列表
    * @param keyName key字段名称
    * @return
    */
    @SuppressWarnings("rawtypes")
    public static <T extends Map> Map<String,T> listToMap(List<T> list,String keyName){
        Map<String,T> result = new HashMap<String, T>();
        for(T jo:list){
            result.put(jo.get(keyName).toString(), jo);
        }
        return result;
    }
    
}
