<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Generic - Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
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
<script type="text/javascript">
	var btc_c, eth_c, dash_c, ltc_c, etc_c, xrp_c, btc_c1, eth_c1, dash_c1, ltc_c1, etc_c1, xrp_c1;
	var pbtc_c, peth_c, pdash_c, pltc_c, petc_c, pxrp_c, obj, tempval;
	var amount, price, avgPrice, currentPrice_b, currentPrice_p;
	function coinChart() {
		$.ajax({
			url : "test/coin.html",
		}).done(function(html) {
			$("#areaText").append(html);
		});
	}
	coinChart();
	function coinInfo(c) {
		$.ajax({
			url : "coin",
			data : {
				command : "coinInfo",
				coinName : c
			},
			method : "post",
			dataType : "html",
			success : function(responseData) {
				var data = JSON.parse(responseData);
				amount = data.amount;
				price = data.price;
				avgPrice = (data.price / data.amount).toFixed(2);
				$("#amount").val(amount);
				$("#price").val(price);
				$("#avgPrice").val(avgPrice);
				if (c == 'BTC') {
					currentPrice_b = btc_c * avgPrice;
					currentPrice_p = pbtc_c * avgPrice;
				} else if (c == 'ETH') {
					currentPrice_b = eth_c * avgPrice;
					currentPrice_p = peth_c * avgPrice;
				} else if (c == 'DASH') {
					currentPrice_b = dash_c * avgPrice;
					currentPrice_p = pdash_c * avgPrice;
				} else if (c == 'LTC') {
					currentPrice_b = ltc_c * avgPrice;
					currentPrice_p = pltc_c * avgPrice;
				} else if (c == 'ETC') {
					currentPrice_b = etc_c * avgPrice;
					currentPrice_p = petc_c * avgPrice;
				} else if (c == 'XRP') {
					currentPrice_b = xrp_c * avgPrice;
					currentPrice_p = pxrp_c * avgPrice;
				}
				$("#currentPrice_b").val(currentPrice_b.toFixed(2));
				$("#currentPrice_p").val(currentPrice_p.toFixed(2));
			}
		});
	}
	function coinInfo(c) {
		$.ajax({
			url : "coin",
			data : {
				command : "coinInfo",
				coinName : c
			},
			method : "post",
			dataType : "html",
			success : function(responseData) {
				var data = JSON.parse(responseData);
				amount = data.amount;
				price = data.price;
				avgPrice = (data.price / data.amount).toFixed(2);
				
			}
		});
	}
</script>
<script type="text/javascript">
	function myFun() {
		$.ajax({
			url : "bithumbUrl.jsp",
			dataType : "html",
			method : "GET",
			success : function(result) {
				result = result.replace(/(\s*)/g, "");
				obj = eval("(" + result + ")");
				if (obj.message == null) {
					btc_c = obj.data.BTC.closing_price;
					eth_c = obj.data.ETH.closing_price;
					dash_c = obj.data.DASH.closing_price;
					ltc_c = obj.data.LTC.closing_price;
					etc_c = obj.data.ETC.closing_price;
					xrp_c = obj.data.XRP.closing_price;
					$("#BTC").text(
							btc_c
									+ "    ("
									+ ((btc_c - obj.data.BTC.opening_price)
											/ btc_c * 100).toFixed(2) + "%"
									+ ")");
					//$("#BTC").css("backgroun-color","blue");
					//$("#BTC").animate({fontSize: '24px'}, "slow");
					$("#ETH").text(
							eth_c
									+ "    ("
									+ ((eth_c - obj.data.ETH.opening_price)
											/ eth_c * 100).toFixed(2) + "%"
									+ ")");
					$("#DASH").text(
							dash_c
									+ "    ("
									+ ((dash_c - obj.data.DASH.opening_price)
											/ dash_c * 100).toFixed(2) + "%"
									+ ")");
					$("#LTC").text(
							ltc_c
									+ "    ("
									+ ((ltc_c - obj.data.LTC.opening_price)
											/ ltc_c * 100).toFixed(2) + "%"
									+ ")");
					$("#ETC").text(
							etc_c
									+ "    ("
									+ ((etc_c - obj.data.ETC.opening_price)
											/ etc_c * 100).toFixed(2) + "%"
									+ ")");
					$("#XRP").text(
							xrp_c
									+ "    ("
									+ ((xrp_c - obj.data.XRP.opening_price)
											/ xrp_c * 100).toFixed(2) + "%"
									+ ")");

				}
			}
		});
	}
	function myFunction2() {
		myVar = setInterval(myFun2, 1000);

	}
	function myFunction() {
		myVar = setInterval(myFun, 1000);
	}
	myFunction();
	myFunction2();
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
				<li><a href="index.jsp#hihi" class="button special fit">Get
						Started</a></li>
				<c:if test="${empty sessionScope.member}">
					<li><a href="login.jsp" class="button fit">Log In</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.member}">
					<li><a href="coin?command=logout" class="button fit">Log
							Out</a></li>
				</c:if>
			</ul>
		</nav>

		<!-- Contact -->
		<section id="contact">
			<div>
				<section>
					<script src="scripts/jquery-3.1.1.js"></script>
						<script src="scripts/jquery.validate.min.js"></script>
						<script src="http://ajax.microsoft.com/ajax/jquery.validate/1.11.1/additional-methods.js"></script>
						<script type="text/javascript">
						$(document).ready(function(){
							 jQuery.validator.addMethod('cnameSelectCheck', function (value) {
							        return (value != 'empty');
							 }, "코인 종류를 선택 하세요");
							
							$("#walletForm").validate({ // joinForm에 validate를 적용
							    rules:{
							    	cname:{cnameSelectCheck:true},
							    	updateAmount:{required:true, digits:true},
							        // required는 필수, rangelength는 글자 개수(5~10개 사이)
							    	updatePrice:{required:true, digits:true}
							    },
							    messages:{ // rules에 해당하는 메시지를 지정하는 속성
							    	updateAmount:{
							            required:"수량을 입력하세요", // 이와 같이 규칙이름과 메시지를 작성
							            digits:"양의 정수를 입력하세요"
							        },
							        updatePrice:{
							            required:"금액을 입력하세요",
							            digits:"양의 정수를 입력하세요"
							        }
							    }
							});
						});	
					</script>
					<form id="walletForm" name="walletForm" method="post" action="coin">
						<div id="part1"
							style="width: 40%; float: left; margin-left: 80px;">
							<h2
								style="text-align: center; border-bottom: 2px solid; border-bottom-color: white; margin-bottom: 80px; margin-top: 0px !important;">지&nbsp;&nbsp;&nbsp;갑&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;리</h2>
							<div class="field half">
								<label for="cname">코인 종류</label> <select name="cname" id="cname"
									onChange="coinInfo(this.value)">
									<option value="empty" style="color: navy !important;">코인 종류를 선택하세요</option>
									<option value="BTC" style="color: navy !important;">비트코인</option>
									<option value="ETH" style="color: navy !important;">이더리움</option>
									<option value="DASH" style="color: navy !important;">대쉬코인</option>
									<option value="LTC" style="color: navy !important;">라이트코인</option>
									<option value="ETC" style="color: navy !important;">이더리움
										클래식</option>
									<option value="XRP" style="color: navy !important;">리플</option>
								</select>
							</div>
							<div class="field half">
								<label for="id">수량</label> <input type="text" name="amount"
									id="amount" readonly />
							</div>
							<div class="field half">
								<label for="pw">총 구매 금액</label> <input type="text" name="price"
									id="price" readonly />
							</div>
							<div class="field half">
								<label for="pw">평균 코인 구매 단가[총구매금액/코인개수]</label> <input
									type="text" name="avgPrice" id="avgPrice" readonly />
							</div>
							<div class="field half">
								<label for="pw">현재 평가 금액[현재가(빗섬)*코인개수]</label> <input
									type="text" name="currentPrice_b" id="currentPrice_b" readonly />
							</div>
							<div class="field half">
								<label for="pw">현재 평가 금액[현재가(플로닉스)*코인개수]</label> <input
									type="text" name="currentPrice_p" id="currentPrice_p" readonly />
							</div>
						</div>

						<div id="part2"
							style="width: 40%; float: right; margin-right: 80px;">
							<p id="areaText"></p>
							<h2
								style="text-align: center; border-bottom: 2px solid; border-bottom-color: white; margin-bottom: 80px; margin-top: 0px !important;">
								지&nbsp;갑&nbsp;정&nbsp;보&nbsp;수&nbsp;정</h2>
							<div class="field half">
								<div style="width: 24%; float: left; margin-right: 21px;">
									<label for="cname">분류</label> <select name="updateType"
										id="updateType">
										<option value="buy" style="color: navy !important;">구입</option>
										<option value="sell" style="color: navy !important;">판매</option>
									</select>
								</div>
								<div style="width: 35%; float: left; margin: 0 auto;">
									<label for="pw">수량</label> <input type="text"
										name="updateAmount" id="updateAmount" />
								</div>
								<div style="width: 35%; float: right;">
									<label for="pw">금액</label> <input type="text"
										name="updatePrice" id="updatePrice" />
								</div>
							</div>

							<br> <br> <br> <br> <br> <input
								type="hidden" name="command" value="coinInfoUpdate" />

							<ul class="actions"
								style="margin: 0 auto !important; width: 58%;">
								<li><input type="submit" value="지갑에 등록" class="special" /></li>
								<li><input type="reset" value="다시 작성" /></li>
							</ul>
						</div>
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
	</div>


	<!-- Scripts -->
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>


</body>
</html>