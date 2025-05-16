package com.cs336.pkg;
import java.sql.Date;
import java.sql.Timestamp;
public class Ticket {

    private int id;
    private String username;
    private Timestamp purchaseTimestamp;
    private double price;
    private String flightClass;
    private String airlineID;
    private int flightNum;
    private int aircraftID;
    private int flightNO;
    private Date depDate;

    public Ticket(int id, String username, Timestamp purchaseTimestamp, double price, String flightClass, String airlineID, int flightNum, int flightNO, Date depDate) {
        this.id = id;
        this.username = username;
        this.purchaseTimestamp = purchaseTimestamp;
        this.price = price;
        this.flightClass = flightClass;
        this.airlineID = airlineID;
        this.flightNum = flightNum;
        this.flightNO = flightNO;
        this.depDate = depDate;
    }

    public Ticket (int ticketID, String username1, Timestamp time, Double price , int flightNumber){
        this.id=ticketID;
        this.username = username1;
        this.purchaseTimestamp = time;
        this.price = price;
        this.flightNum = flightNumber;
    }


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getFlightClass() {
        return flightClass;
    }

    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }

    public String getAirlineID() {
        return airlineID;
    }

    public void setAirlineID(String airlineID) {
        this.airlineID = airlineID;
    }

    public int getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(int flightNum) {
        this.flightNum = flightNum;
    }

    public int getAircraftID() {
        return aircraftID;
    }

    public void setAircraftID(int aircraftID) {
        this.aircraftID = aircraftID;
    }

    public int getFlightNO() {
        return flightNO;
    }

    public void setFlightNO(int flightNO) {
        this.flightNO = flightNO;
    }

    public Date getDepDate() {
        return depDate;
    }

    public void setDepDate(Date depDate) {
        this.depDate = depDate;
        this.price = price;
        this.flightNum= flightNum;
    }

    public Ticket(int id, String username, Timestamp purchaseTimestamp, double price) {
        this.id = id;
        this.username = username;
        this.purchaseTimestamp = purchaseTimestamp;
        this.price = price;
    }

    public Ticket(int flightNumber, String airlineID){
        this.flightNum = flightNumber;
        this.airlineID = airlineID;
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
