package model;

import java.util.Date;

/**
 *
 * @author Thanh Tan
 */
public class Order {
    int orderId;
    Date orderedDate, receivedDate;
    int shippingFee, totalPrice, totalAmount;
    String phoneNumber;
    Date paymentDate;
    int paymentMethodId, paymentStatusId;
    String receiverName;
    String email;
    int statusId, voucherId, salerId;

    public Order() {
    }

    public Order(int orderId, Date orderedDate, Date receivedDate, int shippingFee, int totalPrice, int totalAmount, String phoneNumber, Date paymentDate, int paymentMethodId, int paymentStatusId, String receiverName, String email, int statusId, int voucherId, int salerId) {
        this.orderId = orderId;
        this.orderedDate = orderedDate;
        this.receivedDate = receivedDate;
        this.shippingFee = shippingFee;
        this.totalPrice = totalPrice;
        this.totalAmount = totalAmount;
        this.phoneNumber = phoneNumber;
        this.paymentDate = paymentDate;
        this.paymentMethodId = paymentMethodId;
        this.paymentStatusId = paymentStatusId;
        this.receiverName = receiverName;
        this.email = email;
        this.statusId = statusId;
        this.voucherId = voucherId;
        this.salerId = salerId;
    }

    public int getSalerId() {
        return salerId;
    }

    public void setSalerId(int salerId) {
        this.salerId = salerId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getOrderedDate() {
        return orderedDate;
    }

    public void setOrderedDate(Date orderedDate) {
        this.orderedDate = orderedDate;
    }

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }

    public int getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(int shippingFee) {
        this.shippingFee = shippingFee;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getPaymentStatusId() {
        return paymentStatusId;
    }

    public void setPaymentStatusId(int paymentStatusId) {
        this.paymentStatusId = paymentStatusId;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }
    
}
