<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="img/favicon.png" type="image/png">
	<title>DocHelper</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
	<!-- main css -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/style1.css">
	<link rel="stylesheet" href="css/responsive.css">
	<link rel="stylesheet" href="css/login.css" type="text/css" media="screen" />
	<!-- main script -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/Admin_control.js"></script>
	<script type="text/javascript" src="js/anim.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<div id="id01" class="modal">
<div class="main animate">
        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container_signup">
            <p style="float: right; margin-right: 20px; margin-top: 10px;font-size: 20px; cursor: pointer;" onclick="document.getElementById('id01').style.display='none'"><b>X</b></p>
                <div class="signup-content">
                    
                        <img src="img/CR.png" style="display: block; margin-left: auto ; margin-right: auto; width: 70%;margin-bottom: 20px;">
                        <div id="form1">
                        <div class="form-group">
                            <input type="text" class="form-input" id="Name" placeholder="Your Name" autocomplete="off"/>
                            <span id="name_e"></span>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" id="email" placeholder="Your Email" autocomplete="off"/>
                            <span id="email_e"></span>
                        </div>
                        <div class="form-group">
                            <input type="tel" class="form-input" id="mobile" placeholder="Your Mobile" autocomplete="off"/>
                            <span id="mobile_e"></span>
                        </div>
                        <div class="form-group" onclick="document.getElementById('myPopup').classList.toggle('show')">
							<input type="password" class="form-input" id="password" placeholder="Password" autocomplete="off"/> 
							<div class="popup">
							<span class="popuptext" id="myPopup">
									<span>
									<span id="ps1val1">✓ password should be at least 8 characters</span>
									<span id="ps1val0">* password should be at least 8 characters</span>
									</span><br>
									<span>
									<span id="ps2val1">✓ contain at least one number</span>
									<span id="ps2val0">* contain at least one number</span>
									</span><br>
									<span>
									<span id="ps3val1">✓ contain at least one lowercase letter</span>
									<span id="ps3val0">* contain at least one lowercase letter</span>
									</span><br>
									<span>
									<span id="ps4val1">✓ contain at least one uppercase letter</span>
									<span id="ps4val0">* contain at least one uppercase letter</span>
									</span><br>
									<span>
									<span id="ps5val1">✓ contain at least one special character</span>
									<span id="ps5val0">* contain at least one special character</span>
									</span>
								</span>
						</div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" id="re_password" placeholder="Repeat your password"/>
                            <span id="Cpassword_e"></span>
                        </div>
                        
                        <div class="form-group">
                            <select id="degree" class="form-select">
							<option label="select your degree" value="" style="background-color: #EEF3F3;">Select your degree</option>
							<option label="MBBS" value="MBBS" style="background-color: #EEF3F3; ">MBBS</option>
							<option label="BDS" value="BDS"style="background-color: #EEF3F3;">BDS</option>
							<option label="B. PHARMA" value="B. PHARMA" style="background-color: #EEF3F3;">B. PHARMA</option>
							<option label="BSc Nursing" value="BSc Nursing" style="background-color: #EEF3F3;">BSc Nursing</option>
							<option label="B.P.T" value="B.P.T (physiotherapy)" style="background-color: #EEF3F3;">B.P.T (physiotherapy)</option>
							<option label="B.O.T" value="B.O.T (Occupational Therapy)" style="background-color: #EEF3F3;">B.O.T (Occupational Therapy)</option>
							<option label="B.H.M.S" value="B.H.M.S (Homeopathy Medicine)" style="background-color: #EEF3F3;">B.H.M.S (Homeopathy Medicine)</option>
							<option label="B.U.M.S" value="B.U.M.S (Unani Medicine)" style="background-color: #EEF3F3;">B.U.M.S (Unani Medicine)</option>
							<option label="Optometry" value="Optometry" style="background-color: #EEF3F3;">Optometry</option>
						</select>
                        </div>
                      
                        <div class="form-group">
                        <table>
                        <tr>
                        <td>
                        <input type="checkbox" id="remember" class="agree-term" />
                        <label for="remember" class="label-agree-term"><span><span></span></span>
                        </label>
                        </td>
                        <td>
                        <label for="remember" class="label-agree-term" style="padding-top:17px;"><span><span></span></span>
                            <font style="color: #474B48;font-size: 75%;">
							By clicking Sign Up, you agree to our <a href="#" style="color:dodgerblue">Terms, Data Policy</a> and <a href="#" style="color:dodgerblue">Cookie Policy</a>. You may receive SMS notifications from us and can opt out at any time.
							</font>
						</label>
                        </td>
                        </tr>
                        </table>
                        </div>
                       
                        <div class="form-group">
                            <input type="button" id="submit1" class="form-submit" value="Sign up"/>
                        </div>
                        </div>
                        <div id="otp_block" style="display: none;">
                        <hr><br>
                        <div class="form-group">
                        <input type="number" id="otp" class="form-input" placeholder="Enter Your Otp " maxlength="6">
                        <span id="otp_e" style="float: left;"></span>
                        <a href="#" style="color:black;float: right;cursor:pointer;pointer-events:none;" id="bal" ><span id="resend_otp" onclick="call(120)">Resend otp </span><span id="cal"> in <span id="timer"></span> seconds</span></a>
                       <script type="text/javascript">
                       function call(a){
                    	   document.getElementById("cal").style.display="inline-block";
                    	   document.getElementById("resend_otp").style.color="black";
                    	   document.getElementById("bal").style.pointerEvents="none";
                    	   timer(a);
                       }
                       
                       let timerOn = true;

                       function timer(remaining) {
                         var m = Math.floor(remaining / 60);
                         var s = remaining % 60;
                         
                         m = m < 10 ? '0' + m : m;
                         s = s < 10 ? '0' + s : s;
                         document.getElementById('timer').innerHTML = m + ':' + s;
                         remaining -= 1;
                         
                         if(remaining >= 0 && timerOn) {
                           setTimeout(function() {
                               timer(remaining);
                           }, 1000);
                           return;
                         }

                         if(!timerOn) {
                           return;
                         }
                         
                         document.getElementById("bal").style.pointerEvents="auto";
                         document.getElementById("resend_otp").style.color="#1E90FF";
                         document.getElementById("cal").style.display="none";
                         // Do timeout stuff here
                         
                       }

                       timer(30);
                       </script>
                       
                        </div>
                        <div class="form-group">
                            <input type="button" id="Validate" class="form-submit" value="Validate"/>
                        </div>
                        
                        </div>
                        
                        <div>
			      		<span id="checkbox_e"></span>
			      		</div>
                    
                    <p class="loginhere">
                        Have already an account ? <a href="#" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
</div>

<div id="id02" class="modal">
	<div class="main animate">
        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container_signup">
            <p style="float: right; margin-right: 20px; margin-top: 10px;font-size: 20px; cursor: pointer;" onclick="document.getElementById('id02').style.display='none'"><b>X</b></p>
                 <div class="signup-content">
                    <div>
		<div class="svgContainer" style="width: 40%;margin-left: auto;margin-right: auto;">
			<div>
				<svg class="mySVG" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 200 200">
				<defs>
					<circle id="armMaskPath" cx="100" cy="100" r="100" />
				</defs>
				<clipPath id="armMask">
					<use xlink:href="#armMaskPath" overflow="visible" />
				</clipPath>
				<circle cx="100" cy="100" r="100" fill="#a9ddf3" />
				<g class="body">
					<path fill="#FFFFFF"
						d="M193.3,135.9c-5.8-8.4-15.5-13.9-26.5-13.9H151V72c0-27.6-22.4-50-50-50S51,44.4,51,72v50H32.1 c-10.6,0-20,5.1-25.8,13l0,78h187L193.3,135.9z" />
					<path fill="none" stroke="#3A5E77" stroke-width="2.5"
						stroke-linecap="round" stroke-linejoinn="round"
						d="M193.3,135.9 c-5.8-8.4-15.5-13.9-26.5-13.9H151V72c0-27.6-22.4-50-50-50S51,44.4,51,72v50H32.1c-10.6,0-20,5.1-25.8,13" />
					<path fill="#DDF1FA"
						d="M100,156.4c-22.9,0-43,11.1-54.1,27.7c15.6,10,34.2,15.9,54.1,15.9s38.5-5.8,54.1-15.9 C143,167.5,122.9,156.4,100,156.4z" />
				</g>
				<g class="earL">
					<g class="outerEar" fill="#ddf1fa" stroke="#3a5e77"
						stroke-width="2.5">
						<circle cx="47" cy="83" r="11.5" />
						<path d="M46.3 78.9c-2.3 0-4.1 1.9-4.1 4.1 0 2.3 1.9 4.1 4.1 4.1"
						stroke-linecap="round" stroke-linejoin="round" />
					</g>
					<g class="earHair">
						<rect x="51" y="64" fill="#FFFFFF" width="15" height="35" />
						<path
						d="M53.4 62.8C48.5 67.4 45 72.2 42.8 77c3.4-.1 6.8-.1 10.1.1-4 3.7-6.8 7.6-8.2 11.6 2.1 0 4.2 0 6.3.2-2.6 4.1-3.8 8.3-3.7 12.5 1.2-.7 3.4-1.4 5.2-1.9"
						fill="#fff" stroke="#3a5e77" stroke-width="2.5"
						stroke-linecap="round" stroke-linejoin="round" />
					</g>
				</g>
				<g class="earR">
					<g class="outerEar" fill="#ddf1fa" stroke="#3a5e77"
						stroke-width="2.5">
						<circle cx="155" cy="83" r="11.5" />
						<path d="M155.7 78.9c2.3 0 4.1 1.9 4.1 4.1 0 2.3-1.9 4.1-4.1 4.1"
						stroke-linecap="round" stroke-linejoin="round" />
					</g>
					<g class="earHair">
						<rect x="131" y="64" fill="#FFFFFF" width="20" height="35" />
						<path
						d="M148.6 62.8c4.9 4.6 8.4 9.4 10.6 14.2-3.4-.1-6.8-.1-10.1.1 4 3.7 6.8 7.6 8.2 11.6-2.1 0-4.2 0-6.3.2 2.6 4.1 3.8 8.3 3.7 12.5-1.2-.7-3.4-1.4-5.2-1.9"
						fill="#fff" stroke="#3a5e77" stroke-width="2.5"
						stroke-linecap="round" stroke-linejoin="round" />
					</g>
				</g>
				<path class="chin"
						d="M84.1 121.6c2.7 2.9 6.1 5.4 9.8 7.5l.9-4.5c2.9 2.5 6.3 4.8 10.2 6.5 0-1.9-.1-3.9-.2-5.8 3 1.2 6.2 2 9.7 2.5-.3-2.1-.7-4.1-1.2-6.1"
						fill="none" stroke="#3a5e77" stroke-width="2.5"
						stroke-linecap="round" stroke-linejoin="round" />
				<path class="face" fill="#DDF1FA"
						d="M134.5,46v35.5c0,21.815-15.446,39.5-34.5,39.5s-34.5-17.685-34.5-39.5V46" />
				<path class="hair" fill="#FFFFFF" stroke="#3A5E77"
						stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
						d="M81.457,27.929 c1.755-4.084,5.51-8.262,11.253-11.77c0.979,2.565,1.883,5.14,2.712,7.723c3.162-4.265,8.626-8.27,16.272-11.235 c-0.737,3.293-1.588,6.573-2.554,9.837c4.857-2.116,11.049-3.64,18.428-4.156c-2.403,3.23-5.021,6.391-7.852,9.474" />
				<g class="eyebrow">
					<path fill="#FFFFFF"
						d="M138.142,55.064c-4.93,1.259-9.874,2.118-14.787,2.599c-0.336,3.341-0.776,6.689-1.322,10.037 c-4.569-1.465-8.909-3.222-12.996-5.226c-0.98,3.075-2.07,6.137-3.267,9.179c-5.514-3.067-10.559-6.545-15.097-10.329 c-1.806,2.889-3.745,5.73-5.816,8.515c-7.916-4.124-15.053-9.114-21.296-14.738l1.107-11.768h73.475V55.064z" />
					<path fill="#FFFFFF" stroke="#3A5E77" stroke-width="2.5"
						stroke-linecap="round" stroke-linejoin="round"
						d="M63.56,55.102 c6.243,5.624,13.38,10.614,21.296,14.738c2.071-2.785,4.01-5.626,5.816-8.515c4.537,3.785,9.583,7.263,15.097,10.329 c1.197-3.043,2.287-6.104,3.267-9.179c4.087,2.004,8.427,3.761,12.996,5.226c0.545-3.348,0.986-6.696,1.322-10.037 c4.913-0.481,9.857-1.34,14.787-2.599" />
				</g>
				<g class="eyeL">
					<circle cx="85.5" cy="78.5" r="3.5" fill="#3a5e77" />
					<circle cx="84" cy="76" r="1" fill="#fff" />
				</g>
				<g class="eyeR">
					<circle cx="114.5" cy="78.5" r="3.5" fill="#3a5e77" />
					<circle cx="113" cy="76" r="1" fill="#fff" />
				</g>
				<g class="mouth">
					<path class="mouthBG" fill="#617E92"
						d="M100.2,101c-0.4,0-1.4,0-1.8,0c-2.7-0.3-5.3-1.1-8-2.5c-0.7-0.3-0.9-1.2-0.6-1.8 c0.2-0.5,0.7-0.7,1.2-0.7c0.2,0,0.5,0.1,0.6,0.2c3,1.5,5.8,2.3,8.6,2.3s5.7-0.7,8.6-2.3c0.2-0.1,0.4-0.2,0.6-0.2 c0.5,0,1,0.3,1.2,0.7c0.4,0.7,0.1,1.5-0.6,1.9c-2.6,1.4-5.3,2.2-7.9,2.5C101.7,101,100.5,101,100.2,101z" />
					<path style="display: none;" class="mouthSmallBG" fill="#617E92"
						d="M100.2,101c-0.4,0-1.4,0-1.8,0c-2.7-0.3-5.3-1.1-8-2.5c-0.7-0.3-0.9-1.2-0.6-1.8 c0.2-0.5,0.7-0.7,1.2-0.7c0.2,0,0.5,0.1,0.6,0.2c3,1.5,5.8,2.3,8.6,2.3s5.7-0.7,8.6-2.3c0.2-0.1,0.4-0.2,0.6-0.2 c0.5,0,1,0.3,1.2,0.7c0.4,0.7,0.1,1.5-0.6,1.9c-2.6,1.4-5.3,2.2-7.9,2.5C101.7,101,100.5,101,100.2,101z" />
					<path style="display: none;" class="mouthMediumBG"
						d="M95,104.2c-4.5,0-8.2-3.7-8.2-8.2v-2c0-1.2,1-2.2,2.2-2.2h22c1.2,0,2.2,1,2.2,2.2v2 c0,4.5-3.7,8.2-8.2,8.2H95z" />
					<path style="display: none;" class="mouthLargeBG"
						d="M100 110.2c-9 0-16.2-7.3-16.2-16.2 0-2.3 1.9-4.2 4.2-4.2h24c2.3 0 4.2 1.9 4.2 4.2 0 9-7.2 16.2-16.2 16.2z"
						fill="#617e92" stroke="#3a5e77" stroke-linejoin="round"
						stroke-width="2.5" />
					<defs>
						<path id="mouthMaskPath"
						d="M100.2,101c-0.4,0-1.4,0-1.8,0c-2.7-0.3-5.3-1.1-8-2.5c-0.7-0.3-0.9-1.2-0.6-1.8 c0.2-0.5,0.7-0.7,1.2-0.7c0.2,0,0.5,0.1,0.6,0.2c3,1.5,5.8,2.3,8.6,2.3s5.7-0.7,8.6-2.3c0.2-0.1,0.4-0.2,0.6-0.2 c0.5,0,1,0.3,1.2,0.7c0.4,0.7,0.1,1.5-0.6,1.9c-2.6,1.4-5.3,2.2-7.9,2.5C101.7,101,100.5,101,100.2,101z" />
					</defs>
					<clipPath id="mouthMask">
						<use xlink:href="#mouthMaskPath" overflow="visible" />
					</clipPath>
					<g clip-path="url(#mouthMask)">
						<g class="tongue">
							<circle cx="100" cy="107" r="8" fill="#cc4a6c" />
							<ellipse class="tongueHighlight" cx="100" cy="100.5" rx="3"
						ry="1.5" opacity=".1" fill="#fff" />
						</g>
					</g>
					<path clip-path="url(#mouthMask)" class="tooth"
						style="fill:#FFFFFF;"
						d="M106,97h-4c-1.1,0-2-0.9-2-2v-2h8v2C108,96.1,107.1,97,106,97z" />
					<path class="mouthOutline" fill="none" stroke="#3A5E77"
						stroke-width="2.5" stroke-linejoin="round"
						d="M100.2,101c-0.4,0-1.4,0-1.8,0c-2.7-0.3-5.3-1.1-8-2.5c-0.7-0.3-0.9-1.2-0.6-1.8 c0.2-0.5,0.7-0.7,1.2-0.7c0.2,0,0.5,0.1,0.6,0.2c3,1.5,5.8,2.3,8.6,2.3s5.7-0.7,8.6-2.3c0.2-0.1,0.4-0.2,0.6-0.2 c0.5,0,1,0.3,1.2,0.7c0.4,0.7,0.1,1.5-0.6,1.9c-2.6,1.4-5.3,2.2-7.9,2.5C101.7,101,100.5,101,100.2,101z" />
				</g>
				<path class="nose"
						d="M97.7 79.9h4.7c1.9 0 3 2.2 1.9 3.7l-2.3 3.3c-.9 1.3-2.9 1.3-3.8 0l-2.3-3.3c-1.3-1.6-.2-3.7 1.8-3.7z"
						fill="#3a5e77" />
				<g class="arms" clip-path="url(#armMask)">
					<g class="armL">
						<path fill="#ddf1fa" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2.5"
						d="M121.3 97.4L111 58.7l38.8-10.4 20 36.1z" />
						<path fill="#ddf1fa" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2.5"
						d="M134.4 52.5l19.3-5.2c2.7-.7 5.4.9 6.1 3.5.7 2.7-.9 5.4-3.5 6.1L146 59.7M160.8 76.5l19.4-5.2c2.7-.7 5.4.9 6.1 3.5.7 2.7-.9 5.4-3.5 6.1l-18.3 4.9M158.3 66.8l23.1-6.2c2.7-.7 5.4.9 6.1 3.5.7 2.7-.9 5.4-3.5 6.1l-23.1 6.2M150.9 58.4l26-7c2.7-.7 5.4.9 6.1 3.5.7 2.7-.9 5.4-3.5 6.1l-21.3 5.7" />
						<path fill="#a9ddf3"
						d="M178.8 74.7l2.2-.6c1.1-.3 2.2.3 2.4 1.4.3 1.1-.3 2.2-1.4 2.4l-2.2.6-1-3.8zM180.1 64l2.2-.6c1.1-.3 2.2.3 2.4 1.4.3 1.1-.3 2.2-1.4 2.4l-2.2.6-1-3.8zM175.5 54.9l2.2-.6c1.1-.3 2.2.3 2.4 1.4.3 1.1-.3 2.2-1.4 2.4l-2.2.6-1-3.8zM152.1 49.4l2.2-.6c1.1-.3 2.2.3 2.4 1.4.3 1.1-.3 2.2-1.4 2.4l-2.2.6-1-3.8z" />
						<path fill="#fff" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2.5"
						d="M123.5 96.8c-41.4 14.9-84.1 30.7-108.2 35.5L1.2 80c33.5-9.9 71.9-16.5 111.9-21.8" />
						<path fill="#fff" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2.5"
						d="M108.5 59.4c7.7-5.3 14.3-8.4 22.8-13.2-2.4 5.3-4.7 10.3-6.7 15.1 4.3.3 8.4.7 12.3 1.3-4.2 5-8.1 9.6-11.5 13.9 3.1 1.1 6 2.4 8.7 3.8-1.4 2.9-2.7 5.8-3.9 8.5 2.5 3.5 4.6 7.2 6.3 11-4.9-.8-9-.7-16.2-2.7M94.5 102.8c-.6 4-3.8 8.9-9.4 14.7-2.6-1.8-5-3.7-7.2-5.7-2.5 4.1-6.6 8.8-12.2 14-1.9-2.2-3.4-4.5-4.5-6.9-4.4 3.3-9.5 6.9-15.4 10.8-.2-3.4.1-7.1 1.1-10.9M97.5 62.9c-1.7-2.4-5.9-4.1-12.4-5.2-.9 2.2-1.8 4.3-2.5 6.5-3.8-1.8-9.4-3.1-17-3.8.5 2.3 1.2 4.5 1.9 6.8-5-.6-11.2-.9-18.4-1 2 2.9.9 3.5 3.9 6.2" />
					</g>
					<g class="armR">
						<path fill="#ddf1fa" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2.5"
						d="M265.4 97.3l10.4-38.6-38.9-10.5-20 36.1z" />
						<path fill="#ddf1fa" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2.5"
						d="M252.4 52.4L233 47.2c-2.7-.7-5.4.9-6.1 3.5-.7 2.7.9 5.4 3.5 6.1l10.3 2.8M226 76.4l-19.4-5.2c-2.7-.7-5.4.9-6.1 3.5-.7 2.7.9 5.4 3.5 6.1l18.3 4.9M228.4 66.7l-23.1-6.2c-2.7-.7-5.4.9-6.1 3.5-.7 2.7.9 5.4 3.5 6.1l23.1 6.2M235.8 58.3l-26-7c-2.7-.7-5.4.9-6.1 3.5-.7 2.7.9 5.4 3.5 6.1l21.3 5.7" />
						<path fill="#a9ddf3"
						d="M207.9 74.7l-2.2-.6c-1.1-.3-2.2.3-2.4 1.4-.3 1.1.3 2.2 1.4 2.4l2.2.6 1-3.8zM206.7 64l-2.2-.6c-1.1-.3-2.2.3-2.4 1.4-.3 1.1.3 2.2 1.4 2.4l2.2.6 1-3.8zM211.2 54.8l-2.2-.6c-1.1-.3-2.2.3-2.4 1.4-.3 1.1.3 2.2 1.4 2.4l2.2.6 1-3.8zM234.6 49.4l-2.2-.6c-1.1-.3-2.2.3-2.4 1.4-.3 1.1.3 2.2 1.4 2.4l2.2.6 1-3.8z" />
						<path fill="#fff" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2.5"
						d="M263.3 96.7c41.4 14.9 84.1 30.7 108.2 35.5l14-52.3C352 70 313.6 63.5 273.6 58.1" />
						<path fill="#fff" stroke="#3a5e77" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2.5"
						d="M278.2 59.3l-18.6-10 2.5 11.9-10.7 6.5 9.9 8.7-13.9 6.4 9.1 5.9-13.2 9.2 23.1-.9M284.5 100.1c-.4 4 1.8 8.9 6.7 14.8 3.5-1.8 6.7-3.6 9.7-5.5 1.8 4.2 5.1 8.9 10.1 14.1 2.7-2.1 5.1-4.4 7.1-6.8 4.1 3.4 9 7 14.7 11 1.2-3.4 1.8-7 1.7-10.9M314 66.7s5.4-5.7 12.6-7.4c1.7 2.9 3.3 5.7 4.9 8.6 3.8-2.5 9.8-4.4 18.2-5.7.1 3.1.1 6.1 0 9.2 5.5-1 12.5-1.6 20.8-1.9-1.4 3.9-2.5 8.4-2.5 8.4" />
					</g>				
				</g>
			</svg>
			</div>
		</div><br><br>
		
		

		<div class="inputGroup inputGroup1 form-group">
			<input type="text" id="email_log" class="email form-input" maxlength="256" placeholder="Enter email" />
		</div>
		<div class="inputGroup inputGroup2 form-group">
			<input type="password" id="password_log" class="password form-input" placeholder="Enter Password" />
		</div>
		<div>
				<span id="checkbox_el"></span>
		</div>
		<div class="form-group">
                            <input type="button" id="login" class="form-submit" value="Login"/>
                        </div>
		<script type="text/javascript" src="js/anim.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
	</div>
                    <p class="loginhere">
                     <a href="#" class="loginhere-link">Forget Password</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
	</div>	

<!--================Header Menu Area =================-->
	<header class="header_area">
		<div class="top_menu row m0">
			<div class="container">
				<div class="float-left">
					<ul class="left_side">
						<li>
							<a href="#">
								<i class="fa fa-facebook-f"></i>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-twitter"></i>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-dribbble"></i>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-behance"></i>
							</a>
						</li>
					</ul>
				</div>
				<div class="float-right">
					<ul class="right_side">
						<li>
							<a href="#">
								<i class="lnr lnr-phone-handset"></i>
								+919651324939
							</a>
						</li>
						<li>
							<a href="#">
								<i class="lnr lnr-envelope"></i>
								sk19091997sk@gmail.com
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="#">
						<img src="img/logo.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					 aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<div class="row ml-0 w-100">
							<div class="col-lg-12 pr-0">
								<ul class="nav navbar-nav center_nav pull-right">
									<li class="nav-item active">
										<a class="nav-link" href="Admin.jsp">Home</a>
									</li>
									<li class="nav-item submenu dropdown">
										<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
										<ul class="dropdown-menu">
											<li class="nav-item">
												<a class="nav-link" href="#">About</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">Services</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">Elements</a>
											</li>
										</ul>
									</li>
									<li class="nav-item ">
										<a class="nav-link" href="#" onclick="document.getElementById('id02').style.display='block'">LOGIN</a>
									</li>
									<li class="nav-item ">
										<a class="nav-link" href="#" onclick="document.getElementById('id01').style.display='block'">SIGNUP</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="contact.html">Contact</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================Header Menu Area =================-->

	<!--================ Home Banner Area =================-->
	<section class="home_banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content row">
					<div class="col-lg-12">
						<h1>We Care for Your Health Every Moment</h1>
						<p>If you are looking at blank cassettes on the web, you may be very confused at the difference in price You may see some
							for as low as each.</p>
						<a class="main_btn mr-10" href="#">get started</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End Home Banner Area =================-->

	<!--================ start footer Area =================-->
	<footer class="footer-area section_gap" style="text-align: center;">
		<div class="container">
			<div class="row">
					<div class="single-footer-widget mail-chimp" style="text-align: center;">
						<h6>Contact Us</h6>
						<p>
							DR. VIRENDRA SWAROOP INSTITUTE OF COMPUTER STUDIES
						</p><br>
						<h3>9651324939</h3>
						<h3>8840699736</h3>
					</div>
					<div class="single-footer-widget" style="margin-left: 60px;text-align: center;">
						<h6>Newsletter</h6>
						<p>You can trust us. we only send promo offers, not a single spam.</p>
							<!-- signup page notification -->
							<br>
							<input type="email" style="height:50px; width: 300px;" placeholder="Enter your email">&nbsp&nbsp&nbsp<a class="main_btn mr-10" href="#">Send</a>
							
					</div>
			</div><br>
				<p class="footer-text" style="text-align: center;">
				 Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This website is made with
					<i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.facebook.com/hacker.sk.editor" target="_blank">Sharmask</a>
				</p>
		</div>
	</footer>
	<!--================ End footer Area =================-->



	<!--================ Optional JavaScript =================-->
	<!--================ jQuery first, then Popper.js, then Bootstrap JS =================-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/isotope/isotope-min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>