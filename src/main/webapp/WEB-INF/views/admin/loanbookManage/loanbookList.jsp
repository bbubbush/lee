<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body{
	width:90%;
}
table>tbody>tr>td{
	font-size: 120%;
}
</style>
</head>
<body>

<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약자 관리</h4>
        </div>
        <div class="modal-body">
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
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9" >
		<h2>대출중인 도서 리스트</h2>
		
		
		<form name="loanList">
		<table id="t1" class="table">
		<thead>
			<tr>
				<td>구분</td>
				<th>도서코드</th>
				<th>도서명</th>
				<th>대출자</th>
				<th>대출일</th>
				<th>반납예정일</th>
				<th>연장횟수</th>
				<th>반납여부</th>
				<th>예약자 수</th>
				<th>예약자 관리</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="8" align="center">
						등록된 도서가 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td><input type="checkbox" name="cb" id="cb" value="${dto.mem_id}"><input type="hidden" name="mem_id" value="${dto.mem_id}"></td>
					<td>${dto.book_idx}<input type="hidden" id="bk_isbn" value="${dto.bk_isbn}"></td>
					<td>${dto.bk_subject}</td>
					<td>${dto.mem_name}</td>
					<td>${dto.lb_sday}</td>
					<td>${dto.lb_eday}</td>
					<td>${dto.lb_delay}</td>
					<td>${dto.lb_returnStr}</td>
					<td>${dto.bk_yeyak}</td>
					<td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="modalOpen('${dto.bk_isbn}')" id="yeyakInfo">정보 확인</button></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>	
		<input type="button" value="메일보내기" onclick="mailSend('${dto.mem_id}')">
		</form>
		
		<hr>
		<h2>반납 도서 리스트</h2>
		<table class="table">
		<thead>
			<tr>
				<th>도서코드</th>
				<th>도서명</th>
				<th>대출자</th>
				<th>대출일</th>
				<th>반납일</th>
				<th>연장횟수</th>
				<th>반납여부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list2}">
				<tr>
					<td colspan="7" align="center">
						대출 완료된 도서가 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list2}">
				<tr>
					<td>${dto.book_idx}<input type="hidden" name="mem_id" value="${dto.mem_id}"></td>
					<td>${dto.bk_subject}</td>
					<td>${dto.mem_name}</td>
					<td>${dto.lb_sday}</td>
					<td>${dto.lb_eday}</td>
					<td>${dto.lb_delay}</td>
					<td>${dto.lb_returnStr}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</div>
	</div>
<script>
$("#loanList").addClass('open').children('ul').show();
function modalOpen(k){
	var params = new Object();
	params.bk_isbn = k;
	$.ajax({
		type : "POST",
		url : "yeyakList.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
	})
}

function mailSend(i){
	
	var cb = $('input[name=cb]');
	var len = cb.length;
	var cbVal = '';
	var cbCnt = 0;
	var cbLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0; 

	for(var i=0; i<len; i++){
		if(cb[i].checked == true){
			cbCnt++;        //체크된 체크박스의 개수
			cbLast = i;     //체크된 체크박스의 인덱스
		}
	} 

	for(var i=0; i<len; i++){

		if(cb[i].checked == true){  //체크가 되어있는 값 구분

			cbVal = cb[i].value;
		
			if(cbCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
				rowid += cbVal;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
			}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == cbLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
					rowid += cbVal;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
					rowid += cbVal+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}				
			}
			cnt++;
			cbRow = '';    //checkRow초기화.
		}
	}
	alert(rowid);
	/* var cb = document.getElementById('cb').value; */
	location.href="mailSend.ju?mem_id="+rowid; 
}
</script>
</body>
</html>