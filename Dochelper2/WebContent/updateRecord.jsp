<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "Servest?command=insertUpdate" method = "POST">
		<c:forEach var = "columnData" items = "${ sessionScope.recordMap }">
			<b>${ columnData.key }</b> : <input type = "text" name = "${ columnData.key }" value = "${ columnData.value }"/> <br />
		</c:forEach>
		
		
		<c:forEach var = "rowData" items = "${ sessionScope.drugMap }">
			<c:forEach var = "columnData" items = "${ rowData }">
				<c:choose>
					<c:when test = "${ columnData.key.equals('PRESCRIPTION') }">
						<img src = "${ columnData.value }" alt = "${ columnData.value }" width = "160" height = "160"/>
					</c:when>
					<c:otherwise>
						<b> ${ columnData.value } </b>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<br />
		</c:forEach>
		
		<input type = "submit" value = "Update" />
	</form>
</body>
</html>










<!-- give previous data in input fields while updating. -->
<!-- dropdown for age, radio buttons for sex -->
<!-- format same as new patient form -->