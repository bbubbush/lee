<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<table class="table">
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
					<td align="center">${dto.mem_name}</td>
					<td align="center">${dto.mem_birth}</td>
					<td>${dto.mem_id}</td>
					<td align="center">${dto.mem_hp}</td>
				</tr>
			</c:forEach>
	    </tbody>
	</table>
	<div align="center">
	<input type="button" value="수업 삭제" class="btn btn-danger" onclick="classDel('${sub_idx}')">
	</div>
	<script>
	function classDel(i){
		location.href="classDel.ju?sj_idx="+i;
	}
	</script>
</body>
</html>