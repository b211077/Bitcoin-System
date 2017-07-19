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
/*  * {font-family:'BM HANNA','����ǹ��� �ѳ� ' !important, sans-serif; } */
</style>
<body>

   <!-- Wrapper -->
   <div id="wrapper">
      <!-- �ǽð� ���� �� �޾ƿ��� ���� -->
      <!-- <div id="BTC"></div> -->
      <script type="text/javascript">
               var btc_c;
               var eth_c;
               var dash_c;
               var ltc_c;
               var etc_c;
               var xrp_c;
               var btc_c1;
               var eth_c1;
               var dash_c1;
               var ltc_c1;
               var etc_c1;
               var xrp_c1;
               var pbtc_c
               var peth_c;
               var pdash_c;
               var pltc_c;
               var petc_c;
               var pxrp_c;
               var obj;
               var tempval;

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
                  $("#BTC").text(btc_c);
                  $("#ETH").text(eth_c);
                  $("#DASH").text(dash_c);
                  $("#LTC").text(ltc_c);
                  $("#ETC").text(etc_c);
                  $("#XRP").text(xrp_c);
                    
                  }
               }
            });
         }
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
                     $("#PBTC").text(pbtc_c);
                     $("#PETH").text(peth_c);
                     $("#PDASH").text(pdash_c);
                     $("#PLTC").text(pltc_c);
                     $("#PETC").text(petc_c);
                     $("#PXRP").text(pxrp_c);
                     
                     if(btc_c>pbtc_c){
                     tempval = (btc_c - pbtc_c)/btc_c*100;
                     $("#BTC_p").text(tempval.toFixed(2) + "%"+ "    (bithumb ��)");   
                     }
                     else{
                     tempval = (pbtc_c-btc_c)/btc_c*100;
                     $("#BTC_p").text(tempval.toFixed(2) + "%"+ "   (poloniex ��)");
                     }
                     if(eth_c>peth_c){
                     tempval = (eth_c - peth_c)/eth_c*100;
                     $("#ETH_p").text(tempval.toFixed(2) + "%"+ "    (bithumb ��)");   
                     }
                     else{
                     tempval = (peth_c-eth_c)/eth_c*100;
                     $("#ETH_p").text(tempval.toFixed(2) + "%"+ "   (poloniex ��)");
                     }
                     if(dash_c>pdash_c){
                     tempval = (dash_c - pdash_c)/dash_c*100;
                     $("#DASH_p").text(tempval.toFixed(2) + "%"+ "    (bithumb ��)");   
                     }
                     else{
                     tempval = (pdash_c-dash_c)/dash_c*100;
                     $("#DASH_p").text(tempval.toFixed(2) + "%"+ "   (poloniex ��)");
                     }
                     if(ltc_c>pltc_c){
                     tempval = (ltc_c - pltc_c)/ltc_c*100;
                     $("#LTC_p").text(tempval.toFixed(2) + "%"+ "    (bithumb ��)");   
                     }
                     else{
                     tempval = (pltc_c-ltc_c)/ltc_c*100;
                     $("#LTC_p").text(tempval.toFixed(2) + "%"+ "   (poloniex ��)");
                     }
                     if(etc_c>petc_c){
                   	 tempval = (etc_c - petc_c)/etc_c*100;
                     $("#ETC_p").text(tempval.toFixed(2) + "%"+ "    (bithumb ��)");   
                     }
                     else{
                     tempval = (petc_c-etc_c)/etc_c*100;
                     $("#ETC_p").text(tempval.toFixed(2) + "%"+ "   (poloniex ��)");
                     }
                     if(xrp_c>pxrp_c){
                     tempval = (xrp_c - pxrp_c)/xrp_c*100;
                     $("#XRP_p").text(tempval.toFixed(2) + "%"+ "    (bithumb ��)");   
                     }
                     else{
                     tempval = (pxrp_c-xrp_c)/xrp_c*100;
                     $("#XRP_p").text(tempval.toFixed(2) + "%"+ "   (poloniex ��)");
                     } 
                  }
               });
            }
            function delayfunc(){
               pbtc_c1=pbtc_c;
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

      <!-- Banner -->
      <section id="banner" class="major" style="height: 740px;">
         <div class="inner">
            <header class="major">
               <h1>
                  <!--   �ȳ��ϼ���, <strong>coINsight</strong>�Դϴ�. -->
                  <img src="images/anigif.gif">
               </h1>
            </header>
            <div class="content">
               <p>
                  coINsight�� coin(����) + sight(�þ�)�� ���� �Ļ��� �ܾ�μ�, <br> ���Ҿ� co(�Բ�)
                  + insight(������) �̶�� ���� ������ �ֽ��ϴ�.<br> coINsight�� ����ȭ���� �پ��� ����
                  ��, �׸��� �ŷ��� �� �ü� �񱳸� �� ���� ���� �׷��� ��Ʈ�� �����մϴ�.<br> ���� ����ڰ� ������
                  ����ȭ���� ���� �ü��� ���Ͽ� ���ͷ��� ����ϴ� ����� �߰��� �����մϴ�.<br> coINsight�� �Բ�
                  ����ȭ�� �ŷ����� ���� �پ ���������� ���� ���� â���� �����غ�����. �ѱ�<br>
               </p>

               <ul class="actions">
                  <li><a href="#hihi" class="button next scrolly">�����ϱ�</a></li>
               </ul>
            </div>
         </div>
      </section>

      <div id="hihi" style="height: 600px">
         <!-- Table -->

         <div style="width: 10%; margin: 0 auto;">
            <!-- <button
               style="width: 100%; height: 50px; background-color: white; color: navy;">
               <i class="fa fa-refresh" style="font-size: 24px"></i> ���ΰ�ħ
            </button> -->
         </div>

         <div class="table-wrapper"
            style="width: 35%; float: left; margin-left: 40px;">
            <a href="https://www.bithumb.com/" class="logo"><img
               src="images/logo_bithumb.png" width="240" height="66" /></a> <br>
            <br>
            <table class="alt">
               <thead>
                  <tr>
                     <th>Coin</th>
                     <th>Price(��ȭ: KRW)</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><strong>��Ʈ����(BTC)</strong></td>
                     <td><div id="BTC">�ε����Դϴ�.</div></td>
                  </tr>
                  <tr>
                     <td><strong>�̴�����(ETH)</strong></td>
                     <td><div id="ETH">�ε����Դϴ�.</div></td>
                  </tr>
                  <tr>
                     <td><strong>�뽬 ����(DASH)</strong></td>
                     <td><div id="DASH">�ε����Դϴ�.</div></td>
                  </tr>
                  <tr>
                     <td><strong>����Ʈ ����(LTC)</strong></td>
                     <td><div id="LTC">�ε����Դϴ�.</div></td>
                  </tr>
                  <tr>
                     <td><strong>�̴����� Ŭ����(ETC)</strong></td>
                     <td><div id="ETC">�ε����Դϴ�.</div></td>
                  </tr>
                  <tr>
                     <td><strong>����(XRP)</strong></td>
                     <td><div id="XRP">�ε����Դϴ�.</div></td>
                  </tr>
               </tbody>
            </table>
         </div>

         <div class="table-wrapper"   style="width: 20%; float: left; margin:0 35px;">
            <h2 style="margin-bottom:50px;"> Bithumb : Poloniex </h2>
            <table class="alt">
               <thead>
                  <th><strong>bithumb ��� poloniex �ü�����(%)</strong></th>
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


         <div class="table-wrapper"
            style="width: 35%; float: right; margin-right: 40px;">
            <a href="https://poloniex.com/" class="logo"><img
               src="images/poloniex.png" width="250" height="40"
               style="margin-top: 24px;" /></a> <br> <br>
            <table class="alt">
               <thead>
                  <tr>
                     <th>Coin</th>
                     <th>Price(��ȭ: KRW)</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>��Ʈ����(BTC)</td>
                     <td><div id="PBTC"></div></td>
                  </tr>
                  <tr>
                     <td>�̴�����(ETH)</td>
                     <td><div id="PETH"></div></td>
                  </tr>
                  <tr>
                     <td>�뽬 ����(DASH)</td>
                     <td><div id="PDASH"></div></td>
                  </tr>
                  <tr>
                     <td>����Ʈ ����(LTC)</td>
                     <td><div id="PLTC"></div></td>
                  </tr>
                  <tr>
                     <td>�̴����� Ŭ����(ETC)</td>
                     <td><div id="PETC"></div></td>
                  </tr>
                  <tr>
                     <td>����(XRP)</td>
                     <td><div id="PXRP"></div></td>
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
         <a href="#one" class="button next scrolly">���� �� �󼼺���</a>
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
                  <p>�̴�����</p>
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
                  <p>��Ʈ����</p>
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
                  <p>�뽬����</p>
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
                  <p>����Ʈ����</p>
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
                  <p>�̴����� Ŭ����</p>
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
                  <p>����</p>
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
               <li>�� 2017. kData coInsight Team all rights reserved.</li>
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