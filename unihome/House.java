package unihome;

import java.util.*;

/**
 * Represents a House entity in the system.
 * This class stores details about a house, such as address, size, rent, and owner.
 * 
 * @version 1.1
 */
public class House {

    private int houseID;
    private String address;
    private String area;
    private int size;
    private int rentPerMonth;
    private boolean furnished;
    private String houseType;
    private int scoreOfInterest;
    private int rooms;
    private int floor;
    private int ownerID; // ID of the owner
    private Owner owner; // Full Owner object

    /**
     * Constructor without Owner object.
     *
     * @param houseID unique identifier for the house
     * @param address address of the house
     * @param area geographical area of the house
     * @param size size of the house in square meters
     * @param rentPerMonth monthly rent price
     * @param furnished whether the house is furnished
     * @param houseType type of the house (e.g., apartment, villa)
     * @param scoreOfInterest score indicating the attractiveness of the house
     * @param rooms number of rooms in the house
     * @param floor floor on which the house is located
     * @param ownerID unique identifier of the owner
     */
    public House(int houseID, String address, String area, int size, int rentPerMonth, boolean furnished,
                 String houseType, int scoreOfInterest, int rooms, int floor,
                 int ownerID) {
        this.houseID = houseID;
        this.address = address;
        this.area = area;
        this.size = size;
        this.rentPerMonth = rentPerMonth;
        this.furnished = furnished;
        this.houseType = houseType;
        this.scoreOfInterest = scoreOfInterest;
        this.rooms = rooms;
        this.floor = floor;
        this.ownerID = ownerID;
    }

    /**
     * Constructor with Owner object.
     *
     * @param houseID unique identifier for the house
     * @param address address of the house
     * @param area geographical area of the house
     * @param size size of the house in square meters
     * @param rentPerMonth monthly rent price
     * @param furnished whether the house is furnished
     * @param availability date when the house will be available
     * @param houseType type of the house (e.g., apartment, villa)
     * @param amenities amenities included with the house
     * @param scoreOfInterest score indicating the attractiveness of the house
     * @param rooms number of rooms in the house
     * @param floor floor on which the house is located
     * @param owner Owner object associated with the house
     */
    public House(int houseID, String address, String area, int size, int rentPerMonth, boolean furnished,
                 String houseType, int scoreOfInterest, int rooms, int floor,
                 Owner owner) {
        this.houseID = houseID;
        this.address = address;
        this.area = area;
        this.size = size;
        this.rentPerMonth = rentPerMonth;
        this.furnished = furnished;
        this.houseType = houseType;
        this.scoreOfInterest = scoreOfInterest;
        this.rooms = rooms;
        this.floor = floor;
        this.owner = owner;
        this.ownerID = owner != null ? owner.getOwnerID() : 0; // Extract ownerID from Owner object
    }
 
    /* Getters and Setters */

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getRentPerMonth() {
        return rentPerMonth;
    }

    public void setRentPerMonth(int rentPerMonth) {
        this.rentPerMonth = rentPerMonth;
    }

    public boolean isFurnished() {
        return furnished;
    }

    public void setFurnished(boolean furnished) {
        this.furnished = furnished;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public int getScoreOfInterest() {
        return scoreOfInterest;
    }

    public void setScoreOfInterest(int scoreOfInterest) {
        this.scoreOfInterest = scoreOfInterest;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public int getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }

    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
        this.ownerID = owner != null ? owner.getOwnerID() : 0; // Update ownerID when setting Owner
    }
}

