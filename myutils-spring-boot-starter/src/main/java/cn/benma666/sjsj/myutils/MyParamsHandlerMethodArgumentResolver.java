package cn.benma666.sjsj.myutils;

import cn.benma666.iframe.MyParams;
import cn.benma666.sjsj.web.LjqInterface;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * 结合MyParams的注解
 */
public class MyParamsHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

    /**
     * 判断是否支持
     * @param parameter
     * @return
     */
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(MyParams.class)
                && parameter.hasParameterAnnotation(AMyParams.class);
    }

    /**
     * 进行处理
     * @param parameter
     * @param mavContainer
     * @param webRequest
     * @param binderFactory
     * @return
     * @throws Exception
     */
    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
                                  NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        return webRequest.getAttribute(LjqInterface.MY_PARAMS, RequestAttributes.SCOPE_REQUEST);
    }
}
