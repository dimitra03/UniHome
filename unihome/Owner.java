package unihome;

/**
 * Represents an Owner entity in the system.
 * This class stores details about an owner, such as their first name, last name, phone number and email.
 * 
 * <p>Used in conjunction with the OwnerDAO to interact with the database.</p>
 * 
 * @author Dimitra Telatinidou
 * @version 1.0
 */

public class Owner {
    private int ownerID;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;
    
    public Owner() {}

    public Owner(int ownerID, String firstName, String lastName, String phoneNumber, String email) {
        this.ownerID = ownerID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public int getOwnerID() {
        return ownerID;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Owner [firstName=" + firstName + ", lastName=" + lastName + ", phoneNumber="
                + phoneNumber + ", email=" + email + "]";
    }

}