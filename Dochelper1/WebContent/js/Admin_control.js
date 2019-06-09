
$(document).ready(function(){

    var data = {otp:'',validate:{1:false,3:false,4:false,5:false,6:false}};

    $('#Name').on("input",function(){
        if($('#Name').val().trim()!=''){
                if((/[0-9`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi).test($('#Name').val().trim()))
                {
                        $('#name_e').html('Special Charecters not Allowed ! ');
                        $('#name_e').slideDown(500);
                        data.validate[1]=false;
                        $('#Name').css('border-color', 'red');
                    
                }
                else{
                        $('#name_e').html('');
                        data.validate[1]=true;
                        $('#Name').css('border-color', 'green');
                    }
        }
        else{
                $('#name_e').html('');
                $('#Name').css('border', '');
                data.validate[1]=false;
        }
    });
    



$('#email').on("input",function(){
    if($('#email').val().trim()!=''){
        if((new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i)).test($('#email').val().trim())){
                $.ajax({
                        url : 'error',
                        type: 'POST',
                        dataType: 'json',
                        data: {email:$('#email').val().trim()},
                        success: function(data){

                            if(data.isValid){
                                if(data.username){
                                $('#email_e').html('email alraedy exist');
                                $('#email_e').slideDown(500);
                                $('#submit1').prop('disabled',true);
                                }
                                else{
                                        $('#email_e').html('');
                                        if($('#mobile_e').html()==''){
                                        $('#submit1').prop('disabled',false);
                                        $('#email').css('border-color','green');
                                        }
                                    }
                            }
                            else{
                                $('#email_e').html('');
                                $('#email').css('border-color','green');
                            }
                        }
                    });
                    data.validate[3]=true;
        }
        else{
                    $('#email_e').html('invalid email !');
                    $('#email_e').slideDown(500);
                    data.validate[3]=false;
                    $('#email').css('border-color', 'red');
        }
    }
    else{
        $('#email').css('border', '');
        $('#email_e').html('');
        data.validate[3]=false; 
    }
});

$('#mobile').on("input",function(){
        if($('#mobile').val().trim()!=''){
            if(!isNaN($('#mobile').val())){
                if(($('#mobile').val().length)==10){
                     $.ajax({
                        url : 'error',
                        type: 'POST',
                        dataType: 'json',
                        data: {mobile:$('#mobile').val().trim()},
                        success: function(data){
                            if(data.isValid){
                                if(data.mobile){
                                $('#mobile_e').html('Mobile number alraedy exist');
                                $('#mobile_e').slideDown(500);
                                $('#submit1').prop('disabled',true);
                                $('#mobile').css('border-color', 'red');
                                }
                                else{
                                    $('#mobile_e').html('');
                                    if($('#email_e').html()==''){
                                        $('#submit1').prop('disabled',false);
                                        $('#mobile').css('border-color', 'green');
                                    }
                                }
                            
                            }
                            else{
                                $('#mobile_e').html(''); 
                                $('#mobile').css('border-color', 'green');
                            }
                            
                        }
                    });
                    data.validate[4]=true;
                }
                else{
                     $('#mobile_e').html('invalid mobile Number !');
                     $('#mobile_e').slideDown(500);
                     data.validate[4]=false;
                     $('#mobile').css('border-color', 'red');
                }

        }
        else{
             $('#mobile_e').html('Must input numbers !');
             $('#mobile_e').slideDown(500);
             data.validate[4] =false;
             $('#mobile').css('border-color', 'red');
        }
            }
            else{
                     $('#mobile_e').html('');
                     data.validate[4]=false;
                     $('#mobile').css('border', '');
                }
    
});

$('#password').on("input",function(){
    var pass = {1:false,2:false,3:false,4:false,5:false};
    if($('#password').val().trim()!=''){
            if($('#password').val().match(/[a-z]/g)){
                $('#ps3val0').hide();
                $('#ps3val1').show();
                pass[1]=true;
            }
             else{
                $('#ps3val1').hide();
                $('#ps3val0').show();
                pass[1]=false;
            }
            if($('#password').val().match(/[A-Z]/g)){
                $('#ps4val0').hide();
                $('#ps4val1').show();
                pass[2]=true;
            }
            else{
                $('#ps4val1').hide();
                $('#ps4val0').show();
                pass[2]=false;
            }
            if($('#password').val().match(/[0-9]/g)){
                $('#ps2val0').hide();
                $('#ps2val1').show();
                pass[3]=true;
            }
            else{
                $('#ps2val1').hide();
                $('#ps2val0').show();
                pass[3]=false;
            }
            if($('#password').val().length>=8){
                $('#ps1val0').hide();
                $('#ps1val1').show();
                pass[4]=true;
            }
            else{
                $('#ps1val1').hide();
                $('#ps1val0').show();
                pass[4]=false;
            }
            if($('#password').val().match(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi)){
                $('#ps5val0').hide();
                $('#ps5val1').show();
                pass[5]=true;
            }
            else{
                $('#ps5val1').hide();
                $('#ps5val0').show();
                pass[5]=false;
            }
    
}
            else{
                $('#ps3val1').hide();
                $('#ps3val0').show();
                $('#ps5val1').hide();
                $('#ps5val0').show();
                $('#ps1val1').hide();
                $('#ps1val0').show();
                $('#ps2val1').hide();
                $('#ps2val0').show();
                $('#ps4val1').hide();
                $('#ps4val0').show();
                data.validate[5]=false;
                $('#password').css('border', '');

                }
            if(pass[1]&&pass[2]&&pass[3]&&pass[4]&&pass[5]){
                    data.validate[5]=true;
                    $('#password').css('border-color', 'green');
            }
            else{
                data.validate[5]=false;
                $('#password').css('border-color', 'red');
            }
            
    });

    $('#re_password').on("input",function(){
        if($('#re_password').val().trim()!=''){
            if($('#re_password').val()!=$('#password').val()){
                    $('#Cpassword_e').html('Password not match');
                    $('#Cpassword_e').slideDown(500);
                    data.validate[6]=false;
                    $('#re_password').css('border-color', 'red');
                }
        else{
            $('#Cpassword_e').html('');
            data.validate[6]=true;
            $('#re_password').css('border-color', 'green');
        }
        }
        else{
             $('#Cpassword_e').html('');
             data.validate6=false;
             $('#re_password').css('border', '');
        }
        
    });

$('#submit1').click(function(){
		alert("run");
        if(data.validate[1]&&data.validate[3]&&data.validate[4]&&data.validate[5]&&data.validate[6]&&$('#remember').prop('checked')){
            $('#checkbox_e').html('');
            $('#submit1').prop('disabled',true);
            $.ajax({
        url : 'error',
        type: 'POST',
        dataType: 'json',
        data: {Fname:$('#Name').val().trim(),mobile1:$('#mobile').val().trim()},
        success: function(data1){
            alert("success");
            data.otp=data1.otp;
            $('#form1').prop('disabled',true);
            document.getElementById("form1").style.pointerEvents="none";
            $('#otp_block').show();
        }
      
             });
        }
        else{
            $('#checkbox_e').html(' Something wrong !');
                      $('#checkbox_e').slideDown(500);
        }
                    
                
});

$('#resend_otp').click(function(){
	$.ajax({
        url : 'error',
        type: 'POST',
        dataType: 'json',
        data: {Fname:$('#Name').val().trim(),mobile1:$('#mobile').val().trim()},
        success: function(data1){
            alert("otp sent successful");
            data.otp=data1.otp;
        }
	});
});



$('#Validate').click(function(){
    if($('#otp').val().trim().length!=0){
        $('#Validate').prop('disabled',true);
        $.ajax({
            url: 'error',
            type: 'POST',
            dataType: 'json',
            data:{otpx:$('#otp').val().trim()},
            success:function(data1){
                if(data1.isValid){
                    if(data1.otpx==data.otp){
                $.ajax({
                            url : 'error',
                            type: 'POST',
                            dataType: 'json',
                            data:{Fname1:$('#Name').val().trim(),Lname:"0101",email1:$('#email').val().trim(),mobile2:$('#mobile').val().trim(),password:$('#password').val().trim(),degree:$('#degree').val().trim()},
                            success:function(data2){
                                        if(data2.isValid){
                                        alert("Registeration Successful");
                                        window.location.assign('Admin.jsp');
                                        }
                                    }
                    });   
                }
                else{
                        $('#otp_e').html('otp not match !');
                        $('#otp_e').slideDown(500);
                        $('#Validate').prop('disabled',false);
                }
                }
            }
        });
    }
    });

$('#login').click(function(){
    $('#login').prop('diabled',true);
    if($('#email_log').val().trim()!=''&&$('#password_log').val()!=''){
        $('#checkbox_el').html('');
    $.ajax({
    url : 'error',
    type: 'POST',
    dataType: 'json',
    data:{email_log:$('#email_log').val().trim(),password_log:$('#password_log').val()},
    success:function(data1){
        if(data1.isValid){
        window.location.assign('HomePageold11.jsp');
        }
        else{
            $('#checkbox_el').html('invalid email or password');
            $('#login').prop('diabled',true);
        }
    }
});
}
else{
$('#checkbox_el').html('All Fields are required');
$('#login').prop('diabled',true);
}

});




    $('#can').click(function(){
           if(confirm("Are You Sure ! \nYou want to Cancil this page ?")){
                window.location.reload();
           }
    });

     $('#can_log').click(function(){
           if(confirm("Are You Sure ! \nYou want to Cancil this page ?")){
               window.location.reload();
           }
    });
    $('#can_for').click(function(){
           if(confirm("Are You Sure ! \nYou want to Cancil this page ?")){
               window.location.reload();
           }
    });


    $('#forp').click(function(){
        $('#id02').hide();
        $('#id03').show();

    });
    $('#forp1').click(function(){
        $('#id03').hide();
        $('#id02').show();

    });
    $('#forp2').click(function(){
        $('#id01').hide();
        $('#id02').show();

    });

    $('#search').click(function(){
        $('#search').prop('disabled',true);
            if($('#email_for').val().trim()!=''){
        if((new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i)).test($('#email_for').val().trim())){
                if(confirm("Are You Sure ! \nYour otp will be sent to your Registered mobile number ? ")){
                        $.ajax({
                        url : 'error',
                        type: 'POST',
                        dataType: 'json',
                        data: {email:$('#email_for').val().trim(),update:true},
                        success: function(data1){
                            if(data1.isValid&&data1.username){
                                $('#email_ef').html('');
                                        data.otp=data1.otpf;
                                        $('#forp1').prop('disabled','true');
                                        $('#tab1').prop('disabled',true);
                                        $('#email_for').css('border-color', 'green');
                                        $('#updatepass').show();
                                        $('#setmodel').css('width','65%');
                                        $('#mobstat').html('your otp has been sent to your registered mobile number : XXXXXX'+data1.mob);
                                        $('#mobstat').slideDown(200);
                                        $('#mobstat').css('color','green');
                                }
                            else{
                                $('#email_ef').html('email not available');
                                $('#email_ef').css('color','red');
                                $('#email_for').css('border-color', 'red');
                                 $('#search').prop('disabled',false);
                            }
                        }
                    });
                }
                else{
                    $('#search').prop('disabled',false);
                }
        }
        else{
                    $('#email_ef').html('invalid email !');
                    $('#email_ef').slideDown(500);
                    $('#email_ef').css('color','red');
                    $('#email_for').css('border-color', 'red');
                    $('#search').prop('disabled',false);
        }
    }
    else{
        $('#email_for').css('border', '');
        $('#email_ef').html('enter email');
        $('#email_ef').css('color','red');
         $('#search').prop('disabled',false);
    }
    });

    $('#updatebutton').click(function(){
        $('#updatebutton').prop('disabled',true);
        if(data.validate[1]&&data.validate[2]){
            $.ajax({
            url: 'error',
            type: 'POST',
            dataType: 'json',
            data:{otpx:$('#otp_for').val().trim()},
            success:function(data1){
                if(data1.isValid){
                    if(data1.otpx==data.otp){
                         $.ajax({
                            url: 'error',
                            type: 'POST',
                            dataType: 'json',
                            data:{update_email:$('#email_for').val().trim(),update_pass:$('#password_for').val().trim()},
                            success:function(data2){
                                        if(data2.isValid&&data2.update1){
                                            localStorage.setItem("status1",'Password update successful');
                                            window.location.assign('Admin.jsp'); 
                                        }
                                    }
                        }); 
                    }
                    else{
                        $('#email_ef').html('otp not match !');
                        $('#email_ef').slideDown(500);
                        $('#email_ef').css('color','red');
                        $('#updatebutton').prop('disabled',false);
                    }
                }
            }
    });
        }
        else{
                        $('#email_ef').html('Something wrong !');
                        $('#email_ef').slideDown(500);
                        $('#email_ef').css('color','red');
                        $('#updatebutton').prop('disabled',false);
        }
    });

    $('#password_for').on("input",function(){
    var pass = {1:false,2:false,3:false,4:false,5:false};
    if($('#password_for').val().trim()!=''){
            if($('#password_for').val().match(/[a-z]/g)){
                $('#ps3val0x').hide();
                $('#ps3val1x').show();
                pass[1]=true;
            }
             else{
                $('#ps3val1x').hide();
                $('#ps3val0x').show();
                pass[1]=false;
            }
            if($('#password_for').val().match(/[A-Z]/g)){
                $('#ps4val0x').hide();
                $('#ps4val1x').show();
                pass[2]=true;
            }
            else{
                $('#ps4val1x').hide();
                $('#ps4val0x').show();
                pass[2]=false;
            }
            if($('#password_for').val().match(/[0-9]/g)){
                $('#ps2val0x').hide();
                $('#ps2val1x').show();
                pass[3]=true;
            }
            else{
                $('#ps2val1x').hide();
                $('#ps2val0x').show();
                pass[3]=false;
            }
            if($('#password_for').val().length>=8){
                $('#ps1val0x').hide();
                $('#ps1val1x').show();
                pass[4]=true;
            }
            else{
                $('#ps1val1x').hide();
                $('#ps1val0x').show();
                pass[4]=false;
            }
            if($('#password_for').val().match(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi)){
                $('#ps5val0x').hide();
                $('#ps5val1x').show();
                pass[5]=true;
            }
            else{
                $('#ps5val1x').hide();
                $('#ps5val0x').show();
                pass[5]=false;
            }
    
}
            else{
                $('#ps3val1x').hide();
                $('#ps3val0x').show();
                $('#ps5val1x').hide();
                $('#ps5val0x').show();
                $('#ps1val1x').hide();
                $('#ps1val0x').show();
                $('#ps2val1x').hide();
                $('#ps2val0x').show();
                $('#ps4val1x').hide();
                $('#ps4val0x').show();
                data.validate[1]=false;
                $('#password_for').css('border', '');

                }
            if(pass[1]&&pass[2]&&pass[3]&&pass[4]&&pass[5]){
                    data.validate[1]=true;
                    $('#password_for').css('border-color', 'green');
            }
            else{
                data.validate[1]=false;
                $('#password_for').css('border-color', 'red');
            }
            
    });
    
     $('#password_for2').on("input",function(){
        if($('#password_for2').val().trim()!=''){
            if($('#password_for2').val()!=$('#password_for').val()){
                    $('#Cpassword_ef').html('Password not match');
                    $('#Cpassword_ef').slideDown(500);
                    $('#Cpassword_ef').css('color', 'red');
                    data.validate[2]=false;
                    $('#password_for2').css('border-color', 'red');
                }
        else{
            $('#Cpassword_ef').html('');
            data.validate[2]=true;
            $('#password_for2').css('border-color', 'green');
        }
        }
        else{
             $('#Cpassword_ef').html('');
             data.validate6=false;
             $('#password_for2').css('border', '');
        }
        
    });

    
if(localStorage.getItem("status"))
    {
        $('#state').show();
        $('#status').html('Registeration Successful');
        $('#status').slideDown(200);
        localStorage.clear();
    }
if(localStorage.getItem("status1"))
    {
        $('#state').show();
        $('#status').html('Password update successful');
        $('#status').slideDown(200);
        localStorage.clear();
    }

    });