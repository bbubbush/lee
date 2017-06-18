<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
</head>

<body>
	<div class="row">
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</div>
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/help/helpSide.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-7">
					<h2>책추천 및 감상평 게시판</h2>
<<<<<<< HEAD
=======
				</div>
				<div class="col-md-3" style="text-align: center;">
					<a class="btn btn-default" type="submit" href="reviewWrite.ju">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true">
							책신청, 감상평하기</span>
					</a>
>>>>>>> 7a5c6140c7e2cd754c632f04abd7e83b4f64aa42
				</div>
				<c:if test="${chk}">
					<div class="col-md-3" style="text-align: center;">
						<a class="btn btn-default" type="submit" href="reviewWrite.ju">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"> 글쓰기</span>
						</a>
					</div>
				</c:if>
			</div>
			<div class="row">
				<div class="col-md-10">
					<table class="table table-striped table table-hover" border="1">
						<thead>
							<tr>
								<th>분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:if test="${empty list}">
									<td colspan="6" align="left">등록된 글이 없습니다.</td>
								</c:if>
							</tr>
							<c:forEach var="dto" items="${list}">
								<tr>
<<<<<<< HEAD
									<c:choose>
										<c:when test="${dto.review_cate==0}">
											<td>책추천</td>
										</c:when>
										<c:when test="${dto.review_cate==1}">
											<td>감상평</td>
										</c:when>
									</c:choose>
									<td><a href="reviewContent.ju?review_idx=${dto.review_idx}">${dto.review_subject}</a></td>
=======
									<td>${dto.review_cate}</td>
									<td><a href="reviewContent.ju?qu_idx=${dto.review_idx}">${dto.review_subject}</a></td>
>>>>>>> 7a5c6140c7e2cd754c632f04abd7e83b4f64aa42
									<td>${dto.mem_idx}</td>
									<td>${dto.review_date}</td>
									<td>${dto.review_readnum}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
					<form action="reviewList.ju" id="frm">
							<div class="col-md-2">
								<select class="form-control" name="type">
									<option value="review_subject">전체</option>
									<option value="mem_idx">작성자</option>
									<option value="review_subject">제목</option>
								</select>
							</div>
							<div class="col-md-4 input-group">
								<input  type="text" class="form-control" placeholder="검색어를 입력하세요" name="query">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="submit()">Go!</button>
								</span>
							</div>
							<div class="col-md-12" style="text-align: center">
								<ul class="pagination pagination-sm">
									<c:choose>
										<c:when test="${page==1}">
												<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="reviewList.ju?page=${page-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:otherwise>
									</c:choose>
									<c:forEach begin="${startPage}" end="${endPage}" var="i">
										<c:choose>
											<c:when test="${i eq page}">
												<li class="active"><a href="reviewList.ju?page=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="reviewList.ju?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${page==endPage}">
												<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a>
											</c:when>
											<c:otherwise>
												<li><a href="reviewList.ju?page=${page+1}"><span class="glyphicon glyphicon-chevron-right"></span></a>
											</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<input type="hidden" name="page" value="${page}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function submit(){
		$('#frm').submit();
	}
	</script>
</body>
</html>