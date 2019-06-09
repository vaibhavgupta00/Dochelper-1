package dochelp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//HOMEPAGE OF DOCTOR PANEL TO SHOW LIST OF PATIENTS START HERE ->

@WebServlet("/DocHelpher3")
public class DocHelpher3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public DocHelpher3() {
        super();
    }
    
    /* This Class use to represent the data of Patients in a Doctor Panel.  */
    
    //Initialized the uses objects of classes and variable .
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HttpSession session=null;
    PrintWriter out=null;
	List<Integer> l1=null;
	List<String> l2=null;
	List<String> l3=null;
	List<String> list=null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
		 *  By session thought found DOCID AND SPREAD HIS/HER PATIENTS IN LINE WISE ,
		 * OnLy Those patients show which are comes his Doctor place(clinic or Hospital) .
		 */

                 l1= new ArrayList<>(); // This is holds the id.
		         l2= new ArrayList<>(); // This is holds the name.
		         l3= new ArrayList<>(); // This is holds the image.
		       list= new ArrayList<>(); // This is holds the name for using the Suggestion in Search operation.

		String search= request.getParameter("searchdata");
		out = response.getWriter();
		try {
			
	    //long id= (long) session.getAttribute("DID");// sk se attribute aaega.Did ke liye.
	    // Takes doctorID those who logged in .
			// This condition use to check Doctor is not currently logged. 
		
	    HttpSession session=request.getSession();
		try {
			con = mysql.connect().getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("hello");
		}
		if(search== null  ) {
		try {
			ps = con.prepareStatement("select PID,Name,Image from patient where DID=36");
			//ps.setString(1,request.getParameter("Did_log").toString());
			//CMD1-> BY DOCID THROUGH GET THE DATA OF 3 COLUMNE PATIENTS . 
			rs=  ps.executeQuery();	
		}catch(Exception e) {
			e.printStackTrace();
		}
			
			/* 
			 * Here, In code fetching the data from database of doctor table to associated patients data . 
			 */
			
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
			
			/* 
			 * SESSION GENERATES TO SAVE OF ALL LIST OF PATIENTS,
			 * ACCORDING TO ID, NAME, IMAGE.
			 */
	    	
			RequestDispatcher rd= request.getRequestDispatcher("HomePageold11.jsp");
			
			/*
			 * AND, SENDS TO REPRESENT THE DATA IN HOMEPAGE .
			 */
			rd.forward(request,response);
		  
		}else {
			   
			search(search,request, response,session);
			/*
			 * search(); Function(){
			 * Call To Use when search the patients Name or Id.
			 * } 
			 */
		   }               //ID CHECK 
	}catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
 protected void search(String search,HttpServletRequest request, HttpServletResponse response,HttpSession session)throws  SQLException, ClassNotFoundException, ServletException, IOException {
	
		if(!isInteger(search)) {
		
	    ps = con.prepareStatement("select PID,Name,Image from patient where DID=36 and Name LIKE '%"+search+"%'");
	    //CMD2-> BY DOCID  SEARCH NAME OF PATIENTS .
		rs=  ps.executeQuery();
		
		}else {
		
	    ps = con.prepareStatement("select PID,Name,Image from patient where DID=36 and PID='"+search+"'");
	    //CMD2-> BY DOCID SEARCH THE ID OF PATIENTS .
        rs=  ps.executeQuery();
		
		}
		while(rs.next()) {
			l1.add(rs.getInt(1));
			l2.add(rs.getString(2));
		    l3.add(rs.getString(3));
		}
		
		session.setAttribute("Pids",l1);
		session.setAttribute("PNames",l2 );
		session.setAttribute("PImage",l3 );
		
		/*
		 * Similar, As In Search function(){} to search the data from database table and save the data by Session through 
		 *  then, send and represent the data in Homepage of Doctor Panel .
		 */
		
 }
 
 protected  boolean isInteger(String s) {
	    try { 
	        Integer.parseInt(s); 
	    } catch(NumberFormatException e) { 
	        return false; 
	    } catch(NullPointerException e) {
	        return false;
	    }
	    // Only got here if we didn't return false.
	    return true;
	}
	

	
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
