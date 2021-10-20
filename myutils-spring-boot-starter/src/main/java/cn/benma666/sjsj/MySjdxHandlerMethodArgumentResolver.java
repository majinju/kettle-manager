package cn.benma666.sjsj;

import cn.benma666.domain.SysSjglSjdx;
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
public class MySjdxHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

    /**
     * 判断是否支持
     * @param parameter
     * @return
     */
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(SysSjglSjdx.class)
                && parameter.hasParameterAnnotation(MySjdx.class);
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
        return  (SysSjglSjdx) webRequest.getAttribute(LjqInterface.KEY_SJDX, RequestAttributes.SCOPE_REQUEST);
    }
}
