package dochelp;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;
import javax.annotation.Resource;
import javax.sql.DataSource;

import com.mysql.cj.jdbc.MysqlDataSource;


 interface query {
	String insert_DocReg = "INSERT INTO healthease (Fname,Lname,email,password,degree,mobile) VALUES(?,?,?,?,?,?)";
    String update_pass = " update healthease set password=? where email=?";
    String chek_email = "select * from healthease where email=?";
    String chek_mobile = "select * from healthease where mobile=?";
}

public class mysql{
	@Resource(name="jdbc/healthease")
	public static MysqlDataSource db;
	private static Properties prop = new Properties();
	    public synchronized static  DataSource connect() throws Exception{
		prop.load(mysql.class.getClassLoader().getResourceAsStream("dochelp/config.properties"));
		db=new MysqlDataSource();
		db.setUrl(security.DecryptedCoad(prop.getProperty("db.host.url")));
		db.setMaxReconnects(5);
		db.setUser(security.DecryptedCoad(prop.getProperty("db.user")));
		db.setPassword(security.DecryptedCoad(prop.getProperty("db.password")));
		return db;
	}
}
 
class security {
    public static String DecryptedCoad(String secret)throws Exception {
    	   StringBuilder tmp = new StringBuilder();
    	   for (int i = 0; i < secret.length(); i++) {
    	      tmp.append((char)(secret.charAt(i) - 2));
    	   }
    	   String reversed = new StringBuffer(tmp.toString()).reverse().toString();
    	   String letters = new String(Base64.getMimeDecoder().decode(reversed));
    	   reversed = " ";
    	   for(int i = 0; i < letters.length(); i+=9) {
    	       String temp = letters.substring(i, i+8);
    	       int num = Integer.parseInt(temp,2);
    	       char letter = (char) num;
    	       reversed = reversed+letter;
    	   }
    	 	letters = "";
        	char [] car = reversed.toCharArray();
        	int [] iar = new int [reversed.length()];
        	for(int i=0;i<reversed.length();i++) {
        		iar[i]=((int)car[i]-1);
        		letters  = letters +(char)iar[i];
        	}
        	return letters.trim();
    	}
    
    public static String hash(String value){
        String gp = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(value.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            gp = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        return gp;
    }
    
}

class Otp
{
	public static int otp(String mobile,String Fname) throws Exception {
		String authkey = "244930A90XXy7if5c5e71d7";
		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		String senderId = "TeamVG";
		String message = "Hello "+Fname+" Your OTP is "+otp;
		String route="4";
		URLConnection myURLConnection=null;
		URL myURL=null;
		BufferedReader reader=null;
		@SuppressWarnings("deprecation")
		String encoded_message=URLEncoder.encode(message);
		String mainUrl="http://api.msg91.com/api/sendhttp.php?"; 
		StringBuilder sbPostData= new StringBuilder(mainUrl);
		sbPostData.append("authkey="+authkey);
		sbPostData.append("&mobiles="+mobile);
		sbPostData.append("&message="+encoded_message);
		sbPostData.append("&route="+route);
		sbPostData.append("&sender="+senderId);
		mainUrl = sbPostData.toString();
		myURL = new URL(mainUrl);
		myURLConnection = myURL.openConnection();
		myURLConnection.connect();
		reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
		reader.close();
		return otp;
	}
}


//create table healthease(INT id AUTO INCREMENT NOT NULL, VARCHAR Fname(100) NOT NULL,VARCHAR Lname(100) NOT NULL,VARCHAR email(100) NOT NULL,VARCHAR password(100) NOT NULL, VARCHAR degree (100) NOT NULL, VARCHAR mobile (100) NOT NULL, PRIMARY KEY(id);
