package com.cs336.pkg;

import java.sql.Time;

public class Flight {

    private String AirlineID;
    private int FlightNum;
    private int AircraftID;
    private boolean isDomestic;
    private String departureAirport;
    private Time departureTime;
    private String arrivalAirport;
    private Time arrivalTime;
    private Double price;
    private int dayOffset;
    private int departureDay;


    public Flight(String airlineID, int flightNum, int aircraftID, boolean isDomestic, String departureAirport, Time departureTime, String arrivalAirport, Time arrivalTime, Double price, int dayOffset, int departureDay) {
        AirlineID = airlineID;
        FlightNum = flightNum;
        AircraftID = aircraftID;
        this.isDomestic = isDomestic;
        this.departureAirport = departureAirport;
        this.departureTime = departureTime;
        this.arrivalAirport = arrivalAirport;
        this.arrivalTime = arrivalTime;
        this.price = price;
        this.dayOffset = dayOffset;
        this.departureDay = departureDay;
    }

    public int getDayOffset() {
        return dayOffset;
    }
    public void setDayOffset(int dayOffset) {
        this.dayOffset = dayOffset;
    }
    public int getDepartureDay() {
        return departureDay;
    }
    public void setDepartureDay(int departureDay) {
        this.departureDay = departureDay;
    }

    public String getAirlineID() {
        return AirlineID;
    }

    public void setAirlineID(String airlineID) {
        AirlineID = airlineID;
    }

    public int getFlightNum() {
        return FlightNum;
    }

    public void setFlightNum(int flightNum) {
        FlightNum = flightNum;
    }

    public int getAircraftID() {
        return AircraftID;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setAircraftID(int aircraftID) {
        AircraftID = aircraftID;
    }

    public boolean isDomestic() {
        return isDomestic;
    }

    public void setDomestic(boolean domestic) {
        isDomestic = domestic;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public Time getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Time departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public Time getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
}
