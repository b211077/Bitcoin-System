<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>coINsight</title>
<meta charset="euc-kr" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!-- <link href="https://cdn.rawgit.com/YJSoft/Webfonts/0.1/BM_HANNA.css"  rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style type="text/css">
/*  * {font-family:'BM HANNA','배달의민족 한나 ' !important, sans-serif; } */
</style>
<body>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- 실시간 코인 값 받아오는 로직 -->
		<!-- <div id="BTC"></div> -->
		<script type="text/javascript">
		  var btc_c,eth_c,dash_c,ltc_c,etc_c,xrp_c;
			function myFun() {
				$.ajax({
					url : "bithumbUrl.jsp",
					dataType : "html",
					method : "post",
					success : function(result) {
						obj = JSON.parse(result);
						if (obj.message == null){
							btc_c = obj.data.BTC.closing_price;
							eth_c = obj.data.ETH.closing_price;
							dash_c = obj.data.DASH.closing_price;
							ltc_c = obj.data.LTC.closing_price;
							etc_c = obj.data.ETC.closing_price;
							xrp_c = obj.data.XRP.closing_price;
							$("#BTC").text(btc_c);
							$("#ETH").text(eth_c);
							$("#DASH").text(dash_c);
							$("#LTC").text(ltc_c);
							$("#ETC").text(etc_c);
							$("#XRP").text(xrp_c);
							tempval = btc_c * 10;
							$("#BTC_p").text(tempval + "%");
						}
					}
				});
			}
			function myFunction() {
				myVar = setInterval(myFun, 5000);
			}
			myFunction();
		</script>
		<!-- ---------------------------------- -->
		<!-- Header -->
		<header id="header" class="alt">
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
            <li><a href="coin?command=wallet">Wallet</a></li>
            <li><a href="index.jsp#hidden">Real Time Chart</a></li>
            <li><a href="index.jsp#one">Coin Graph</a></li>
         </ul>
         <ul class="actions vertical">
            <c:if test="${empty sessionScope.member}">
            	<li><a href="login.jsp" class="button special fit">Log In</a></li>		
			</c:if>
			<c:if test="${not empty sessionScope.member}">
				<li><a href="coin?command=logout" class="button special fit">Log Out</a></li>	
			</c:if>
         </ul>
      </nav>

		<!-- Banner -->
		<section id="banner" class="major" style="height: 740px;">
			<div class="inner">
				<header class="major">
					<h1>
						<!--   안녕하세요, <strong>coINsight</strong>입니다. -->
						<img src="images/anigif.gif">
					</h1>
				</header>
				<div class="content">
					<p>
						coINsight란 coin(코인) + sight(시야)를 통해 파생된 단어로서, <br> 더불어 co(함께)
						+ insight(통찰력) 이라는 뜻을 가지고 있습니다.<br> coINsight는 가상화폐의 다양한 종류
						별, 그리고 거래소 별 시세 비교를 한 눈에 쉽게 그래프 차트로 제공합니다.<br> 또한 사용자가 구매한
						가상화폐의 현재 시세와 비교하여 수익률을 계산하는 기능을 추가로 제공합니다.<br> coINsight와 함께
						가상화폐 거래에서 더욱 뛰어난 통찰력으로 높은 수익 창출을 경험해보세요. <br>
					</p>

					<ul class="actions">
						<li><a href="index.jsp#hihi" class="button next scrolly">시작하기</a></li>
					</ul>
				</div>
			</div>
		</section>

		<div id="hihi" style="height:600px;">
			<!-- Table -->

			<div class="table-wrapper"	style="width: 35%; float: left; margin-left: 40px;">
				<a href="https://www.bithumb.com/" class="logo"><img
					src="images/logo_bithumb.png" width="240" height="66" /></a> <br>
				<br>
				<table class="alt">
					<thead>
						<tr>
							<th>Coin</th>
							<th>Price(원화: KRW)</th>
						</tr>
					</thead>
					<script>
						
					</script>
					<tbody>
						<tr>
							<td><strong>비트코인(BTC)</strong></td>
							<td><div id="BTC">로딩중입니다.</div></td>
						</tr>
						<tr>
							<td><strong>이더리움(ETH)</strong></td>
							<td><div id="ETH">로딩중입니다.</div></td>
						</tr>
						<tr>
							<td><strong>대쉬 코인(DASH)</strong></td>
							<td><div id="DASH">로딩중입니다.</div></td>
						</tr>
						<tr>
							<td><strong>라이트 코인(LTC)</strong></td>
							<td><div id="LTC">로딩중입니다.</div></td>
						</tr>
						<tr>
							<td><strong>이더리움 클래식(ETC)</strong></td>
							<td><div id="ETC">로딩중입니다.</div></td>
						</tr>
						<tr>
							<td><strong>리플(XRP)</strong></td>
							<td><div id="XRP">로딩중입니다.</div></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="table-wrapper"	style="width: 20%; float: left; margin:0 35px;">
				<h2 style="margin-bottom:50px;"> Bithumb : Poloniex </h2>
				<table class="alt">
					<thead>
						<tr>
							<th>변동 금액</th>
						</tr>
					</thead>
					<tbody style="text-align:center;">
						<tr> 
							<td><div id="BTC_p">0</div></td>
						</tr>
						<tr>
							<td><div id="ETH_p">0</div></td>
						</tr>
						<tr>
							<td><div id="DASH_p">0</div></td>
						</tr>
						<tr>
							<td><div id="LTC_p">0</div></td>
						</tr>
						<tr>
							<td><div id="ETC_p">0</div></td>
						</tr>
						<tr>
							<td><div id="XRP_p">0</div></td>
						</tr>
					</tbody>
					<!-- <tfoot>
                  <tr>
                     <td colspan="2"></td>
                     <td>100.00</td>
                  </tr>
               </tfoot> -->
				</table>
			</div>
		
		
			<div class="table-wrapper" style="width: 35%; float: right; margin-right: 40px;">
				<a href="https://poloniex.com/" class="logo"><img
					src="images/poloniex.png" width="250" height="40"
					style="margin-top: 24px;" /></a> <br> <br>
				<table class="alt">
					<thead>
						<tr>
							<th>Name</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Item1</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>Item2</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>Item3</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>Item4</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>Item5</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>Item6</td>
							<td>29.99</td>
						</tr>
					</tbody>
					<!-- <tfoot>
                  <tr>
                     <td colspan="2"></td>
                     <td>100.00</td>
                  </tr>
               </tfoot> -->
				</table>
			</div>
		</div>


		<div style="width: 16%; margin: 0 auto; margin-bottom: 20px;">
			<a href="#one" class="button next scrolly">코인 별 상세보기</a>
		</div>

		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image"> <!-- <img src="images/pic01.jpg" alt="" /> -->
						<img src="images/eth.png" />
					</span>
					<header class="major">
						<h3>
							<a href="coin?command=generic" class="link">ETH</a>
						</h3>
						<p>이더리움</p>
					</header>
				</article>
				<article>
					<span class="image"> <!-- <img src="images/pic02.jpg" alt="" /> -->
						<img src="images/btc.png" />
					</span>
					<header class="major">
						<h3>
							<a href="coin?command=generic" class="link">BTC</a>
						</h3>
						<p>비트코인</p>
					</header>
				</article>
				<article>
					<span class="image"> <!-- <img src="images/pic03.jpg" alt="" /> -->
						<img src="images/dash.png" width="100" />
					</span>
					<header class="major">
						<h3>
							<a href="coin?command=generic" class="link">DASH</a>
						</h3>
						<p>대쉬코인</p>
					</header>
				</article>
				<article>
					<span class="image"> <!-- <img src="images/pic04.jpg" alt="" /> -->
						<img src="images/ltc.png" />
					</span>
					<header class="major">
						<h3>
							<a href="coin?command=generic" class="link">LTC</a>
						</h3>
						<p>라이트코인</p>
					</header>
				</article>
				<article>
					<span class="image"> <!-- <img src="images/pic05.jpg" alt="" /> -->
						<img src="images/etc.png" />
					</span>
					<header class="major">
						<h3>
							<a href="coin?command=generic" class="link">ETC</a>
						</h3>
						<p>이더리움 클래식</p>
					</header>
				</article>
				<article>
					<span class="image"> <!-- <img src="images/pic06.jpg" alt="" /> -->
						<img src="images/xrp.png" />
					</span>
					<header class="major">
						<h3>
							<a href="coin?command=generic" class="link">XRP</a>
						</h3>
						<p>리플</p>
					</header>
				</article>
			</section>

		</div>


		<!-- Footer -->
		<footer id="footer">
			<div class="inner"
				style="padding: 10px !important; text-align: center; width: 60%;">
				<br>
				<ul class="copyright">
					<li>ⓒ 2017. kData coInsight Team all rights reserved.</li>
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