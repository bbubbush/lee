<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>
	
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<style type="text/css">
	.btn-primary{
		background-color:#0BD392;
		border-color: #09BD8D;
	}
	.btn-primary:HOVER{
		background-color:#1AA4AC;
		border-color: #3CDBDE;
	}
	
	</style>
    
<script type="text/javascript">
	
	
	</script>
<style>
@media ( min-width :769px) {
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width: 1030px;
	height: 276px;
	}
	
	
}
@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width:100%;
	height: 134px;
	margin-bottom:50px;
	}
	
	
}
</style>
<script>
function elibViwer(el_idx) {
    var popupWidth=screen.availWidth;
    var popupHeight=screen.availHeight;
    var popupSize="width=" + popupWidth + "px,height=" + popupHeight + "px";
    window.open("/lee/eViewer.ju?el_idx="+el_idx, "eViewer", popupSize);
 }

function elibViwer2(el_idx) {
	
	var spt = el_idx.split('#');
    var popupWidth=screen.availWidth;
    var popupHeight=screen.availHeight;
    var popupSize="width=" + popupWidth + "px,height=" + popupHeight + "px";
    /* alert("/lee/eViewer.ju?el_idx="+spt[0]+"#"+spt[1]); */
    window.open("/lee/eViewer.ju?el_idx="+spt[0]+"#"+spt[1], "eViewer", popupSize);
 }

</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm"
				style="padding: 0px; background-color: ">
						
				<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->
				<div id="submenulabel" style="background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px;  background-color: rgba(0, 0, 0, 0.3 );">
						<h1 style="color:white;">전자도서</h1>
					</div>
				</div>		
				<!-- 컨텐츠 실영역 -->
				<h3>E-book</h3>
				<!-- 전자책 -->
				<div class="row" id="loanbook">
<c:set var="eblist" value="${eblist}"/>
<c:set var="bookmark" value="${bookmark}"/>						  
						     <c:choose>
							    <c:when test="${empty eblist}">
							      <div style="width:400px; height:400px;text-align:center;">대출하신 e-book이 없습니다.</div>      
							    </c:when>
							    <c:when test="${eblist ne null}">
							            <c:forEach items="${eblist}" var="list" varStatus="status">
							           			 <div class="col-sm-6 col-md-4">
												     <div class="thumbnail ">
												     <div class="text-center" style="margin:auto; width:100%;height:200px;" id="imgpannel">
												      <img src="${list.el_path}" style="width:200px;height:200px;">
												     
												      </div>
												      <div class="caption ">
												        <h3>${list.el_subject}</h3>
												        <p>
												        대출일 : <fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.lb_sd}" /><br>
												        반납예정일 : <fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.lb_ed}" /><br>
												        연장횟수 : ${list.lb_delay}<br>
												        </p>
												        <p><a class="btn btn-primary" role="button" onclick="elibViwer('${list.el_idx}')">뷰어로 연결</a>
												        </p>
												      </div>
												    </div>
												  </div>
												  <div class="col-md-5">
												  	<div class="thumbnail ">
												     <h3>북마크</h3>
												      <div class="caption ">
												     <c:if test="${bookmark[status.index] ne null}"> 
												     	<c:forEach items="${bookmark[status.index]}" var="bklist">
												     		${bklist}
												     	</c:forEach>
												     </c:if>
												      </div>
												    </div>
												  </div>
												  
							        	</c:forEach>
							    </c:when>
							    
							</c:choose>
				
					
				</div>

				<hr>

		</div>
	</div>
	
</div>
</body>
</html>