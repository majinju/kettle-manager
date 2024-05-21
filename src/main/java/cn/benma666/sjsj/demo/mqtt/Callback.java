package cn.benma666.sjsj.demo.mqtt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;

/**
 * 常规MQTT回调函数
 *
 * @author Mr.Qu
 * @since 2020/1/9 16:26
 */
@Slf4j
public class Callback implements MqttCallback {

    /**
     * MQTT 断开连接会执行此方法
     */
    @Override
    public void connectionLost(Throwable throwable) {
        log.info("断开了MQTT连接 ：{}", throwable.getMessage());
        log.error(throwable.getMessage(), throwable);
    }

    /**
     * publish发布成功后会执行到这里
     */
    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        log.info("发布消息成功");
    }

    /**
     * subscribe订阅后得到的消息会执行到这里
     */
    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        //  TODO    此处可以将订阅得到的消息进行业务处理、数据存储
        log.info("收到来自 " + topic + " 的消息：{}", new String(message.getPayload()));

        String msg = new String(message.getPayload());
        try {
            JSONObject jsonObject = JSON.parseObject(msg);
            String clientId = String.valueOf(jsonObject.get("clientid"));
            if (topic.endsWith("disconnected")) {
                log.info("客户端已掉线：{}",clientId);
            } else {
                log.info("客户端已上线：{}",clientId);
            }
        } catch (JSONException e) {
            log.error("JSON Format Parsing Exception : {}", msg);
        }

    }
}
