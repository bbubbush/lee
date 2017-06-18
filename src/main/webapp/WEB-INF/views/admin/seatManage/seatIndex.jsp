<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="rrdto" value="${sessionScope.rrdto }"/>
<c:set var="time" value="${sessionScope.checkTime }"/>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<style type="text/css">
.allGuide{
	width:80%;
	margin: 40px auto;
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
#loginButton{
	text-align: center;
	width:400px;
	height:180px;
	font-size: 400%;
	margin: 20px auto;
}
.loginButton{
	margin: 20px auto;
}
.loginbtndiv{
	text-align: center;
}
#conBarcode{
	font-size: 500%
}

.rradd,.rrreturn,.rrlogout{
	width:400px;
	height:180px;
	font-size: 400%;
}

.modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
}
  
.rrBbtn{
	width:400px;
	height:180px;
	font-size: 400%;
}
.rrSub{
	font-size: 400%
}
</style>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* 	$(document).ready(function(){
		$(".container>button").click(){
			$("#rrmem_idx").val("${normalMember}");
			$("#crmem_idx").val("${normalMember}");
		}
	}); */
</script>
</head>
<body>
	<div class="allGuide">
         <h2 style="text-align: center;">열람실 이용 시스템</h2><hr>
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
      
	<c:set var="sid" value="${sid }" />
	<c:choose>
		<c:when test="${empty normalMember }">
			<div class="loginButton">
			<div class="loginbtndiv">
				<button id="loginButton" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#seatLogin">로그인</button>
			</div>
			<form method="post" name="barcodeLogin" action="bigBarcodeLogin.ju">
				<!-- Modal -->
				<div class="modal fade" id="seatLogin" role="dialog">
					<div class="modal-dialog">
	
						<!-- Modal content-->
						<div class="modal-content" id="seat">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" id="modal-title">로그인</h4>
							</div>
							<div class="modal-body">
								<span class="glyphicon glyphicon-barcode" id="conBarcode"></span>
								<span>바코드를 찍어주세요.</span>
								<div id="bardiv" class="lgdiv">
									<input type="text" name="mem_idx">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success" id="login">로그인</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" onclick="javascript:location.reload();">닫기</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</c:when>
		<c:when test="${!empty normalMember }">
			<div class="bookingdiv">
				<c:if test="${rrdto eq null}">
					<div class="rrBook" style="float: left;">
						<%@include file="rrBook.jsp" %>
					</div>
					<div class="crBook" style="float: left;">
						<%@include file="crBook.jsp" %>
					</div>
				</c:if>
				<c:if test="${rrdto ne null }">
				<div class="userInfo" style="text-align: center;">
					<fieldset>
						<legend>현재 이용중인 좌석</legend>
						<label class="cate">이용중인 방 : 
						<c:choose>
							<c:when test="${rrdto.getRr_cate() eq 1 }">
								열람실1
							</c:when>
							<c:when test="${rrdto.getRr_cate() eq 2 }">
								열람실2
							</c:when>
							<c:when test="${rrdto.getRr_cate() eq 3 }">
								자료실
							</c:when>
						</c:choose>
						</label><br>
						<label class="seatno">이용 좌석번호 : ${rrdto.getRr_seatno() }</label><br>
						<label class="start">이용 시작시간 : ${time.startTime }</label><br>
						<label class="end">이용 마감시간 : ${time.endTime }</label><br>
						<label class="addTime"> 연장가능여부 : 
						<c:choose>
							<c:when test="${rrdto.getRr_add() eq '0' }">
								3번 가능
							</c:when>
							<c:when test="${rrdto.getRr_add() eq '1' }">
								2번 가능
							</c:when>
							<c:when test="${rrdto.getRr_add() eq '2' }">
								1번 가능
							</c:when>
							<c:when test="${rrdto.getRr_add() eq '불가' }">
								불가능
							</c:when>
							<c:otherwise>
								오류발생
							</c:otherwise>
						</c:choose>
						</label><br>
					</fieldset>
				</div>
				<span style="text-align: center; float: left;">
					<c:if test="${rrdto.getRr_add() ne '불가'}">
						<c:url var="bigadd" value="bigAdd.ju">
							<c:param name="rr_idx" value="${rrdto.getRr_idx() }"/>
							<c:param name="rr_add" value="${rrdto.getRr_add() }"/>
						</c:url>
						<button type="button" class="btn btn-success rradd" onclick="javascript:location.href='${bigadd}'">연장하기</button>
					</c:if>
					<c:url var="returnseat" value="returnSeat.ju">
						<c:param name="rr_idx" value="${rrdto.getRr_idx() }"/>
					</c:url>
					<button type="button" class="btn btn-danger rrreturn" onclick="javascript:location.href='${returnseat}'">반납하기</button>
				</span>
			</c:if>
			</div>
			<div style="text-align: center;float: left;">
				<button type="button" class="btn btn-info btn-lg rrlogout" onclick="javascript:location.href='/lee/seatLogout.ju'">로그아웃</button>
			</div>
		</c:when>
	</c:choose>
	
</body>
</html>