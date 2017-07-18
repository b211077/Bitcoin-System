<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TEST</title>
</head>
<body>

테스트 <br>

   
   <div id="dataView"></div>
   <button onclick="getHistoryData()">test</button>      <!-- 자동으로 바꿀수있음 -->
   <button onclick="myFun()">전송</button>
   <script type="text/javascript" src="scripts/jquery-3.1.1.js"></script>
   <script type="text/javascript">
      var data = new Array();
   	
      function getHistoryData() {
         $.ajax({
            /*url : "https://poloniex.com/public?command=returnTicker",*/
            url : "https://poloniex.com/public?command=returnChartData&currencyPair=BTC_XMR&start=1405699200&end=9999999999&period=14400",
            method : "post",
            dataType : "html",
            success : function(result) {
               var jsonData = JSON.parse(result);
               var close = "";
               var volume = "";
               for (var i = 0; i < jsonData.length; i++){
                  data[i] =timeConverter(jsonData[i].date)+"/"+jsonData[i].close+"/"+jsonData[i].volume+"/"+"1";
                   console.log(data);
               }
            }
         });
      }
      
      function myFun(){
  		$.ajax({
  			url : "coin",
  			data : {
  				command: "btcInsert",
  				array: data,
  				},
  			method : "post",
  			dataType: "html",
  			success : function(result) {
				alert("전송성공");  			
			}
  		});
  	}
      

      
      function timeConverter(UNIX_timestamp){
           var a = new Date(UNIX_timestamp * 1000);
           var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
           var year = a.getFullYear();
           var month = months[a.getMonth()];
           var date = a.getDate();
           var hour = a.getHours();
           var min = a.getMinutes();
           var sec = a.getSeconds();
           var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
           return time;
         }
   </script>

</body>
</html>