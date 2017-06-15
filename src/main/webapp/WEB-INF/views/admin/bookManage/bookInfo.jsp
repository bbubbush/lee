<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 바코드 -->
<link rel="stylesheet" href="/lee/resources/member/barcode2/code128.css" type="text/css">
<script src="/lee/resources/member/barcode2/base2-jsb-fp.js" type="text/javascript" charset="utf-8"></script>
<script src="/lee/resources/member/barcode2/code128-base2.js" type="text/javascript"></script>
<script src="/lee/resources/member/barcode2/get.js" type="text/javascript"></script>
</head>
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>

<body>
<c:set var="dto" value="${dto}"/>
<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">파손 상태</h4>
        </div>
        <div class="modal-body">
          <form name="bookState" action="bookInfo.ju" method="post">
          	<input type="hidden" name="bk_idx" id="bk_idx" value="${dto.bk_idx}">
          	<label><input type="radio" value="0" class="cb" name="bk_break" id="bk_break0">정상</label><br>
			<label><input type="radio" value="1" class="cb" name="bk_break" id="bk_break1">분실</label><br>
			<label><input type="radio" value="2" class="cb" name="bk_break" id="bk_break2">파손</label><br>
			<label><input type="radio" value="3" class="cb" name="bk_break" id="bk_break3">교체예정</label><br>
			<label><input type="radio" value="4" class="cb" name="bk_break" id="bk_break4">폐기</label><br>
			<button type="submit" class="btn btn-success" id="breaks" onclick="bookStateUpdate()">수정</button>
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container" id="modalForm">
  <!-- Modal -->
  <div class="modal fade" id="barcode" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">바코드 발급</h4>
        </div>
        <div class="modal-body2">
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9" >

		<h2>일반도서 정보</h2>
		<form name="bookInfo">
		<table width="800px">
			<tr>
				<td rowspan="6" width="300px"><img src="${dto.bk_url}" width="300px"></td>
				<th>도서코드</th>
				<td>${dto.bk_idx}</td>
			</tr>
			<tr>
				<th>도서명</th>
				<td>${dto.bk_subject}</td>
			</tr>
			<tr>
				<th>저자명</th>
				<td>${dto.bk_writer}</td>
			</tr>
			<tr>
				<th>출판사명</th>
				<td>${dto.bk_publisher}</td>
			</tr>
			<tr>
				<th>출판일</th>
				<td>${dto.bk_writedate}</td>
			</tr>
			<tr>
				<th>파손상태</th>
				<td><span id="breakZone"></span><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">파손 수정</button></td>
			</tr>
		</table>
		<table width="800px">
			<tr>
				<th>설명</th>
				<td>${dto.bk_info}</td>
			</tr>
		</table>
		<input type="button" value="전체 목록으로" onclick="bookListBack()">
		<input type="button" value="도서삭제" onclick="bookDel('${dto.bk_idx}')">
		</form>
		<form name="barcode2">
		<input type="hidden" name="barcode" id="barcode_input" value="${dto.bk_idx}">
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#barcode" id="barcodeGo">바코드 발급</button>
		</form>
	</div>
</div>
<script>
//바코드
$(document).on('click','#barcodeGo',function() {
	var params = new Object();
	params.barcode_input = document.getElementById('barcode_input').value;
	$.ajax({
		type : "GET",
		url : "bookBarcode.ju",
		data : params,
		success : function(args) {
			$(".modal-body2").html(args);
		}
	});
});

new jsb.Rule(".barcode, .barcode2", base2.Barcode.code128behaviour);

var qs=new getParameter();
var idx = document.getElementById('barcode_input').value;
console.log('qs = '+idx);
if(idx) {
	  /* var cls = qs.bigger ? 'barcode2' : 'barcode'; */ /*Bigger CheckBox로 크기 정하기*/
	  /* var cls = 'barcode'; */ /*바코드 작은사이즈*/
	  var cls = 'barcode2'; /*바코드 큰사이즈*/
	  if (qs.type) cls += ' '+qs.type;
	  
	 
		new jsb.Rule("#barcode_input", { 
			ondocumentready: function() {
				
				if (qs.type) document.getElementById('barcode_subtype').value = qs.type;
				
				if (qs.bigger) document.getElementById('bigger').checked = true;
				
				 $('#memberIdcard').html("<div class='"+cls+"'>"+idx+"</div>");
			}
		});
}	


function bookDel(i){
	location.href="bookDel.ju?bk_idx="+i;
}

var breakState = null;
var breakInfo = ${dto.bk_break};
var state = document.getElementById('breakZone');



function bookStateUpdate(){
	var breakRadio = document.getElementsByName('bk_break');
	for(var i=0;i<breakRadio.length;i++){
		if(document.getElementById('bk_break'+i).checked){
			breakState = document.getElementById('bk_break'+i).value;
		}
	}
	var breakIdx = document.getElementById('bk_idx').value;
	var params = 'bk_break=' + breakState + '&bk_idx=' + breakIdx;
	sendRequest('bookInfo.ju',params,updateResult,'POST');
}


function updateResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			switch(breakState){ 
			case '0' : state.innerText = '정상'; break;
			case '1' : state.innerHTML = '분실'; break;
			case '2' : state.innerHTML = '파손'; break;
			case '3' : state.innerHTML = '교체 예정'; break;
			case '4' : state.innerHTML = '폐기'; break;
			}
		}
	}
}

$(document).ready(function(){
	var bookState = document.getElementById('bk_break'+breakInfo);
	bookState.checked = true;
});
	switch(breakInfo){ 
	case 0 : state.innerHTML = '정상'; break;
	case 1 : state.innerHTML = '분실'; break;
	case 2 : state.innerHTML = '파손'; break;
	case 3 : state.innerHTML = '교체 예정'; break;
	case 4 : state.innerHTML = '폐기'; break;
	}
	
function bookListBack(){
	location.href="bookList.ju";
}




</script>
</body>
</html>