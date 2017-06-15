<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/lee/resources/sideMenu/sideScript.js"></script>
<link rel="stylesheet" href="/lee/resources/sideMenu/css/adminStyle.css">
<style>
@media (max-width:768px) {
	#cssmenu{
		width:100%;
	}
}
</style>


<div>
	<div class="col-md-2">
		<div id='cssmenu'>
			<ul>
			   <li><a href='/lee/adminIndex.ju' class="mainGo">관리자</a></li>
			   
			   <li class='has-sub' id="memberList"><a href='#' onclick="return false">회원관리</a><!-- 1단 -->
			   	  <ul>
				   	<li id="memberList2"><a href="/lee/memberList.ju" data-md="0" class="subpro">전체회원 리스트</a></li> <!-- 3단 -->
				   	<li id="memberList2"><a href="/lee/memberBanList.ju" data-md="1" class="subpro">정지회원 리스트</a></li>
				  </ul>
			   </li> 
			  
			   <li class='has-sub' id="bkList"><a href='#'>전체도서 관리</a> <!--1단  -->
			      <ul>
			   	  	<li class='has-sub' id="bkList2"><a href="#" onclick="return false" data-lg="0">일반도서 관리</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="/lee/bookList.ju" data-md="0" class="subpro">일반도서 리스트</a></li> <!-- 3단 -->
				   			<li><a href="/lee/bookAdd.ju" data-md="1" class="subpro">일반도서 등록</a></li>
				   		</ul>
			   		</li>
			   	  </ul>
			   	 
			   	  <ul>
			   	  	<li class='has-sub' id="bkList2"><a href="#" onclick="return false" data-lg="1">전자도서 관리</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">전자도서 리스트</a></li> <!-- 3단 -->
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">전자도서 등록</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">오디오북 리스트</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">오디오북 등록</a></li>
				   		</ul>
			   		 </li>
			   	  </ul>
			    </li>
			   	 
			    <li class='has-sub' id="loanList"><a href='#'>대출 관리</a>
			   	  <ul>
			   	  	<li><a href="loanbookList.ju" data-lg="0">대출도서 관리</a> <!-- 2단 --></li>
			   	  </ul>
			   	  
			   	  <ul>
			   		<li class='has-sub' id="loanList2"><a href="#" onclick="return false" data-lg="1">대출 / 반납</a> <!-- 2단 -->
			   			<ul>
			   				<li><a href="checkOut.ju" data-md="0" class="subpro">대출</a></li> <!-- 3단 -->
				   			<li><a href="checkIn.ju" data-md="1" class="subpro">반납</a></li>
			   			</ul>
			   		</li>
			   	 </ul>
			   </li>
			   
			   <li id="fedexList"><a href='/lee/fedexList.ju'>택배대출 관리</a><!-- 1단 --></li>
			   
			   <li class='has-sub' id="learningList"><a href='#'>평생교육 관리</a><!-- 1단 -->
			   		<ul>
			   	  		<li class='has-sub' id="learningList2"><a href="#" onclick="return false" data-lg="0">수업</a> <!-- 2단 -->
			   	  			<ul>
			   	  				<li><a href="learningList.ju" data-md="0" class="subpro">수업 리스트</a></li> <!-- 3단 -->
				   				<li><a href="learningClassAdd.ju" data-md="1" class="subpro">수업 추가</a></li>
			   	  			</ul>
			   	  		</li>
			   	 	</ul>
			   	 	<ul>
			   	 		<li class='has-sub' id="learningList3"><a href="#" onclick="return false" data-lg="0">강사</a> <!-- 2단 -->
			   	  			<ul>
			   	  				<li><a href="learningTeacherList.ju" data-md="0" class="subpro">강사 리스트</a></li> <!-- 3단 -->
				   				<li><a href="learningTeacherAdd.ju" data-md="1" class="subpro">강사 추가</a></li>
			   	  			</ul>
			   	  		</li>
			   	 	</ul>
			   </li>
			   
			   <li id="abList"><a href='/lee/eAudio.ju'>이용실 관리</a><!-- 1단 --></li>
			   
			   <li id="calendar"><a href='/lee/calendar.ju'>캘린더 관리</a><!-- 1단 --></li>
			</ul>
		</div>
	</div>
</div>
