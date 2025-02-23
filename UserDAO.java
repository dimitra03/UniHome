package unihome;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * UserDAO provides all the necessary methods related to users.
 * 
 * @author 
 *
 */
public class UserDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	@SuppressWarnings("unchecked")

	public List<User> getUsers() throws Exception {

		// ΘΕΜΑ 1 A

		List<User> users = new ArrayList<User>();

        DBConnection db = new DBConnection();
        Connection con = null;
        String query = "SELECT * FROM user;";

        try {

            con = db.openConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            // skipping setting parameters (do not need)
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                users.add( new User(rs.getString("firtName"), rs.getString("lastName"), rs.getString("university"), rs.getString("username"), rs.getString("password"), rs.getString("userType")) );

            }

            rs.close();
            stmt.close();
            db.closeConnection();

            return users;

            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.closeConnection();    
            } catch (Exception e) {
                
            }
			
		}
		
		
	} //End of getUsers

	/**
	 * Search user by username
	 * 
	 * @param username, String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {

		// ΘΕΜΑ 1 B

		DBConnection db = new DBConnection();
		Connection con = null;
		String query = "SELECT * FROM user WHERE username = ?;";
		User user = null; 
		
		try {
			con = db.openConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			
		
			stmt.setString(1, username); 
			
			ResultSet rs = stmt.executeQuery();
			
			// case valid credentials
			if (rs.next()) {
				user = new User(
					rs.getString("firtName"),  
					rs.getString("lastName"),   
					rs.getString("university"),
					rs.getString("username"),
					rs.getString("password"),
                    rs.getString("userType")
				);
			}
			
			// Close ResultSet and PreparedStatement
			rs.close();
			stmt.close();
	
			return user;
	
		} catch (Exception e) {
			throw new Exception("Error while finding user: " + e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					throw new Exception("Error while closing the connection: " + e.getMessage());
				}
			}
		}
		
	
		
	} //End of findUser
	

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		
			
		

		Connection con = null;
		User user = null;
		try {
			DBConnection db = new DBConnection();
			con = db.openConnection();

			String query= "SELECT * FROM user WHERE username = ? AND password = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
                String firtName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
                String university = rs.getString("university");
                String userType = rs.getString("userType");
                
                user = new User(firtName, lastName, university, username, password, userType);
            
			} else {
				throw new Exception("Wrong username or password");
			}
            
            rs.close();
            stmt.close();
            
			return user;
		
		} catch (SQLException e) {
			throw new Exception("Error while retrieving user from the database. " + e.getMessage(), e);
		
		} finally {
			con.close();
		}

			
		
	} //End of authenticate

	
	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
			


		DBConnection db = new DBConnection();
        Connection con = null;

        try {
            //Establish database connection
            con = db.openConnection();

    

            // Insert new user details into the table
            String insertQuery = "INSERT INTO user (username, firstName, lastName, university, password, userType) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement insertStmt = con.prepareStatement(insertQuery);
            insertStmt.setString(1, user.getUsername());
            insertStmt.setString(2, user.getFirstName());
            insertStmt.setString(3, user.getLastName());
            insertStmt.setString(4, user.getUniversity());
            insertStmt.setString(5, user.getPassword());
            insertStmt.setString(6, user.getUserType());

            insertStmt.executeUpdate(); // Execute the insertion
            insertStmt.close();

        } catch (SQLException e) {
            //  Handle any exceptions and rethrow with appropriate message
			throw new Exception("Error while retrieving user from the database. " + e.getMessage(), e);
		

        } finally {
                if (con != null) {
                    con.close();
                }
           
		
	    }//end of register

    } 

}//End of class
