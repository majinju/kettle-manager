package cn.benma666.contorller.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.common.service.SjdxService;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.BasicObject;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.JsonUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.web.SConf;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

/**
* 通用 <br/>
* date: 2018年12月3日 <br/>
* @author jingma
* @version 
*/
@Controller
public class IndexController extends BasicObject{
    @Autowired
    private SjdxService sjdxService;

    private JSONObject myParams;
    private SysSjglSjdx dbSjdx;
    /**
    * 获取数据 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/getdata.do")
    public void getdata(HttpServletRequest request,HttpServletResponse response) {
        try {
            JsonResult r = basicJcxx(request);
            if(!r.isStatus()){
                WebUtil.sendJson(response, r);
            }
            WebUtil.sendJson(response, sjdxService.getdata(dbSjdx,myParams));
        } catch (Throwable e) {
            log.error("数据处理异常", e);
            WebUtil.sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 执行操作 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/plcl.do")
    public void plcl(HttpServletRequest request,HttpServletResponse response) {
        try {
            JsonResult r = basicJcxx(request);
            if(!r.isStatus()){
                WebUtil.sendJson(response, r);
            }
            WebUtil.sendJson(response, sjdxService.txPlcl(dbSjdx,myParams));
        } catch (Throwable e) {
            log.error("数据处理异常", e);
            WebUtil.sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 执行操作 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/getfile.do")
    public void getfile(HttpServletRequest request,HttpServletResponse response) {
        try {
            JsonResult r = basicJcxx(request);
            if(!r.isStatus()){
                WebUtil.sendJson(response, r);
            }
            //后台还是走批量处理接口
            r = sjdxService.txPlcl(dbSjdx,myParams);
            if(r.isStatus()){
                JSONObject data = (JSONObject) r.getData();
                WebUtil.sendBytes(response, data.getBytes(LjqInterface.KEY_FILE_BYTES),
                        (SysSjglFile) data.get(LjqInterface.KEY_FILE_OBJ));
            }else{
                WebUtil.sendJson(response, r);
            }
        } catch (Throwable e) {
            log.error("数据处理异常", e);
            WebUtil.sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 获取基础信息 <br/>
    * @author jingma
    * @param sjdx
    * @param myparams
    * @param request
     * @param response 
    * @param response 
    * @return 
     * @throws IOException 
     * @throws UnsupportedEncodingException 
    */
    protected JsonResult basicJcxx(HttpServletRequest request) throws UnsupportedEncodingException, IOException {
        JSONObject params = cscl(request);
        SysSjglSjdx sjdx = params.getJSONObject(LjqInterface.KEY_SJDX).toJavaObject(SysSjglSjdx.class);
        JsonResult result = LjqManager.jcxx(sjdx,params.getString(LjqInterface.KEY_YOBJ),request);
        if(result.isStatus()){
            myParams = (JSONObject)result.getData();
            dbSjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
        }
        return result;
    }

    /**
    * 参数处理 <br/>
    * @author jingma
    * @param request
    * @return
     * @throws IOException 
     * @throws UnsupportedEncodingException 
    */
    private JSONObject cscl(HttpServletRequest request) throws UnsupportedEncodingException, IOException {
        //json形式请求的参数处理
        JSONObject jsono = getJSONParam(request);
        if(jsono==null){
            //获取默认参数
            jsono = SConf.getKzxxObj("DEFAULT.qqmrcs");
        }else{
            //合并默认参数和请求参数
            jsono = JsonUtil.mergeJSONObjects(SConf.getKzxxObj("DEFAULT.qqmrcs"),jsono);
        }
        //合并以普通请求参数传入的参数
        Map<?, ?> pm = request.getParameterMap();
        for(Object pk:pm.keySet()){
            String[] va = (String[])pm.get(pk);
            if(va.length>0&&JSONPath.set(jsono, "$."+pk.toString(), va[0])){
                throw new MyException(pk.toString()+"参数设置失败："+JSON.toJSONString(va));
            }
        }
        //还应该合并公共参数和对象参数，不能无限制的允许前端出入任何参数，存在风险。
        return jsono;
    }
    /**
     * 功能描述:通过request来获取到json数据<br/>
     * @param request
     * @return
     * @throws IOException 
     * @throws UnsupportedEncodingException 
     */
    private JSONObject getJSONParam(HttpServletRequest request) throws UnsupportedEncodingException, IOException{
        JSONObject jsonParam = null;
            // 获取输入流
            BufferedReader streamReader = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
            // 写入数据到Stringbuilder
            StringBuilder sb = new StringBuilder();
            String line = null;
            while ((line = streamReader.readLine()) != null) {
                sb.append(line);
            }
            if(StringUtil.isNotBlank(sb.toString())){
                jsonParam = JSONObject.parseObject(sb.toString());
            }
        return jsonParam;
    }

}
