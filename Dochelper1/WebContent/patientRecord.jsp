<!--

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body{
	background-color: #E6E6FA;
}
.contain {
  position: relative;
  width: 50%;
}

.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.contain:hover .image {
  opacity: 0.3;
}

.contain:hover .middle {
  opacity: 1;
}

.text {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
</style>
</head>
<body bgcolor="red">
<div class = "container-fluid">
	<c:forEach var = "columnData" items = "${ sessionScope.recordMap }">
		<b>${ columnData.key }</b> : ${ columnData.value }<br />
	</c:forEach>

	<br /><br /><br /><br /><br /><br />
	<c:forEach var = "rowData" items = "${ sessionScope.drugMap }">
	<div class = "row">
		<c:forEach var = "columnData" items = "${ rowData }">
			<c:choose>
				<c:when test = "${ columnData.key.equals('PRESCRIPTION') }">
				<div class = "col-sm-6">
					<div class="contain">
						<img src = "${ columnData.value }" class = "img-thumbnail" alt = "${ columnData.value }" class="image" style="width:100%"/>
						<div class="middle">
							<a href = "${ columnData.value }" target = "_blank"><div class="text">View</div></a>
					    	<a href = "${ columnData.value }" download><div class="text">Download</div></a>
					 	</div>
					</div>
				</div>
				</c:when>
				<c:otherwise>
				<div class = "col-sm-3">
					<b> ${ columnData.value } </b>
				</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	</c:forEach>
	
	<button onclick = "window.location.href = 'updateRecord.jsp'">Update</button>
	<button onclick = "window.location.href = 'Servest?command=deleteRecord'">Delete</button>
	<button onclick = "window.location.href = 'Servest?command=exportRecord'">Export</button>
	<button onclick = "window.print();">Print this page</button>
</div>
</body>
</html> -->







<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

	
	

	
	
	
	
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/udm/popper.min.js">
		</script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
.fakeimg {
			height: 200px;
			background: #aaa;
		  }

</style>
</head>
<body>

	
		<!-- <c:forEach var = "columnData" items = "${ sessionScope.recordMap }">
			<c:set var=" columnData.key " scope="session" value="${ columnData.value }" />
		</c:forEach> -->
	
	<div class="jumbotron text-center" style="margin-bottom:0">
			<h1>Gajju${ FULL_NAME }</h1>
			<p>Age: 25${ AGE} &nbsp;&nbsp;&nbsp; Sex:	F${ SEX }</p>
		</div>
	
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
				  <li class="nav-item">
					<a class="nav-link" href="Servest?command=deleteRecord">Delete</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="updateRecord.jsp">Update</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" onclick = "window.print();">Print</a>
				  </li>    
				</ul>
		  </div>  
		</nav>
	
	
	<div class="container" style="margin-top:30px">
			<h2>Patient:</h2>
			<div class="row" style="margin-top:20px">
				<div class="col-sm-4">
					<img class="fakeimg" src="images/dd.jpg" />
				</div>
				<div class="col-sm-8">
					<c:forEach var = "columnData" items = "${ sessionScope.recordMap }">
						<p><b>${ columnData.key }</b> : ${ columnData.value }</p>
					</c:forEach>
				</div>
			</div>
			<hr style="margin-top:45px;margin-bottom:45px;">
				
	<div class = "row" style="margin-top:20px">
	<c:forEach var = "rowData" items = "${ sessionScope.drugMap }">
	<div class="col-sm-4">
		<c:forEach var = "columnData" items = "${ rowData }">
		
			<c:choose>
				<c:when test = "${ columnData.key.equals('PRESCRIPTION') }">
						<img src = "${ columnData.value }" class = "img-thumbnail" alt = "${ columnData.value }"/>
				</c:when>
				<c:otherwise>
				<div class = "col-sm-3">
					<p> ${ columnData.value } </p>
				</div>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
		</div>
	</c:forEach>
	</div>
</body>
</html>





















<!--
	 session validation at top -->
















<!--
	 session validation at top -->