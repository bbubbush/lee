<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<style type="text/css">
</style>

<script type="text/javascript"
	src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
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
					<h2>FAQ 게시판</h2>
					<c:set var="dto" value="${dto}"/>
				</div>
			</div>
			<div class="col-md-11">
				<table class="table table-condensed">
					<tr>
						<td><div class="col-md-8"> <strong> 제목 : ${dto.qu_subject}</strong></div>
							<div class="col-md-4">작성자 : ${dto.mem_idx}</div></td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-4">작성일 : ${dto.qu_date}</div>
								<div class="col-md-4">조회수 : ${dto.qu_readnum}</div>
								<c:if test="${chk}">
									<div class="col-md-2">
										<a href="questChange.ju?qu_idx=${dto.qu_idx}">글 수정</a>
									</div>
									<div class="col-md-2">
										<a href="questDelete.ju?qu_idx=${dto.qu_idx}">글 삭제</a>
									</div>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-8"> <strong>${dto.qu_content}</strong> </div>
							</div>
						</td>
					</tr>
				</table>
				<table class="table table-striped table table-hover">
					<tr>
						<td>
							<div class="row">
								<div class="col-md-12">댓글 쓰기</div>
							</div>
						</td>
						<td>
							<div class="col-md-9">
								<textarea rows="3" cols="70" placeholder="댓글을 입력하세요"></textarea>
							</div>
						<td colspan="2">
							<button type="submit">등록</button>
						</td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-12">댓글 작성자</div>
							</div>
						</td>
						<td>
							<div class="col-md-9">댓글내용1</div>
						<td><a href="#">수정</a></td>
						<td><a href="#">삭제</a></td>
						<td colspan="2">
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
