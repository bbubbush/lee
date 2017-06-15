<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/mainMenu/jquery.smartmenus.min.js"></script>
<link rel="stylesheet" href="/lee/resources/mainMenu/css/sm-core-css.css">
<link rel="stylesheet" href="/lee/resources/mainMenu/css/sm-clean/sm-clean.css">
<style type="text/css">
	body{
		width: 90%;
		margin: auto;
	}
	@media (max-width: 768px) {
		body{
			width: auto;
			margin: 0 10%;
		}
	}
	#mainImg{
		height: 100px;
		background: yellow;
	}
	
	.main-menu-btn {
		position: relative;
		display: inline-block;
		width: 28px;
		height: 28px;
		text-indent: 28px;
		white-space: nowrap;
		overflow: hidden;
		cursor: pointer;
		-webkit-tap-highlight-color: rgba(0,0,0,0);
	}
	/* hamburger icon */
	.main-menu-btn-icon, .main-menu-btn-icon:before, .main-menu-btn-icon:after {
		position: absolute;
		top: 50%;
		left: 2px;
		height: 2px;
		width: 24px;
		background: #bbb;
		-webkit-transition: all 0.25s;
		transition: all 0.25s;
	}
	.main-menu-btn-icon:before {
		content: '';
		top: -7px;
		left: 0;
	}
	.main-menu-btn-icon:after {
		content: '';
		top: 7px;
		left: 0;
	}
	/* x icon */
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon {
		height: 0;
		background: transparent;
	}
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon:before {
		top: 0;
		-webkit-transform: rotate(-45deg);
		transform: rotate(-45deg);
	}
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon:after {
		top: 0;
		-webkit-transform: rotate(45deg);
		transform: rotate(45deg);
	}
	/* hide menu state checkbox (keep it visible to screen readers) */
	#main-menu-state {
		position: absolute;
		width: 1px;
		height: 1px;
		margin: -1px;
		border: 0;
		padding: 0;
		overflow: hidden;
		clip: rect(1px,1px,1px,1px);
	}
	/* hide the menu in mobile view */
	#main-menu-state:not(:checked) ~ #main-menu {
		display: none;
	}
	#main-menu-state:checked ~ #main-menu {
		display: block;
	}
	@media (min-width: 768px) {
		/* hide the button in desktop view */
		.main-menu-btn {
			position: absolute;
			top: -99999px;
		}
		/* always show the menu in desktop view */
		#main-menu-state:not(:checked) ~ #main-menu {
			display: block;
		}
	}
	
	@media (min-width: 768px) {
		#main-menu > li {
			float: none;
			display: table-cell;
			width: 1%;
			text-align: center;
		}
	}
	
	.loginColor{
		color : #0bd392;
	}
	.loginColor:HOVER {
		color: #1aa4ac;
	}
</style>

<script type="text/javascript">
	 $(function() {
		$('#main-menu').smartmenus(
			{
				mainMenuSubOffsetX: -1
				, subMenusSubOffsetX: 10
				, subMenusSubOffsetY: 0
			}
		);
	}); 
</script>
</head>
<body>
<p class="text-left"/>
	<h2>도서관로고</h2>
	
<div class="row">
		<nav id="main-nav" role="navigation">
			<input id="main-menu-state" type="checkbox" />
			<label class="main-menu-btn" for="main-menu-state">
			  <span class="main-menu-btn-icon"></span> Toggle main menu visibility
			</label>
			<ul id="main-menu" class="sm sm-clean">
				<li><a href="adminIndex.ju"><img src="resources/img/home.png" height="40px"><br>관리자 홈으로</a></li>
				<li><a href="index.ju"><img src="resources/img/lib.png" height="40px"><br>도서관 홈으로</a></li>
				<li><a href="memberList.ju"><img src="resources/img/member.png" height="40px"><br>회원관리</a></li>
				<li><a href="bookList.ju"><img src="resources/img/book.png" height="40px"><br>일반도서관리</a></li>
				<li><a><img src="resources/img/ebook.png" height="40px"><br>전자도서관리</a></li>
				<li><a href="loanbookList.ju"><img src="resources/img/loan.png" height="40px"><br>대출도서관리</a></li>
				<li><a href="adminSeatManage.ju"><img src="resources/img/seat.png" height="40px"><br>자리예약관리</a></li>
				<li><a href="learningList.ju"><img src="resources/img/learn.png" height="40px"><br>교육관리</a></li>
				<li><a href="fedexList.ju"><img src="resources/img/fedex.png" height="40px"><br>택배대출관리</a></li>
				<li><a href="calendar.ju"><img src="resources/img/calendar.png" height="40px"><br>캘린더관리</a></li>
			</ul>
		</nav>
	</div>

</body>
</html>