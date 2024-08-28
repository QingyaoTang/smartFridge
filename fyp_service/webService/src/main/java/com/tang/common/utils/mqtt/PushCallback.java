package com.tang.common.utils.mqtt;

import com.alibaba.fastjson2.JSONObject;
import com.tang.appservice.domain.FoodInfo;
import com.tang.appservice.service.IFoodInfoService;
import com.tang.common.config.MqttConfig;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class PushCallback implements MqttCallback {
    private static final Logger logger = LoggerFactory.getLogger(MqttPushClient.class);

    @Autowired
    private MqttConfig mqttConfig;

    @Autowired
    private IFoodInfoService foodInfoService;
    private static MqttClient client;

    private static String _topic;
    private static String _qos;
    private static String _msg;

    @Override
    public void connectionLost(Throwable throwable) {
        // 连接丢失后，一般在这里面进行重连
        logger.info("connect lost");
        if (client == null || !client.isConnected()) {
            mqttConfig.getMqttPushClient();
        }
    }

    @Override
    public void messageArrived(String topic, MqttMessage mqttMessage) throws Exception {
        // subscribe后得到的消息会执行到这里面
        logger.info("topic : " + topic);
        logger.info("qos : " + mqttMessage.getQos());
        logger.info("msg : " + new String(mqttMessage.getPayload()));

        _topic = topic;
        _qos = mqttMessage.getQos()+"";
        _msg = new String(mqttMessage.getPayload());

        if ("addFood".equals(topic)) {
            addFood(_msg);
        }

    }

    private void addFood(String msg) {
        // parse JSON string
        JSONObject jsonObject = JSONObject.parseObject(msg);
        FoodInfo foodInfo = new FoodInfo();
        try {
            String foodName = jsonObject.getString("product_name");
            String quality_time = jsonObject.getString("best_date");
            foodInfo.setFoodName(foodName);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(quality_time);
            foodInfo.setQualityTime(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        logger.info("receive msg : " + new String(foodInfo.toString()));
        foodInfo.setCreateBy("mqtt");
        foodInfoService.insertFoodInfo(foodInfo);
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        logger.info("deliveryComplete---------" + iMqttDeliveryToken.isComplete());
    }

    //别的Controller层会调用这个方法来  获取  接收到的硬件数据
    public String receive() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("topic", _topic);
        jsonObject.put("qos", _qos);
        jsonObject.put("msg", _msg);
        return jsonObject.toString();
    }

}
