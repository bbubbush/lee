<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<meta charset="UTF-8">
<meta http-ereviewiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<style type="text/css">
</style>

<script type="text/javascript"
	src="/lee/resources/js/jreviewery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="row">
		<div class="col-md-3">
<<<<<<< HEAD
			<jsp:include page="/WEB-INF/views/service/elibSide.jsp"></jsp:include>
=======
			<jsp:include page="/WEB-INF/views/help/helpSide.jsp"></jsp:include>
>>>>>>> origin/Daewon
		</div>
		<div class="col-md-7">
			<h2>책추천 및 감상평 게시판 쓰기</h2>
			<div class="row">
				<form name="reviewWrite" action="reviewWriteOk.ju">
					<table class="table table-striped table table-hover" border="1">
						<tr>
<<<<<<< HEAD
							<th class="text-center">제목</th>
=======
							<th style="text-align: center; vertical-align: middle;">제목</th>
>>>>>>> origin/Daewon
							<td><input type="text" class="form-control"
								name="review_subject" placeholder="제목을 입력하세요"></td>

						</tr>
						<tr>
<<<<<<< HEAD
							<th class="text-center">작성자</th>
							<td class="text-center">${sid}</td>
						</tr>
						<tr>
							<th class="text-center">카테고리</th>
=======
							<th style="text-align: center; vertical-align: middle;">작성자</th>
							<td class="text-center">${sid}</td>
						</tr>
						<tr>
							<th style="text-align: center; vertical-align: middle;">카테고리</th>
>>>>>>> origin/Daewon
							<td>
								<div class="radio">
									<label><input type="radio" name="review_cate" value="0" checked> 책추천 </label> 
									<label><input type="radio" name="review_cate" value="1"> 감상평 </label>
								</div>
							</td>

						</tr>

						<tr>
<<<<<<< HEAD
							<th class="text-center">내용</th>
=======
							<th style="text-align: center; vertical-align: middle;">내용</th>
>>>>>>> origin/Daewon
							<td><textarea class="form-control" rows="10"
									name="review_content" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form-group"></div>
								<button type="submit" class="btn btn-default">등록</button>
								<button type="reset" class="btn btn-default">재작성</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<hr>
		</div>
	</div>

</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> origin/Daewon
