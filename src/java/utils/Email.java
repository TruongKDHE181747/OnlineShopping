/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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
import javax.mail.internet.MimeUtility;
import model.Order;
import model.User;

public class Email {

    //generate random code
    public String getRandom() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(String toEmail, String subject, String body) {
        boolean test = false;

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

            mess.setSubject(subject);
            String htmlContent = body;

            mess.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(mess);
            test = true;

        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

        return test;
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

            String subject = MimeUtility.encodeText("Xác thực", "UTF-8", "B");
            mess.setSubject(subject);
            String htmlCOntent = "<table role=\"presentation\" style=\"width: 100%; border-collapse: collapse;background: black;\">\n"
                    + "        <tr>\n"
                    + "            <td align=\"center\" style=\"padding: 40px 0;\">\n"
                    + "                <table role=\"presentation\" style=\"width: 600px; border-collapse: collapse; background-color: #ffffff; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);\">\n"
                    + "                    <tr>\n"
                    + "                        <td style=\"padding: 40px 30px; text-align: center;\">\n"
                    + "                            <h1 style=\"color: #333333; font-size: 24px; margin-bottom: 20px;\">Verify Your Email Address</h1>\n"
                    + "                            <p style=\"color: #666666; font-size: 16px; line-height: 1.5; margin-bottom: 30px;\">Cảm ơn bạn đã đăng ký! Vui lòng sử dụng mã xác minh dưới đây để hoàn tất đăng ký của bạn:</p>\n"
                    + "                            <div style=\"background-color: #f0f0f0; border-radius: 4px; padding: 20px; margin-bottom: 30px;\">\n"
                    + "                                <span style=\"font-size: 32px; font-weight: bold; color: #333333; letter-spacing: 5px;\">" + user.getVerification_code() + "</span>\n"
                    + "                            </div>\n"
                    + "                            <p style=\"color: #666666; font-size: 14px; line-height: 1.5;\">Nếu bạn không yêu cầu mã xác minh này, vui lòng bỏ qua email này.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td style=\"background-color: #f8f8f8; padding: 20px 30px; text-align: center; color: #999999; font-size: 14px;\">\n"
                    + "                            <p style=\"margin: 0;\">Đây là email tự động. Vui lòng không trả lời.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>";

            mess.setContent(htmlCOntent, "text/html; charset=UTF-8");
            Transport.send(mess);
            test = true;

        } catch (MessagingException | UnsupportedEncodingException ex) {
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

            String subject = MimeUtility.encodeText("Đặt mật khẩu", "UTF-8", "B");
            mess.setSubject(subject);

            String htmlContent = """
                                 <table role="presentation" style="width: 100%; border-collapse: collapse;">
                                         <tr>
                                             <td align="center" style="padding: 40px 0;">
                                                 <table role="presentation"
                                                     style="width: 600px; border-collapse: collapse; background-color: #ffffff; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
                                                     <tr>
                                                         <td style="padding: 40px 30px; text-align: center;">
                                                             <h1 style="color: #333333; font-size: 24px; margin-bottom: 20px;">Đặt lại mật khẩu</h1>
                                                             <p style="color: #666666; font-size: 16px; line-height: 1.5; margin-bottom: 30px;">Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu của bạn. Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này. Nếu không, hãy nhấp vào nút dưới đây để đặt mật khẩu mới:</p>
                                                             <form action="http://localhost:8080/OnlineShopping/resetPasswordRequest" method="post">
                                                                 <input type='hidden' name='resetCode' value='""" + user.getReset_password_code() + "'>\n"
                    + "                                <input type='hidden' name='email' value='" + user.getEmail() + "'>\n"
                    + "                                <button type=\"submit\" style=\"background-color: #007bff; color: #ffffff; text-decoration: none; padding: 14px 30px; border-radius: 4px; font-size: 16px; font-weight: bold; border: none; cursor: pointer;\">Đặt lại mật khẩu</button>\n"
                    + "                            </form>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                    <tr>\n"
                    + "                        <td\n"
                    + "                            style=\"background-color: #f8f8f8; padding: 20px 30px; text-align: center; color: #999999; font-size: 14px;\">\n"
                    + "                            <p style=\"margin: 0;\"></p>\n"
                    + "                            <p style=\"margin: 10px 0 0;\">© 2024.</p>\n"
                    + "                        </td>\n"
                    + "                    </tr>\n"
                    + "                </table>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>";

            mess.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(mess);
            test = true;

        } catch (MessagingException | UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }

        return test;
    }

    public boolean sendNotifyShippingOrder(Order order) {
        boolean test = false;

        String toEmail = order.getEmail();
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

            String subject = MimeUtility.encodeText("Đơn hàng của bạn đang được giao!", "UTF-8", "B");
            mess.setSubject(subject);

            String receiveDateString = order.getReceiveDate();
            String orderDateString = order.getOrderedDate();

            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");

            LocalDateTime receiveDate = LocalDateTime.parse(receiveDateString, inputFormatter);
            LocalDateTime orderDate = LocalDateTime.parse(orderDateString, inputFormatter);

            String formattedReceiveDate = receiveDate.format(outputFormatter);
            String formattedOrderDate = orderDate.format(outputFormatter);

            String htmlContent = "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #f0f0f0; padding: 20px;\">\n"
                    + "        <tr>\n"
                    + "            <td>\n"
                    + "                <h1 style=\"color: #4a4a4a; text-align: center;\">Đơn hàng của bạn đang được giao!</h1>\n"
                    + "                <p style=\"text-align: center;\">Xin chào " + order.getReceiverName() + ",</p>\n"
                    + "                <p>Chúng tôi rất vui mừng thông báo rằng đơn hàng được đặt lúc: " + formattedOrderDate + "  của bạn hiện đang được giao đến. Dưới\n"
                    + "                    đây là chi tiết:</p>\n"
                    + "                <ul style=\"background-color: #ffffff; padding: 15px; border-radius: 5px;\">\n"
                    + "                    <li>Ngày giao hàng dự kiến: " + formattedReceiveDate + "</li>\n"
                    + "                    <li>Địa chỉ giao hàng: " + order.getAddress() + ", " + order.getWardName() + ", " + order.getDistrictName() + ", " + order.getProvinceName() + "</li>\n"
                    + "                    <li>Mã vận đơn: " + order.getShippingCode() + "</li>\n"
                    + "                </ul>\n"
                    + "\n"
                    + "\n"
                    + "                <p>Cảm ơn bạn đã mua sắm cùng chúng tôi!</p>\n"
                    + "                <p style=\"text-align: center; margin-top: 20px; font-size: 0.8em; color: #666;\">\n"
                    + "                    Đây là tin nhắn tự động, vui lòng không trả lời email này.\n"
                    + "                </p>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>";

            mess.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(mess);
            test = true;

        } catch (MessagingException | UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }

        return test;
    }

    public boolean sendNotifyCancelOrder(Order order) {
        boolean test = false;

        String toEmail = order.getEmail();
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

            String subject = MimeUtility.encodeText("Đơn hàng của bạn đã bị hủy !", "UTF-8", "B");
            mess.setSubject(subject);

            String orderDateString = order.getOrderedDate();

            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");

            LocalDateTime orderDate = LocalDateTime.parse(orderDateString, inputFormatter);

            String formattedOrderDate = orderDate.format(outputFormatter);

            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String today = formatter.format(date);

            String htmlContent = "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #f0f0f0; padding: 20px;\">\n"
                    + "        <tr>\n"
                    + "            <td>\n"
                    + "                <h1 style=\"color: #4a4a4a; text-align: center;\">Đơn hàng của bạn đã bị hủy</h1>\n"
                    + "                <p style=\"text-align: center;\">Xin chào " + order.getReceiverName() + ",</p>\n"
                    + "                <p>Chúng tôi rất tiếc phải thông báo rằng đơn hàng của bạn đã bị hủy. Dưới đây là chi tiết:</p>\n"
                    + "                <ul style=\"background-color: #ffffff; padding: 15px; border-radius: 5px;\">\n"
                    + "                    <li>Ngày đặt hàng: " + formattedOrderDate + "</li>\n"
                    + "                    <li>Ngày hủy: " + today + "</li>\n"
                    + "                </ul>\n"
                    + "                <p>Nếu bạn không yêu cầu hủy đơn hàng này hoặc có bất kỳ câu hỏi nào, vui lòng liên hệ ngay với đội ngũ hỗ trợ khách hàng của chúng tôi.</p>\n"
                    + "                <p>Nếu đã thanh toán cho đơn hàng này, số tiền sẽ được hoàn trả vào phương thức thanh toán ban đầu của bạn trong vòng 3-5 ngày làm việc.</p>\n"
                    + "                <p>Chúng tôi xin lỗi vì bất kỳ sự bất tiện nào có thể gây ra. Chúng tôi đánh giá cao sự ủng hộ của bạn và hy vọng sẽ phục vụ bạn tốt hơn trong tương lai.</p>\n"
                    + "                <p style=\"text-align: center; margin-top: 20px; font-size: 0.8em; color: #666;\">\n"
                    + "                    Đây là tin nhắn tự động, vui lòng không trả lời email này.\n"
                    + "                </p>\n"
                    + "            </td>\n"
                    + "        </tr>\n"
                    + "    </table>";

            mess.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(mess);
            test = true;

        } catch (MessagingException | UnsupportedEncodingException ex) {
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
