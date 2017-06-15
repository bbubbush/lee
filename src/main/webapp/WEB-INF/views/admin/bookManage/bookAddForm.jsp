<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <link rel="stylesheet" type="text/css" href="resources/codebase/dhtmlxcalendar.css"/>
   <script src="resources/codebase/dhtmlxcalendar.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<body onload="doOnLoad()">
<div class="row">
	<div class="col-md-3">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-7">

<h2>책 등록 페이지</h2>
<form name="bookAddForm" action="bookAdd.ju" method="post">
          	<table border="1" cellspacing="1" style="width: 800px">
          		<tr>
					<td rowspan="8" width="300px">
						<img src="${image}" width="300px" height="300px">
						<input type="hidden" name="bk_url" value="${image}">
					</td>
					<th>ISBN</th>
					<td>${isbn}<input type="hidden" name="bk_isbn" value="${isbn}"></td>
				</tr>
				<tr>
					<th>도서명</th>
					<td>${title}<input type="hidden" name="bk_subject" value="${title}"></td>
				</tr>
				<tr>
					<th>저자명</th>
					<td>${author}<input type="hidden" name="bk_writer" value="${author}"></td>
				</tr>
				<tr>
					<th>출판사명</th>
					<td>${publisher}<input type="hidden" name="bk_publisher" value="${publisher}"></td>
				</tr>
				<tr>
					<th>출판일</th>
					<td style="position:relative; height:10px;" id="calen"><input type="text" id="bk_writedate" name="bk_writedate" required></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
					<select name="bk_lg" id="lg" class="form-control" onchange="find()">
			            <option selected="selected" value="all">전체</option>
			            <option value="0">철학</option>
			            <option value="1">종교</option>
			            <option value="2">인문과학</option>
			            <option value="3">자연과학</option>
			            <option value="4">예술</option>
			            <option value="5">언어</option>
			            <option value="6">문학</option>
			            <option value="7">역사</option>
			        </select>
			        	<br>
			        	<div class="md"></div>
			        </td>
				</tr>
          	</table>
          	<table width="800px">
          		<tr>
          			<th width="10%">책 설명</th>
          			<td width="90%">${description}<input type="hidden" name="bk_info" value="${description}"></td>
          		</tr>
          	</table>
			<input type="submit" value="책 등록">
		</form>
		</div>
	</div>
<script type="text/javascript" src="resources/js/bkList.js"></script>
<script>
$("#bkList").addClass('open').children('ul').show();
$("#bkList2").addClass('open').children('ul').show();
var myCalendar;      
function doOnLoad() {      
   
   myCalendar = new dhtmlXCalendarObject("bk_writedate");
   myCalendar.attachEvent("onShow", function(){
      document.getElementById("bk_writedate").readOnly = true; 
   });      
   myCalendar.attachEvent("onHide", function(){});         
}
</script>
</body>
</html>