<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>coINsight</title>
<meta charset="utf-8" />
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
/*  * {font-family:'BM HANNA','¹è´ŞÀÇ¹ÎÁ· ÇÑ³ª ' !important, sans-serif; } */
</style>
<body>
	
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- ½Ç½Ã°£ ÄÚÀÎ °ª ¹Ş¾Æ¿À´Â ·ÎÁ÷ -->
		<!-- <div id="BTC"></div> -->
		<script type="text/javascript">
		/* 
			var eth_c; 
			var dash_c; */ 
			
			function myFun() {
				$.ajax({
					url : "bithumbUrl.jsp",
					dataType : "html",
					method : "GET",
					success : function(result) {
						var btc_c;
						console.log(result)
						obj = JSON.parse(result);
						btc_c=obj.data.BTC.closing_price;
						eth_c=obj.data.ETH.closing_price;
						dash_c=obj.data.DASH.closing_price;
						ltc_c=obj.data.LTC.closing_price;
						etc_c=obj.data.ETC.closing_price;
						xrp_c=obj.data.XRP.closing_price;
						//$("#BTC").text(btc_c);
						$("#ETH").text(eth_c);
						$("#DASH").text(dash_c);
						$("#LTC").text(ltc_c);
						$("#ETC").text(etc_c);
						$("#XRP").text(xrp_c);
					}
				});
			}
		 
			function myFunction() {
				btc_c;
				myVar = setInterval(myFun, 1000);	
				$("#BTC").text(btc_c);	
			}
			
			
		 			
		</script>


		<!-- ---------------------------------- -->
		<!-- Header -->
		<header id="header" class="alt">
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
					<p>${sessionScope.member.id}(${sessionScope.member.name})</p>
					<p>
						<a href="coin?command=logout">logout</a>
					</p>
				</c:if>
				<a href="#menu">Menu</a>
			</nav>
		</header>
=======
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <title>coINsight</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="assets/css/main.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
       <!-- <link href="https://cdn.rawgit.com/YJSoft/Webfonts/0.1/BM_HANNA.css"  rel="stylesheet" type="text/css" /> -->
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   </head>
   <style type="text/css">
      /*  * {font-family:'BM HANNA','ë°°ë‹¬ì˜ë¯¼ì¡± í•œë‚˜ ' !important, sans-serif; } */
   </style>
   <body>

      <!-- Wrapper -->
         <div id="wrapper">
				<!-- Header -->
					<header id="header" class="alt">
						<a href="index.jsp" class="logo"><img src="images/coinsight.png" style="width:260px; height:60px;"></a>
						<nav>
							<c:if test="${empty sessionScope.member}">
								<p><a href="join.html">JOIN</a></p>
								<p><a href="login.html">LOGIN</a></p>
							</c:if>
							<c:if test="${not empty sessionScope.member}">
								<p>${sessionScope.member.id}(${sessionScope.member.name})</p>
								<p><a href="coin?command=logout">logout</a></p>
							</c:if>
							<a href="#menu">Menu</a>
						</nav>
					</header>
>>>>>>> 99c4ccb0865c02c02c4a276eeac6a5b0c1ffdf0c


		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="index.html">Home</a></li>
				<li><a href="coin?command=wallet">wallet</a></li>
				<li><a href="generic.html">Generic</a></li>
				<li><a href="elements.html">Elements</a></li>
			</ul>
			<ul class="actions vertical">
				<li><a href="#" class="button special fit">Get Started</a></li>
				<li><a href="#" class="button fit">Log In</a></li>
			</ul>
		</nav>

<<<<<<< HEAD
		<!-- Banner -->
		<section id="banner" class="major" style="height: 740px;">
			<div class="inner">
				<header class="major">
					<h1>
						¾È³çÇÏ¼¼¿ä, <strong>coINsight</strong>ÀÔ´Ï´Ù.
					</h1>
				</header>
				<div class="content">
					<p>
						coINsight´Â °¡»óÈ­Æä ½Ã¼¼ ºñ±³ Á¶È¸ ¼­ºñ½º¸¦ Á¦°øÇÕ´Ï´Ù.<br> coINsight¶õ coin(ÄÚÀÎ)
						+ sight(½Ã¾ß)¸¦ ÅëÇØ ÆÄ»ıµÈ ´Ü¾î·Î¼­, <br> ´õºÒ¾î co(ÇÔ²²) + insight(ÅëÂû·Â) ÀÌ¶ó´Â
						¶æÀ» °¡Áö°í ÀÖ½À´Ï´Ù.<br> coINsigh´Â °¡»óÈ­ÆóÀÇ ´Ù¾çÇÑ Á¾·ù º°, ±×¸®°í °Å·¡¼Ò º° ½Ã¼¼ ºñ±³¸¦ ÇÑ
						´«¿¡ ½±°Ô ±×·¡ÇÁ Â÷Æ®·Î Á¦°øÇÕ´Ï´Ù.<br> ¶ÇÇÑ »ç¿ëÀÚ°¡ ±¸¸ÅÇÑ °¡»óÈ­ÆóÀÇ ÇöÀç ½Ã¼¼¿Í ºñ±³ÇÏ¿© ¼öÀÍ·üÀ»
						°è»êÇÏ´Â ±â´ÉÀ» Ãß°¡·Î Á¦°øÇÕ´Ï´Ù.<br> coINsight¿Í ÇÔ²² °¡»óÈ­Æó °Å·¡¿¡¼­ ´õ¿í ¶Ù¾î³­ ÅëÂû·ÂÀ¸·Î
						³ôÀº ¼öÀÍ Ã¢ÃâÀ» °æÇèÇØº¸¼¼¿ä. <br>
					</p>

					<ul class="actions">
						<li><a href="#hihi" class="button next scrolly">½ÃÀÛÇÏ±â</a></li>
					</ul>
				</div>
			</div>
		</section>
=======
            <!-- Banner -->
               <section id="banner" class="major" style="height:740px;">
                  <div class="inner">
            <header class="major">
               <h1>
                <!--   ì•ˆë…•í•˜ì„¸ìš”, <strong>coINsight</strong>ì…ë‹ˆë‹¤. -->
                <img src="images/anigif.gif">
               </h1>
            </header>
            <div class="content">
               <p>
                  coINsightë€ coin(ì½”ì¸)   + sight(ì‹œì•¼)ë¥¼ í†µí•´ íŒŒìƒëœ ë‹¨ì–´ë¡œì„œ, <br> 
                  ë”ë¶ˆì–´ co(í•¨ê»˜) + insight(í†µì°°ë ¥) ì´ë¼ëŠ” ëœ»ì„ ê°€ì§€ê³  ìˆìŠµë‹ˆë‹¤.<br> 
                  coINsightëŠ” ê°€ìƒí™”íì˜ ë‹¤ì–‘í•œ ì¢…ë¥˜ ë³„, ê·¸ë¦¬ê³  ê±°ë˜ì†Œ ë³„ ì‹œì„¸ ë¹„êµë¥¼ í•œ ëˆˆì— ì‰½ê²Œ ê·¸ë˜í”„ ì°¨íŠ¸ë¡œ ì œê³µí•©ë‹ˆë‹¤.<br> 
                  ë˜í•œ ì‚¬ìš©ìê°€ êµ¬ë§¤í•œ ê°€ìƒí™”íì˜ í˜„ì¬ ì‹œì„¸ì™€ ë¹„êµí•˜ì—¬ ìˆ˜ìµë¥ ì„ ê³„ì‚°í•˜ëŠ” ê¸°ëŠ¥ì„ ì¶”ê°€ë¡œ ì œê³µí•©ë‹ˆë‹¤.<br> 
                  coINsightì™€ í•¨ê»˜ ê°€ìƒí™”í ê±°ë˜ì—ì„œ ë”ìš± ë›°ì–´ë‚œ í†µì°°ë ¥ìœ¼ë¡œ ë†’ì€ ìˆ˜ìµ ì°½ì¶œì„ ê²½í—˜í•´ë³´ì„¸ìš”. <br>
               </p>

               <ul class="actions">
                  <li><a href="#hihi" class="button next scrolly">ì‹œì‘í•˜ê¸°</a></li>
               </ul>
            </div>
         </div>
               </section>
>>>>>>> 99c4ccb0865c02c02c4a276eeac6a5b0c1ffdf0c

		<div id="hihi" style="height: 600px">
			<!-- Table -->

<<<<<<< HEAD
			<div style="width: 10%; margin: 0 auto;">
				<button
					style="width: 100%; height: 50px; background-color: white; color: navy;">
					<i class="fa fa-refresh" style="font-size: 24px"></i> »õ·Î°íÄ§
				</button>
			</div>

			<div class="table-wrapper"
				style="width: 46%; float: left; margin-left: 40px;">
				<a href="https://www.bithumb.com/" class="logo"><img
					src="images/logo_bithumb.png" width="240" height="66" /></a> <br>
				<br>
				<table>
					<thead>
						<tr>
							<th>Coin</th>
							<th>Price(¿øÈ­: KRW)</th>
						</tr>
					</thead>
					<script>
					
					</script>
					<tbody>
						<tr>
							<td>ºñÆ®ÄÚÀÎ(BTC)</td>
							<td><div id="BTC"><script> myFunction()</script></div></td>
						</tr>
						<tr>
							<td>ÀÌ´õ¸®¿ò(ETH)</td>
							<td><div id="ETH"><script> myFunction()</script></div></td>
						</tr>
						<tr>
							<td>´ë½¬ ÄÚÀÎ(DASH)</td>
							<td><div id="DASH"><script> myFunction()</script></div></td>
						</tr>
						<tr>
							<td>¶óÀÌÆ® ÄÚÀÎ(LTC)</td>
							<td><div id="LTC"><script> myFunction()</script></div></td>
						</tr>
						<tr>
							<td>ÀÌ´õ¸®¿ò Å¬·¡½Ä(ETC)</td>
							<td><div id="ETC"><script> myFunction()</script></div></td>
						</tr>
						<tr>
							<td>¸®ÇÃ(XRP)</td>
							<td><div id="XRP"><script> myFunction()</script></div></td>
						</tr>
					</tbody>
					<!-- <tfoot>
=======
         <div style="width:10%; margin:0 auto;">
           <!--  <button style="width:100%; height:50px; background-color:white; color:navy;">
            <i class="fa fa-refresh" style="font-size:24px"></i> ìƒˆë¡œê³ ì¹¨</button> -->
         </div>
         
         <div class="table-wrapper" style="width:46%; float:left; margin-left:40px;">
            <a href="https://www.bithumb.com/" class="logo"><img src="images/logo_bithumb.png" width="240" height="66" /></a>
            <br>
            <br>
            <table>
               <thead>
                  <tr>
                     <th>Name</th>
                     <th>Description</th>
                     <th>Price</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>Item1</td>
                     <td>Ante turpis integer aliquet porttitor.</td>
                     <td>29.99</td>
                  </tr>
                  <tr>
                     <td>Item2</td>
                     <td>Vis ac commodo adipiscing arcu aliquet.</td>
                     <td>19.99</td>
                  </tr>
                  <tr>
                     <td>Item3</td>
                     <td>Morbi faucibus arcu accumsan lorem.</td>
                     <td>29.99</td>
                  </tr>
                  <tr>
                     <td>Item4</td>
                     <td>Vitae integer tempus condimentum.</td>
                     <td>19.99</td>
                  </tr>
                  <tr>
                     <td>Item5</td>
                     <td>Ante turpis integer aliquet porttitor.</td>
                     <td>29.99</td>
                  </tr>
                  <tr>
                     <td>Item6</td>
                     <td>Ante turpis integer aliquet porttitor.</td>
                     <td>29.99</td>
                  </tr>
               </tbody>
               <!-- <tfoot>
>>>>>>> 99c4ccb0865c02c02c4a276eeac6a5b0c1ffdf0c
                  <tr>
                     <td colspan="2"></td>
                     <td>100.00</td>
                  </tr>
               </tfoot> -->
				</table>
			</div>


			<div class="table-wrapper"
				style="width: 46%; float: right; margin-right: 40px;">
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
<<<<<<< HEAD
				</table>
			</div>
		</div>

		<div style="width: 16%; margin: 0 auto; margin-bottom: 20px;">
			<a href="#one" class="button next scrolly">ÄÚÀÎ º° »ó¼¼º¸±â</a>
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
						<p>ÀÌ´õ¸®¿ò</p>
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
						<p>ºñÆ®ÄÚÀÎ</p>
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
						<p>´ë½¬ÄÚÀÎ</p>
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
						<p>¶óÀÌÆ®ÄÚÀÎ</p>
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
						<p>ÀÌ´õ¸®¿ò Å¬·¡½Ä</p>
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
						<p>¸®ÇÃ</p>
					</header>
				</article>
			</section>
=======
            </table>
         </div>
      </div>
      
      <div style="width:16%; margin:0 auto; margin-bottom:20px;"><a href="#one" class="button next scrolly">ì½”ì¸ ë³„ ìƒì„¸ë³´ê¸°</a></div>
      
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
                  <p>ì´ë”ë¦¬ì›€</p>
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
                  <p>ë¹„íŠ¸ì½”ì¸</p>
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
                  <p>ëŒ€ì‰¬ì½”ì¸</p>
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
                  <p>ë¼ì´íŠ¸ì½”ì¸</p>
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
                  <p>ì´ë”ë¦¬ì›€ í´ë˜ì‹</p>
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
                  <p>ë¦¬í”Œ</p>
               </header>
            </article>
         </section>
>>>>>>> 99c4ccb0865c02c02c4a276eeac6a5b0c1ffdf0c

		</div>


<<<<<<< HEAD
		<!-- Footer -->
		<footer id="footer">
			<div class="inner"
				style="padding: 10px !important; text-align: center; width: 60%;">
				<br>
				<ul class="copyright">
					<li>¨Ï 2017. kData coInsight Team all rights reserved.</li>
				</ul>
			</div>
		</footer>
=======
      <!-- Footer -->
      <footer id="footer">
         <div class="inner"
            style="padding: 10px !important; text-align: center; width: 60%;">
            <br>
            <ul class="copyright">
               <li>â“’ 2017. kData coInsight Team all rights reserved.</li>
            </ul>
         </div>
      </footer>
>>>>>>> 99c4ccb0865c02c02c4a276eeac6a5b0c1ffdf0c

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