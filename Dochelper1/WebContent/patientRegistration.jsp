<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
	#upload{
		display : none;
	}
</style>

<script>
	function enableUpload(){
		var x = document.getElementById("upload");
		if(x.style.display == "none")
			x.style.display = "block";
		else
			x.style.display = "none";
	}
	
	function ss(){
		document.getElementById("demo").innerHTML = "dd";
	}
	
	function dd(){
		document.getElementById("demo").innerHTML = "ss";
	}
</script>

</head>
<body>
<p id = "demo"></p>
	<form action = "Servest" method = "POST">
		<label>Full Name : </label> <input type = "text" name = "fullName" /> <br />
		<label>Age : </label> <input type = "text" name = "age" /> <br />
		<label>Address :</label> <input type = "text" name = "age" /> <br />
		<label>E-mail :<label> <input type = "email" name = "email" /> <br />
		<label>Contact :</label> <input type = "text" name = "contact" /> <br />
		<label>Sex :</label> <input type = "radio" name = "sex" /> Female <input type = "radio" name = "sex" /> Male <input type = "radio" name = "sex" /> Transgender <br />
		
		
		<!-- jS for enabling upload option and adding uploadMaps to List(using jS/PHP/JSP) on front page
			 so that the control is not forwarded till new patient's data is not finally submitted after
			 filling all details.
			 
			 Can upload multiple prescription details in between patient BIO entry. -->
		
		
		<i onclick = "enableUpload()">+</i>
		<div id = "upload">
		<form action = "Servest" method = "POST">
			<label>Date :</label> <input type = "date" name = "date" />
			<label>Disease :</label> <input type = "text" name = "disease" />
			<label>Prescription :</label> <input type = "file" name = "prescription" />
			<input type = "hidden" name = "command" value = "prflag" />
			<input type = "submit" value = "Uplaod" />
		</form>
		</div>
		
		<c:if test = ${ not empty sessionScope.uploadList }>
			<c:forEach var = "uploadMap" items = ${ sessionScope.uploadList }>
				<c:choose>
					<c:when test = "${ uploadMap.key.equals('Prescription') }">
						<img src = "${ uploadMap.value }" alt = "${ uploadMap.value }" width = "160" height = "160"/>
					</c:when>
					<c:otherwise>
						<b> ${ uploadMap.value } </b>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
		
		
		
		<input type = "hidden" name = "command" value = "registerPatient" />
		<input type = "submit" value = "Submit" />
	</form>
	
	
	
	<!-- submit form and catch in same jsp without reloading -->
	
	<iframe name = "foo"></iframe>
	
	
	
	<%
		if(1 == 2){
	%>
	
	<script> ss(); </script>
	<%
		}
		else{
	%>
	<script> dd(); </script>
	<% } %>
	
	
	
	
	
</body>
</html>