<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서전체 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<style>
body{
	width:90%;
}
table>thead>tr>th{
	font-size: 140%;
	text-align: center;
}
table>tbody>tr>td{
	font-size: 113%;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>

<body id="bookListBody">
<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9" align="center">
		<h2>도서관리 페이지</h2>
		<span style="margin-left:82em">
		<select name="bk_tag" id="bk_tag">
			<option>====선택====</option>
			<option value="0">등록순</option>
			<option value="1">출간일 오름차순</option>
			<option value="2">출간일 내림차순</option>
		</select>
		</span>
		
		<form name="listForm">
		<table cellspacing="0" class="table table-hover">
		<thead>
			<tr>
				<th width="5%">표지</th>
				<th width="13%">도서코드</th>
				<th width="35%">도서명</th>
				<th width="17%">저자명</th>
				<th width="12%">출판사</th>
				<th width="9%">출간일</th>
				<th width="9%">파손상태</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
					<tr>
						<td colspan="7" align="center">
							등록된 도서가 없습니다.
						</td>
					</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td><img src="${dto.bk_url}" width="50px" height="50x"></td>
					<td align="center">${dto.bk_idx}</td>
					<td><a href="bookInfo.ju?bk_idx=${dto.bk_idx}">${dto.bk_subject} (${dto.bk_small})</a></td>
					<td>${dto.bk_writer}</td>
					<td>${dto.bk_publisher}</td>
					<td align="center">${dto.bk_writedate}</td>
					<td id="bk_break" align="center">${dto.bk_breakStr}
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot align="center">
			<tr>
				<td colspan="7">
				<nav>
				  <ul class="pagination">
				    <li>
				    ${pageStr}
				    </li>
				  </ul>
				</nav>
				</td>
			</tr>
		</tfoot>
		</table>
		<input type="button" value="도서등록" onclick="bookAddForm()" class="btn btn-default btn-lg">
		</form>
		<span id="tagBookTable"></span>
	</div>
</div>




<script>
$("#bkList").addClass('open').children('ul').show();
$("#bkList2").addClass('open').children('ul').show();

$(document).on('change','#bk_tag',function() {
	var params = new Object();
	params.tagNum = document.getElementById('bk_tag').value;
	$.ajax({
		type : "GET",
		url : "bookSelList.ju",
		data : params,
		success : function(args) {
			document.getElementById("bookListBody").innerHTML = args;
		}
	});
});
function bookAddForm(){
	location.href="bookAdd.ju";
}

</script>
</body>
</html>