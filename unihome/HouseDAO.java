package unihome;

import java.sql.*;
import java.util.*;

public class HouseDAO {

    // Method to fetch houses based on House-selected filters
    public List<House> searchHouses(String area, int size, int rentPerMonth, String houseType, int floor, int rooms, boolean furnished) throws Exception {
        List<House> houses = new ArrayList<>();
        DBConnection db = new DBConnection();
        Connection con = null;
    
        // Base SQL query
        StringBuilder query = new StringBuilder("SELECT * FROM House WHERE furnished = ?");
    
        // Parameters list for dynamic query
        List<Object> parameters = new ArrayList<>();
        
        
        parameters.add(furnished);
        // Add filters dynamically
        if (area != null && !area.isEmpty()) {
            query.append(" AND area = ?");
            parameters.add(area);
        }
        if (size != 0) {
            query.append(" AND size BETWEEN ? AND ?");
            parameters.add(size - 20); // Lower bound
            parameters.add(size);      // Upper bound
        }
        if (rentPerMonth != 0) {
            query.append(" AND rentPerMonth BETWEEN ? AND ?");
            parameters.add(rentPerMonth - 200); // Lower bound
            parameters.add(rentPerMonth);       // Upper bound
        }
        if (houseType != null && !houseType.isEmpty()) {
            query.append(" AND houseType = ?");
            parameters.add(houseType);
        }
        if (floor != 0) {
            query.append(" AND floor = ?");
            parameters.add(floor);
        }
        if (rooms != 0) {
            query.append(" AND rooms = ?");
            parameters.add(rooms);
        }
        
            
        
    
        try {
            con = db.openConnection();
            PreparedStatement stmt = con.prepareStatement(query.toString());
    
            // Set parameters dynamically
            for (int i = 0; i < parameters.size(); i++) {
                stmt.setObject(i + 1, parameters.get(i));
            }
    
            ResultSet rs = stmt.executeQuery();
    
            // Populate house list
            while (rs.next()) {
                houses.add(new House(
                    rs.getInt("houseID"),
                    rs.getString("address"),
                    rs.getString("area"),
                    rs.getInt("size"),
                    rs.getInt("rentPerMonth"),
                    rs.getBoolean("furnished"),
                    rs.getString("houseType"),
                    rs.getInt("scoreOfInterest"),
                    rs.getInt("rooms"),
                    rs.getInt("floor"),
                    rs.getInt("ownerID")
                ));
            }
    
            rs.close();
            stmt.close();
            db.closeConnection();
    
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.closeConnection();
            } catch (Exception e) {
                // Ignore exception during close
            }
        }
    
        return houses;
    }
    

    public House findHouse(int houseId) throws Exception {

		// ΘΕΜΑ 1 B

		DBConnection db = new DBConnection();
		Connection con = null;
		String query = "SELECT * FROM house WHERE houseId = ?;";
		House house = null; 
		
		try {
			con = db.openConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			
		
			stmt.setInt(1, houseId); 
			
			ResultSet rs = stmt.executeQuery();
			
			// case valid credentials
			if (rs.next()) {
				house = new House(
					rs.getInt("houseID"),
                    rs.getString("address"),
                    rs.getString("area"),
                    rs.getInt("size"),
                    rs.getInt("rentPerMonth"),
                    rs.getBoolean("furnished"),
                    rs.getString("houseType"),
                    rs.getInt("scoreOfInterest"),
                    rs.getInt("rooms"),
                    rs.getInt("floor"),
                    rs.getInt("ownerID")
				);
			}
			
			// Close ResultSet and PreparedStatement
			rs.close();
			stmt.close();
	
			return house;
	
		} catch (Exception e) {
			throw new Exception("Error while finding house: " + e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					throw new Exception("Error while closing the connection: " + e.getMessage());
				}
			}
		}
		
	
		
	} //End of findHouse
}
