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
			<jsp:include page="/WEB-INF/views/help/helpSide.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-7">
					<h2>희망도서신청 게시판</h2>
					<c:set var="dto" value="${dto}" />
				</div>
			</div>

			<div class="col-md-11">
			<form action="orderbookReplyWrite.ju">
				<table class="table table-condensed">
					<tr>
						<td><div class="col-md-8">제목 : ${dto.orderbook_subject}</div>
							<div class="col-md-4">작성자 : ${dto.mem_idx}</div></td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-4">작성일 : ${dto.orderbook_date}</div>
								<div class="col-md-4">조회수 : ${dto.orderbook_readnum}</div>
								<c:if test="${chk}">
									<div class="col-md-2">
										<a href="orderbookChange.ju?orderbook_idx=${dto.orderbook_idx}">글 수정</a>
									</div>
									<div class="col-md-2">
										<a href="orderbookDelete.ju?orderbook_idx=${dto.orderbook_idx}">글 삭제</a>
									</div>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="row">
								<div class="col-md-8">${dto.orderbook_content}</div>
							</div>
						</td>
					</tr>
				</table>
				<br> <br> <br>

						<table class="table table-striped table table-hover">
						<c:if test="${!empty sessionScope.sid }">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">댓글 쓰기</div>
									</div>
								</td>
								<td>
									<div class="col-md-9">
										<textarea rows="3" cols="70" placeholder="댓글을 입력하세요" name="reply_content"></textarea>
									</div>
								<td colspan="2">
									<button type="submit">등록</button>
								</td>
							</tr>
							</c:if>
							<c:choose>
						<c:when test="${empty reply }">
						<tr>
							<td colspan="2">
								<div class="row">
									<div class="col-md-12">등록된 댓글이 없습니다</div>
								</div>
							</td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="re" items="${reply }">
						<tr>
							<td>
								<div class="row">
									<div class="col-md-12">${re.mem_idx}</div>
								</div>
							</td>
							<td>
								<div class="col-md-9">${re.reply_content}</div>
							</td>
							<td colspan="3">
							<c:if test="${re.mem_idx eq sessionScope.sname }">
								<a href="orderbookReplyDelete.ju?reply_idx=${re.reply_idx}">삭제</a>
							</c:if>
							</td>
						</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
							<c:if test="${!empty next }">
								<tr>
									<td colspan="3"><a href="orderbookContent.ju?orderbook_idx=${next.orderbook_idx}">△${next.orderbook_subject}</a></td>
									<td>${next.mem_idx}</td>
								</tr>
							</c:if>
							<c:if test="${!empty pre }">
								<tr>
									<td colspan="3"><a href="orderbookContent.ju?orderbook_idx=${pre.orderbook_idx}">▽${pre.orderbook_subject}</a></td>
									<td>${pre.mem_idx}</td>
								</tr>
							</c:if>
						</table>
				<input type="hidden" name="reply_cate" value="${dto.orderbook_idx}"/>
				<input type="hidden" name="mem_idx" value="${sessionScope.sidx}"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>