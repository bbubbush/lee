<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
p{
	font-size : 130%;
	color : red; 
}
table th{
	text-align: center;
}
</style>
<body>
<c:set var="dto" value="${dto}"/>

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원 정지 기간 설정</h4>
        </div>
        <div class="modal-body">
         <form name="memberBan" method="get">
          	<input type="hidden" name="mem_idx" id="mem_idx" value="${dto.mem_idx}">
          	<select id="banDate" name="banDate" onChange="getSelectValue(this.form);">
          		<option value="no" selected="selected">정지사유 선택</option>
          		<option value="0">기물 파손으로 인한 정지</option>
          		<option value="1">분실으로 인한 정지</option>
          		<option value="2">지속적인 연체로 인한 정지</option>
          		<option value="3">도서관 풍기문란으로 인한 정지</option>
          		<option value="4">허위사실 유포로 인한 정지</option>
          		<option value="5">열람실 내 취식로 인한 정지</option>
          		<option value="6">모태솔로 특별 정지</option>
          	</select><br><br>
          	<span id="banSpan"></span><br><br>
	          	<script>
	          	function getSelectValue(){
					
	          		var selectArr = document.getElementById("banDate");
	          		reason = selectArr.options[selectArr.selectedIndex].value;
	          		
	          		switch(reason){
	          		case "0" : document.getElementById('banSpan').innerHTML = '정지일 : 5일 정지'; break;
	          		case "1" : document.getElementById('banSpan').innerHTML = '정지일 : 3일 정지'; break;
	          		case "2" : document.getElementById('banSpan').innerHTML = '정지일 : 7일 정지'; break;
	          		case "3" : document.getElementById('banSpan').innerHTML = '정지일 : 2일 정지'; break;
	          		case "4" : document.getElementById('banSpan').innerHTML = '정지일 : 1일 정지'; break;
	          		case "5" : document.getElementById('banSpan').innerHTML = '정지일 : 7일 정지'; break;
	          		case "6" : document.getElementById('banSpan').innerHTML = '정지일 : 10일 정지'; break;
	          		}
	          	}
	          	</script>
			<button type="button" class="btn btn-success" id="breaks" onclick="banGo()">정지</button>
		 </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>

<div class="row">
	<div class="col-md-3">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-8" >
	<h2>회원정보 페이지</h2>
		<h3>${dto.mem_name}님 회원정보</h3>
		<table class="table" style = width:800px;>
			<tr>
				<th>회원코드</th>
				<td colspan="3">${dto.mem_idx}</td>
			</tr>
			<tr>
				<th>회원ID</th>
				<td>${dto.mem_id}</td>
				<th>성별</th>
				<td><span id="mem_birth"></span></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.mem_hp}</td>
				<th>관심사</th>
				<td><span id="mem_like"></span></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="3">${dto.mem_addr}</td>
			</tr>
		</table>
		<br>
		<fieldset>
			<legend>${dto.mem_name}님 대출중인 책</legend>
			<form name="loanList">
				<table class="table" style = width:800px;>
				<thead>
					<tr>
						<th>도서코드</th>
						<th>도서명</th>
						<th>대출일</th>
						<th>반납예정일</th>
						<th>연장횟수</th>
						<th>반납여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="6" align="center">
								대출중인 도서가 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.book_idx}</td>
							<td>${dto.bk_subject}</td>
							<td>${dto.lb_sday}</td>
							<td>${dto.lb_eday}</td>
							<td>${dto.lb_delay}</td>
							<td>${dto.lb_returnStr}</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>	
				</form>
		</fieldset>
			<h3><span id="banDay"></span></h3><p>${count}회 정지</p><br>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="btBan" disabled="disabled">회원정지하기</button> &nbsp;
		<input type="button" class="btn btn-info btn-lg" data-toggle="modal" value="회원정지풀기" id="btUnBan" disabled="disabled" onclick="unban()"> &nbsp;
		<input type="button" value="회원강제탈퇴" onclick="memDel()">
		</div>
	</div>
<script>
$("#memberList").addClass('open').children('ul').show();
$("#memberList2").addClass('open').children('ul').show();

function memDel(){
	if(confirm('강제탈퇴 시키시겠습니까?')){
		var idx = document.getElementById('mem_idx').value;
		location.href="memDel.ju?mem_idx="+idx;
	}
}

var dayday = ${dto2.ban_day};
	if(dayday>0){
		document.getElementById('banDay').innerText = dayday+'일 정지된 회원입니다.';
		$("#banDay").css("color", "red");
		$("#btUnBan").attr("disabled", false);
	}else{
		document.getElementById('banDay').innerText = '정지된 회원이 아닙니다.'; 
		$("#banDay").css("color", "blue");
		$("#btBan").attr("disabled", false);
	}
	
function unban(){
	if(confirm('정지를 해제 하시겠습니까?')){
		var idx = document.getElementById('mem_idx').value;
		location.href="banDel.ju?mem_idx="+idx;
	}
}

function banGo(){
	var idx = document.getElementById('mem_idx').value;
	var day = document.getElementById('banDate').value;
	alert(day);
	
	if(day=="no"){
		alert('정지 이유를 선택해주세요');
	}else{
		switch(day){
			case "0" : var banGo = 5; break;
			case "1" : var banGo = 3; break;
			case "2" : var banGo = 7; break;
			case "3" : var banGo = 2; break;
			case "4" : var banGo = 1; break;
			case "5" : var banGo = 7; break;
			case "6" : var banGo = 10; break;
			}
		location.href="banAdd.ju?ban_period="+banGo+"&mem_idx="+idx+"&ban_reason="+reason;
	}
}

var birth = "${dto.mem_birth}";
var str = birth.substring(7);
switch (str) {
case "1":
	document.getElementById('mem_birth').innerText = '남';
	break;
case "2":
	document.getElementById('mem_birth').innerText = '여';
	break;
}

var like = "${dto.mem_like}";
switch(like){
case "0":
	document.getElementById('mem_like').innerText = '나의존재';
	break;
case "1":
	document.getElementById('mem_like').innerText = '삶과죽음';
	break;
case "2":
	document.getElementById('mem_like').innerText = '사회';
	break;
case "3":
	document.getElementById('mem_like').innerText = '과학';
	break;
case "4":
	document.getElementById('mem_like').innerText = '문화생활';
	break;
case "5":
	document.getElementById('mem_like').innerText = '지구촌';
	break;
case "6":
	document.getElementById('mem_like').innerText = '갈등';
	break;
case "7":
	document.getElementById('mem_like').innerText = '과거와 현재, 그리고 미래';
	break;
case "8":
	document.getElementById('mem_like').innerText = '새로배움';
	break;
}
</script>
</body>
</html>