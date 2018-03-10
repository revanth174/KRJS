package extra;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	
	
	public void sendMain(String email) {

        final String username = "poojinvr@gmail.com"; // enter your mail id
        final String password = "vendi@1742";// enter ur password

        Properties props = new Properties();
        props.put("mail.defaultEncoding=UTF-8","true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.required","true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.fallback","false");
        props.put("mail.smtp.socketFactory.port","465");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("poojinvr@gmail.com")); // same email id
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));// whome u have to send mails that person id
            message.setSubject("Approved");
            message.setText("congrtulations,"
                    + "\n\n your membership has been approved"
            		+"\n your fimal membe id is mem123");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
