/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class PostFeedback {
    int post_feedback_id, customer_id,post_id;
    String review;
    int is_active;
    String username,profile_picture_url;
  
    Post post;
    User user;
    public PostFeedback() {
    }

    public PostFeedback(int post_feedback_id, int customer_id, int post_id, String review, int is_active) {
        this.post_feedback_id = post_feedback_id;
        this.customer_id = customer_id;
        this.post_id = post_id;
        this.review = review;
        this.is_active = is_active;
    }

    public PostFeedback(int post_feedback_id, int customer_id, int post_id, String review, int is_active, String username, String profile_picture_url) {
        this.post_feedback_id = post_feedback_id;
        this.customer_id = customer_id;
        this.post_id = post_id;
        this.review = review;
        this.is_active = is_active;
        this.username = username;
        this.profile_picture_url = profile_picture_url;
    }

    public PostFeedback(int post_feedback_id, int customer_id, String review, int is_active, String username, String profile_picture_url, Post post) {
        this.post_feedback_id = post_feedback_id;
        this.customer_id = customer_id;
        this.review = review;
        this.is_active = is_active;
        this.username = username;
        this.profile_picture_url = profile_picture_url;
        this.post = post;
    }

    public PostFeedback(int post_feedback_id, String review, int is_active, Post post, User user) {
        this.post_feedback_id = post_feedback_id;
        this.review = review;
        this.is_active = is_active;
        this.post = post;
        this.user = user;
    }



    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    

    public int getPost_feedback_id() {
        return post_feedback_id;
    }

    public void setPost_feedback_id(int post_feedback_id) {
        this.post_feedback_id = post_feedback_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProfile_picture_url() {
        return profile_picture_url;
    }

    public void setProfile_picture_url(String profile_picture_url) {
        this.profile_picture_url = profile_picture_url;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
    
    
    
}
