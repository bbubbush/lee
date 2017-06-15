<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">수강신청 현황</h4>
        </div>
        <div class="modal-body">
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>

<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9" >

		<h2>수업 리스트</h2>
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="learningList.ju"
				aria-controls="home" role="tab" data-toggle="tab">수업 리스트</a></li>
			<li role="presentation"><a href="learningTeacherList.ju"
				aria-controls="profile" role="tab" data-toggle="tab">강사 리스트</a></li>
		</ul>
		<form name="classList" action="learningClassAdd.ju" method="get">
		<table>
		<thead>
			<tr>
				<th>수업명</th>
				<th>강사이름</th>
				<th>강의실</th>
				<th>개강날짜</th>
				<th>종강날짜</th>
				<th>시작시간</th>
				<th>끝나는시간</th>
				<th>수강인원</th>
				<th>수강인원 명단</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="9" align="center">
						등록된 강사가 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.sj_name}</td>
					<td>${dto.tc_name}</td>
					<td>${dto.sj_loc}</td>
					<td>${dto.sj_sday}</td>
					<td>${dto.sj_eday}</td>
					<td>${dto.sj_st}</td>
					<td>${dto.sj_et}</td>
					<td>${dto.sj_num} / ${dto.sj_max}</td>
					<td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="modalOpen('${dto.sj_idx}')">명단확인</button></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<input type="button" value="수업 등록" onclick="classAdd()">
		</form>
		</div>
	</div>
<script>
$("#learningList").addClass('open').children('ul').show();
$("#learningList2").addClass('open').children('ul').show();
function classAdd(){
	location.href="learningClassAdd.ju";
}

function modalOpen(idx){
	var params = new Object();
	params.sj_idx = idx;
	$.ajax({
		type : "POST",
		url : "memberCheck.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
	})
}

</script>
</body>
</html>