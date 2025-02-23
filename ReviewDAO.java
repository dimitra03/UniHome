package unihome;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class ReviewDAO {

    public void newReview(Review review) throws Exception {
        DBConnection db = new DBConnection();
        Connection con = null;
    
        try {
            con = db.openConnection();
    
            String insertQuery = "INSERT INTO review (comment, author, datePosted, rate, houseID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(insertQuery);
            
            java.sql.Date sqlDate = new java.sql.Date(review.getDatePosted().getTime());

            stmt.setString(1, review.getComment());
            stmt.setString(2, review.getAuthor());
            stmt.setDate(3, sqlDate); // Use the converted sqlDate
            stmt.setInt(4, review.getRate());
            stmt.setInt(5, review.getHouseID());
    
            
    
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new Exception("Error while adding review: " + e.getMessage(), e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    
    public List<Review> showReview(int houseID) throws Exception {
        DBConnection db = new DBConnection();
        Connection con = null;
        String query = "SELECT * FROM review WHERE houseID = ?";
        List<Review> reviews = new ArrayList<>();
    
        try {
            con = db.openConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, houseID);
    
            ResultSet rs = stmt.executeQuery();
            
    
            while (rs.next()) {
                Review review = new Review(
                    rs.getInt("reviewID"),
                    rs.getString("comment"),
                    rs.getString("author"),
                    rs.getDate("datePosted"),
                    rs.getInt("rate"), 
                    rs.getInt("houseID")
                );
                reviews.add(review);
            }
    
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new Exception("Error while retrieving reviews: " + e.getMessage(), e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    
        return reviews;
    }
    
}
