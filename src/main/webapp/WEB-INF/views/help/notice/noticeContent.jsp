<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<jsp:include page="/WEB-INF/views/service/elibSide.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-7">
					<h2>공지사항 게시판</h2>
					<c:set var="dto" value="${dto}" />
				</div>
			</div>

			<div class="col-md-11">
				<table class="table table-condensed">
					<tr>
						<td><div class="col-md-8">제목 : ${dto.nt_subject}</div>
							<div class="col-md-4">작성자 : ${dto.mem_idx}</div></td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-4">작성일 : ${dto.nt_date}</div>
								<div class="col-md-4">조회수 : ${dto.nt_readnum}</div>
								<div class="col-md-2">
									<a href="noticeChange.ju?nt_idx=${dto.nt_idx}">글 수정</a>
								</div>
								<div class="col-md-2">
									<a href="noticeDelete.ju?nt_idx=${dto.nt_idx}">글 삭제</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-8">${dto.nt_content}</div>
							</div>
						</td>
					</tr>
				</table>

				<br> <br> <br>
				<form name="replyWrite" action="replyWriteOk.ju">
					<fieldset disabled>
						<table class="table table-striped table table-hover">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">댓글 쓰기</div>
									</div>
								</td>
								<td>
									<div class="col-md-9">
										<textarea rows="3" cols="70" placeholder="공지사항에 댓글을 작성할수 없습니다"></textarea>
									</div>
								<td colspan="2">
									<button type="submit" hidden="true">등록</button>
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
								<td><a href="replyChange.ju">수정</a></td>
								<td><a href="replyDelete.ju">삭제</a></td>
								<td colspan="2">
							</tr>
							<tr>
								<td colspan="3">△이전글 제목</td>
								<td>이전글 작성자</td>
							</tr>
							<tr>
								<td colspan="4">현재글 제목</td>
							</tr>
							<tr>
								<td colspan="3">▽다음글 제목</td>
								<td>다음글 작성자</td>
							</tr>
						</table>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
