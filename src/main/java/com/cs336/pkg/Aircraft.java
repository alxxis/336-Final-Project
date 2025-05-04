package com.cs336.pkg;

public class Aircraft {
    private int id;
    private int numSeats;
    private String name;


    public Aircraft(int id, int numSeats, String name) {
        this.id = id;
        this.numSeats = numSeats;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumSeats() {
        return numSeats;
    }

    public void setNumSeats(int numSeats) {
        this.numSeats = numSeats;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
