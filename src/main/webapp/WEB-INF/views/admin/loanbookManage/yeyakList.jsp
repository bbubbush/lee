<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="yeyakList">
<form name="yeList">
<table>
	<thead>
		<tr>
			<th>순번</th>
			<th>예약자</th>
			<th>예약날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					예약자가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.ye_sunbun}<input type="hidden" id="bk_isbn" value="${dto.bk_isbn}"></td>
				<td>${dto.mem_name}<input type="hidden" id="mem_idx" value="${dto.mem_idx}"></td>
				<td>${dto.ye_date}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<input type="button" value="순번정리" id="sunbunDel">
</form>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>

$(document).on('click','#sunbunDel',function() {
	alert('삭제누름');
	var params = new Object();
	params.mem_idx = document.getElementById('mem_idx').value;
	params.bk_isbn = document.getElementById('bk_isbn').value;
	$.ajax({
		type : "POST",
		url : "sunbunDel.ju",
		data : params,
		success : function(args) {
			document.getElementById("yeyakList").innerHTML = args;
		}
	});
});
</script>
</body>
</html>