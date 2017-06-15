<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
    	<tr>
    		<th>이름</th>
    		<th>생년월일</th>
    		<th>ID</th>
    		<th>연락처</th>
    	</tr>
    </thead>
    <tbody>
    	<c:if test="${empty list}">
		<tr>
			<td colspan="8" align="center">
				신청한 학생이 없습니다.
			</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.mem_name}</td>
				<td>${dto.mem_birth}</td>
				<td>${dto.mem_id}</td>
				<td>${dto.mem_hp}</td>
			</tr>
		</c:forEach>
    </tbody>
</table>
</body>
</html>