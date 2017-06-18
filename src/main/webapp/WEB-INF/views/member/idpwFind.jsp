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
  
</head>
<body>
<div class="row">
<div class="col-md-12" style="margin-top: 5%; margin-bottom:15%;">
<h1 style="text-align: center;">
<a href="index.ju"><img src="/lee/resources/index/logo2.png" style="width:500px;height:">
</a>
</h1>
<br>
<br>

	<div class="well" style="width:500px;height:900px; margin:auto;  font-size:x-large; background-color:white;">
<form action="idFind.ju">	

<h1>아이디 찾기</h1>
	  <input id="mem_name" name="mem_name" type="text" class="form-control" required="required" placeholder="이름" style="height:60px; width:400px; margin-bottom:20px;margin-left: auto;margin-right: auto; font-size:x-large;" value="">
	  	<h3>핸드폰번호</h3>
	  <div class="row">
	  		
	 		<select class="form-control col-md-3" id=phph0 name="phph0" style="height:60px; width:100px;border-top-left-radius:0;border-bottom-left-radius:0; font-size:x-large;">
				<option>010</option>
				<option>011</option>
				<option>017</option>
				<option>019</option>
			</select>
			<span class="input-group-addon col-md-1" id="basic-addon1"  style="height:60px;padding-right:20px;padding-top:10px;border-radius:0;border:0px; background-color:#fff; border-top-left-radius:0;border-bottom-left-radius:0;" >
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
			</span>
													<!-- 연락처 2 -->
			<input type="text" id="phph" name="phph" class="form-control col-md-3" aria-describedby="basic-addon2" style="height:60px; width:100px; font-size:x-large;" maxlength="4" required>
			<span class="input-group-addon col-md-1" id="basic-addon1" style="height:60px;padding-right:20px;padding-top:10px;border-radius:0;border:0px; background-color:#fff; border-top-left-radius:0;border-bottom-left-radius:0;">
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
			</span>
													<!-- 연락처 3 -->
			<input type="text" id="phph2" name="phph1" class="form-control col-md-3" aria-describedby="basic-addon2" style="height:60px; width:100px; font-size:x-large;" maxlength="4" required>
			<br>
			<div class="col-md-12">
	  		<input type="submit" id="loginsubmit" class="btn btn-primary" style="border-color:#1AA4AC; background-color:#1AA4AC;height:60px; width:400px; margin-bottom:20px;margin-left: 30px auto;margin-right: 30px auto; font-size:x-large;" value="아이디 찾기">
	  		</div>
<c:set var="mdto" value="${mdto}"/>
<c:choose>
	<c:when test="${empty mdto}">
		<input type="text" id="idresult" readonly style="width:400px;border:0px;color:red;" value="이름과 핸드폰 번호를 정확히 입력해주세요">
	</c:when>
	<c:when test="${mdto ne null }">
		<input type="text" id="idresult" readonly style="width:400px;border:0px;color:red;" value="귀하의 아이디 : ${mdto.mem_id}">
	</c:when>
</c:choose>
	  		
	  </div>
	  
</form>
<hr>

<form action="pwFind.ju">	
<h1>비밀번호 찾기</h1>


	<!-- 아이디 -->
		<input id="mem_name" name="mem_id" type="text" class="form-control" required="required" placeholder="아이디" style="height:60px; width:400px; margin-bottom:20px;margin-left: auto;margin-right: auto; font-size:x-large;">
	 <!-- 비밀번호 힌트 -->
	       <div class="row">

	       	<label class="col-md-12" for="sel1">비밀번호 힌트</label>
			<div class="col-md-12"> 
			<select class="form-control" id="pwdhint" name="mem_hint">
				<option value="0">나의 첫사랑 이름은 ?</option>
				<option value="1">내가 다녔던 초등학교는 ?</option>
				<option value="2">나에게 영감을 주는 사람은 ?</option>
				<option value="3">나에게 가장 소중한 사람은 ?</option>
				<option value="4">가장 여행가보고 싶은 나라는 ?</option>
				<option value="5">내 이상형의 조건은 ?</option>
			</select>
			</div>
		</div>
	       
	       <!-- 비밀번호 찾기 답 -->
	       <div class="row" id="selfinput">
	       	
	      		<label class="col-md-12" for="sel1">비밀번호 답변</label>
	      		<div class="col-md-12">
			<input type="text" id="pwdanswer"class="form-control" aria-describedby="sizing-addon2" name="mem_answer" >
			</div>
			<br>
			
			<div class="col-md-12">
			<input type="submit" id="loginsubmit" class="btn btn-primary" style="border-color:#1AA4AC; background-color:#1AA4AC;height:60px; width:400px; margin-bottom:20px;margin-left: 30px auto;margin-right: 30px auto; font-size:x-large;" value="비밀번호 찾기">
			</div>
<c:set var="mdto2" value="${mdto2}"/>
<c:choose>
	<c:when test="${empty mdto2}">
		<input type="text" id="idresult" readonly style="width:400px;border:0px;color:red;">
	</c:when>
	<c:when test="${mdto2 ne null}">
		<input type="text" id="idresult" readonly style="width:400px;border:0px;color:red;" value="귀하의 이메일로 임시비밀번호(인증코드)를 발급하였습니다.">
	</c:when>
</c:choose>
			
		</div>
	  
	  
	  
	  
	  
</form>
	
	</div>

	


</div>
</div>
</body>
</html>