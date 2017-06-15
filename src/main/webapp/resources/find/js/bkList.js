var query;
var bk_lg;
var bk_md;
var bk_publisher;
var bk_writer;
var page;

var result = 0;
var result2 = 0;

function detailSearch(){
	query = $('#query').val();
	bk_lg = $('#bk_lg').val();
	bk_md = $('#bk_md').val();
	bk_writer = $('#bk_writer').val();
	bk_publisher = $('#bk_publisher').val();
	page = 1;
	bkDetailSearch1(query, bk_lg, bk_md, bk_publisher, bk_writer, page);
}

function bkView(){
	$('#tbody>tr>td').click(function (){
		var selectNum=$("#tbody>tr>td").index(this);
		var bk_subject=$("#tbody>tr>td").eq(selectNum).data("subject");
		$('#mbody').html("");
		$.ajax({
			type: "GET",
			url: "bkView.ju",
			data: {'bk_subject' : bk_subject},
			dataType: "json",
			success: function(list){
				var modalBody = "";
				var modalFooter = "";
				modalBody = '<div class="media-left media">'
				+'<img class="media-object" src="'+list.list.bk_url+'"'
				+'	style="width: 100px; height: 150px;" alt="...">'
				+'</div>'
				+'<div class="media-body">'
				+'<h4 class="media-heading" id="media-heading">'+list.list.bk_subject+'</h4>'
				+'<div class="row-fluid">'
				+'<div class="col-xs-3">저자</div>'
				+'<div class="col-xs-9">'+list.list.bk_writer+'</div>'
				+'<div class="col-xs-3">출판사</div>'
				+'<div class="col-xs-9">'+list.list.bk_publisher+'</div>'
				+'<div class="col-xs-3">출판일</div>'
				+'<div class="col-xs-9">'+list.list.bk_writedate+'</div>'
				+'<div class="col-xs-3">보유권수</div>'
				+'<div class="col-xs-9">'+list.countBkSubject+'</div>'
				+'<div class="col-xs-3">예약가능권수</div>'
				+'<div class="col-xs-9">'+list.sumBktake+'</div>'
				+'<div class="col-xs-12 text-right">'
				+'	<button class="btn btn-default" id="refreshSpan_1" onClick="bkRefresh()">'
				+'		<span class="glyphicon glyphicon-refresh"'
				+'			aria-hidden="true"></span><span>대출여부확인</span>'
				+'	</button>'
				+'	<button class="btn btn-default" onClick="bkYeyak()">'
				+'		<span class="glyphicon glyphicon-star-empty"'
					+'			aria-hidden="true"></span><span id="yeyak_1">예약하기</span>'
					+'</button>'
					+'<button class="btn btn-default" onClick="bkFedex()">'
				+'	<span class="glyphicon glyphicon-gift"'
				+'			aria-hidden="true"></span><span id="fedex_1">택배대출</span>'
				+'	</button>'
				+'</div>'
				+'</div>'
				+'</div>';
				
				modalFooter=list.list.bk_info
				
			$("#modal-body").html(modalBody);
			$("#info").html(modalFooter);
			}
			
		});
		$("#myModal").modal("show");
	})
}



function bkDetailSearch1(query, bk_lg, bk_md, bk_publisher, bk_writer, page){
$('#tbody').html("");
$.ajax({
	type: "GET",
	url: "bkDetailSearch.ju",
	data: {'query' : query, 'page' : page, 'bk_lg' : bk_lg, 'bk_md' : bk_md, 'bk_writer' : bk_writer, 'bk_publisher' : bk_publisher},
	dataType: "json",
	success: function(list){
		var values = list.list;
		var str = ""
			if(values.length==0){
				str = '<tr><td>검색 결과가 없습니다.</td></tr>'
			}else{
				$.each(values, function(index, value){
					str+='<tr>'
						+'<td data-subject="'+value.bk_subject+'">'
						+'<div class="media padding1">'
						+'		<div class="media-left media-middle">'
						+'				<img class="media-object" src="'+value.bk_url+'" alt="책이미지" width="100px" height="130">'
						+'	</div>'
						+'	<div class="media-body">'
						+'		<h4 class="media-heading">'+value.bk_subject+'</h4>'
						+'		<div class="row">'
						+'			<div class="col-md-2">글쓴이</div>'
						+'			<div class="col-md-10">'+value.bk_writer+'</div>'
						+'			<div class="col-md-2">출판사</div>'
						+'			<div class="col-md-10">'+value.bk_publisher+'</div>'
						+'				<div class="col-md-12 ">간략소개</div>'
						+'			<dl class="col-md-12 dl-horizontal"> '
						+'				<dt>'+value.bk_info+'</dt>'
						+'			</dl>'
						+'		</div>'
						+'	</div>'
						+'</div>'
						+'</td>'
						+'</tr>';
				})
				str+='<tr>'
					+'<td class="text-center">'
					+'<nav>'
					+'  <ul class="pagination">';
				if(list.page<=1){
					str+='<li class="disabled">'
						+'      <a  aria-label="Previous">'
						+'        <span aria-hidden="true">&laquo;</span>'
						+'      </a>'
						+'    </li>';
				}else{
					str+='  <li>'
						+'      <a  aria-label="Previous" onclick="pageMove('+(list.page-1)+')">'
						+'        <span aria-hidden="true">&laquo;</span>'
						+'      </a>'
						+'    </li>';
				}
				
				for(i=list.startPage; i<= list.endPage; i=i+1){
					if(i==list.page){
						str += '<li class="active"><a>'+i+'</a></li>';
					}else{
						str+='    			<li><a  onclick="pageMove('+i+')">'+i+'</a></li>';
					}
				}
				
				if(list.page>=list.endPage){
					str+='    <li class="disabled">'
						+'      <a  aria-label="Next">'
						+'        <span aria-hidden="true">&raquo;</span>'
						+'      </a>'
						+'    </li>';
				}else{
					str+='  	<li>'
						+'      <a  aria-label="Next" onclick="pageMove('+(list.page+1)+')">'
						+'        <span aria-hidden="true">&raquo;</span>'
						+'      </a>'
						+'    </li>';
				}
				str+='  </ul>'
					+'						</nav>'
					+'</td>'
					+'</tr>';
				
			} //else 
		
		
		$('#tbody').html(str);
		bkView();
	}
});
}

function find(){
	if($('#bk_lg').val()==0){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">미학/예술철학</option>');
		$('#bk_md').append('<option value="1">종교학/신화학</option>');
		$('#bk_md').append('<option value="2">논리학</option>');
		$('#bk_md').append('<option value="3">윤리학</option>');
		$('#bk_md').append('<option value="4">철학/사상</option>');
		$('#bk_md').append('<option value="5">한국철학</option>');
		$('#bk_md').append('<option value="6">동양철학</option>');
		$('#bk_md').append('<option value="7">서양철학</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==1){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">종교 일반</option>');
		$('#bk_md').append('<option value="1">기독교(개신교)</option>');
		$('#bk_md').append('<option value="2">천주교</option>');
		$('#bk_md').append('<option value="3">불교</option>');
		$('#bk_md').append('<option value="4">세계종교</option>');
		$('#bk_md').append('<option value="5">역학/사주</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==2){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">경제</option>');
		$('#bk_md').append('<option value="1">경영</option>');
		$('#bk_md').append('<option value="2">마케팅/세일즈</option>');
		$('#bk_md').append('<option value="3">투자/재테크</option>');
		$('#bk_md').append('<option value="4">CEO/비즈니스맨</option>');
		$('#bk_md').append('<option value="5">인터넷비즈니스</option>');
		$('#bk_md').append('<option value="6">총람/연감</option>');
		$('#bk_md').append('<option value="7">정부간행물</option>');
		$('#bk_md').append('<option value="8">심리</option>');
		$('#bk_md').append('<option value="9">인문일반</option>');
		$('#bk_md').append('<option value="10">기호학/언어학</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==3){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">과학</option>');
		$('#bk_md').append('<option value="1">수학</option>');
		$('#bk_md').append('<option value="2">물리학</option>');
		$('#bk_md').append('<option value="3">화학</option>');
		$('#bk_md').append('<option value="4">나노과학</option>');
		$('#bk_md').append('<option value="5">생명과학</option>');
		$('#bk_md').append('<option value="6">뇌과학</option>');
		$('#bk_md').append('<option value="7">인체</option>');
		$('#bk_md').append('<option value="8">천문학</option>');
		$('#bk_md').append('<option value="9">지구과학</option>');
		$('#bk_md').append('<option value="10">공학</option>');
		$('#bk_md').append('<option value="11">농/축/수산학</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==4){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">예술기행</option>');
		$('#bk_md').append('<option value="1">예술일반/예술사</option>');
		$('#bk_md').append('<option value="2">건축</option>');
		$('#bk_md').append('<option value="3">미술</option>');
		$('#bk_md').append('<option value="4">음악</option>');
		$('#bk_md').append('<option value="5">사진</option>');
		$('#bk_md').append('<option value="6">무용</option>');
		$('#bk_md').append('<option value="7">대중문화론</option>');
		$('#bk_md').append('<option value="8">TV/라디오</option>');
		$('#bk_md').append('<option value="9">연극/공연</option>');
		$('#bk_md').append('<option value="10">영화/드라마</option>');
		$('#bk_md').append('<option value="11">대중음악</option>');
		$('#bk_md').append('<option value="12">아트북</option>');
		$('#bk_md').append('<option value="13">예술치료</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==5){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">언어일반</option>');
		$('#bk_md').append('<option value="1">한국어</option>');
		$('#bk_md').append('<option value="2">중국어</option>');
		$('#bk_md').append('<option value="3">일본어 및 기타 아시아어</option>');
		$('#bk_md').append('<option value="4">영어</option>');
		$('#bk_md').append('<option value="5">독일어 및 기타 게르만어</option>');
		$('#bk_md').append('<option value="6">프랑스어</option>');
		$('#bk_md').append('<option value="7">스페인어</option>');
		$('#bk_md').append('<option value="8">이탈리어</option>');
		$('#bk_md').append('<option value="9">기타언어</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==6){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">소설</option>');
		$('#bk_md').append('<option value="1">에세이</option>');
		$('#bk_md').append('<option value="2">역사/장르문학</option>');
		$('#bk_md').append('<option value="3">테마소설</option>');
		$('#bk_md').append('<option value="4">고전문학/신화</option>');
		$('#bk_md').append('<option value="5">시/희곡</option>');
		$('#bk_md').append('<option value="6">비평/창작/이론</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==7){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">역사와 문화 교양서</option>');
		$('#bk_md').append('<option value="1">역사학 이론/비평</option>');
		$('#bk_md').append('<option value="2">한국사/한국문화</option>');
		$('#bk_md').append('<option value="3">동양사/동양문화</option>');
		$('#bk_md').append('<option value="4">서양사/서양문화</option>');
		$('#bk_md').append('<option value="5">세계사/세계문화</option>');
		$('#bk_md').append('<option value="6">기타 역사</option>');
		$('.md').append('</select>');
	}else if($('#bk_lg').val()==8){
		$('#bk_md').remove();
		$('.md').append('<select name="bk_md" id="bk_md" class="form-control">');
		$('#bk_md').append('<option value="99" selected="selected">모두보기</option>');
		$('#bk_md').append('<option value="0">국어</option>');
		$('#bk_md').append('<option value="1">수학</option>');
		$('#bk_md').append('<option value="2">언어</option>');
		$('#bk_md').append('<option value="3">한국사</option>');
		$('#bk_md').append('<option value="4">사회/사회탐구</option>');
		$('#bk_md').append('<option value="5">과학/과학탐구</option>');
		$('.md').append('</select>');
	}else{
		$('#bk_md').remove();
	}
};


function bkSearch(){
	query = $('#query').val();
	bk_lg = $('#bk_lg').val();
	bk_md = $('#bk_md').val();
	bk_writer = $('#bk_writer').val();
	bk_publisher = $('#bk_publisher').val();
	page = 1;
	bkDetailSearch1(query, bk_lg, bk_md, bk_publisher, bk_writer, page);
}

function pageMove(move){
	page = move;
	bkDetailSearch1(query, bk_lg, bk_md, bk_publisher, bk_writer, page);
}

function cateMove(lg, md){
	bk_lg = lg;
	bk_md = md;
	bkDetailSearch1(query, bk_lg, bk_md, bk_publisher, bk_writer, page);
}


function bkRefresh(){
	var bk_subject = $('#media-heading').html();
	$.ajax({
		type: "GET",
		url: "bkRefresh.ju",
		data: {'bk_subject' : bk_subject},
		dataType: "json",
		success: function(list){
			if(list.count>0){
				$('#refreshSpan_1').text('대출가능');
				result = 1;
			}else if(list.count==0){
				$('#refreshSpan_1').text('대출불가');
				result = 3;
			}
		}
	});
	
}


function bkYeyak(){
	var bk_subject = $('#media-heading').html();
	if(result==1){
		alert('대출가능 도서입니다. 도서관에 방문하시거나 택배대출기능을 이용해주세요');
	}else if(result==0){
		alert('대출가능여부를 확인해주세요');
		
	}else if(result==3){
		$.ajax({
			type: "GET",
			url: "bkYeyak.ju",
//			sid를 임시로 고정
			data: {'bk_subject' : bk_subject},
			dataType: "json",
			success: function(list){
				if(list.count==1){
					alert('대출예약이 되었습니다 순번 : ' + list.ye_sunbun);
				}else if(list.count==80){
					alert('예약 회원이 많아 예약이 불가합니다');
//					$('#refreshSpan_1').text('예약실패');
				}else if(list.count==90){
					alert('이미 예약한 도서입니다');
				}else if(list.count==70){
					alert('예약은 총 3권 까지만 가능합니다. 마이페이지에서 확인 바랍니다');
				}else{
					alert('오류가 발생했습니다. 관리자에게 문의 바랍니다');
				}
			}
		});
	}
}


function bkFedex(){
	var bk_subject = $('#media-heading').html();
	if(result==1){
		$.ajax({
			type: "GET",
			url: "bkFedex.ju",
//			sid를 임시로 고정
			data: {'bk_subject' : bk_subject},
			dataType: "json",
			success: function(list){
				if(list.count==1){
					alert('택배대출신청했습니다. 마이페이지에서 현황을 확인해주세요');
					result2 = 1;
				}else if(list.count==0){
					alert('오류가 발생했습니다. 관리자에게 문의 바랍니다.');
				}else if(list.count==90){
					alert('이미 대출하신 도서가 3권 이상입니다');
				}else if(list.count==80){
					alert('대출된 도서');
				}else if(list.count==70){
					alert('이미 신청하셨습니다');
					
				}
			}
		});
		
	}else if(result==0){
		alert('대출가능여부를 확인해주세요');
	}else if(result==3){
		alert('대출중인 도서입니다. 대출이 가능하면 신청해주세요');
	}else if(result2==1){
		alert('이미 예약하셨습니다. 마이페이지에서 확인 바랍니다');
		
	}
}












