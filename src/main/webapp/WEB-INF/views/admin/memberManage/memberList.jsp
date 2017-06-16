<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원전체 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<style>
body{
	width: 90%;
}
table>thead>tr>th{
	font-size: 140%;
	text-align: center;
}
table>tbody>tr>td{
	font-size: 120%;
}
</style>
<body id="memList">
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9">
		<h2>회원 전체 리스트</h2>
		<c:set var="dto" value="${dto}"/>
		<table cellspacing="1" class="table table-hover" width="1000px">
			<thead>
				<tr>
					<th width="14%">회원번호</th>
					<th width="8%">회원이름</th>
					<th width="8%">생년월일</th>
					<th width="15%">ID</th>
					<th width="15%">연락처</th>
					<th width="40%">주소</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align="center">
							등록된 회원이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}"> 
					<tr>
						<td>${dto.mem_idx}</td>
						<td><a href="memberInfo.ju?mem_idx=${dto.mem_idx}">${dto.mem_name}</a></td>
						<td>${dto.mem_birth}</td>
						<td>${dto.mem_id}</td>
						<td>${dto.mem_hp}</td>
						<td>${dto.mem_addr}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="6">
				<nav>
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    ${pageStr}
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				</td>
			</tr>
			</tfoot>
		</table>
		<form name="memSearch">
			<input type="text" id="mem_name">&nbsp;
			<input type="button" value="검색" id="mem_search">
		</form>
		</div>
	</div>
<script>
$("#memberList").addClass('open').children('ul').show();
$("#memberList2").addClass('open').children('ul').show();
$(document).on('click','#mem_search',function() {
	var params = new Object();
	params.mem_name = document.getElementById('mem_name').value;
	$.ajax({
		type : "POST",
		url : "memberList.ju",
		data : params,
		success : function(args) {
			document.getElementById("memList").innerHTML=args;
		}
	});
});
</script>
</body>
</html>