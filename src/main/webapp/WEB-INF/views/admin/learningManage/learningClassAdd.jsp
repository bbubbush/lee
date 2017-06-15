<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <link rel="stylesheet" type="text/css" href="resources/codebase/dhtmlxcalendar.css"/>
   <script src="resources/codebase/dhtmlxcalendar.js"></script>
   <style>
      #calendar {
         border: 1px solid #dfdfdf;
         font-family: Roboto, Arial, Helvetica;
         font-size: 14px;
         color: #404040;         
      }
   </style>
   </head>
<body onload="doOnLoad()">

<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>

<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-9" >
		<h2>수업 추가하기 페이지</h2>
		<form name="classAdd" action="learningClassAdd.ju" method="POST">
			<table>
				<tr>
					<th>수업명</th>
					<td><input type="text" name="sj_name"></td>
				</tr>
				<tr>
					<th>강사이름</th>
					<td>
						<select name="tc_idx">
						<c:forEach var="dto" items="${list}">
							<option value="${dto.tc_idx}">${dto.tc_name}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>강의실</th>
					<td><input type="text" name="sj_loc"></td>
				</tr>
				<tr>
					<th>개강날짜</th>
					<td style="position:relative; height:10px;" id="calen"><input type="text" id="cal_1" name="sj_sd"></td>
				</tr>
				<tr>
					<th>종강날짜</th>
					<td style="position:relative; height:10px;" id="calen2"><input type="text" id="cal_2" name="sj_ed"></td> 
				</tr>
				<tr>
					<th>수업 시작시간</th>
					<td><input type="text" name="sj_st"></td>
				</tr>
				<tr>
					<th>수업 종료시간</th>
					<td><input type="text" name="sj_et"></td>
				</tr>
				<tr>
					<th>최대 수강인원</th>
					<td><input type="text" name="sj_max"></td>
				</tr>
				<tr>
					<th>수업설명</th>
					<td><textarea rows="10" cols="20" name="sj_sum"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="수업등록">
		</form>
		</div>
	</div>
<script>
$("#learningList").addClass('open').children('ul').show();
$("#learningList2").addClass('open').children('ul').show();
var myCalendar;      
function doOnLoad() {      
   
   myCalendar = new dhtmlXCalendarObject("cal_1");
   myCalendar.attachEvent("onShow", function(){
      document.getElementById("cal_1").readOnly = true; 
   });      
   myCalendar.attachEvent("onHide", function(){});         
   
   myCalendar2 = new dhtmlXCalendarObject("cal_2");
   myCalendar.attachEvent("onShow", function(){
      document.getElementById("cal_2").readOnly = true; 
   });      
   myCalendar.attachEvent("onHide", function(){}); 
   
}
</script>
</body>
</html>