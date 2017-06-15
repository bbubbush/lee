<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정지회원 리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/lee/resources/sideMenu/css/adminTable.css">
</head>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<style>
body{
	width: 90%;
}
table>tbody>tr>td{
	font-size: 150%;
}
</style>
<body id="memList">
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-7">
		<h2>회원 정지 리스트</h2>
		<c:set var="dto" value="${dto}"/>
		<table border="1" cellspacing="1" id="listtable">
			<thead>
				<tr>
					<th width="14%">회원번호</th>
					<th width="8%">회원이름</th>
					<th width="15%">ID</th>
					<th width="33%">정지사유</th>
					<th width="15%">정지일</th>
					<th width="15%">해제일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align="center">
							정지된 회원이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}"> 
					<tr>
						<td>${dto.mem_idx}</td>
						<td><a href="memberInfo.ju?mem_idx=${dto.mem_idx}">${dto.mem_name}</a></td>
						<td>${dto.mem_id}</td>
						<td>${dto.ban_str}</td>
						<td>${dto.ban_sday}</td>
						<td>${dto.ban_eday}</td>
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