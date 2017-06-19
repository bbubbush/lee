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
      <fieldset align="center">
      	<legend>주의사항</legend>
      	중복하지 않도록<br>
      	같은 강사 같은시간에 불가<br>
      	같은 강의실 동시사용 불가
      </fieldset>
      <form name="classAdd" action="learningClassAdd.ju" method="POST">
         <table class="table">
            <tr>
               <th>수업명</th>
               <td><input type="text" name="sj_name"></td>
               
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
               
               <th>수업 시간</th>
               <td>
               	<select id="sj_st" name="sj_st">
               		<option value="09:00">09:00</option>
               		<option value="10:00">10:00</option>
               		<option value="11:00">11:00</option>
               		<option value="12:00">12:00</option>
               		<option value="13:00">13:00</option>
               	</select> ~ 
               	<select id="sj_et" name="sj_et">
               		<option value="13:00">13:00</option>
               		<option value="14:00">14:00</option>
               		<option value="15:00">15:00</option>
               		<option value="16:00">16:00</option>
               		<option value="17:00">17:00</option>
               	</select>
             	</td>
            </tr>
            <tr>
               <th>개강날짜</th>
               <td style="position:relative; height:10px;" id="calen"><input type="text" id="cal_1" name="sj_sd"></td>

               <th>종강날짜</th>
               <td style="position:relative; height:10px;" id="calen2"><input type="text" id="cal_2" name="sj_ed"></td> 
            </tr>
            <tr>
               <th>수업설명</th>
               <td><textarea rows="5" cols="30" name="sj_sum"></textarea></td>
               
               <th>최대 수강인원</th>
               <td>
               	<label><input type="radio" name="sj_max" id="rd-5" value="5">5</label>&nbsp;&nbsp;
               	<label><input type="radio" name="sj_max" id="rd-10" value="10">10</label>&nbsp;&nbsp;
               	<label><input type="radio" name="sj_max" id="rd-15" value="15">15</label>&nbsp;&nbsp;
               	<label><input type="radio" name="sj_max" id="rd-20" value="20">20</label><br>
               	<label><input type="radio" name="sj_max" id="rd-5" value="25">25</label>&nbsp;&nbsp;
               	<label><input type="radio" name="sj_max" id="rd-10" value="30">30</label>&nbsp;&nbsp;
               	<label><input type="radio" name="sj_max" id="rd-15" value="35">35</label>&nbsp;&nbsp;
               	<label><input type="radio" name="sj_max" id="rd-20" value="40">40</label>&nbsp;&nbsp;
               </td>
            </tr>
         </table>
         <input type="submit" value="수업등록" class="btn btn-primary btn-lg">
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