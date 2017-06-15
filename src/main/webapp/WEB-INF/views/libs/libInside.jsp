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
				<div class="col-md-12">
					<h2>도서관 층별소개</h2>


					<div role="tabpanel">

						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">1층</a></li>
							<li role="presentation"><a href="#profile"
								aria-controls="profile" role="tab" data-toggle="tab">2층</a></li>
							<li role="presentation"><a href="#messages"
								aria-controls="messages" role="tab" data-toggle="tab">3층</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">1층
							<img src="/lee/resources/syj/first.jpg" class="img-responsive" style="width: 80%; height: 80%" alt="Image"></div>
							<div role="tabpanel" class="tab-pane" id="profile">2층
							<img src="/lee/resources/syj/second.jpg" class="img-responsive" style="width: 80%; height: 80%" alt="Image"></div>
							<div role="tabpanel" class="tab-pane" id="messages">3층
							<img src="/lee/resources/syj/third.jpg" class="img-responsive" style="width: 80%; height: 80%" alt="Image"></div>
						</div>

					</div>




				</div>
			</div>

		</div>
	</div>
</body>
</html>
