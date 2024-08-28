package com.tang.appservice.ws;

import com.alibaba.fastjson2.JSON;
import com.tang.appservice.ws.entiy.Message;
import org.springframework.stereotype.Component;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author：tang
 */
@ServerEndpoint("/webSocket/{userId}")
@Component
public class WebSocketServer {

    // 静态变量，用来记录当前在线连接数。
    private static AtomicInteger onlineNum = new AtomicInteger();

    // concurrent包的线程安全Set,用来存放每个客户端对应的WebSocketServer对象
    private static ConcurrentHashMap<Long, Session> sessionPools = new ConcurrentHashMap<>();

    /**
     * 连接成功时调用
     * @param session
     * @param userId
     */
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "userId") Long userId) {
        sessionPools.put(userId, session);
        addOnlineCount();
        System.out.println("加入webSocket！当前人数为" + onlineNum);
        // 广播上线消息
        Message message = new Message();
        message.setDate(new Date());
        message.setToId(0l);
        message.setText(String.valueOf(userId));
        broadcast(JSON.toJSONString(message));
    }

    // 收到客户端消息后，根据接收人的username把消息推下去或者群发
    // to = -1 是群发消息
    @OnMessage
    public void onMessage(String message){
        System.out.println("Server get "+ message);
        Message msg = JSON.parseObject(message, Message.class);
        msg.setDate(new Date());
        if ("-1".equals(msg.getToId())){
            broadcast(JSON.toJSONString(msg));
        }else {
            sendInfo(msg.getToId(),JSON.toJSONString(msg));
        }
    }

    /**
     * 用户退出时关闭了页面或浏览器，这导致了 WebSocket 连接的断开。
     * 在 WebSocket 连接断开时，浏览器会触发 WebSocket 的 onclose 事件
     * @param userId
     */
    @OnClose
    public void onClose(@PathParam(value = "userId") String userId){
        sessionPools.remove(userId);
        subOnlineCount();
        System.out.println(userId + "断开webSocket连接！当前人数为" + onlineNum);
        // 广播下线消息
        Message msg = new Message();
        msg.setDate(new Date());
        msg.setToId(-2l);
        msg.setText(userId);
        broadcast(JSON.toJSONString(msg));
    }

    //错误时调用
    @OnError
    public void onError(Session session, Throwable throwable){
        System.out.println("发生错误");
        throwable.printStackTrace();
    }

    private void sendInfo(long userId, String jsonString) {
        Session session = sessionPools.get(userId);
        try {
            sendMessage(session,jsonString);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // 群发消息
    private void broadcast(String jsonString) {
        for (Session session : sessionPools.values()) {
            try {
                sendMessage(session,jsonString);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // 发送消息
    public void sendMessage(Session session,String message) throws IOException {
        if (session!=null){
            synchronized (session){
                System.out.println("发送数据：" + message);
                session.getBasicRemote().sendText(message);
            }
        }
    }

    public static void addOnlineCount() {
        onlineNum.incrementAndGet();
    }

    public static void subOnlineCount() {
        onlineNum.decrementAndGet();
    }

    public static AtomicInteger getOnlineNumber() {
        return onlineNum;
    }

    public static ConcurrentHashMap<Long, Session> getSessionPools() {
        return sessionPools;
    }


}
