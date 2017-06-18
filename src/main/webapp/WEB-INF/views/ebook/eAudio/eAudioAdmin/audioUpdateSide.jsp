<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/lee/resources/sideMenu/sideScript.js"></script>
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">

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
			   <li class='has-sub' id="abList"><a href='/lee/eAudioListAdmin.ju'>오디오북 수정</a>
			   		<ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="0">철학</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">미학/예술철학</a></li> <!-- 3단 -->
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">종교학/신화학</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">논리학</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">윤리학</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">철학/사상</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">한국철학</a></li>
				   			<li><a href="#" onclick="return false" data-md="6" class="subpro">동양철학</a></li>
				   			<li><a href="#" onclick="return false" data-md="7" class="subpro">서양철학</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	 <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="1">종교</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">종교 일반</a></li> <!-- 3단 -->
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">기독교(개신교)</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">천주교</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">불교</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">세계 종교</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">역학/사주</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	  <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="2">인문 과학</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">경제</a></li> <!-- 3단 -->
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">경영</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">마케팅/세일즈</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">투자/재테크</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">CEO/비즈니스맨</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">인터넷 비즈니스</a></li>
				   			<li><a href="#" onclick="return false" data-md="6" class="subpro">총람/연감</a></li>
				   			<li><a href="#" onclick="return false" data-md="7" class="subpro">정부간행물</a></li>
				   			<li><a href="#" onclick="return false" data-md="8" class="subpro">심리</a></li>
				   			<li><a href="#" onclick="return false" data-md="9" class="subpro">인문일반</a></li>
				   			<li><a href="#" onclick="return false" data-md="10" class="subpro">기호학/언어학</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	 <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="3">자연 과학</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">과학</a></li> <!-- 3단 -->
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">수학</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">물리학</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">화학</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">나노과학</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">생명과학</a></li>
				   			<li><a href="#" onclick="return false" data-md="6" class="subpro">뇌과학</a></li>
				   			<li><a href="#" onclick="return false" data-md="7" class="subpro">인체</a></li>
				   			<li><a href="#" onclick="return false" data-md="8" class="subpro">천문학</a></li>
				   			<li><a href="#" onclick="return false" data-md="9" class="subpro">지구과학</a></li>
				   			<li><a href="#" onclick="return false" data-md="10" class="subpro">공학</a></li>
				   			<li><a href="#" onclick="return false" data-md="11" class="subpro">농/축/수산학</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	 <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="4">예술</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">예술기행</a></li>
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">예술일반/예술사</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">건축</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">미술</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">음악</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">사진</a></li>
				   			<li><a href="#" onclick="return false" data-md="6" class="subpro">무용</a></li>
				   			<li><a href="#" onclick="return false" data-md="7" class="subpro">대중 문화론</a></li>
				   			<li><a href="#" onclick="return false" data-md="8" class="subpro">TV/라디오</a></li>
				   			<li><a href="#" onclick="return false" data-md="9" class="subpro">연국/공연</a></li>
				   			<li><a href="#" onclick="return false" data-md="10"  class="subpro">영화/드라마</a></li>
				   			<li><a href="#" onclick="return false" data-md="11" class="subpro">대중음악</a></li>
				   			<li><a href="#" onclick="return false" data-md="12" class="subpro">아트북</a></li>
				   			<li><a href="#" onclick="return false" data-md="13" class="subpro">예술치료</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	 <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="5">언어</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">언어일반</a></li>
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">한국어</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">중국어</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">일본어 및 기타 아시아어</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">영어</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">독일어 및 기타 게르만어</a></li>
				   			<li><a href="#" onclick="return false" data-md="6"  class="subpro">프랑스어</a></li>
				   			<li><a href="#" onclick="return false" data-md="7" class="subpro">스페인어</a></li>
				   			<li><a href="#" onclick="return false" data-md="8" class="subpro">이탈리아어</a></li>
				   			<li><a href="#" onclick="return false" data-md="9" class="subpro">기타 언어</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	 <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="6">문학</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">소설</a></li>
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">에세이</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">역사/장르문학</a></li>
				   			<li><a href="#" onclick="return false" data-md="3" class="subpro">테마소설</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">고전문학/신화</a></li>
				   			<li><a href="#" onclick="return false" data-md="5"  class="subpro">시/희곡</a></li>
				   			<li><a href="#" onclick="return false" data-md="6" class="subpro">비평/창작/이론</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   	 
			   	 <ul>
			   	  	<li class='has-sub'><a href="#" onclick="return false" data-lg="7">역사</a> <!-- 2단 -->
				   		<ul>
				   			<li><a href="#" onclick="return false" data-md="0" class="subpro">역사와 문화 교양서</a></li>
				   			<li><a href="#" onclick="return false" data-md="1" class="subpro">역사학 이론/비평</a></li>
				   			<li><a href="#" onclick="return false" data-md="2" class="subpro">한국사/한국문화</a></li>
				   			<li><a href="#" onclick="return false" data-md="3"  class="subpro">동양사/동양문화</a></li>
				   			<li><a href="#" onclick="return false" data-md="4" class="subpro">서양사/서양문화</a></li>
				   			<li><a href="#" onclick="return false" data-md="5" class="subpro">세계사/세계문화</a></li>
				   			<li><a href="#" onclick="return false" data-md="6" class="subpro">아프리카/중동/중남미/<br>오세아니아 역사</a></li>
				   		</ul>
			   		</li>
			   	 </ul>
			   </li>
			</ul>
		</div>
	</div>
</div>