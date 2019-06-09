package dochelp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

@WebServlet("/error")
public class Error extends HttpServlet implements query {
	private static final long serialVersionUID = 1L;  
    public Error() {
        super();    }
    private String mob = null;
    private String Did = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,Object> map = new HashMap<String,Object>();
		boolean isValid=false;
		try {
		
		// otp hash code generation /
		if(request.getParameter("otpx")!=null) {
			isValid = true;
			map.put("otpx",security.hash(request.getParameter("otpx")));
		}
		
		// update forget password
		if(request.getParameter("update_email")!=null&&request.getParameter("update_pass")!=null) {
			isValid = true;
			map.put("update1",update(request.getParameter("updateemail"),security.hash(request.getParameter("update_pass"))));
		}
		
		// user login
		if(request.getParameter("email_log")!=null&&request.getParameter("password_log")!=null) {
				if(login(request.getParameter("email_log"),security.hash(request.getParameter("password_log")))) {
					HttpSession session = request.getSession();
					 List<Integer> l1= new ArrayList<>(); // This is holds the id.
			         List<String> l2= new ArrayList<>(); // This is holds the name.
			         List<String> l3= new ArrayList<>(); // This is holds the image.
			         List<String> list = new ArrayList<>(); //
			         Connection con = mysql.connect().getConnection();
			         PreparedStatement ps = con.prepareStatement("select PID,Name,Image from patient where DID=?");
			         ps.setString(1,Did);
			         ps.executeQuery();
			         ResultSet rs = ps.getResultSet();
			         while(rs.next()) {
							l1.add(rs.getInt(1));
							l2.add(rs.getString(2));  
							l3.add(rs.getString(3));
						}
						session.setAttribute("Pids",l1);
						session.setAttribute("PNames",l2 );
						session.setAttribute("PImage",l3 );
						list.addAll(l2);                   
						// This is original list of patients always be maintain .
						session.setAttribute("Plist",list );
					Did = null;
					isValid=true;
				}
		}
		
		//email availability & marquee notification in forget password
		if(request.getParameter("email")!=null) {
				isValid = true;
				map.put("username",matched(request.getParameter("email"),0));
				if(request.getParameter("update")!=null&&Boolean.valueOf(map.get("username").toString())) {
					mob="";
					map.put("otpf",updatefor(request.getParameter("email")));
					if(mob!="") {
					map.put("mob",mob);
					}
				}
		}
		
		// mobile availability
		if(request.getParameter("mobile")!=null) {
				isValid = true;
				map.put("mobile",matched(request.getParameter("mobile"),1));
		}
		
		//for otp generation
		if(request.getParameter("mobile1")!=null) {
			isValid = true;
			map.put("otp",security.hash(Integer.toString(Otp.otp(request.getParameter("mobile1"),request.getParameter("Fname")))));
		}
		
		//for data updation
		if(request.getParameter("mobile2")!=null) {
				isValid = true;
                matche(request);
		}
		
		map.put("isValid",isValid) ;
		write(response,map);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("exception found this page");
		}
		finally {
				map.clear();
		}
	}

	private boolean update(String email, String pass) throws SQLException {
		Connection con = null;
		PreparedStatement stmt= null;
		boolean x = false;
         try {
        	con = mysql.connect().getConnection();
 			stmt = con.prepareStatement(update_pass);
 			stmt.setString(1,pass);
 			stmt.setString(2,email);
 			x=!(stmt.execute());
         }catch(Exception e) {
        	 e.printStackTrace();
         }
         finally {
        	 con.close();
        	 stmt.close();
         }
		return x;
	}

	private String updatefor(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt= null;
		ResultSet rs=null;
		String x = "";
		try {
			con = mysql.connect().getConnection();
			stmt = con.prepareStatement(chek_email);
			stmt.setString(1,email);
			stmt.execute();
		    rs = stmt.getResultSet();
		    if(rs.next()) {
		    	x=security.hash(Integer.toString(Otp.otp(rs.getString(7),rs.getString(2))));
		    	for(int i=6;i<10;i++) {
		    		mob=mob+(rs.getString(7).toCharArray()[i]);
		    	}
		    }
		}catch(Exception e) {
			System.out.println(e+"update error");
		}
		finally {
			con.close();
			stmt.close();
			rs.close();
		}
		return x;
	}

	private boolean login(String email, String password) throws SQLException {
		Connection con = null;
		PreparedStatement stmt= null;
		ResultSet rs=null;
		boolean x = false;
		try {
			con = mysql.connect().getConnection();
			stmt = con.prepareStatement(chek_email);
			stmt.setString(1,email);
			stmt.execute();
		    rs = stmt.getResultSet();
			if(rs.next()&&rs.getString(5).equalsIgnoreCase(password)) {
			x=true;
			Did = rs.getString(1).toString();
			System.out.println(Did);
			}
			else {
			x=false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("login exception");
		}finally {
			con.close();
			stmt.close();
			rs.close();
		}
		return x;
	}

	private void matche(HttpServletRequest request) throws SQLException  {
		Connection con = null;
		PreparedStatement stmt= null;
		try {
		con = mysql.connect().getConnection();
		stmt = con.prepareStatement(insert_DocReg);
		stmt.setString(1,request.getParameter("Fname1"));
		stmt.setString(2,request.getParameter("Lname"));
		stmt.setString(3,request.getParameter("email1"));
		stmt.setString(4,security.hash(request.getParameter("password")));
		stmt.setString(5,request.getParameter("degree"));
		stmt.setString(6,request.getParameter("mobile2"));
		stmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("data update");
			e.printStackTrace();
		}
		finally {
			con.close();
			stmt.close();
		}
	}

	private boolean matched(String username, int y) throws SQLException {
		boolean x = false;
		Connection con = null;
		PreparedStatement stmt= null;
		ResultSet rs=null;
		try {
			con = mysql.connect().getConnection();
				if(y==0) {
					stmt = con.prepareStatement(chek_email);	
				}
				else {
					stmt = con.prepareStatement(chek_mobile);
				}
				
				stmt.setString(1,username);
				stmt.execute();
				rs = stmt.getResultSet();
				if(rs.next()) {
					x= true;
				}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
				con.close();
				stmt.close();
				rs.close();
		}
		return x;
	}

	private void write(HttpServletResponse response, Map<String, Object> map) throws IOException {
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));
	}
}
