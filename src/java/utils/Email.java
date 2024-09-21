/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.User;

public class Email {

    //generate random code
    public String getRandom() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }

    //send email to user to verify account register
    public boolean sendRegisterEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = Constants.SENT_EMAIL;
        String password = Constants.EMAIL_PASSWORD;

        Properties pr = configEmail(new Properties());

        Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }

        });
        //set email message detail
        Message mess = new MimeMessage(session);
        try {
            
            mess.setHeader("Content-Type", "text/plain; charset=UTF-8");

            mess.setFrom(new InternetAddress(fromEmail));

            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            mess.setSubject("Verification");
            mess.setText("Verification link: " + user.getVerification_code());

            Transport.send(mess);
            test = true;

        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

        return test;
    }
    
    public boolean sendResetPassEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = Constants.SENT_EMAIL;
        String password = Constants.EMAIL_PASSWORD;

        Properties pr = configEmail(new Properties());

        Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }

        });
        //set email message detail
        Message mess = new MimeMessage(session);
        try {
            
            mess.setHeader("Content-Type", "text/html; charset=UTF-8");

            mess.setFrom(new InternetAddress(fromEmail));

            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            mess.setSubject("Reset Password");
            
            String resetLink = "<a href='http://localhost:9999/OnlineShopping/resetPassword?userId="+user.getUser_id()+"' >Click me</a>";
            mess.setText("Reset password link: " + resetLink);

            Transport.send(mess);
            test = true;

        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

        return test;
    }

    private Properties configEmail(Properties pr) {
        //host email smtp server details
        pr.setProperty("mail.smtp.host", "smtp.gmail.com");
        pr.setProperty("mail.smtp.port", "587");
        pr.setProperty("mail.smtp.auth", "true");
        pr.setProperty("mail.smtp.starttls.enable", "true");
        pr.put("mail.smtp.socketFactory.port", "587");
        pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        return pr;
    }
    
    
//    public static void main(String[] args) {
//        Email em = new Email();
//        User user = new User("", "", "", "", "", "mnhduc3012@gmail.com", true, "", "113113", "", "", "", true, true, new Role(5, ""));
//        em.sendRegisterEmail(user);
//    }
}
