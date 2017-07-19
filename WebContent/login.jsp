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
<style type="text/css">
form .field.half {
	width: 100% !important;
	float: none;
	padding: 0;
}

#contact>.inner>:nth-child(2n - 1) {
	width: 55% !important;
	margin: 0 auto;
	padding-right: 0px !important;
	border-right: 0px !important;
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

		<!-- Contact -->
		<section id="contact">
			<div class="inner">
				<section>
					<form method="post" action="coin">
						<h2
							style="text-align: center; border-bottom: 2px solid; border-bottom-color: white; margin-bottom: 80px; margin-top: 0px !important;">로&nbsp;&nbsp;&nbsp;그&nbsp;&nbsp;&nbsp;인</h2>
						<div class="field half">
							<label for="id">아이디</label> <input type="text" name="id" id="id" />
						</div>
						<div>
							<label for="pw">비밀번호</label> <input type="password" name="pw"
								id="pw" />
						</div>
						<br> <input type="hidden" name="command" value="login" />
						<ul class="actions" style="margin: 0 auto !important; width: 44%;">
							<li><input type="submit" value="로&nbsp;&nbsp;그&nbsp;&nbsp;인"
								class="special" /></li>
							<li><input type="reset" value="다시 작성" /></li>
						</ul>
					</form>
				</section>
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="inner"
				style="padding: 10px !important; text-align: center; width: 60%;">
				<ul class="copyright">
					<li>ⓒ 2017. kData Bitcoin Viewer Team all rights reserved.</li>
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