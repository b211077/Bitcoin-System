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
		<title>Generic - Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<style type="text/css">
			form .field.half {
					width: 100% !important;
					float: none;
					padding: 0;
				}
			#contact > .inner > :nth-child(2n - 1) {
				width:55% !important;
				margin: 0 auto;
				padding-right:0px !important;
				border-right:0px !important;
			}
		</style>
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
						<a href="join.html">JOIN</a>
					</p>
					<p>
						<a href="login.html">LOGIN</a>
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
				<li><a href="index.html">Home</a></li>
				<li><a href="wallet.jsp">wallet</a></li>
				<li><a href="generic.html">Generic</a></li>
				<li><a href="elements.html">Elements</a></li>
			</ul>
			<ul class="actions vertical">
				<li><a href="#" class="button special fit">Get Started</a></li>
				<li><a href="#" class="button fit">Log In</a></li>
			</ul>
		</nav>

				<!-- Contact -->
					<section id="contact">
						<div class="inner">
							<section>
								<form method="post" action="coin">
								<h2 style="text-align:center; border-bottom:2px solid; border-bottom-color:white; margin-bottom:80px;
								margin-top:0px !important;">지&nbsp;&nbsp;&nbsp;갑&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;리</h2>
									<div class="field half">
										<label for="cname">코인 종류</label>
										<select name="cname" id="cname">
											<option value="BTC" style="color:navy !important;">비트코인</option>
											<option value="ETH" style="color:navy !important;">이더리움</option>
											<option value="DASH" style="color:navy !important;">대쉬코인</option>
											<option value="LTC" style="color:navy !important;">라이트코인</option>
											<option value="ETC" style="color:navy !important;">이더리움 클래식</option>
											<option value="XRP" style="color:navy !important;">리플</option>
										</select>
									</div>
									<div class="field half">
										<label for="id">수량</label>
										<input type="text" name="id" id="id" />
									</div>
									<div class="field half">
										<label for="pw">금액</label>
										<input type="text" name="pw" id="pw" />
									</div>
									<br>
									
									<input type="hidden" name="command" value="memberInsert" />
									
									<ul class="actions" style="margin:0 auto !important; width:50%;">
										<li><input type="submit" value="지갑에 등록" class="special" /></li>
										<li><input type="reset" value="다시 작성" /></li>
									</ul>
								</form>
							</section>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner" style="padding:10px !important; text-align:center; width:60%;">
							<ul class="copyright" >
								<li>ⓒ 2017. kData Bitcoin Viewer Team all rights reserved.</li>
							</ul>
						</div>
						

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