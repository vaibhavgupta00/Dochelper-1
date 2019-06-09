
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/fdata.js"></script>

 <script>
 function show(){
	 alert("aaaaaaaa");
	 //document.getElementById("add").display = "block";
	 $("#add").fadeIn();
 }
 
 
$(document).ready(function(){

	$("#butt").click(function(){
		ALERT("SDS00");
		$("#add").fadeIn();
		
		
	});
	
});
</script>

</head>
<body>
<b>this is the data</b>
<br>


  <c:forEach items="${list}" var="record">
   ${record.get("PID")} 
   ${record.get("NAME")} 
   ${record.get("DATE")} 
  <!--   ${record.get("PRESCRIPTION")}-->
   
   <a href="images/${record.get('PRESCRIPTION')}" download > <img src="images/${record.get('PRESCRIPTION')}" height="100" width="100"/> </a>
   <input type="button"  name ="PHOTO" value="edit" class="E1" >
   <br></br>     <br></br>      
    </c:forEach>
    
    <input type="button" value ="add"  id="butt" onclick="show();">
    
    <div id="add" style="display:none">
    	<form id = "f1" method = "POST" action = "DocHelper3" >
    		<input type = "text" name = "NAME" value = "">
    		<input type = "date" name = "DATE" value = "">
         	<input type="file" name="file" value="">
    	    <input type="submit" name="sub">
    	</form>
    </div>

</body>
</html>