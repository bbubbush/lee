<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/lee/resources/sideMenu/sideScript.js"></script>
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<script type="text/javascript">
</script>
<style type="text/css">
@media ( min-width :769px) {
   #changeForm {
      width: 100%;
   }
   #submenulabel {
      width: 675px;
      height: 134px;
   }
}

@media ( max-width :1250px) {
	#cssmenu {
		width: 100%;
	}
	#changeForm {
		width: 100%;
	}
	#guideTable {
		width: 100%;
		height: 134px;
	}
	.bookingdiv{
		width: 100%;
		height: 120px;
	}
}
#guideTable>thead>tr>th{
   text-align: center;
   vertical-align: middle; 
}
#guideTable>tbody>tr>th{
   text-align: center;
   vertical-align: middle;
}
#guideTable>tbody>tr>td{
   text-align: center;
   vertical-align: middle;
}
ul{
	list-style: none;
}


</style>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<body>
<div class="row">
<div class="col-md-2">
<jsp:include page="/WEB-INF/views/big/sideMenu.jsp"></jsp:include>
</div>
<div class="col-md-10">
   <div class="bookingGuide col-md-10">
      <div class="allGuide">
         <h2>열람실 이용 시스템</h2>
         <table class="table table-bordered" id="guideTable">
            <thead>
               <tr>
                  <th style="width:20%">자료실</th>
                  <th style="width:25%">이용 시간</th>
                  <th style="width:35%">휴관일</th>
                  <th style="width:20%">기타 사항</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <th>일반 열람실</th>
                  <td class="info">07:00 ~ 23:00</td>
                  <td rowspan="3" class="danger">
                     - 매달 짝수 주 금요일<br>
                     - 법정 공휴일<br>
                     - 특별한 사유로 관장이 정한 경우<br>
                     &nbsp;&nbsp;(장서점검 및 시설유지 보수 등)                     
                  </td>
                  <td class="warning">
                     - 1회 2시간 이용<br>
                     - 당일 이용<br>
                     - 시간연장 3번 가능
                  </td>
               </tr>
               <tr>
                  <th>멀티미디어 자료실</th>
                  <td class="info">09:00 ~ 18:00</td>
                  <td class="warning">
                     - 1회 1시간 이용<br>
                     - 당일 이용<br>
                     - 시간연장 불가
                  </td>
               </tr>
               <tr>
                  <th>스터디룸</th>
                  <td class="info">09:00 ~ 21:00</td>
                  <td class="warning">
                     - 1일 1회 이용<br>
                     - 2주전부터 예약 가능<br>
                     - 시간연장 불가
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <div class="bookingdiv col-md-10">
      <div class="rrBook col-md-3">
         <%@include file="rrBook.jsp" %>
      </div>
      <div class="crBook col-md-3">
         <%@include file="crBook.jsp" %>
      </div>
      <div class="srBook container col-md-4">
         <h2>스터디룸 예약 이용</h2>
         <button type="button" class="glyphicon glyphicon-calendar btn btn-info btn-lg " onclick="javascript:location.href='/lee/srBook.ju';">&nbsp;예약하기</button>
      </div>
   </div>
</div>
</div>
</body>
</html>