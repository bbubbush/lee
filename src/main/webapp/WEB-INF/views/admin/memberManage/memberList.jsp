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
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<body id="memList">
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
						<td align="center">${dto.mem_idx}</td>
						<td><a href="memberInfo.ju?mem_idx=${dto.mem_idx}">${dto.mem_name}</a></td>
						<td align="center">${dto.mem_birth}</td>
						<td>${dto.mem_id}</td>
						<td align="center">${dto.mem_hp}</td>
						<td>${dto.mem_addr}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot align="center">
			<tr>
				<td colspan="6">
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
			<div class="row">
			<div class="col-md-4"></div>
				<form name="memSearch">
				<div class="col-md-4 input-group">
					
				<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="mem_name">
					<span class="input-group-btn">
						<input type="button" class="btn btn-default" type="button" id="mem_search" value="검색">
					</span>
					</div>
				</form>
				
			</div>
			
			
		</div>
	</div>
</body>
<script>
$("#memberList").addClass('open').children('ul').show();
$("#memberList2").addClass('open').children('ul').show();
 $(document).on('click','#mem_search',function() {
	var params = new Object();
	params.mem_name = document.getElementById('mem_name').value;
	$.ajax({
		type : "GET",
		url : "memberSearchList.ju",
		data : params,
		success : function(args) {
			document.getElementById("memList").innerHTML=args;
		}
	});
});
/* $(document).on('click','#mem_search',function() {
	mem_name = document.getElementById('mem_name').value;
	$.ajax({
		type : "POST",
		url : "memberList.ju",
		data : mem_name,
		dataType : "json",
		success : function(data) {
			var memArr = data.memArr;
			alert(memArr);
			var intoHTML="";
			if(memArr.length==0){
				intoHTML='<div class="alert alert-warning text-center" role="alert">검색 결과가 없습니다.</div>';
			}
			for(var i=0; i<memArr.length; i++){
				intoHTML+='<div class="col-md-9">';
				intoHTML+=' <h2>회원 전체 리스트</h2>';
				intpHTML+='	 <c:set var="dto" value="${dto}"/>';
				intpHTML+='	  <table cellspacing="1" class="table table-hover" width="1000px">';
				intpHTML+='		<thead>';
				intpHTML+='		<tr>';
				intpHTML+='			<th width="14%">회원번호</th>';
				intpHTML+='			<th width="8%">회원이름</th>';
				intpHTML+='			<th width="8%">생년월일</th>';
				intpHTML+='			<th width="15%">ID</th>';
				intpHTML+='			<th width="15%">연락처</th>';
				intpHTML+='			<th width="40%">주소</th>';
				intpHTML+='		</tr>';
				intpHTML+='		</thead>';
				intpHTML+='	<tbody>';
				intpHTML+='<c:if test="${empty list}">';
				intpHTML+='<tr>';
				intpHTML+='<td colspan="6" align="center">';
				intpHTML+='등록된 회원이 없습니다.';
				intpHTML+='</td>';
				intpHTML+='</tr>';
				intpHTML+='</c:if>';
				intpHTML+='<c:forEach var="dto" items="${list}">';
				intpHTML+='<tr>';
				intpHTML+='<td>${dto.mem_idx}</td>';
				intpHTML+='<td><a href="memberInfo.ju?mem_idx=${dto.mem_idx}">${dto.mem_name}</a></td>';
				intpHTML+='<td>${dto.mem_birth}</td>';
				intpHTML+='<td>${dto.mem_id}</td>';
				intpHTML+='<td>${dto.mem_hp}</td>';
				intpHTML+='<td>${dto.mem_addr}</td>';
				intpHTML+='</tr>';
				intpHTML+='</c:forEach>';
				intpHTML+='</tbody>';
				intpHTML+='<tfoot align="center">';
				intpHTML+='<tr>';
				intpHTML+='<td colspan="6">';
				intpHTML+='<nav>';
				intpHTML+='<ul class="pagination">';
				intpHTML+='<li>';
				intpHTML+='<a href="#" aria-label="Previous">';
				intpHTML+='<span aria-hidden="true">&laquo;</span>';
				intpHTML+=' </a>';
				intpHTML+='</li>';
				intpHTML+='yo';
				intpHTML+='<li>';
				intpHTML+='<a href="#" aria-label="Next">';
				intpHTML+='<span aria-hidden="true">&raquo;</span>';
				intpHTML+='</a>';
				intpHTML+='</li>';
				intpHTML+='</ul>';
				intpHTML+='</nav>';
				intpHTML+='</td>';
				intpHTML+='</tr>';
				intpHTML+='</tfoot>';
				intpHTML+='</table>';
				intpHTML+='<div class="row">';
				intpHTML+='<div class="col-md-4"></div>';
				intpHTML+='<form name="memSearch">';
				intpHTML+='<div class="col-md-4 input-group">';
				intpHTML+='<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="mem_name">';
				intpHTML+='<span class="input-group-btn">';
				intpHTML+='<input type="button" class="btn btn-default" type="button" id="mem_search" value="검색">';
				intpHTML+='</span>';
				intpHTML+='</div>';
				intpHTML+='</form>';
				intpHTML+='</div>';
				intpHTML+='</div>';
				intpHTML+='</body>';
				intpHTML+='</div>';
				$("memList").html(intoHTML);
			}
		}
	});
}); */
</script>

</html>