package com.cs336.pkg;
import java.sql.Timestamp;
public class Ticket {

    private int id;
    private String username;
    private Timestamp purchaseTimestamp;

    public Ticket(int id, String username, Timestamp purchaseTimestamp) {
        this.id = id;
        this.username = username;
        this.purchaseTimestamp = purchaseTimestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getPurchaseTimestamp() {
        return purchaseTimestamp;
    }

    public void setPurchaseTimestamp(Timestamp purchaseTimestamp) {
        this.purchaseTimestamp = purchaseTimestamp;
    }
}
