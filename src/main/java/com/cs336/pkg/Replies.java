package com.cs336.pkg;

import java.sql.Timestamp;
public class Replies {
    private int rID;
    private String author;
    private int qID;
    private String messageContent;
    private Timestamp messageTimestamp;

    public Replies(int rID, String author, int qID, String messageContent, Timestamp messageTimestamp) {
        this.rID = rID;
        this.author = author;
        this.qID = qID;
        this.messageContent = messageContent;
        this.messageTimestamp = messageTimestamp;
    }

    public int getrID() {
        return rID;
    }

    public void setrID(int rID) {
        this.rID = rID;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getqID() {
        return qID;
    }

    public void setqID(int qID) {
        this.qID = qID;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Timestamp getMessageTimestamp() {
        return messageTimestamp;
    }

    public void setMessageTimestamp(Timestamp messageTimestamp) {
        this.messageTimestamp = messageTimestamp;
    }
}
