<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/lee/resources/mj/css/default.css" />
<link rel="stylesheet" type="text/css" href="/lee/resources/mj/css/component.css" />
</head>
<body>
	<footer class="cbp-spmenu-push">
		<nav class="cbp-spmenu cbp-spmenu-horizontal cbp-spmenu-bottom"
			id="cbp-spmenu-s4">
			<div class="footerM">
				<a href="#" id="fMhead">이용약관</a>
			</div>
			<div class="footerM">
				<a href="#" id="fMhead">CONTACT US</a>
				<ul>
					<li>1544-9970</li>
					<li>khmaster2017@gmail.com</li>
					<li><a href="#">오시는 길</a></li>
				</ul>
			</div>
			<div class="footerM">
				<a href="#" id="fMhead">책 검색</a>
			</div>
			<div class="footerM">
				<a href="#" id="fMhead">도서관 소개</a>
				<ul>
					<li><a href="#">도서관장 인사말</a></li>
					<li><a href="#">층별소개</a></li>
					<li><a href="#">장서정보</a></li>
					<li><a href="#">이용안내</a></li>
				</ul>
			</div>
			<div class="footerM">
				<a href="#" id="fMhead">고객센터</a>
				<ul>
					<li><a href="#">분실물센터</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="#">FAQ</a></li>
				</ul>
			</div>
		</nav>
		<div class="footermain">
			<p id="showBottom" style="margin:0;">
				LIBxSERVICE | 사업자등록번호 : 000-00-00000 | 대표자 : 김대원  | 책임자 : 김태영  | 개인정보관리책임자 : 이상훈<br>
				(우)06234 서울특별시 강남구 테헤란로14길 6 남도빌딩<br>
				Copyright&copy;LIBxSERVICE. ALL RIGTHS RESERVED.
			</p>
		</div>
		<script src="/lee/resources/mj/js/classie.js"></script>
		<script>
			var menuBottom = document.getElementById('cbp-spmenu-s4'),
				showBottom = document.getElementById('showBottom'),
				body = document.body;
			
			showBottom.onclick = function() {
				classie.toggle(this, 'active');
				classie.toggle(menuBottom, 'cbp-spmenu-open');
				console.log('오버3');
			}
			
			$(window).scroll(function(){
				$(menuBottom).removeClass('cbp-spmenu-open');
			});
			
			$(showBottom).click(function(){
				document.body.scrollTop = document.body.scrollHeight;
			});
				 
			
		</script>
	</footer>
</body>
</html>