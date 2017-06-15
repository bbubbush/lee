<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#memberInfo{
	display: none;
}
body{
	width:90%;
}
.button:hover{
  background-color: #eee;
  color: #555;
}

.button:active{
  background: #e9e9e9;
  position: relative;
  top: 1px;
  text-shadow: none;
  box-shadow: 0 1px 1px rgba(0, 0, 0, .3) inset;
}

.cf:before, .cf:after{
    content:"";
    display:table;
}

.cf:after{
    clear:both;
}

.cf{
    zoom:1;
}    
/* Form wrapper styling */
.form-wrapper {
    width: 550px;
    padding: 15px;
    margin: 150px auto 50px auto;
    background: #444;
    background: rgba(0,0,0,.2);
    border-radius: 10px;
    box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
}

/* Form text input */

.form-wrapper input {
    width: 400px;
    height: 40px;
    padding: 5px 5px;
    float: left;    
    font: bold 15px 'lucida sans', 'trebuchet MS', 'Tahoma';
    border: 0;
    background: #eee;
    border-radius: 3px 0 0 3px;      
}

.form-wrapper input:focus {
    outline: 0;
    background: #fff;
    box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
}

.form-wrapper input::-webkit-input-placeholder {
   color: #999;
   font-weight: normal;
   font-style: italic;
}

.form-wrapper input:-moz-placeholder {
    color: #999;
    font-weight: normal;
    font-style: italic;
}

.form-wrapper input:-ms-input-placeholder {
    color: #999;
    font-weight: normal;
    font-style: italic;
}    

/* Form submit button */
.form-wrapper button {
    overflow: visible;
    position: relative;
    float: right;
    border: 0;
    padding: 0;
    cursor: pointer;
    height: 40px;
    width: 110px;
    font: bold 15px/40px 'lucida sans', 'trebuchet MS', 'Tahoma';
    color: #fff;
    text-transform: uppercase;
    background: #d83c3c;
    border-radius: 0 3px 3px 0;      
    text-shadow: 0 -1px 0 rgba(0, 0 ,0, .3);
}   
  
.form-wrapper button:hover{		
    background: #e54040;
}	
  
.form-wrapper button:active,
.form-wrapper button:focus{   
    background: #c42f2f;
	outline: 0;   
}

.form-wrapper button:before { /* left arrow */
    content: '';
    position: absolute;
    border-width: 8px 8px 8px 0;
    border-style: solid solid solid none;
    border-color: transparent #d83c3c transparent;
    top: 12px;
    left: -6px;
}

.form-wrapper button:hover:before{
    border-right-color: #e54040;
}

.form-wrapper button:focus:before,
.form-wrapper button:active:before{
        border-right-color: #c42f2f;
}      

.form-wrapper button::-moz-focus-inner { /* remove extra button spacing for Mozilla Firefox */
    border: 0;
    padding: 0;
}
</style>
</head>
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<body id="okletsgo">
<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	
	<div class="col-md-4" >
		
		<h2>반납 페이지</h2>
		<form name="wrapper" class="form-wrapper cf">
		     <input type="text" name="bk_idx" id="bk_idx" placeholder="반납할 도서코드를 입력해 주세요" required>
		     <button type="button" id="search" data-target="#myModal" data-toggle="modal">Search</button>
		</form> 
		<fieldset align="center">
			<legend>유 의 사 항</legend>
			1. ISBN이 아닌 도서관에 등록된 바코드를 찍어주세요.<br>
			2. 바코드기를 통해 입력하는 방법이 유용합니다.<br>
			3. 대출중이 아닌 도서는 검색되지 않습니다.
		</fieldset>
		</div>
	</div>
		<div class="container">
		  <!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">책 정보</h4>
		        </div>
		        <div class="modal-body">
		        
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		</div> 
<script>
$("#loanList").addClass('open').children('ul').show();
$("#loanList2").addClass('open').children('ul').show();
document.wrapper.bk_idx.focus();
$("#search").click(function() {
	
	var params = new Object();
	params.bk_idx = document.getElementById("bk_idx").value;
	$.ajax({
		type : "GET",
		url : "loanbookInfo2.ju",
		data : params,
		success : function(args) {
			$(".modal-body").html(args);
		}
	});
});
		
</script>
</body>
</html>