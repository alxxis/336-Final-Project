package com.cs336.pkg;

import java.sql.Date;
public class TicketInfo {

    private int ticketId;
    private double price;
    private String flightClass;
    private String airlineID;
    private int flightNum;
    private int aircraftID;
    private int flightNO;
    private Date depDate;

    public TicketInfo(int ticketId, double price, String flightClass, String airlineID, int flightNum, int aircraftID, int flightNO, Date depDate) {
        this.ticketId = ticketId;
        this.price = price;
        this.flightClass = flightClass;
        this.airlineID = airlineID;
        this.flightNum = flightNum;
        this.aircraftID = aircraftID;
        this.flightNO = flightNO;
        this.depDate = depDate;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
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
    }
}
