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
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?v=3.exp&region=KR">
	
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
					<h2>도서관 오시는길</h2><br>
					<div class="row">
						<div class="col-md-12">
							<img src="/lee/resources/syj/map.PNG" class="img-responsive"
								style="width: 1340px; height: 200px" alt="Image">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3165.465707620158!2d127.03321343809816!3d37.49693285432158!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xbdc1c5a42ae43d87!2z64Ko64-E67mM65Sp!5e0!3m2!1sko!2skr!4v1496902550735"
								width="600" height="450" frameborder="0" style="border: 0"
								allowfullscreen></iframe>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
