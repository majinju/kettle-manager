package cn.benma666.common.service;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {
    @Override
    public void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
        //webSocket连接使用url
        stompEndpointRegistry.addEndpoint("/myws/server").setAllowedOrigins("*").withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        //向客户端发送信息时，destination的前缀必须是配置中的topic和testtp
        config.enableSimpleBroker("/topic","/testtp");
        //客户端向服务端发起请求时，必须以myws为前缀
        config.setApplicationDestinationPrefixes("/myws");
        //服务器向客户端发起一对一信息时，必须以touser为前缀
        config.setUserDestinationPrefix("/touser/");
    }
}