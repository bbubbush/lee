<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminIndex</title>
<style>
table{
	width: 800px;
	height: 800px;
	text-align: center;
	margin: 0px auto;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<h2>- 관리자 페이지 -</h2>
<table>
	<tr>
		<td><a href="memberList.ju"><img src="resources/img/member.png" width="100px"><br>회원관리</a></td>
		<td><a href="bookList.ju"><img src="resources/img/book.png" width="100px"><br>일반도서관리</a></td>
		<td><a><img src="resources/img/ebook.png" width="100px"><br>전자도서관리</a></td>
	</tr>
	<tr>
		<td><a href="loanbookList.ju"><img src="resources/img/loan.png" width="100px"><br>대출도서관리</a></td>
		<td><a href="index.ju"><img src="resources/img/lib.png" width="100px"><br>도서관 메인으로</a></td>
		<td><a href="adminSeatManage.ju"><img src="resources/img/seat.png" width="100px"><br>자리예약관리</a></td>
	</tr>
	<tr>
		<td><a href="learningList.ju"><img src="resources/img/learn.png" width="100px"><br>수강관리</a></td>
		<td><a href="fedexList.ju"><img src="resources/img/fedex.png" width="100px"><br>택배대출관리</a></td>
		<td><a href="calendar.ju"><img src="resources/img/calendar.png" width="100px"><br>캘린더 관리</a></td>
	</tr>
</table>
</body>
</html>