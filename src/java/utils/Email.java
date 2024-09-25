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
    public boolean sendVerifyEmail(User user) {
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
            String htmlCOntent = "<table role=\"presentation\" style=\"width: 100%; border-collapse: collapse;background: black;\">\n"
                    + "        <tr>\n"
                    + "            <td align=\"center\" style=\"padding: 40px 0;\">\n"
                    + "                <table role=\"presentation\" style=\"width: 600px; border-collapse: collapse; background-color: #ffffff; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);\">\n"
                    + "                    <tr>\n"
                    + "                        <td style=\"padding: 40px 30px; text-align: center;\">\n"
                    + "                            <h1 style=\"color: #333333; font-size: 24px; margin-bottom: 20px;\">Verify Your Email Address</h1>\n"
                    + "                            <p style=\"color: #666666; font-size: 16px; line-height: 1.5; margin-bottom: 30px;\">Thank you for signing up! Please use the verification code below to complete your registration:</p>\n"
                    + "                            <div style=\"background-color: #f0f0f0; border-radius: 4px; padding: 20px; margin-bottom: 30px;\">\n"
                    + "                                <span style=\"font-size: 32px; font-weight: bold; color: #333333; letter-spacing: 5px;\">" + user.getVerification_code() + "</span>\n"
                    + "                            </div>\n"
                    + "                            <p style=\"color: #666666; font-size: 14px; line-height: 1.5;\">If you didn't request this verification code, please ignore this email.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td style=\"background-color: #f8f8f8; padding: 20px 30px; text-align: center; color: #999999; font-size: 14px;\">\n"
                    + "                            <p style=\"margin: 0;\">This is an automated email. Please do not reply.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>";

            mess.setContent(htmlCOntent, "text/html; charset=UTF-8");
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

            String htmlContent = "<table role=\"presentation\" style=\"width: 100%; border-collapse: collapse;\">\n"
                    + "        <tr>\n"
                    + "            <td align=\"center\" style=\"padding: 40px 0;\">\n"
                    + "                <table role=\"presentation\"\n"
                    + "                    style=\"width: 600px; border-collapse: collapse; background-color: #ffffff; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);\">\n"
                    + "                    <tr>\n"
                    + "                        <td style=\"padding: 40px 30px; text-align: center;\">\n"
                    + "                            <h1 style=\"color: #333333; font-size: 24px; margin-bottom: 20px;\">Reset Your Password</h1>\n"
                    + "                            <p style=\"color: #666666; font-size: 16px; line-height: 1.5; margin-bottom: 30px;\">We\n"
                    + "                                received a request to reset your password. If you didn't make this request, you can\n"
                    + "                                ignore this email. Otherwise, click the button below to choose a new password:</p>\n"
                    + "                            <form action=\"http://localhost:8080/OnlineShopping/resetPasswordRequest\" method=\"post\">\n"
                    + "                                <input type='hidden' name='resetCode' value='" + user.getReset_password_code() + "'>\n"
                    + "                                <input type='hidden' name='email' value='" + user.getEmail() + "'>\n"
                    + "                                <button type=\"submit\" style=\"background-color: #007bff; color: #ffffff; text-decoration: none; padding: 14px 30px; border-radius: 4px; font-size: 16px; font-weight: bold; border: none; cursor: pointer;\">Reset Password</button>\n"
                    + "                            </form>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td\n"
                    + "                            style=\"background-color: #f8f8f8; padding: 20px 30px; text-align: center; color: #999999; font-size: 14px;\">\n"
                    + "                            <p style=\"margin: 0;\">If you didn't request a password reset, please contact our support\n"
                    + "                                team immediately.</p>\n"
                    + "                            <p style=\"margin: 10px 0 0;\">© 2023 Your Company Name. All rights reserved.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>";

            mess.setContent(htmlContent, "text/html; charset=UTF-8");

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

}
