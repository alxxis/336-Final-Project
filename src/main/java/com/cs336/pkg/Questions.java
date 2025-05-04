package com.cs336.pkg;

import java.sql.Timestamp;

public class Questions {

    private int qID;
    private String author;
    private String messageContent;
    private Timestamp messageTimestamp;

    public Questions(int qID, String author, String messageContent, Timestamp messageTimestamp) {
        this.qID = qID;
        this.author = author;
        this.messageContent = messageContent;
        this.messageTimestamp = messageTimestamp;
    }

    public int getqID() {
        return qID;
    }

    public void setqID(int qID) {
        this.qID = qID;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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
