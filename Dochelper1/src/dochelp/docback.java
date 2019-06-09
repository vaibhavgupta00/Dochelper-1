package dochelp;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class docback */
@WebServlet("/docback")
public class docback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/vgdochelper")
	private DataSource dataSource;
	
	    Connection myConn=null;PreparedStatement pstmt;ResultSet rs;
	    String filePath="C:\\Users\\Richa-Maan\\eclipse-workspace\\projectdochelper\\WebContent\\images";  
    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String name="",sex="",contact = null,address="",email="",ag="",date="",pname="";
			
	 HttpSession session = request.getSession();	
        String str="one";		
    	
    	//checking whether the photo request is given or not
		if(ServletFileUpload.isMultipartContent(request)) {
		str="two";	
		System.out.println("photo is sent");
		}
		
	    ArrayList<Object> list=new ArrayList<Object>();
		Object myObject=new Object();
	    
		switch(str)
		{
		//THIS CASE IS USED TO ACCESS DATA FROM THE PATIENT LIST
		case "one" :  
		System.out.println("i m inside "+str);		
		int age=0;
		 pname=request.getParameter("NAME");//myObject=pname;list.add(myObject);
		 session.setAttribute("pname",pname);
		ag =request.getParameter("AGE");
		session.setAttribute("age",ag);
		try {age=Integer.parseInt(ag);
		myObject=age;
		list.add(myObject);}
		catch(Exception e){System.out.print(e);}
		sex =request.getParameter("GENDER");      //myObject=sex;list.add(myObject);		
		session.setAttribute("sex",sex);
		contact =request.getParameter("CONTACT"); //myObject=contact;list.add(myObject);
		session.setAttribute("contact",contact);
		address =request.getParameter("ADDRESS");//myObject=address;list.add(myObject);
		session.setAttribute("address",address);
		email =request.getParameter("EMAIL");	//myObject=email;list.add(myObject);
		session.setAttribute("email",email);
		
	    session.setAttribute("list",list);					
	    System.out.println(list);
			break;
        
		//THIS CASE IS USED TO COPY PHOTO
		case "two" :	
		 System.out.println("im here @"+str);
		// HttpSession session1= request.getSession(false);
		 System.out.println("these are the temporary values : "+session.getAttribute("list"));		 
		 
         //insertion of photograph/prescription
		 // Check that we have a file upload request
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	    if(ServletFileUpload.isMultipartContent(request))
		{
	    //CHECKING WHETHER FILE IS PRESENT OR NOT 	
		String filePath="C:\\Users\\Richa-Maan\\eclipse-workspace\\projectdochelper\\WebContent\\images";  
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
	      String fileName=new String();
	      	if( !isMultipart ) {
	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>Servlet upload</title>");  
	         out.println("</head>");
	         out.println("<body> <body text = \"Green\" bgcolor =\"orange\">\r\n" + "");
	         out.println("<p>No file uploaded</p>"); 
	         out.println("</body>");
	         out.println("</html>");
	         }
	  
	      else {
	    	//COPYING OF PHOTO
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      
	  try {	  factory.setRepository(new File("C:\\Users\\Richa-Maan\\eclipse-workspace\\projectdochelper\\WebContent\\images\\"));
	      ServletFileUpload upload = new ServletFileUpload(factory);
	         List<FileItem> fileItems = upload.parseRequest(request);
	         Iterator<FileItem> i = fileItems.iterator();
	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>Servlet upload</title>");  
	         out.println("</head>");
	         out.println("<body>");
	         while ( i.hasNext () ) {
	            FileItem fi = (FileItem)i.next();
	            if ( !fi.isFormField () ) {
	         fileName = fi.getName();
	               File file;
	               String ext=fileName.substring(fileName.lastIndexOf("."));
	               System.out.println("extension is------------- "+ext);
	               Date d1=new Date();
	               System.out.println("DATE IS------------- "+d1+"name is"+pname);
	               
	               if( fileName.lastIndexOf("\\") >= 0 ) {
	              //  file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
	            	  System.out.println(fileName+"fileName");
	            	 
	            	  file = new File( filePath + "\\"+"1"+"1"+ext) ;
	            	  System.out.println(file);
	               } 
	              else {
	                //  file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
		            	  System.out.println(fileName+"fileName");
	            	   file = new File( filePath + "\\Ak"+"1"+"1"+ext) ;
	            	   System.out.println(file);
		           }
	               fi.write( file ) ;
	               out.println("Uploaded Filename: " + fileName.substring(fileName.lastIndexOf("\\")+1 ) + "<br> " );
	            } 
	         	try {			myConn=dataSource.getConnection();
	         	
	         	pname=(String) session.getAttribute("pname");
	         	ag=(String) session.getAttribute("age");
	         	sex=(String) session.getAttribute("sex");
	         	contact=(String) session.getAttribute("contact");
	         	address=(String) session.getAttribute("address");
	         	email=(String) session.getAttribute("email");
			    
	         	pstmt=myConn.prepareStatement("INSERT INTO PATIENT(DID,FULL_NAME,AGE,SEX,CONTACT,ADDRESS,E_MAIL) VALUES(2,'"+pname+"','"+ag+"','"+sex+"','"+contact+"','"+address+"','"+email+"')");
				pstmt.executeUpdate();
				} catch (Exception e1) {
			    e1.printStackTrace();}  
  }//CLOSING FILE NAME
	        
	         out.println("</body>"+"</html>");
             }
	        catch(Exception ex) { System.out.println(ex); }
	      }
	}//closing if
  }//closing switch
		
        //RequestDispatcher rd= request.getRequestDispatcher("ptreatment.jsp");
		  RequestDispatcher rd= request.getRequestDispatcher("dataprint2.jsp"); 
        rd.forward(request, response);		
 }//closing post

	    
	    
	    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    		try {
				myConn=dataSource.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          System.out.println("doget");
          HttpSession session = request.getSession();	
          String str="one",path="";		
      	String name="",date="",pname="";
  		
      	if(ServletFileUpload.isMultipartContent(request)) {
  		str="two";	
  		System.out.println("photo is sent");
  		}
  		
  	    ArrayList<Object> list=new ArrayList<Object>();
  		Object myObject=new Object();
  	    
  		switch(str)
  		{
  		//THIS CASE IS USED TO ACCESS DATA FROM THE PATIENT LIST
  		case "one" :  
  		System.out.println("i m inside "+str);		
  		//int age=0;
  		 pname=request.getParameter("NAME");myObject=pname;list.add(myObject);
  		String dte =request.getParameter("DATE");     myObject=date;list.add(myObject);		
  	   session.setAttribute("pname",pname);					
  	  session.setAttribute("dte",dte);					
	    break;
     
  		case "two" :	
  			 System.out.println("im here @"+str);
  			// HttpSession session1= request.getSession(false);
  			 System.out.println("these are the temporary values : "+session.getAttribute("list"));		 
  			String disease=(String) session.getAttribute("pname");
  			String date2=(String) session.getAttribute("date");
  	        
  			//insertion of photograph/prescription
  			 // Check that we have a file upload request
  			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  		    if(ServletFileUpload.isMultipartContent(request))
  			{
  		    //CHECKING WHETHER FILE IS PRESENT OR NOT 	
  			String filePath="C:\\Users\\Richa-Maan\\eclipse-workspace\\projectdochelper\\WebContent\\images";  
  		      response.setContentType("text/html");
  		      java.io.PrintWriter out = response.getWriter( );
  		      String fileName=new String();
  		      	if( !isMultipart ) {
  		         out.println("<html>");
  		         out.println("<head>");
  		         out.println("<title>Servlet upload</title>");  
  		         out.println("</head>");
  		         out.println("<body> <body text = \"Green\" bgcolor =\"orange\">\r\n" + "");
  		         out.println("<p>No file uploaded</p>"); 
  		         out.println("</body>");
  		         out.println("</html>");
  		         }
  		  
  		      else {
  		    	//COPYING OF PHOTO
  		      DiskFileItemFactory factory = new DiskFileItemFactory();
  		      
  		  try {	  factory.setRepository(new File("C:\\Users\\Richa-Maan\\eclipse-workspace\\projectdochelper\\WebContent\\images\\"));
  		      ServletFileUpload upload = new ServletFileUpload(factory);
  		         List<FileItem> fileItems = upload.parseRequest(request);
  		         Iterator<FileItem> i = fileItems.iterator();
  		         out.println("<html>");
  		         out.println("<head>");
  		         out.println("<title>Servlet upload</title>");  
  		         out.println("</head>");
  		         out.println("<body>");
  		         while ( i.hasNext () ) {
  		            FileItem fi = (FileItem)i.next();
  		            if ( !fi.isFormField () ) {
  		         fileName = fi.getName();
  		               File file;
  		               String ext=fileName.substring(fileName.lastIndexOf("."));
  		               System.out.println("extension is------------- "+ext);
  		               Date d1=new Date();
  		               System.out.println("DATE IS------------- "+d1+"name is"+pname);
  		               
  		               if( fileName.lastIndexOf("\\") >= 0 ) {
  		                System.out.println(fileName+"fileName");
  		            	  file = new File( filePath +"\\"+"1"+"1"+disease+date2+ext) ;
  		            	  System.out.println(file);
  		             path=filePath +"\\"+"1"+"1"+disease+date2+ext;
  		               } 
  		              else {
  		                   file = new File( filePath + "\\"+"1"+"1"+disease+date2+ext) ;
  		            	   System.out.println(file);
  		            	 path=filePath +"\\"+"1"+"1"+disease+date2+ext;
  		              }
  		               fi.write( file ) ;
  		               out.println("Uploaded Filename: " + fileName.substring(fileName.lastIndexOf("\\")+1 ) + "<br> " );
  		            } 
  		           	try {			myConn=dataSource.getConnection();
  		    				    pstmt=myConn.prepareStatement("INSERT INTO PATIENT(PID,DATE,NAME,PRESCRIPTION) VALUES(2,'"+pname+"','"+date+"','"+path+"')");
  		    					pstmt.executeUpdate();
  		    			} catch (Exception e1) {
  		    			    e1.printStackTrace();}  
  		    	    
  		         }//CLOSING FILE NAME
  		         out.println("</body>"+"</html>");
  	             }
  		        
  		  catch(Exception ex) { System.out.println(ex); }
  		      }
  		   }
  	     }  		
  	 }
}