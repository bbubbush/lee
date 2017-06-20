<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
	text-align: center;
}
table>tr>th{
	text-align: center;
}
</style>
<body>
<div align="center">
		<h2>선생님 등록하기 페이지</h2>
		<form name="teacherForm" action="learningTeacherAdd.ju" method="post">
			<table class="table">
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강사 이름</th>
					<td><input type="text" name="tc_name" required="required"></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생년 월일</th>
					<td><input type="text" name="tc_birth" required="required"></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강사 주소</th>
					<td><input type="text" name="tc_addr" required="required"></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강사 연락처</th>
					<td><input type="text" name="tc_hp" required="required"></td>
				</tr>
				<tr>
					<th><br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강사 소개</th>
					<td><textarea rows="10" cols="22" name="tc_sum" required="required"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="강사 등록" class="btn btn-success">
		</form>
</div>
</body>
</html>