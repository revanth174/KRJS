package extra;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;


public class Sms{

   public void sendSms(String phone)
    {
        //Your authentication key
        String authkey = "200690AnOs0FnSuxq5a9986e0";
        //Multiple mobiles numbers separated by comma
        String mobiles = "+91"+phone;
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "MSGIND";
        //Your message to send, Add URL encoding here.
        String message = "Test message this is msg79";
        //define route
        String route="4";

        //Prepare Url
        URLConnection myURLConnection=null;
        URL myURL=null;
        BufferedReader reader=null;

        //encoding message
        String encoded_message=URLEncoder.encode(message);

        //Send SMS API
        String mainUrl="http://api.msg91.com/api/sendhttp.php?";

        //Prepare parameter string
        StringBuilder sbPostData= new StringBuilder(mainUrl);
        sbPostData.append("authkey="+authkey);
        sbPostData.append("&mobiles="+mobiles);
        sbPostData.append("&message="+encoded_message);
        sbPostData.append("&route="+route);
        sbPostData.append("&sender="+senderId);

        //final string
        mainUrl = sbPostData.toString();
        try
        {
            //prepare connection
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            //reading response
            String response;
            while ((response = reader.readLine()) != null)
                //print response
                System.out.println(response);

            System.out.println("donesms");
            //finally close connection
            reader.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}

