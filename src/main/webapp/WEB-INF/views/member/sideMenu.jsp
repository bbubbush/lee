<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 하위 3개를 적어야 가능, JQ, 부트스트랩 밑에 작성 할 것 -->
	<script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
	<link rel="stylesheet" href="/lee/resources/index/index.css">
<c:choose>
	<c:when test="${empty sidx}">
		<script>
		alertify.alert("",'로그인이 필요한 서비스 입니다.',
				function(){
					window.location.href="index.ju";
				}
		);
		</script>
		
	</c:when>
</c:choose>

<div class="col-md-3 sidenav" id='cssmenu'>
			<ul>
				<li>
					<a href='#' class="mainGo">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						마이 페이지
					</a>
				</li>
				<li class="" id=myCard>
					<a href='myCard.ju'>
					<span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
					도서관 카드</a>
				</li>
				<li class="" id="aboutMybook">
					<a href='aboutMybook.ju'>
					<span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>
					대출/예약</a>
				</li>
				<li class="" id="aboutEbook">
					<a href='aboutEbook.ju'>
					<span class="glyphicon glyphicon-modal-window" aria-hidden="true"></span>
					전자도서</a>
				</li>
				<li class="" id="changeMe">
					<a href='changeMe.ju'>
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					회원정보 수정</a>
				</li>
				<li class="" id="myQna">
					
					<a href='myQna.ju'>
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
					나의 문의
					</a>
				</li>
				<li class="" id="myQna">
					
					<a href='loginLog.ju'>
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
					로그인정보
					</a>
				</li>
				<li class="" id="memberOut">
					<a href='memberOut.ju'>
						<span class="glyphicon glyphicon-erase" aria-hidden="true"></span>
					회원 탈퇴
					</a>
				</li>
			</ul>
		</div>