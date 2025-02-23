package unihome;

public class User {
    
    private String firstName;
	private String lastName;
	private String university;
	private String username;
	private String password;
    private String userType;
    

    /**
     * Full constuctor
     *   
     * @param firstName
     * @param lastName
     * @param university
     * @param username
     * @param password
     * @param userType
     */
    public User(String firstName, String lastName, String university, String username, String password, String userType) {        
        this.firstName = firstName;
        this.lastName = lastName;
        this.university = university;
        this.username = username;
        this.password = password;
        this.userType = userType;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setPassword(String password) {
        this.password = password;        
    }  

    public String getPassword() {
        return password;
    }

    public void setUserType(String userType) {
        this.userType = userType;        
    }  

    public String getUserType() {
        return userType;
    }


}