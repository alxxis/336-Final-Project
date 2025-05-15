package com.cs336.pkg;
import java.sql.Timestamp;
public class Ticket {

    private int id;
    private String username;
    private Timestamp purchaseTimestamp;
    private double price;

    public Ticket(int id, String username, Timestamp purchaseTimestamp, double price) {
        this.id = id;
        this.username = username;
        this.purchaseTimestamp = purchaseTimestamp;
        this.price = price;
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

    public double getPrice() {return price;}

    public void setPrice(double price) {this.price = price;}
}
