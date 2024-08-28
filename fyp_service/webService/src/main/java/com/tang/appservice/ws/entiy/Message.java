package com.tang.appservice.ws.entiy;

import java.util.Date;

public class Message {

    /**
     * 发送的消息
     */
    private Object data;

    private String text;

    /**
     * 发给谁
     */
    private Long toId;

    private Date date;


    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Long getToId() {
        return toId;
    }

    public void setToId(Long toId) {
        this.toId = toId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
