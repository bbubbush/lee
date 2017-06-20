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
table>thead>tr>th{
	font-size: 140%;
	text-align: center;
}
table>tbody>tr>td{
	font-size: 120%;
}
</style>
</head>
<body id="lbBody">

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
	
	<div class="col-md-9" align="center">
		<h2>대출중인 도서 리스트</h2>
		<span style="margin-left:82em">
		<select name="lb_tag" id="lb_tag">
			<option>====선택====</option>
			<option value="0">가까운 반납일 순</option>
			<option value="1">일반대출만</option>
			<option value="2">택배대출만</option>
		</select>
		</span>
		
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
				<th>대출종류</th>
				<th>예약자 수</th>
				<th>예약자 관리</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="9" align="center">
						등록된 도서가 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center"><input type="checkbox" name="cb" id="cb" value="${dto.mem_id}"><input type="hidden" name="mem_id" value="${dto.mem_id}"></td>
					<td align="center">${dto.book_idx}<input type="hidden" id="bk_isbn" value="${dto.bk_isbn}"></td>
					<td><a href="bookInfo.ju?bk_idx=${dto.book_idx}">${dto.bk_subject} (${dto.bk_small})</a></td>
					<td align="center">${dto.mem_name}</td>
					<td align="center">${dto.lb_sday}</td>
					<td align="center">${dto.lb_eday}</td>
					<td align="center">${dto.lb_returnStr}</td>
					<td align="center">${dto.bk_yeyak}</td>
					<td align="center"><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="modalOpen('${dto.bk_isbn}')" id="yeyakInfo">정보 확인</button></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot align="center">
			<tr>
				<td colspan="9">
				<nav>
				  <ul class="pagination">
				    <li>
				    ${pageStr}
				    <li>
				  </ul>
				</nav>
				</td>
			</tr>
		</tfoot>
		</table>	
		<input type="button" value="메일보내기" onclick="mailSend('${dto.mem_id}')" class="btn btn-primary btn-lg">
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
					<td align="center">${dto.book_idx}<input type="hidden" name="mem_id" value="${dto.mem_id}"></td>
					<td><a href="bookInfo.ju?bk_idx=${dto.book_idx}">${dto.bk_subject} (${dto.bk_small})</a></td>
					<td align="center">${dto.mem_name}</td>
					<td align="center">${dto.lb_sday}</td>
					<td align="center">${dto.lb_eday}</td>
					<td align="center">${dto.lb_returnStr}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot align="center">
			<tr>
				<td colspan="7">
				<nav>
				  <ul class="pagination">
				    <li>
				    ${pageStr2}
				    </li>
				  </ul>
				</nav>
				</td>
			</tr>
		</tfoot>
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

$(document).on('change','#lb_tag',function() {
	var params = new Object();
	params.tagNum = document.getElementById('lb_tag').value;
	$.ajax({
		type : "GET",
		url : "loanBookSelList.ju",
		data : params,
		success : function(args) {
			document.getElementById("lbBody").innerHTML = args;
		}
	});
});

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