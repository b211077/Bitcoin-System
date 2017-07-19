<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Generic - Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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
		<header id="header">
			<a href="index.jsp" class="logo"><img src="images/coinsight.png"
				style="width: 260px; height: 60px;"></a>
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
                <li><a href="coin?command=wallet">Generic</a></li>
				<li><a href="elements.html">Elements</a></li>
			</ul>
			<ul class="actions vertical">
				<li><a href="#hihi" class="button special fit">Get Started</a></li>
                    <c:if test="${empty sessionScope.member}">
                    	<li><a href="login.jsp" class="button fit">Log In</a></li>		
				</c:if>
				<c:if test="${not empty sessionScope.member}">
					<li><a href="coin?command=logout" class="button fit">Log Out</a></li>	
				</c:if>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main" class="alt">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h1>BTC _ ��Ʈ����</h1>
					</header>
					<span class="image main">
						<p id="areaText"></p>
						<script>
							$.ajax({
								  url: "test/demo3.html",
								  cache: false
								})
								  .done(function( html ) {
								    $("#areaText").append( html );
								    $("#clickButton2").css("display","none");
								  });
						</script>
					</span>
				</div>
			</section>
			<ul class="actions"	style="width: 100px; margin: 20px auto; margin-bottom: 100px;">
				<li style="width: 100px;">
					<button id="clickButton" onclick="openVolume()">�ŷ�������</button>
					<button id="clickButton2" onclick="openVolume()">�ü�����</button>
				</li>
			</ul>
		</div>
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

		<!-- Footer -->
		<footer id="footer">
			<div class="inner"
				style="padding: 10px !important; text-align: center; width: 60%;">
				<ul class="copyright">
					<li>�� 2017. kData Bitcoin Viewer Team all rights reserved.</li>
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