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
<% String username = "DR. shubham sharma"; %>




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
									<li class="nav-item ">
										<a class="nav-link"><%=username%></a>
									</li>
									<li class="nav-item ">
										<a class="nav-link">Logout</a>
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
	<section>
		
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