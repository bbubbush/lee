<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<link rel="stylesheet" href="/lee/resources/index/index.css">

 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <style>
  body {
	font-family: Arial, Helvetica, sans-serif;
}



  
  </style>
  <script>
  $(function (){
	  
	$("#saveid").click(function(event){
		
		if($(event.target).is(".glyphicon-unchecked")){
			$("#saveid").removeClass('glyphicon-unchecked');
			$("#saveid").addClass('glyphicon-check');
			$("#saveidcheck").val("save");
		}else{
			$("#saveid").removeClass('glyphicon-check');
			$("#saveid").addClass('glyphicon-unchecked');
			$("#saveidcheck").val("");
		}
		
	});
	  
  });
  </script>
</head>
<body>

<div class="row">
<div class="col-md-12" style="margin-top: 10%; margin-bottom:15%;">
<h1 style="text-align: center;">
<a href="index.ju">
<img src="/lee/resources/index/logo2.png" style="width:500px;height:">
</a></h1>
<br>
<br>

	<div class="well" style="width:500px;height:500px; margin:auto;  font-size:x-large; background-color:white;">
<form action="memberLoginOk.ju" method="post">	

	<c:set var="saveid" value="${cookie.saveidck.value}"/>
	<c:if test="${empty saveid}">
		  <input id="mem_id" name="mem_id" type="text" class="form-control" required="required" placeholder="아이디" style="height:60px; width:400px; margin-bottom:20px;margin-left: auto;margin-right: auto; font-size:x-large;" value="">
	</c:if>
	<c:if test="${saveid ne null}">
		<input id="mem_id" name="mem_id" type="text" class="form-control" required="required" placeholder="아이디" style="height:60px; width:400px; margin-bottom:20px;margin-left: auto;margin-right: auto; font-size:x-large;" value="${saveid}">
	</c:if>		
	  <input id="mem_id" name="mem_pwd" type="password" class="form-control" required="required" placeholder="비밀번호" style="height:60px; width:400px; margin-bottom:20px;margin-left: auto;margin-right: auto; font-size:x-large;">
	  <div style="width:400px; height:160px; margin:auto;">
	  <input type="hidden" id="saveidcheck" name="saveidck">
		  <input type="submit" id="loginsubmit" class="btn btn-primary" style="border-color:#1AA4AC; background-color:#1AA4AC;height:60px; width:400px; margin-bottom:20px;margin-left: 30px auto;margin-right: 30px auto; font-size:x-large;" value="로그인">
		  <span id="saveid" class="glyphicon glyphicon-unchecked"></span>&ensp;아이디저장
	  </div>
</form>
<div style="margin:auto; text-align:center;">
<button class="btn btn-default" style="height:60px; font-size:x-large;" onclick="location.href='idpwFindForm.ju'">아이디/비밀번호 찾기</button>

<button class="btn btn-default" style="height:60px; font-size:x-large;" onclick="location.href='memberJoin.ju'">회원가입</button>
</div>	
	</div>

	


</div>
</div>
 

</body>

</html>