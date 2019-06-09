

  <html>
  <head>
<title></title>

  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/fdata.js"></script>

<style>
body {
     background: url('https://static-communitytable.parade.com/wp-content/uploads/2014/03/rethink-target-heart-rate-number-ftr.jpg') fixed;
    background-size: cover;
}

*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    border-radius: 0.3em;
    background-color: #f2f2f2;
}

*[role="form"] h2 { 
    font-family: 'Open Sans' , sans-serif;
    font-size: 40px;
    font-weight: 600;
    color: #000000;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
}

</style>

<script>
$(function(){
	$.validator.setDefaults({
		highlight: function(element){
			$(element)
			.closest('.form-group')
			.addClass('has-error')
		},
		unhighlight: function(element){
			$(element)
			.closest('.form-group')
			.removeClass('has-error')
		}
	});
	
	$.validate({
		rules:
		{	
		    password: "required",
			birthDate: "required",
			weight: {
			    required:true,
			    number:true
			},
			height:  {
			    required:true,
			    number:true
			},
			email: {
				required: true,
				email: true
			}
		},
			messages:{			
				email: {
				required: true,
				email: true
			}
		},
				password: {
					required: " Please enter password"
				},
				birthDate: {
					required: " Please enter birthdate"
				},
				email: {
					required: ' Please enter email',
					email: ' Please enter valid email'
				},
				weight: {
					required: " Please enter your weight",
					number: " Only numbers allowed"
				},
				height: {
					required: " Please enter your height",
					number: " Only numbers allowed"
				},
			}
			
	);
});
</script>
 
 
 
 
 <script>
$(document).ready(function(){
	$('#button').click(function(){
		
		window.print();
		$.ajax({
			url:'docback',
			method:'post',
			datatype:'jason',
			data:{
			NAME:$('#NAME').val().trim(),
		    AGE:   $('#AGE').val().trim(),	
			CONTACT:$('#CONTACT').val().trim(),
			EMAIL:$('#EMAIL').val().trim(),
			ADDRESS:$('#ADDRESS').val().trim(),
			//GENDER:$('#GENDER').val().trim()
			}			
		});
	});
});


</script>

 
 
 
 
 
  </head>

<body>
<div class="container">
            <form class="form-horizontal" role="form" action="docback" method="post" enctype="multipart/form-data">
                <h2>Registration</h2>
                <div class="form-group">
				<div class="row">
                    <label for="firstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="NAME" class="form-control" name="NAME" autofocus required >
                    </div>
				</div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">AGE</label>
                    <div class="col-sm-9">
                        <input type="text" id="AGE" class="form-control" name="AGE" autofocus required>
                    </div>
                </div>
            
                <div class="form-group">
                    <label class="control-label col-sm-3">SEX(M/F/T)</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="text" id="GENDER" class="form-control" name="GENDER"  required >
                                </label>
                            </div>
                            </div>
                    </div>
                </div> 
            
            	<div class="form-group">
                    <label for="phoneNumber" class="col-sm-3 control-label">CONTACT number </label>
                    <div class="col-sm-9">
                        <input type="text" id="CONTACT" class="form-control" name="CONTACT" required>
                        <span class="help-block">Your phone number won't be disclosed anywhere </span>
                    </div>
                </div>
            
                <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">address</label>
                    <div class="col-sm-9">
                        <input type="text" id="ADDRESS"  class="form-control" name="ADDRESS" id="ADDRESS" autofocus required>
                    </div>
                </div>
            
            
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email* </label>
                    <div class="col-sm-9">
                        <input type="email" id="EMAIL"  class="form-control" name= "E_MAIL" required>
                    </div>
                </div>
                
                <br><br>
                <input type="button" value="send" name="button" id="button">
			    <br><br>
				
 			
			<div class="form-group">
                    <label for="address" class="col-sm-3 control-label">photo</label>
                    <div class="col-sm-9">
                     <input type = "file" name = "file" size = "maxFileSize" multiple  required/>
                        </div>
                </div>
                
                
            <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">*Required fields</span>
                    </div>
                </div>
                <input type="submit" id="presup" name="submit" value="two" class="btn btn-primary btn-block" >Register
           
            </form> <!-- /form -->
        </div> <!-- ./container -->
		
		
		</body>
	</html>