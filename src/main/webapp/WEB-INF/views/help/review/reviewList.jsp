<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2>책추천및 감상평 게시판</h2>
				</div>
				<div class="col-md-3" style="text-align: center;">
					<a class="btn btn-default" type="submit" href="noticeWrite.ju">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true">
							책신청,감상평하기</span>
					</a>
				</div>
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
							<tr>
								<td>철학</td>
								<td>마법사의돌</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>99999</td>
							</tr>
							<tr>
								<td>문학</td>
								<td>비밀의방</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>잡지</td>
								<td>아즈카반의죄수</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>언어</td>
								<td>불의잔</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>교육</td>
								<td>불사조기사단</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-2">
							<select class="form-control">
								<option>전체</option>
								<option>작성자</option>
								<option>제목</option>
							</select>
						</div>
						<div class="col-md-4 input-group">
							<input type="text" class="form-control" placeholder="검색어를 입력하세요">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"
									href="noticeFind.ju">Go!</button>
							</span>
						</div>
						<div class="col-md-12" style="text-align: center">
							<ul class="pagination pagination-sm">
								<li class="disabled"><a href="#"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li class="active"><a href="#">5</a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-chevron-right"></span></a>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
