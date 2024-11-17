package src.main.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Performs connection with the database and executes operations related to Owner entity
 * 
 * @author Dimitra Telatinidou
 * @version 1.0
 */

public class OwnerDAO {

        /**
        * Gets the details of the owner by house ID.
        * 
        * @param houseId the ID of the house whose owner details are to be fetched
        * @return a list of owners associated with the given house ID
        * @throws SQLException if a database access error occurs
        */
        public List<Owner> getOwnerDetails(int house_id) throws SQLException {
            List<Owner> ownerDetails = new ArrayList<>();
            Connection conn;
    
            try {
                // Open database connection
                conn = DBConnection.openConnection();
    
                // SQL queries
                String getOwnerId = "SELECT ownerID FROM house WHERE houseID = ?";
                String getOwnerDetails = "SELECT firstName, lastName, phoneNumber, email FROM owner WHERE ownerID = ?";
    
                // Query to get ownerID from house table
                PreparedStatement pst = conn.prepareStatement(getOwnerId);
                pst.setInt(1, house_id);
                ResultSet rs = pst.executeQuery();
    
                if (rs.next()) {
                    int ownerId = rs.getInt("ownerID");

                    // Query to get owner details from owner table
                    PreparedStatement pst2 = conn.prepareStatement(getOwnerDetails);
                    pst2.setInt(1, ownerId);
                    ResultSet rs2 = pst2.executeQuery();
    
                    if (rs2.next()) {
                        Owner owner = new Owner();
                        owner.setFirstName(rs2.getString("firstName"));
                        owner.setLastName(rs2.getString("lastName"));
                        owner.setPhoneNumber(rs2.getString("phoneNumber"));
                        owner.setEmail(rs2.getString("email"));
                        ownerDetails.add(owner);
                    }
                }
            
            } catch (SQLException e) {
                e.printStackTrace(); 
                throw e;
            
            } finally {
                DBConnection.closeConnection();
            }
    
            return ownerDetails;
        }
        
}
