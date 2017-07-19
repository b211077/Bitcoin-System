<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Landing - Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
				<!-- Note: The "styleN" class below should match that of the banner element. -->
					<header id="header" class="alt style2">
						<a href="index.jsp" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
						<nav>
							<c:if test="${empty sessionScope.member}">
								<p>
									<a href="join.jsp">JOIN</a>
								</p>
								<p>
									<a href="login.jsp">LOGIN</a>
								</p>
							</c:if>
							<c:if test="${not empty sessionScope.member}">
								<p>${sessionScope.member.id}(${sessionScope.member.name})</p>
								<p>
									<a href="coin?command=logout">logout</a>
								</p>
							</c:if>
							<a href="#menu">Menu</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="coin?command=wallet">wallet</a></li>
			                <li><a href="coin?command=generic">Generic</a></li>
							<li><a href="elements.jsp">Elements</a></li>
						</ul>
						<ul class="actions vertical">
							<li><a href="index.jsp#hihi" class="button special fit">Get Started</a></li>
			                    <c:if test="${empty sessionScope.member}">
			                    	<li><a href="login.jsp" class="button fit">Log In</a></li>		
							</c:if>
							<c:if test="${not empty sessionScope.member}">
								<li><a href="coin?command=logout" class="button fit">Log Out</a></li>	
							</c:if>
						</ul>
					</nav>

				<!-- Banner -->
				<!-- Note: The "styleN" class below should match that of the header element. -->
					<section id="banner" class="style2">
						<div class="inner">
							<span class="image">
								<img src="images/pic07.jpg" alt="" />
							</span>
							<header class="major">
								<h1>Landing</h1>
							</header>
							<div class="content">
								<p>Lorem ipsum dolor sit amet nullam consequat<br />
								sed veroeros. tempus adipiscing nulla.</p>
							</div>
						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h2>Sed amet aliquam</h2>
					</header>
					<p id="areaText"></p>
					<script>
						$.ajax({
							url : "test/demo.html",
							cache : false
						}).done(function(html) {
							$("#areaText").append(html);
						});
					</script>

				</div>
			</section>
			<ul class="actions"
				style="width: 15%; margin: 20px auto; margin-bottom: 100px;">
				<li>
					<button id="clickButton" onclick="openVolume()">거래량보기</button>
					<button id="clickButton2" onclick="openVolume()">시세보기</button>
				</li>
			</ul>
			<script>
			count = 1;
			function openVolume() {
			
			if (count == 1) {
					$.ajax({
						url : "test/demo2.html",
						cache : false
					}).done(function(html) {
						$("#areaText").html(html);
						$("#clickButton2").css("display","block");
						$("#clickButton").css("display","none");
					});
					count = 0;
				} else {
					$.ajax({
						url : "test/demo3.html",
						cache : false
					}).done(function(html) {
						$("#areaText").html(html);
						$("#clickButton").css("display","block");
						$("#clickButton2").css("display","none");
					});
					count = 1;
				}
			}
		</script>
			<!-- Two -->
			<section id="two" class="spotlights">
				<section>
					<a href="generic.jsp" class="image"> <img
						src="images/pic08.jpg" alt="" data-position="center center" />
					</a>
					<div class="content">
						<div class="inner">
							<header class="major">
								<h3>Orci maecenas</h3>
							</header>
							<p>Nullam et orci eu lorem consequat tincidunt vivamus et
								sagittis magna sed nunc rhoncus condimentum sem. In efficitur
								ligula tate urna. Maecenas massa sed magna lacinia magna
								pellentesque lorem ipsum dolor. Nullam et orci eu lorem
								consequat tincidunt. Vivamus et sagittis tempus.</p>
							<ul class="actions">
								<li><a href="generic.jsp" class="button">Learn more</a></li>
							</ul>
						</div>
					</div>
				</section>
				<section>
					<a href="generic.jsp" class="image"> <img
						src="images/pic09.jpg" alt="" data-position="top center" />
					</a>
					<div class="content">
						<div class="inner">
							<header class="major">
								<h3>Rhoncus magna</h3>
							</header>
							<p>Nullam et orci eu lorem consequat tincidunt vivamus et
								sagittis magna sed nunc rhoncus condimentum sem. In efficitur
								ligula tate urna. Maecenas massa sed magna lacinia magna
								pellentesque lorem ipsum dolor. Nullam et orci eu lorem
								consequat tincidunt. Vivamus et sagittis tempus.</p>
							<ul class="actions">
								<li><a href="generic.jsp" class="button">Learn more</a></li>
							</ul>
						</div>
					</div>
				</section>
				

				<section>
					<a href="generic.jsp" class="image"> <img
						src="images/pic10.jpg" alt="" data-position="25% 25%" />
					</a>
					<div class="content">
						<div class="inner">
							<header class="major">
								<h3>Sed nunc ligula</h3>
							</header>
							<p>Nullam et orci eu lorem consequat tincidunt vivamus et
								sagittis magna sed nunc rhoncus condimentum sem. In efficitur
								ligula tate urna. Maecenas massa sed magna lacinia magna
								pellentesque lorem ipsum dolor. Nullam et orci eu lorem
								consequat tincidunt. Vivamus et sagittis tempus.</p>
							<ul class="actions">
								<li><a href="generic.jsp" class="button">Learn more</a></li>
							</ul>
						</div>
					</div>
				</section>
			</section>

			<!-- Three -->
							<section id="three">
								<div class="inner">
									<header class="major">
										<h2>Massa libero</h2>
									</header>
									<p>Nullam et orci eu lorem consequat tincidunt vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus pharetra. Pellentesque condimentum sem. In efficitur ligula tate urna. Maecenas laoreet massa vel lacinia pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus amet pharetra et feugiat tempus.</p>
									<ul class="actions">
										<li><a href="generic.jsp" class="button next">Get Started</a></li>
									</ul>
								</div>
							</section>

					</div>

				<!-- Contact -->
					<section id="contact">
						<div class="inner">
							<section>
								<form method="post" action="#">
									<div class="field half first">
										<label for="name">Name</label>
										<input type="text" name="name" id="name" />
									</div>
									<div class="field half">
										<label for="email">Email</label>
										<input type="text" name="email" id="email" />
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="6"></textarea>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send Message" class="special" /></li>
										<li><input type="reset" value="Clear" /></li>
									</ul>
								</form>
							</section>
							<section class="split">
								<section>
									<div class="contact-method">
										<span class="icon alt fa-envelope"></span>
										<h3>Email</h3>
										<a href="#">information@untitled.tld</a>
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon alt fa-phone"></span>
										<h3>Phone</h3>
										<span>(000) 000-0000 x12387</span>
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon alt fa-home"></span>
										<h3>Address</h3>
										<span>1234 Somewhere Road #5432<br />
										Nashville, TN 00000<br />
										United States of America</span>
									</div>
								</section>
							</section>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
								<li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
							</ul>
							<ul class="copyright">
								<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>