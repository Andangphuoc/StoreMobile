/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.mail.internet.MimeUtility;

public class Email {

    static final String username = "Mobile group 2";
    static final String from = "an0932003860@gmail.com";
    static final String password = "jhddgheiqkretsni";

    public boolean sendEmail(String to, String title, String content, String reply) {
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            // Người gửi
            msg.setFrom(new InternetAddress(from, username));
            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            // Tiêu đề email
            msg.setSubject(MimeUtility.encodeText(title, "UTF-8", "B"));
            msg.setHeader("Content-type", "text/HTML; charset=UTF-8");
            // Quy đinh ngày gửi
            msg.setSentDate(new Date());
            // Quy định email nhận phản hồi
            if (reply != null) {
                msg.setReplyTo(new InternetAddress[]{new InternetAddress(reply)});
            }
            // Nội dung
            msg.setContent(content, "text/HTML; charset=UTF-8");
            // Gửi email
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
