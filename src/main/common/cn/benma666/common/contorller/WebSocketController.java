package cn.benma666.common.contorller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.benma666.common.service.WebSocketService;
import cn.benma666.myutils.JsonResult;
import cn.benma666.web.BasicController;

/**
* 通用 <br/>
* date: 2018年12月3日 <br/>
* @author jingma
* @version 
*/
//@Controller
//@RequestMapping(value="/ws")
public class WebSocketController extends BasicController {
    @Autowired
    private WebSocketService webSocketService;
    /**
     * 文本消息发送模板
     */
    private SimpMessageSendingOperations template;
    
    public WebSocketController(SimpMessageSendingOperations  template) {
        this.template = template;
    }

    @Autowired  
    public WebSocketController(SimpMessagingTemplate template) {  
        this.template = template;  
    }  
    @SubscribeMapping("/getStatus")
    public String getStatus(@RequestParam String msg) {
        return msg;
    }

    @MessageMapping("/init")
    @SendTo("/topic/init")
    public JsonResult init(@RequestParam String msg) {
//        template.convertAndSend("/topic/init",error("测试失败"));
        return success("测试init");
    }

    @MessageMapping("/init1")
    @SendTo("/topic/init1")
    public JsonResult init1(Principal p,@RequestParam String msg) {
        template.convertAndSend("/topic/init",error("测试失败1"));
        return success("测试init1");
    }
    
    @MessageMapping("/hello")  
    @SendTo("/topic/hello")  
    public String greeting(String message) throws Exception {  
        return message;  
    }  
  
    @MessageMapping("/message")  
    @SendToUser("/message")  
    public String userMessage(String userMessage) throws Exception {  
        return "s1:"+userMessage;  
    }  
    @Override
    public String getFModulePath() {
        return "";
    }
    @Override
    public String getModulePath() {
        return "ws";
    }

}
