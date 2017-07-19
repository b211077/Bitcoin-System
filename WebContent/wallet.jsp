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
		<script type="text/javascript">
			function coinInfo(c){
				$.ajax({
					url : "coin",
					data : {
						command: "coinInfo",
						coinName: c
						},
					method : "post",
					dataType: "html",
					success : function(responseData) {
						var data = JSON.parse(responseData);
						$("#amount").val(data.amount);
						$("#price").val(data.price);
					}
				});
			}
		</script>
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
								<h2 style="text-align:center; border-bottom:2px solid; border-bottom-color:white; margin-bottom:80px;
								margin-top:0px !important;">��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</h2>
									<div class="field half">
										<label for="cname">���� ����</label>
										<select name="cname" id="cname" onChange="coinInfo(this.value)">
											<option value="empty" style="color:navy !important;">( ���� ���� ���� )</option>
											<option value="BTC" style="color:navy !important;">��Ʈ����</option>
											<option value="ETH" style="color:navy !important;">�̴�����</option>
											<option value="DASH" style="color:navy !important;">�뽬����</option>
											<option value="LTC" style="color:navy !important;">����Ʈ����</option>
											<option value="ETC" style="color:navy !important;">�̴����� Ŭ����</option>
											<option value="XRP" style="color:navy !important;">����</option>
										</select>
									</div>
									<div class="field half">
										<label for="id">����</label>
										<input type="text" name="amount" id="amount" />
									</div>
									<div class="field half">
										<label for="pw">�ݾ�</label>
										<input type="text" name="price" id="price" />
									</div>
									<br>
									
									<input type="hidden" name="command" value="coinInfoUpdate" />
									
									<ul class="actions" style="margin:0 auto !important; width:50%;">
										<li><input type="submit" value="������ ���" class="special" /></li>
										<li><input type="reset" value="�ٽ� �ۼ�" /></li>
									</ul>
								</form>
							</section>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner" style="padding:10px !important; text-align:center; width:60%;">
							<ul class="copyright" >
								<li>�� 2017. kData Bitcoin Viewer Team all rights reserved.</li>
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