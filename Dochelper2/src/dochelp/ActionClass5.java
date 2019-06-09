package dochelp;

/* Thses Package uses in this class.*/
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.google.gson.Gson;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


@WebServlet("/ActionClass5")
public class ActionClass5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/healthease")
	private DataSource dataSource;
          
	/*
	 * This Class use to Operate all the operation is related to data patients.
	 * 
	 * < Like->PANEL PAGE OF DOCTOR, SELECTION, DELETION, SEARCHING, EXPORTING THE DATA(PDF or EXCEL),
	 * LOGOUT OPERATION, REPRESENTING THE PATIENTS DATA AND ALSO, 
	 * SEARCH REALTED SUGGEST NAME OF PATIENTS. >
	 *     
	 */
	
    public ActionClass5() {
        super();
       }
    
    /* 
     * GLOBAL VARIABLE ,
     * Initialized the uses objects of classes and variable in this Class.
     * 
     */
    
     
     int editexcel=1;
     int editpdf=1;
	 Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet rs=null;
	 FileOutputStream fexcel=null;
	 XSSFWorkbook workbook =null;
	 XSSFSheet spreadsheet=null;
	 XSSFRow row=null;
	 XSSFCell cell=null;
	 boolean excelindicator=true;
	 Document doc= null;
	 Font f=null;
	 File fio=null,fin=null;
	 FileOutputStream fpdf=null;
	 int c=1;
	 int irow;
	 boolean pdfindicator=true;
	 float fno;
	 Paragraph para=null;
	 int width= 20*256;
     short height=60*20;
     HttpSession session;
 	 String search=null;
 	 Map<String,Object> map= null,map2=null;
     boolean found=false;
     String r=null;
     List<String> nameList=null ;
     int newPage=0;
	 
    @SuppressWarnings({ "resource", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		/*<==========================================================================>*/
		
		String[] local= request.getParameterValues("patientdetails");
		/*
		 * Selection process done by Selected Checkbox of Patients .
		 */
		try {
			
			con = dataSource.getConnection(); // CONNECTION TO DATABASE OF DOCHELPER.
			
		  int id=0;
		
		 if(local[0].split(",")!= null) {
			 
	     String[] pat=local[0].split(",");
		 irow = 1;
		 excelindicator=true;
		 pdfindicator=true;
         fno=680f;
         fio=null;
         fin=null;
         c=1;//imgcell
         ps=null;
         rs=null;
         para=null;
         f=null;
         doc=null;
         editexcel=1;
         editpdf=1;
    	 fexcel=null;
    	 workbook =null;
    	 spreadsheet=null;
    	 row=null;
    	 cell=null;
         doc= null;
         newPage=0;
    	 
         String check= request.getParameter("DATA");
         /*
          * Here, Exporting operation done (i)-> First operation related to export is to 
          * Check the Existing File which is use to save the data of selected patients in PDF or Excel format.
          * if File is not exist then, created the new File of Export.
          */
         if(check.equals("EXPORT EXCEL")) { 
        	 while(true) {
        	 fio =new File("D://PATIENTS"+editexcel+".xlsx");
        	 if(fio.exists()) {
              editexcel++;  
        	 }else {	
        		break; 
        	 }
           }
        	 fexcel = new FileOutputStream(fio);
       }else if(check.equals("PDF")) {
        	while(true) {
        	fin= new File("D://patientsPDF"+editpdf+".pdf");
        	if(fin.exists()) {
             editpdf++;	
        	}else {
        		break;
        	}
           }
        	 fpdf= new FileOutputStream(fin);
         }
         
         /* < =================================================================== > */
         
         
         for(String s: pat) {
        	 
        	 /*
        	  * Now, In this Loop select particular patients oneby one for Operation 
        	  * according to Doctor wants.
        	  */
        	 
        	 id= Integer.parseInt(s);	
				
		    String h= request.getParameter("DATA"); 
		    /* H = VARIABLE, HOLDS THE STRING TO TELLS THE PROGRAM WHICH OPERATION DO RELATED THE PATIENT DATA.*/
     	  
	   if(h.equals("Delete")) {
     	   //(II)DELETE==========================================================>
     	    
		    	delete(id);	
		    /*
		     * DELETE FUNCTION(); USE TO DELETE MANY PATIENTS FROM THE DATABASES OR DOCTOR PANEL,
		     * AND ALSO, DOCTOR CAN DELETE PARTICULAR PATIENTS DATA.
		     * */  
		    }
		   
      else if(h.equals("EXPORT EXCEL")){
          //(II)EXCEL WRITE=======================================================>
    	    ExcelExport(id);
    	   /*
    	    * ExcelExport(); USE TO WRITE SELECTED PATIENTS DATA IN EXCEL FILE .
    	    * */
           }
		    
      else if(h.equals("PDF")){
         //(II)PDF WRITE===========================================================>
    	      pdfExport(id); 	   
    	   /*
       	    * pdfExport(); USE TO WRITE SELECTED PATIENTS DATA IN PDF FILE .
       	    * */
          }
    	}
   }
      	    
		}catch(Exception e) {
			e.printStackTrace();
       }finally{
    	   /* In finally all work in done then, close all the connection of realted programs.
    	    * Like--> Databases connection and other file closed.
    	    */
        if(workbook !=null){
        	
         workbook.write(fexcel);
         workbook.close();
         workbook=null;
        }
    	if (fexcel != null) {
	     
    	 fexcel.flush();	
         fexcel.close();
        }
        if(doc != null) {
        	
	    doc.close();
	    }
        if(fpdf!=null) {
        	
        fpdf.flush();
        fpdf.close();
        }
    	 try {
		con.close();
    	} catch (SQLException e) {
 		e.printStackTrace();
     	}
	 
  }
	
}
    
    
/*This function Export the data of patients in excel file .*/
  protected void ExcelExport(int id) {
	 try {	
       				if(excelindicator==true) {
    		      workbook = new XSSFWorkbook(); 
    		     spreadsheet = workbook.createSheet("Patients Details");
    		     row = spreadsheet.createRow(0);		    
    	         cell = row.createCell(1);
    	         cell.setCellValue("Pid-->");
    	         cell = row.createCell(2);
    	         cell.setCellValue("PName-->");
    	         cell = row.createCell(3);
    	         cell.setCellValue("PAge-->");
    	         cell = row.createCell(4);
    	         cell.setCellValue("PSex-->");
    	         cell = row.createCell(5);
    	         cell.setCellValue("PAddress-->");
    	         cell = row.createCell(6);
    	         cell.setCellValue("PDate-->");
    	         cell = row.createCell(7);
    	         cell.setCellValue("PhoneNo-->");
    	         cell = row.createCell(8);
    	         cell.setCellValue("PEmail-->");
    	         cell = row.createCell(9);
    		     cell.setCellValue("PImage-->     ");
    	        excelindicator=false;
    			}   			  
   	        ps = con.prepareStatement("select * from patients where PID="+id);
   	        //CMD3-> BY PID TAKES ALL DATA OF PATIENTS TO WRITE IN EXCEL FILE.
   	        rs=  ps.executeQuery();			  
    	      while(rs.next()) { 
               row = spreadsheet.createRow(irow);
  	            int x=1;   	          
    	      for(int j=1;j<=10;j++) {	
    	       	  if(j==2) {
    	       		  // Docid skip to not write in patien excel file.
    	   		  continue;
            	  }
   	          cell = row.createCell(x); 	            
    	         if(j!=10) {
    	        	 // Image of patient write in Excel file.
              cell.setCellValue(rs.getString(j));
 	            spreadsheet.autoSizeColumn(x);
   	            x++;
   	          }else {
    //---------------------=============Image write==================--------------------//
    	            InputStream inputStream = new FileInputStream(rs.getString(j));
    	            byte[] bytes = IOUtils.toByteArray(inputStream);
    	            int pictureIdx =  workbook .addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
    	            inputStream.close();
    	            CreationHelper helper =  workbook .getCreationHelper();
    	            Drawing<?> drawing = spreadsheet.createDrawingPatriarch();
    	            ClientAnchor anchor = helper.createClientAnchor();
    	            anchor.setCol1(9);
    	            anchor.setRow1(c);
    	            Picture pict= drawing.createPicture(anchor, pictureIdx);
    	            pict.resize(1,1); // cover according to suitable col.
    	            spreadsheet.setColumnWidth(9, width);
    	            cell.getRow().setHeight( height);
    	             //Reset the image to the original size
    	            spreadsheet.autoSizeColumn(9);
    	               }
    	             }
    	            c++;
    	            irow++;// NUMBERS OF ROWS COUNTS IN NEW EXCEL FILE .
    	           }
                  
    	     	}catch(Exception e) {
    			e.printStackTrace();
    	    	}	    
    }
    
  
  /*This function Export the data of patients in pdf file .*/ 
    protected void pdfExport(int id) {
    	try {
	        ps = con.prepareStatement("select * from patients where PID="+id);
	   //CMD4-> BY PID FETCH THE DATA OF PATIENTS TO USE THE WRITE A DATA IN PDF FILE.
			rs=  ps.executeQuery();
		if(pdfindicator==true) {
		   doc=new Document();
          PdfWriter.getInstance(doc, fpdf);
		   doc.open();
	       f= new Font();
	       f.setStyle(Font.BOLD);
	       f.setSize(25);
        doc.add(new Paragraph("Patient Details-->",f));
        pdfindicator=false; 
    	}
	     para= new Paragraph();
         if(rs.next()) {  	 
        	
         Image img= Image.getInstance(rs.getString(10));
            img.setAbsolutePosition(500f, fno+15);
         	img.scaleToFit(106, 50);
        	doc.add(img);
        	para.add("\n");
        	para.add("\n");
        	para.add("\n");	
        	para.add("Pid-->"+rs.getInt(1)+"\nPName-->"+rs.getString(3)+"\nPAge-->"+rs.getInt(4)+"\nPSex-->"+rs.getString(5)+"\nPAddress-->"+rs.getString(6)+"\nPDate-->"+rs.getString(7)+"\nPEmail-->"+rs.getString(9)+"\nPMobileNo.-->"+rs.getString(8));
        	para.add("\n");
        	para.add("\n");
        	para.add("\n");
        	para.add("---------------------------------------------------------------------------\n");
        	
        	doc.add(para);
        	fno=fno-240;
        	System.out.println(fno);
        	if(newPage==2) {
        		newPage=-1;// reset the page write action .
        		fno=708f;
        		doc.newPage();// Use to write new page in pdf file. 
        	}
        
        	newPage++;// counts pages of pdf.
         }
   		}catch(Exception e) {
   			e.printStackTrace();
   		}
    }
    
    
    /*This function delete the data of patients  .*/
    protected int delete(int id) {
    	int p=0;
    	try {
			ps = con.prepareStatement("Delete from patients where PID="+id);
			//CMD5->BY PID DELETE PARTICULAR PATIENTS DATA .
			p= ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
    }
    	
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] pat= request.getParameterValues("patientdetails");
		/* pat variable, tells the selected patients . */
		if(pat==null) {
		try {
			/* This function use to run when no one patients is selected 
			 * this indicated doctor input from search the patients name. 
			 * */
			search(request,response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			nameList=null;
			map=null;
		}	
		}else {
		doGet(request, response);
		}
	}
	
	
	/* This function() use to tell the inputs from searching the data is Id or Name
	 * means (Integer or String).*/
	 protected  boolean isInteger(String s) {
		    try { 
		        Integer.parseInt(s); 
		    } catch(NumberFormatException e) { 
		        nameList.clear();
		    	return false; 
		    } catch(NullPointerException e) {
		    	nameList.clear();
		        return false;
		    }
		    
		    return true;
		}
	 

	/* This function LOgically found the Name related to inputs of searching words of patients Name. */ 
	 protected void search(HttpServletRequest request, HttpServletResponse response)throws  ClassNotFoundException, ServletException, IOException {
	/* By Ajax through this function is call. */
		 session =request.getSession(true);
			 search= request.getParameter("searchdata");
			 nameList= new ArrayList<>();
			 map= new HashMap<>();
				if(!isInteger(search)) {
					String s="(.*)"+search+"(.*)";
					@SuppressWarnings("unchecked")
					List<String> NAME= (List<String>)session.getAttribute("Plist");
					Iterator<String> it=NAME.iterator();
					while(it.hasNext()) {
					r= it.next();
					if(r.matches(s)) {	  
						nameList.add(r);
                  /*In this function input word compare the original list of patient and send those the 
                   * who is similar to input string ( this operation work for searching suggestion of name). */
					}
					}
					
					if(nameList.isEmpty()) {
					nameList.add("This name is noT in LIST");
					}
				}
				
				
				map.put("found",found);
				map.put("name",nameList);
				write(map,response);
		 }
	 
	 private void write(Map<String,Object> map,HttpServletResponse response){
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));
			/*BY using gson we send the list of suggested name of patients
			 * without Refreshing the home page .
			 */
			
		} catch (IOException e) {
			e.printStackTrace();
		} 
	 }
} 
