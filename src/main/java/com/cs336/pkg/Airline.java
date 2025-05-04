package com.cs336.pkg;

public class Airline {
    private String airlineID;
    private String name;

    public Airline(String airlineID, String name) {
        this.airlineID = airlineID;
        this.name = name;
    }

    public String getAirlineID() {
        return airlineID;
    }

    public void setAirlineID(String airlineID) {
        this.airlineID = airlineID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
