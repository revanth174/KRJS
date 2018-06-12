package extra;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class BulkSms {
	
	
	 
	
		/*public static void main(String args[]) throws UnsupportedEncodingException {
			
			String gw = "info.bulksms-service.com/WebServiceSMS.apsx?User=T2017081401&passwd=th6RLkgr";
			
			String cont = "hello0";
			
			String phone = "7396880443";
			String cth = URLEncoder.encode(cont,"UTF-8");
			String sd = "VEMANA";
			String type = "N";
			String sd1 = URLEncoder.encode(sd,"UTF-8");
			String urlpar="http://"+gw+"&mobilenumber="+phone+"&message="+cth+"&sid="+sd1+"&mtype="+type;
			System.out.println("urlpar");
			callURL(urlpar);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			
			
		}*/
	
	
	public static void main(String args[]) throws Exception {
		BulkSms s = new BulkSms();
		s.send(123, "7396880443");
	}

	/*	
    1	Create a URL. 
	2	Retrieve the URLConnection object. 
	3	Set output capability on the URLConnection. 
	4	Open a connection to the resource. 
	5	Get an output stream from the connection. 
	6	Write to the output stream. 
	7	Close the output stream.
	*/
	public void send(int memid,String phone) throws Exception{
		String postData="";
		String retval = "";

		//give all Parameters In String 
		String User ="T2017081401";
		String passwd = "th6RLkgr";
		String mobilenumber = phone; 
		String msg="your ward "+ memid +" is absent for 3rd hour on 08.05.2018";
		String sid = "VEMANA";
		String mtype = "N";
				

		
		
		postData += "User=" + URLEncoder.encode(User,"UTF-8") + "&passwd=" + passwd + "&mobilenumber=" + mobilenumber + "&message=" + URLEncoder.encode(msg,"UTF-8") + "&sid=" + sid + "&mtype=" + mtype ;
		URL url = new URL("http://info.bulksms-service.com/WebserviceSMS.aspX");
		//URL google = new URL("https://www.google.co.in");
		HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();

		
		urlconnection.setRequestMethod("POST");
		urlconnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		urlconnection.setDoOutput(true);
		OutputStreamWriter out = new OutputStreamWriter(urlconnection.getOutputStream());
		out.write(postData);
		out.close();
		BufferedReader in = new BufferedReader(	new InputStreamReader(urlconnection.getInputStream()));
		String decodedString;
		while ((decodedString = in.readLine()) != null) {
			retval += decodedString;
		}
		in.close();

		System.out.println(retval);
	}
	
	
	public void sendForgotCode(String memid,String phone,String code) throws Exception{
		String postData="";
		String retval = "";

		//give all Parameters In String 
		String User ="T2017081401";
		String passwd = "th6RLkgr";
		String mobilenumber = phone; 
		String msg="your ward "+ code +" is absent for 5th hour on 29.08.2017";
		String sid = "VEMANA";
		String mtype = "N";
				

		
		
		postData += "User=" + URLEncoder.encode(User,"UTF-8") + "&passwd=" + passwd + "&mobilenumber=" + mobilenumber + "&message=" + URLEncoder.encode(msg,"UTF-8") + "&sid=" + sid + "&mtype=" + mtype ;
		URL url = new URL("http://info.bulksms-service.com/WebserviceSMS.aspX");
		//URL google = new URL("https://www.google.co.in");
		HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();

		
		urlconnection.setRequestMethod("POST");
		urlconnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		urlconnection.setDoOutput(true);
		OutputStreamWriter out = new OutputStreamWriter(urlconnection.getOutputStream());
		out.write(postData);
		out.close();
		BufferedReader in = new BufferedReader(	new InputStreamReader(urlconnection.getInputStream()));
		String decodedString;
		while ((decodedString = in.readLine()) != null) {
			retval += decodedString;
		}
		in.close();

		System.out.println(retval);
	}
	
	

}
