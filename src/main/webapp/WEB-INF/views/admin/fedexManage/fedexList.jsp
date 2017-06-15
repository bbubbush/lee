<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
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
          <h4 class="modal-title">택배 대출 정보</h4>
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
	
	<div class="col-md-8" >
		<form name="fedex">
		<h2>택배대출 신청확인 페이지</h2>
			<table class="table">
			<thead>
				<tr>
					<th>신청자</th>
					<th>도서명</th>
					<th>택배요청지</th>
					<th>연락처</th>
					<th>대출확인</th>
				</tr>
			<thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">요청된 택배대출도서가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.mem_name}<input type="hidden" id="memIdx" value="${dto.mem_idx}"></td>
						<td>${dto.bk_subject}<input type="hidden" id="bkIdx" value="${dto.bk_idx}"></td>
						<td>${dto.mem_addr}<input type="hidden" id="fdIdx" value="${dto.fedex_idx}"></td>
						<td>${dto.mem_hp}</td>
						<td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="modalOpen('${dto.bk_idx}')" id="fedexInfo">정보 확인</button></td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</form>
		<hr>
		
			<h2>택배대출 완료 리스트</h2>
			<table class="table">
			<thead>
				<tr>
					<th>신청자</th>
					<th>도서명</th>
					<th>택배지</th>
					<th>연락처</th>
					<th>대출일</th>
					<th>반납예정일</th>
				</tr>
			<thead>
			<tbody>
				<c:if test="${empty list2}">
					<tr>
						<td colspan="6">보낸 택배대출도서가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto2" items="${list2}">
					<tr>
						<td>${dto2.mem_name}</td>
						<td>${dto2.bk_subject}</td>
						<td>${dto2.mem_addr}</td>
						<td>${dto2.mem_hp}</td>
						<td>${dto2.lb_sday}</td>
						<td>${dto2.lb_eday}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
<script>
function modalOpen(idx){
	var params = new Object();
	params.bk_idx = idx;
	params.mem_idx = document.getElementById("memIdx").value;
	params.fedex_idx = document.getElementById("fdIdx").value;
	$.ajax({
		type : "POST",
		url : "fedexInfo.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
	})
}

</script>
</body>
</html>