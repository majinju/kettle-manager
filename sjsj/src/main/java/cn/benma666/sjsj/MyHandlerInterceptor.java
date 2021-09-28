package cn.benma666.sjsj;

import cn.benma666.exception.MyException;
import cn.benma666.exception.QxException;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.WebUtil;
import cn.benma666.sjsj.utils.Msg;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjsj.web.LjqManager;
import cn.benma666.sjsj.web.UserManager;
import com.alibaba.druid.util.Utils;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

/**
 * 实现的参数处理等逻辑
 */
public class MyHandlerInterceptor extends BasicObject implements HandlerInterceptor {
    /**
     * 接收参数的JSON对象key
     */
    public static final String MY_PARAMS = "myParams";
    /**
     * 返回前端的对象Key
     */
    public static final String RETURN_BODY = "returnBody";

    /**
     * 控制器前执行
     *
     * @param request  请求
     * @param response 返回
     * @param handler  对应的控制器中的方法
     * @return 是否进入控制器
     * @throws Exception 初始化异常
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //自定义参数读取逻辑，支持json和普通参数混合传参
        JSONObject myParams = getJSONParam(request);
        Result r = success("预处理成功");
        try {
            LjqManager.jcxx(myParams);
            //设置参数传入控制层
            request.setAttribute(MY_PARAMS, myParams);
            request.setAttribute(LjqInterface.KEY_SJDX, myParams.get(LjqInterface.KEY_SJDX));
            //切换语言
            switchLanguage(request, myParams);
        } catch (QxException e) {
            r = failed(e.getMessage());
            r.setCode(e.getCode());
        } catch (MyException e) {
            //获取基础信息，返回失败信息
            r = failed(e.getMessage());
        } catch (Exception e) {
            //获取基础信息，返回失败信息
            r = failed("获取基础信息异常：" + e.getMessage());
            log.error(r.getMsg(), e);
        }
        if (r.isStatus()) {
            //继续进行控制器方法执行
            return true;
        } else {
            LjqManager.sendResult(response, myParams, r);
            return false;
        }
    }

    /**
     * 控制器后执行
     *
     * @param request      请求
     * @param response     返回
     * @param handler      选择要执行的处理程序，用于类型和/或实例计算
     * @param modelAndView 视图
     * @throws Exception 处理异常
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {
        //进行处理完成后的日志记录等操作
//        log.debug("返回内容：" + request.getAttribute(RETURN_BODY));
    }

    /**
     * 切换国际化语言
     *
     * @param request  请求
     * @param myParams 参数
     */
    private void switchLanguage(HttpServletRequest request, JSONObject myParams) {
        Object language = JSONPath.eval(myParams, "$.header.language");
        if (language != null) {
            request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME,
                    Locale.forLanguageTag(language.toString()));
            log.info(Msg.msg("switch.language", language));
        }
    }

    /**
     * 功能描述:通过request来获取到json数据<br/>
     *
     * @param request 请求对象
     * @return 请求参数JSONObject
     * @throws IOException 参数处理异常
     */
    private JSONObject getJSONParam(HttpServletRequest request) throws IOException {
        JSONObject myParams;
        //请求参数为json时
        if (MediaType.APPLICATION_JSON.equals(request.getContentType())) {
            // 获取输入流读取配置，与默认配置合并
            myParams = JSONObject.parseObject(Utils.read(request.getInputStream()));
        } else {
            myParams = new JSONObject();
        }
        //合并以普通请求参数传入的参数
        Map<String, String[]> pm = request.getParameterMap();
        for (String pk : pm.keySet()) {
            String[] va = pm.get(pk);
            if (va.length > 0) {
                if (!JSONPath.set(myParams, "$." + pk, va[0])) {
                    log.warn(pk + "参数设置失败：" + va[0]);
                }
            }
        }
        if (JSONPath.eval(myParams, LjqInterface.$_SYS_TOKEN) == null) {
            //常规参数中没有设置权限认证key
            JSONPath.set(myParams, LjqInterface.$_SYS_TOKEN, UserManager.getToken(request));
        }
        //设置客户端ip
        JSONPath.set(myParams, LjqInterface.$_SYS_CLIENT_IP, WebUtil.getIpAddr(request));
        //记录请求开始时间
        JSONPath.set(myParams, "$.sys.qqkssj", System.currentTimeMillis());
        return myParams;
    }
}
