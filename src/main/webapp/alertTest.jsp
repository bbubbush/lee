<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
		body{
			margin: 100px;
		}
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	
	<!-- 하위 3개를 적어야 가능, JQ, 부트스트랩 밑에 작성 할 것 -->
	<script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
	
	
	<script type="text/javascript">
	$(function() {
		
		$("button").eq(0).click(
			function() {
				alertify.alert("타이틀", "띄울 메시지");
			}
		); // click 1
		
		$("button").eq(1).click(
			function() {
				alertify.confirm("타이틀", "내용",
						  function(){
						    console.log("ok누름");
						  }, // ok function
						  function(){
							  console.log("취소함");
						  } // cancel function
				);
			}
		); //click 2
		
		$("button").eq(2).click(
			function() {
				alertify.prompt("타이틀", "내용",
						  function(evt, value){
						    console.log("ok누름 : " + value);
						  }, // ok function
						  function(){
							  console.log("취소함");
						  } // cancel function
				);
			}
		); //click 3
		
		$("button").eq(3).click(
			function() {
				alertify.alert("타이틀", "하단에 결과를 잠시 보여 줄 수 있음 <br> ok누르면 실행",
					function(){
						alertify.success("성공 메시지");
						alertify.error("에러 메시지");
						alertify.warning("워닝 메시지");
						alertify.message("노말 메시지");
					} // cancel function
				);
			}
		); //click 4
		
	});
	</script>
	
</head>
<body>

	<button class="btn btn-default">alert</button>
	<br><br>
	<button class="btn btn-default">Confirm</button>
	<br><br>
	<button class="btn btn-default">Prompt</button>
	<br><br>
	<button class="btn btn-default">우측 하단 메세지</button>

</body>
</html>