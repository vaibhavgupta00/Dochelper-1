<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
session.invalidate();
response.sendRedirect("DocHelpher");//login hoga
/*

<!-- <form action="ActionClass3" id="form">-->
<!--  <span class="glyphicon glyphicon-download-alt" id="gly"></span><span><input class="buttons2" type="button" id="export"  value="Export" /></span>-->
<!--  <input class="buttons2"  NAME="DATA" value="Delete" id="delete" type="button" />-->
<!-- <input id="search" class="btn btn-success" type="button" value="Search">-->
<!-- <span id='list' style='visibility:hidden; margin-top:23px'></span>-->

var msg = '';
		        if (jqXHR.status === 0) {
		            msg = 'Not connect.\n Verify Network.';
		        } else if (jqXHR.status == 404) {
		            msg = 'Requested page not found. [404]';
		        } else if (jqXHR.status == 500) {
		            msg = 'Internal Server Error [500].';
		        } else if (exception === 'parsererror') {
		            msg = 'Requested JSON parse failed.';
		        } else if (exception === 'timeout') {
		            msg = 'Time out error.';
		        } else if (exception === 'abort') {
		            msg = 'Ajax request aborted.';
		        } else {
		            msg = 'Uncaught Error.\n' + jqXHR.responseText;
		        }
		        alert(msg);

System.out.println(nameList+" originsl"+NAME);

/* Blob b= rs.getBlob(10);//PROBLEM
         	byte[] bar= b.getBytes(1, (int)b.length());
         	Image img= Image.getInstance(bar);

         	
         	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->


System.out.println("close");
System.out.println("closefile");


//InputStream inputStream = rs.getBinaryStream(j);
// pict.resize(1,1 );  // c++;

// out1 = new FileOutputStream(fio);
    	          // workbook.write(out1);

// LOOP CLOSE
		//response.sendRedirect("DocHelpher");//FOR REPRESENT PAGE AGAIN
        // map2=new HashMap<>();
         //map2.put("isgO", isgO);
        // write(map2,response);
        
        /* else{
		  //IF NO CORRECT BUTTON CHOSSEN FOR OPERATION	
			String pselect= request.getParameter("data");//CREATE ATTRIBUTE FOR USE TO PASS NEXT CODE.		
			if(pselect== null) {
			//out.println("<html><body style=' background-color:#5c755e;  text-align: center'><br><h1>Please ! select particular name for operation</h1><a href='http://localhost:8081/vgdochelper/DocHelpher''/>BACK</a></body></html>");
			//confirm box show
			}
			//USE BELOW CODE TO FINDING THE ID OF PATIENT FOR USING THE FURTHER NEXT PAGE CODE-->
			else {
			System.out.println(pselect);//Selected Checkbox Take Input
			ps = con.prepareStatement("select * from patients where PID='"+pselect+"'");//YE JHA KO DENA HAI data se sidha le le
			rs=  ps.executeQuery();	
			while(rs.next()) {
		out.println("<html><body><table border='1'><tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td></tr></table></body></html>");			
			}
			}
			}*/ 
/*

int p;
if(p==0) {
     	   	   System.out.println("not deleted");
			       }else {
		       System.out.println("deleted");
			       }

id=1;*/

//order by PDate desc; 

//import java.util.Base64;
//import java.util.HashMap;
//import java.util.Map;

//byte[] imgData = rs.getBytes(3); // blob field //PROBLEM 
		 	//l3.add(Base64.getEncoder().encodeToString(imgData));


// byte[] imgData = rs.getBytes(3); // blob field  
			  //l3.add(Base64.getEncoder().encodeToString(imgData));

/*
 session.setAttribute(String.valueOf(id),"DID");//ye login me banega.
			 HTTPSession session = request.getSession(true);
			 long dId= (long) session.getAttribute("DOCID");
			// use docid
			 

 linear-gradient(to top right, #EDEDFB 10%,#92B4F2 );

.element{
 margin-left:270px;
margin-top:23px;
color:green;

}
.gly{
height:15px;
background-color:white;
color:#5c755e;
width:15px;
border-radius:3px;
}

$.each(data.name, function(index,value) {
			    	if(value == "This name is noT in DataBase"){
			    		$('#list').empty();
			    		$('#list').append("<span id='names"+n+"'' style='margin-top:23px;'>"+value+"</span><br>");	
			    		return false;
			    	}
			    	indicator=false;
			    	$.each(matches,function(t,v){
			    		if(v == value){
			    			indicator=true;
			    		}
			    	});
			    	if(indicator == false){
			    	$('#list').append("<span id='names'"+n+"' class='my' style='margin-top:23px;'>"+value+"</span><br>");
			    	n++;
			    	matches.push(value);
			    	matches = Array.from(new Set(matches));
			    	}else{
			    	matches=[];
			        $('#list').empty();
			    	}
			    });	    
var arr = jQuery.makeArray( elems );
// Use an Array method on list of dom elements
arr.reverse();
$( arr ).appendTo( document.body );


$('#list').click(function(event){
	 var s=$(event.target);
	 var t=$(s).text();
	    $('#bar').val(t);
	  });



var tags = [
            {"label": "ActionScript", "value": 1},
            {"label": "AppleScript", "value": 2},
            {"label": "Asp", "value": 3}
        ];
        $( "#tags" ).autocomplete({ 
            source: tags,
            select: function (event, ui) {
                $("#tags_code").val(ui.item.value);  
            }
        });

$('#list,#names').click(function(){
			 var t=$('#list , #names').text();
			    $('#bar').val(t);
			  });

<span id='names"+n+"' style='margin-top:23px;' onclick='myselector(this.id);'>

function myselector(source){
var t= document.getElementById(source).value;
document.getElementById('#bar').innerText = t;
}

$('#export').click(function(){
	 var n = $('.checkboxClass:checked').length;
	 if(n==0){
		 alert("please! select paticular name of patient for export ")
	 }
});
				 
alert( "Handler for .submit() called." );
event.preventDefault();

		
function validLogin(){
	checkboxes = document.getElementsByName('patientdetails');
	if (checkboxes.length == 0){
	alert ( "Please select Patient Name." );
	return true;
	}
}
				 
*/
%>
</body>
</html>