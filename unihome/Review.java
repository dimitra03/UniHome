package unihome;

import java.util.Date;

public class Review {
    private int reviewID;
    private String comment;
    private String author;
    private Date datePosted;
    private int rate; 
    private int houseID;

    public Review(int reviewID, String comment, String author, Date datePosted, int rate, int houseID) {
        this.reviewID = reviewID;
        this.comment = comment;
        this.author = author;
        this.datePosted = datePosted;
        this.rate = rate;
        this.houseID = houseID;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(Date datePosted) {
        this.datePosted = datePosted;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }
}
 