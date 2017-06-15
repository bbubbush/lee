<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="dto" value="${dto}"></c:set>
<h3>${dto.mem_name}님 회원정보</h3>

<form name="fedexForm">
<table>
	<tr>
		<th>회원코드</th>
		<td colspan="3">${dto.mem_idx}<input type="hidden" id="mem_idx" value="${dto.mem_idx}"></td>
	</tr>
	<tr>
		<th>회원ID</th>
		<td>${dto.mem_id}<input type="hidden" id="mem_name" value="${dto.mem_name}"></td>
		<th>성별</th>
		<td><span id="mem_birth"></span></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${dto.mem_hp}<input type="hidden" id="mem_hp" value="${dto.mem_hp}"></td>
		<th>관심사</th>
		<td>${dto.mem_like}<input type="hidden" id="fedex_idx" value="${fedex_idx}"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">${dto.mem_addr}<input type="hidden" id="mem_addr" value="${dto.mem_addr}"></td>
	</tr>
</table>
<h2>도서정보</h2>
<c:set var="dto2" value="${dto2}"></c:set>
<table>
	<tr>
		<td rowspan="6"><img src="${dto2.bk_url}" width="300px"></td>
		<th>도서코드</th>
		<td>${dto2.bk_idx}<input type="hidden" id="bk_idx" value="${dto2.bk_idx}"></td>
	</tr>
	<tr>
		<th>도서명</th>
		<td>${dto2.bk_subject}<input type="hidden" id="bk_idx" value="${dto2.bk_subject}"></td>
	</tr>
	<tr>
		<th>저자명</th>
		<td>${dto2.bk_writer}</td>
	</tr>
	<tr>
		<th>출판사명</th>
		<td>${dto2.bk_publisher}</td>
	</tr>
	<tr>
		<th>출판일</th>
		<td>${dto2.bk_writedate}</td>
	</tr>
</table>
<table>
	<tr>
		<th>설명</th>
		<td>${dto2.bk_info}</td>
	</tr>
</table>
<button type="button" class="btn btn-success" id="fedexGo">Fedex</button>
</form>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
	$("#fedexGo").click(function() {
		var params = new Object();
		params.mem_idx = document.getElementById("mem_idx").value;
		params.bk_idx = document.getElementById("bk_idx").value;
		params.fedex_idx = document.getElementById("fedex_idx").value;
		$.ajax({
			type : "GET",
			url : "fedexCheckOut.ju",
			data : params,
			success : function(args) {
				location.href="fedexList.ju"
			}
		});
	});
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
</script>
</body>
</html>