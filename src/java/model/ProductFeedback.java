/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class ProductFeedback {
    int feedback_id, customer_id, order_id,product_id;
    String review;
    String thumbnail;
    int rating, is_active;

    public ProductFeedback() {
    }

    public ProductFeedback(int feedback_id, int customer_id, int order_id, int product_id, String review, int rating, int is_active) {
        this.feedback_id = feedback_id;
        this.customer_id = customer_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.review = review;
        this.rating = rating;
        this.is_active = is_active;
    }

    public ProductFeedback(int feedback_id, int customer_id, int order_id, int product_id, String review, String thumbnail, int rating, int is_active) {
        this.feedback_id = feedback_id;
        this.customer_id = customer_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.review = review;
        this.thumbnail = thumbnail;
        this.rating = rating;
        this.is_active = is_active;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
    

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }
    
    
    
}
