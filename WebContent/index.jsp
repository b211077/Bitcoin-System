<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
      /*  * {font-family:'BM HANNA','배달의민족 한나 ' !important, sans-serif; } */
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


            <!-- Menu -->
               <nav id="menu">
                  <ul class="links">
                     <li><a href="index.html">Home</a></li>
                     <li><a href="landing.html">Landing</a></li>
                     <li><a href="generic.html">Generic</a></li>
                     <li><a href="elements.html">Elements</a></li>
                  </ul>
                  <ul class="actions vertical">
                     <li><a href="#" class="button special fit">Get Started</a></li>
                     <li><a href="#" class="button fit">Log In</a></li>
                  </ul>
               </nav>

            <!-- Banner -->
               <section id="banner" class="major" style="height:740px;">
                  <div class="inner">
            <header class="major">
               <h1>
                  안녕하세요, <strong>coINsight</strong>입니다.
               </h1>
            </header>
            <div class="content">
               <p>
                  coINsight는 가상화페 시세 비교 조회 서비스를 제공합니다.<br> 
                  coINsight란 coin(코인)   + sight(시야)를 통해 파생된 단어로서, <br> 
                  더불어 co(함께) + insight(통찰력) 이라는 뜻을 가지고 있습니다.<br> 
                  coINsigh는 가상화폐의 다양한 종류 별, 그리고 거래소 별 시세 비교를 한 눈에 쉽게 그래프 차트로 제공합니다.<br> 
                  또한 사용자가 구매한 가상화폐의 현재 시세와 비교하여 수익률을 계산하는 기능을 추가로 제공합니다.<br> 
                  coINsight와 함께 가상화폐 거래에서 더욱 뛰어난 통찰력으로 높은 수익 창출을 경험해보세요. <br>
               </p>

               <ul class="actions">
                  <li><a href="#hihi" class="button next scrolly">시작하기</a></li>
               </ul>
            </div>
         </div>
               </section>

      <div id="hihi" style="height: 600px">
         <!-- Table -->

         <div style="width:10%; margin:0 auto;">
            <button style="width:100%; height:50px; background-color:white; color:navy;">
            <i class="fa fa-refresh" style="font-size:24px"></i> 새로고침</button>
         </div>
         
         <div class="table-wrapper" style="width:46%; float:left; margin-left:40px;">
            <img src="images/logo_bithumb.png" width="240" height="66" />
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
                  <tr>
                     <td colspan="2"></td>
                     <td>100.00</td>
                  </tr>
               </tfoot> -->
            </table>
         </div>

         
         <div class="table-wrapper" style="width:46%; float:right; margin-right:40px;">
         <img src="images/poloniex.png" width="250" height="40" style="margin-top:24px;"/>
         <br>
         <br>
            <table class="alt">
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
                  <tr>
                     <td colspan="2"></td>
                     <td>100.00</td>
                  </tr>
               </tfoot> -->
            </table>
         </div>
      </div>
      
      <div style="width:16%; margin:0 auto; margin-bottom:20px;"><a href="#one" class="button next scrolly">코인 별 상세보기</a></div>
      
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