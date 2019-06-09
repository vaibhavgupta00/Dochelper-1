package dochelp;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;

/**
 * Servlet implementation class Servest
 */
@WebServlet("/Servest")
public class Servest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/vgdochelper")
	DataSource dataSource;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null)
			request.getRequestDispatcher("/HomePageold11.jsp").forward(request, response);
		else{
			try {
				String command = request.getParameter("command");//?
				System.out.println(command);
				
				switch(command) {
				case "patientRecord":	callPatientRecord(request, response, session);
										break;
				case "prflag":			callPrFlag(request, response, session);
										break;
				case "deleteRecord":	calldeleteRecord(request, response);
										break;
				case "exportRecord":	callExportRecord(request, response);
										System.out.println("3");
				default:				System.out.println("4");
										request.getRequestDispatcher("/patientRecord.jsp").forward(request, response);
				}
			}catch(Exception e) {e.printStackTrace();request.getRequestDispatcher("/HomePageold11.jsp").forward(request, response);}
		}
	}
	
	

	@SuppressWarnings("unchecked")
	private void callPrFlag(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.out.println("yesssssssss");
		/*List<Map<String, String>> uploadList = null;
		uploadList = (List<Map<String, String>>) session.getAttribute("uploadList");
		Map<String, String> uploadMap = new HashMap<>();
		uploadMap.put("Date", request.getParameter("date"));
		uploadMap.put("Disease", request.getParameter("disease"));
		String localpath = request.getParameter("Prescription");
		//TODO:	sub folders for every doctor + preview name in case of duplicates.
		String serverPath = "images//" + localpath.substring(localpath.lastIndexOf("\\"));
		uploadMap.put("Prescription", serverPath);
		uploadList.add(uploadMap);
		session.setAttribute("uploadList", uploadList);*/
	}

	private void calldeleteRecord(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		Connection conn = null;
		try{
			conn = dataSource.getConnection();
			if(conn.createStatement().executeUpdate("delete from patient where pid = '" + request.getSession().getAttribute("patientID") + "';") != 0)
				System.out.println("Deleted successfully");
			else
				System.out.println("Deletion impossible!");
			conn.createStatement().executeUpdate("delete from disease where pid = '" + request.getSession().getAttribute("patientID") + "';");
			request.getRequestDispatcher("/homepage.jsp").forward(request, response);
		}catch(Exception e) {e.printStackTrace();}finally {if(conn != null) {conn.close();}}
	}

	private void callExportRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		@SuppressWarnings("unchecked")
		Map<String, String> recordMap = (Map<String, String>) request.getSession(false).getAttribute("recordMap");

        HSSFWorkbook wb = null;
        wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("Excel Sheet");
        HSSFRow rowhead = sheet.createRow((short) 0);
        //rowhead.createCell((short) 0).setCellValue("PID");
        //rowhead.createCell((short) 1).setCellValue("DID");
        rowhead.createCell((short) 0).setCellValue("FULL NAME");
        rowhead.createCell((short) 1).setCellValue("AGE");
        rowhead.createCell((short) 2).setCellValue("SEX");
        rowhead.createCell((short) 3).setCellValue("E-MAIL");
        rowhead.createCell((short) 4).setCellValue("CONTACT");
        rowhead.createCell((short) 5).setCellValue("ADDRESS");
        
        for(int i = 0; i < 6; i++) {
        	sheet.setColumnWidth(i, 30 * 256);
        }
                HSSFRow row = sheet.createRow((short) 1);
                //row.createCell((short) 0).setCellValue(Integer.parseInt(recordMap.get("PID")));
                //row.createCell((short) 1).setCellValue(Integer.parseInt(recordMap.get("DID")));
                row.createCell((short) 0).setCellValue(recordMap.get("FULL_NAME"));
                row.createCell((short) 1).setCellValue(Integer.parseInt(recordMap.get("AGE")));
                row.createCell((short) 2).setCellValue(recordMap.get("SEX"));
                row.createCell((short) 3).setCellValue(recordMap.get("E_MAIL"));
                row.createCell((short) 4).setCellValue(recordMap.get("CONTACT"));
                row.createCell((short) 5).setCellValue(recordMap.get("ADDRESS"));
                
                HSSFRow rowhead2 = sheet.createRow((short) 5);
                rowhead2.createCell((short) 0).setCellValue("DATE");
                rowhead2.createCell((short) 1).setCellValue("DISEASE");
                rowhead2.createCell((short) 2).setCellValue("PRESCRIPTION");
                
                int i = 6;
                @SuppressWarnings("unchecked")
				List<Map<String, String>> drugMap = (List<Map<String, String>>) request.getSession(false).getAttribute("drugMap");
                for(Map<String, String> dm: drugMap) {
                	HSSFRow row2 = sheet.createRow((short) i++);
                	row2.createCell((short) 0).setCellValue(dm.get("DATE"));
                	row2.createCell((short) 1).setCellValue(dm.get("NAME"));
                	//TODO: add image in excel column...
                	Cell cell = row2.createCell((short) 2);//.setCellValue(dm.get("PRESCRIPTION"));
                	FileInputStream inputStream = new FileInputStream("C:\\eclipse\\dd.jpg");
                	byte[] bytes = IOUtils.toByteArray(inputStream);
                	System.out.println(bytes.length);
                	int pictureIdx = wb.addPicture(bytes, Workbook.PICTURE_TYPE_JPEG);
                	inputStream.close();
                	//returns an object that handles instantiating concrete classes
                	CreationHelper helper = wb.getCreationHelper();
                	//creates the top level drawing patriarch
                	Drawing drawing = sheet.createDrawingPatriarch();
                	//create an anchor that is attached to the worksheet
                	ClientAnchor anchor = helper.createClientAnchor();
                	
                	//create an anchor with upper-left and bottom-right cells
                	anchor.setCol1(1);	//column B
                	anchor.setRow1(2);	//Row 3
                	anchor.setCol2(2);	//column C
                	anchor.setRow2(3);	//Row 4
                	
                	//creates a picture
                	drawing.createPicture(anchor, pictureIdx);
                	
                	//reset the image to the original size
                	//pict.resize();	//not recommended; let anchor resize the image
                	//set width to n characters widths = count characters * 256;
                	//set height to n points to twips = n * 20
                	cell.getRow().setHeight((short) (60*20));
                }
        
        FileOutputStream fileOut = null;
        try{
        	fileOut = new FileOutputStream("D:\\excelFile.xlsx");
        	wb.write(fileOut);
        	}catch(IOException e) {e.printStackTrace();}finally {if(fileOut != null) {fileOut.close();}if(wb != null) {wb.close();}}
        System.out.println("Data is saved in excel file.");
	}

	private void callInsertUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("update patient set FULL_NAME = ?, AGE = ?, SEX = ?, CONTACT = ?, ADDRESS = ?, E_MAIL = ? where PID = ?");
			pstmt.setString(1, request.getParameter("FULL_NAME"));
			pstmt.setInt(2, Integer.parseInt(request.getParameter("AGE")));
			pstmt.setString(3, request.getParameter("SEX"));
			pstmt.setString(4, request.getParameter("CONTACT"));
			pstmt.setString(5, request.getParameter("ADDRESS"));
			pstmt.setString(6, request.getParameter("E_MAIL"));
			pstmt.setInt(7, Integer.parseInt((String)request.getSession(false).getAttribute("patientID")));
			pstmt.execute();
			pstmt.close();
			/*
			pstmt = conn.prepareStatement("insert into drug  values(PID = ?, date = ? name = ?, prescription = ?");	//won't allow to modify drugDetail but delete or add one.
			pstmt.setString(0, (String)request.getSession(false).getAttribute("patientId"));
			pstmt.setInt(1, Integer.parseInt(request.getParameter("age")));
			pstmt.setString(2, request.getParameter("sex"));
			pstmt.setString(3, request.getParameter("contact"));
			pstmt.setString(4, request.getParameter("address"));
			pstmt.setString(5, request.getParameter("email"));
			pstmt.execute();
			*/
	
			hitDB(request, response, session);
		}catch(Exception e) {e.printStackTrace();}finally {if(pstmt != null) {pstmt.close();}if(conn != null) {conn.close();}}
	}

	private List<Map<String, String>> drugDB(HttpSession session) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		List<Map<String, String>> drugList = null;
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			//MetaData of table to get column names; to be used as keys and record data as values
			drugList = new ArrayList<>();
			rs = stmt.executeQuery("select * from disease where pid = '" +session.getAttribute("patientID") + "';");
			rsmd = rs.getMetaData();
			
			while(rs.next()){
				Map<String, String> drugRow = new HashMap<>();
				for(int i = 2; i <= rsmd.getColumnCount(); i++)
					drugRow.put(rsmd.getColumnName(i), rs.getString(i));		//#####separate catches for blobs#####
				drugList.add(drugRow);
			}
			return drugList;
		}catch(Exception e) {e.printStackTrace(); return drugList;}finally {if(rs != null) {rs.close();}if(stmt != null) {stmt.close();}if(conn != null) {conn.close();}}
	}

	private void hitDB(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException, SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		FileOutputStream fos = null;
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			Map<String, String> recordMap = new LinkedHashMap<String, String>();	//Map<columnHead, columnValue>
			rs = stmt.executeQuery("select * from patient where pid = '" + session.getAttribute("patientID") + "';");
			rsmd = rs.getMetaData();
			rs.next();
			for(int i = 2; i < rsmd.getColumnCount() - 1; i++)
				recordMap.put(rsmd.getColumnName(i + 1), rs.getString(i + 1));		//????0/1????	????getString retrieving integer column value????
			/*File file = new File("//HealthEase//WebContent//images");
			if(file != null) {
			fos = new FileOutputStream(file);
			byte b[];
			Blob blob = rs.getBlob("image");
			b = blob.getBytes(1, (int)blob.length());
			fos.write(b);
			fos.flush();
			request.getSession(false).setAttribute("patientImagePath", "//HealthEase//WebContent//images//currentPatient.jpg");}*/
			session.setAttribute("recordMap", recordMap);
			session.setAttribute("drugMap", drugDB(session));
			//redirect to homePage if an exception occurs
			request.getRequestDispatcher("/patientRecord.jsp").forward(request, response);
		}catch(Exception e) {e.printStackTrace();}finally {if(fos != null) {fos.close();}if(rs != null) {rs.close();}if(stmt != null) {stmt.close();}if(conn != null) {conn.close();}}
	}

	private void callPatientRecord(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException, SQLException {
		session.setAttribute("patientID", request.getParameter("data")); //"patientID" data use to get pid
		hitDB(request, response, session);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO:update data in record and redirect to patientRecord.jsp
		HttpSession session = request.getSession(false);
		if(session == null)
			request.getRequestDispatcher("/homepage.jsp").forward(request, response);
		else {
			if(request.getParameter("command").equals("insertUpdate"))
				try {
					callInsertUpdate(request, response, session);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

}





/**
 *select CAST(colName as CHAR CHARACTER SET utf8)...	//typeCasting sql data
 *will have a flag to indicate that new disease is to be filed in callInsertUpdate() if user provides one.
 *in updateRecord.jsp, disease data cannot be modified but one can be added or deleted.
 *JasperReport library to export patient's details as PDF.
 */