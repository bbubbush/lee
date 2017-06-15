<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<!-- 내가 추가한 js 및 css 부분 -->
<link rel="stylesheet" href="/lee/resources/find/css/bkList.css">
<script type="text/javascript" src="/lee/resources/find/js/bkView.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>




	<!-- info -->
	<div class="container">
		<div class="row-fluid">
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/views/find/bkSide.jsp"></jsp:include>

			</div>
			<div class="col-md-9 padding2">
				<div class="row-fluid">
					<!-- book section -->
					<div class="row panel panel-default padding2">
						<div class="row">
							<div class="col-md-12">
								<div class="media">
									<div class="media-left media">
										<img class="media-object" src="${dto[0].bk_url}"
											style="width: 100px; height: 150px;" alt="...">
									</div>
									<div class="media-body">
										<br>
										<h4 class="media-heading">${dto[0].bk_subject}</h4>
										<div class="row">
											<div class="col-md-2">저자</div>
											<div class="col-md-10">${dto[0].bk_writer}</div>
											<div class="col-md-2">출판사</div>
											<div class="col-md-10">${dto[0].bk_publisher}</div>
											<div class="col-md-2">제작일</div>
											<div class="col-md-10">${dto[0].bk_publisher}</div>
											<div class="col-md-2">추천수</div>
											<div class="col-md-10">${dto[0].bk_publisher}</div>
											<div class="col-md-2">대출</div>
											<div class="col-md-10">${dto[0].bk_publisher}</div>
											<div class="col-md-2">예약</div>
											<div class="col-md-10">${dto[0].bk_publisher}</div>
											<div class="col-md-12 text-right">
												<button class="btn btn-default" onClick="bkRefresh('${dto[0].bk_idx}')">
													<span class="glyphicon glyphicon-refresh"
														aria-hidden="true"></span><span id="refreshSpan_1">대출여부확인</span>
												</button>
												<button class="btn btn-default" onClick="bkYeyak('${dto[0].bk_idx}')">
													<span class="glyphicon glyphicon-star-empty"
														aria-hidden="true"></span><span id="yeyak_1">예약하기</span>
												</button>
												<button class="btn btn-default" onClick="bkFedex('${dto[0].bk_idx}')">
													<span class="glyphicon glyphicon-gift"
														aria-hidden="true"></span><span id="fedex_1">택배대출</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr />
					<!-- description -->
					<div class="row">
						<table class="table">
							<tr>
								<td>
									<h4>작품소개</h4> ${dto[0].bk_info}
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>