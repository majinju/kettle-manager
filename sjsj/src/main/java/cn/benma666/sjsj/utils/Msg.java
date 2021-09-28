package cn.benma666.sjsj.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Locale;

/**
 * 国际化工具
 */
@Component
public class Msg {
    private final MessageSource messageSource;

    private static MessageSource staticMessageSource;

    public Msg(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @PostConstruct
    public void init() {
        Msg.staticMessageSource = messageSource;
    }

    /**
     * 对消息进行国际化
     * @param messageKey 消息键
     * @param params 参数
     * @return 国际化消息
     */
    public static String msg(String messageKey, Object... params) {
        Locale locale = LocaleContextHolder.getLocale();
        return staticMessageSource.getMessage(messageKey, params, locale);
    }
}
