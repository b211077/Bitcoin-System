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
			var btc_c,eth_c,dash_c,ltc_c,etc_c,xrp_c,btc_c1,eth_c1,dash_c1,ltc_c1,etc_c1,xrp_c1;
	        var pbtc_c,peth_c,pdash_c,pltc_c,petc_c,pxrp_c,obj,tempval;
			var amount, price, avgPrice, currentPrice_b, currentPrice_p;
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
						amount = data.amount;
						price = data.price;
						avgPrice = (data.price/data.amount).toFixed(2);
						$("#amount").val(amount);
						$("#price").val(price);
						$("#avgPrice").val(avgPrice);
						if(c == 'BTC'){
							currentPrice_b = btc_c*amount;
							currentPrice_p = pbtc_c*amount;
						}else if(c == 'ETH'){
							currentPrice_b = eth_c*amount;
							currentPrice_p = peth_c*amount;
						}else if(c == 'DASH'){
							currentPrice_b = dash_c*amount;
							currentPrice_p = pdash_c*amount;
						}else if(c == 'LTC'){
							currentPrice_b = ltc_c*amount;
							currentPrice_p = pltc_c*amount;
						}else if(c == 'ETC'){
							currentPrice_b = etc_c*amount;
							currentPrice_p = petc_c*amount;
						}else if(c == 'XRP'){
							currentPrice_b = xrp_c*amount;
							currentPrice_p = pxrp_c*amount;
						}
						$("#currentPrice_b").val(currentPrice_b.toFixed(2));
						$("#currentPrice_p").val(currentPrice_p.toFixed(2));
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
                  if (obj.message == null){
                  btc_c = obj.data.BTC.closing_price;   
                  eth_c = obj.data.ETH.closing_price;
                  dash_c = obj.data.DASH.closing_price;
                  ltc_c = obj.data.LTC.closing_price;
                  etc_c = obj.data.ETC.closing_price;
                  xrp_c = obj.data.XRP.closing_price;
                  $("#BTC").text(btc_c+"    (" + ((btc_c-obj.data.BTC.opening_price)/btc_c*100).toFixed(2) + "%" + ")");
                  //$("#BTC").css("backgroun-color","blue");
                  //$("#BTC").animate({fontSize: '24px'}, "slow");
                  $("#ETH").text(eth_c+"    (" + ((eth_c-obj.data.ETH.opening_price)/eth_c*100).toFixed(2) + "%" + ")");
                  $("#DASH").text(dash_c+"    (" + ((dash_c-obj.data.DASH.opening_price)/dash_c*100).toFixed(2) + "%" + ")");
                  $("#LTC").text(ltc_c+"    (" + ((ltc_c-obj.data.LTC.opening_price)/ltc_c*100).toFixed(2) + "%" + ")");
                  $("#ETC").text(etc_c+"    (" + ((etc_c-obj.data.ETC.opening_price)/etc_c*100).toFixed(2) + "%" + ")");
                  $("#XRP").text(xrp_c+"    (" + ((xrp_c-obj.data.XRP.opening_price)/xrp_c*100).toFixed(2) + "%" + ")");
                  	
                    
                  }
               }
            });
         }
            //폴로닉스 api 받아오는 함수
            function myFun2() {
               $.ajax({
                  url : "poloniexUrl.jsp",
                  dataType : "html",
                  method : "GET",
                  success : function(result2) {
                     result2 = result2.replace(/(\s*)/g, "");               
                     obj = eval("(" + result2 + ")");
                     pbtc_c = parseInt(obj.USDT_BTC.last*1121);
                     peth_c = parseInt(obj.USDT_ETH.last*1121);
                     pdash_c = parseInt(obj.USDT_DASH.last*1121);
                     pltc_c = parseInt(obj.USDT_LTC.last*1121);
                     petc_c = parseInt(obj.USDT_ETC.last*1121);
                     pxrp_c = parseInt(obj.USDT_XRP.last*1121);
                     $("#PBTC").html(pbtc_c +"<div style='float:right;'>(" + (obj.USDT_BTC.percentChange*100).toFixed(2) + "%" + ")</div>");
                     $("#PETH").html(peth_c+"    <div style='float:right;'>(" + (obj.USDT_ETH.percentChange*100).toFixed(2) + "%" + ")</div>");
                     $("#PDASH").html(pdash_c+"    <div style='float:right;'>(" + (obj.USDT_DASH.percentChange*100).toFixed(2) + "%" + ")</div>");
                     $("#PLTC").html(pltc_c+"    <div style='float:right;'>(" + (obj.USDT_LTC.percentChange*100).toFixed(2) + "%" + ")</div>");
                     $("#PETC").html(petc_c+"    <div style='float:right;'>(" + (obj.USDT_ETC.percentChange*100).toFixed(2) + "%" + ")</div>");
                     $("#PXRP").html(pxrp_c+"    <div style='float:right;'>(" + (obj.USDT_XRP.percentChange*100).toFixed(2) + "%" + ")</div>");
                     if(btc_c != null && pbtc_c != null){
	                     if(btc_c>pbtc_c){
	                     tempval = (btc_c - pbtc_c)/btc_c*100;
	                     $("#BTC_p").html(tempval.toFixed(2) + "%"+ "    (bithumb <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");   
	                     }
	                     else{
	                     tempval = (pbtc_c-btc_c)/btc_c*100;
	                     $("#BTC_p").html(tempval.toFixed(2) + "%"+ "   (poloniex <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");
	                     }
                     }
                     if(eth_c != null && peth_c != null){
	                     if(eth_c>peth_c){
	                     tempval = (eth_c - peth_c)/eth_c*100;
	                     $("#ETH_p").html(tempval.toFixed(2) + "%"+ "    (bithumb <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");   
	                     }
	                     else{
	                     tempval = (peth_c-eth_c)/eth_c*100;
	                     $("#ETH_p").html(tempval.toFixed(2) + "%"+ "   (poloniex <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");
	                     }
                     }
                     if(dash_c != null && pdash_c != null){
	                     if(dash_c>pdash_c){
	                     tempval = (dash_c - pdash_c)/dash_c*100;
	                     $("#DASH_p").html(tempval.toFixed(2) + "%"+ "    (bithumb <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");   
	                     }
	                     else{
	                     tempval = (pdash_c-dash_c)/dash_c*100;
	                     $("#DASH_p").html(tempval.toFixed(2) + "%"+ "   (poloniex <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");
	                     }
                     }
                     if(ltc_c != null && pltc_c != null){
	                     if(ltc_c>pltc_c){
	                     tempval = (ltc_c - pltc_c)/ltc_c*100;
	                     $("#LTC_p").html(tempval.toFixed(2) + "%"+ "    (bithumb <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");   
	                     }
	                     else{
	                     tempval = (pltc_c-ltc_c)/ltc_c*100;
	                     $("#LTC_p").html(tempval.toFixed(2) + "%"+ "   (poloniex <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");
	                     }
                     }
                     if(etc_c != null && petc_c != null){
	                     if(etc_c>petc_c){
	                   	 tempval = (etc_c - petc_c)/etc_c*100;
	                     $("#ETC_p").html(tempval.toFixed(2) + "%"+ "    (bithumb <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");   
	                     }
	                     else{
	                     tempval = (petc_c-etc_c)/etc_c*100;
	                     $("#ETC_p").html(tempval.toFixed(2) + "%"+ "   (poloniex <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");
	                     }
                     }
                     if(xrp_c != null && pxrp_c != null){
	                     if(xrp_c>pxrp_c){
	                     tempval = (xrp_c - pxrp_c)/xrp_c*100;
	                     $("#XRP_p").html(tempval.toFixed(2) + "%"+ "    (bithumb <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");   
	                     }
	                     else{
	                     tempval = (pxrp_c-xrp_c)/xrp_c*100;
	                     $("#XRP_p").html(tempval.toFixed(2) + "%"+ "   (poloniex <i class='fa fa-arrow-up' style='font-size:26px; color:green;'></i>)");
	                     } 
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
								margin-top:0px !important;">지&nbsp;&nbsp;&nbsp;갑&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;리</h2>
									<div class="field half">
										<label for="cname">코인 종류</label>
										<select name="cname" id="cname" onChange="coinInfo(this.value)">
											<option value="empty" style="color:navy !important;">( 코인 종류 선택 )</option>
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
										<input type="text" name="amount" id="amount" readonly />
									</div>
									<div class="field half">
										<label for="pw">총 구매 금액</label>
										<input type="text" name="price" id="price" readonly />
									</div>
									<div class="field half">
										<label for="pw">평균 코인 구매 단가[총구매금액/코인개수]</label>
										<input type="text" name="avgPrice" id="avgPrice" readonly />
									</div>
									<div class="field half">
										<label for="pw">현재 평가 금액[현재가(빗섬)*코인개수]</label>
										<input type="text" name="currentPrice_b" id="currentPrice_b" readonly />
									</div>
									<div class="field half">
										<label for="pw">현재 평가 금액[현재가(플로닉스)*코인개수]</label>
										<input type="text" name="currentPrice_p" id="currentPrice_p" readonly />
									</div>
									
									
									<h3 style="text-align:center; border-bottom:1px dashed; border-bottom-color:white;">지갑 정보 수정</h3>
									<div class="field half">
										<div style="width:24%; float:left; margin-right:21px;">
											<label for="cname">분류</label>
											<select name="updateType" id="updateType" >
												<option value="buy" style="color:navy !important;">구입</option>
												<option value="sell" style="color:navy !important;">판매</option>
											</select>
										</div>
										<div style="width:35%;  float:left; margin:0 auto;" >
											<label for="pw">수량</label>
											<input type="text" name="updateAmount" id="updateAmount" />
										</div>
										<div style="width:35%;  float:right;">
											<label for="pw">금액</label>
											<input type="text" name="updatePrice" id="updatePrice" />
										</div>
									</div>
									
									<br><br><br><br><br>
									
									<input type="hidden" name="command" value="coinInfoUpdate" />
									
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
			<script src="scripts/jquery.validate.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<script src="assets/js/jquery.validate.min.js"></script>

	</body>
</html>