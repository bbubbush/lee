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
    		<th>강의실</th>
    		<th>시작날짜</th>
    		<th>끝나는날짜</th>
    	</tr>
    </thead>
    <tbody>
    	<c:if test="${empty list}">
		<tr>
			<td colspan="8" align="center">
				등록된 수업이 없습니다.
			</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.sj_name}</td>
				<td>${dto.sj_loc}</td>
				<td>${dto.sj_sday}</td>
				<td>${dto.sj_eday}</td>
			</tr>
		</c:forEach>
    </tbody>
</table>
</body>
</html>