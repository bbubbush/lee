<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

/* #tarrow {
  animation-duration: 2s;
  animation-name: slidein;
  animation-iteration-count: infinite;
  animation-direction: reverse;
} */

/* @keyframes slidein {
  from {
    padding-left:400px;
    padding-right:0px;
  }

  to {
    padding-left:0px;
    padding-right:400px;
  } */
}
</style>

<script>


var tbx;
var tdetail ="";
var pt;
function trackbook(tcode){
	
	$.ajax({
		url:"http://tracking.sweettracker.net/tracking",
		type:"get",
		data:{"t_key":"lEe3wbrNRikejA5XajFc0A","t_code":"08","t_invoice":tcode},
		dataType:"xml",
		success: function(xmldata){
			if(xmldata){
				console.log(xmldata);
				tbx = xmldata;
				var tlevelarr = tbx.getElementsByTagName('level');
				var tlevel = parseInt(tlevelarr[0].innerHTML)*16 + 4;
				tdetail = tbx.getElementsByTagName('tracking_details');
				pt = tlevel*4+70;
				$("#tprogresspt").html("<h3>배송진행률 : "+tlevel + "%</h3>");
				$("#tprogress").css("width",tlevel+"%");
				
				var thtml ="";
				for(var i=0 ; i<tdetail.length ; i++){
					
					
					thtml += "상태 : "+tdetail[i].getElementsByTagName('trans_kind')[0].innerHTML+"<br>";
					thtml += "위치 : "+tdetail[i].getElementsByTagName('trans_where')[0].innerHTML+"<br>";
					thtml += "지점번호 : "+tdetail[i].getElementsByTagName('trans_telno')[0].innerHTML+"<br>";
					thtml += "처리일시 : "+tdetail[i].getElementsByTagName('trans_time')[0].innerHTML+"<br>";
					
					if(i!=(tdetail.length-1)){
						thtml += "<span class='glyphicon glyphicon-arrow-down' aria-hidden='true'></span><br>"
					};
					
				}
				$("#tracking-info").html(thtml);
				$(function() {
				    function swing() {
				        $('#tarrow').animate({'padding-left':'70px'},600).animate({'padding-left':pt+'px'},1000,swing);
				        $('#tarrow').css('padding-left','70px');
				    }
				    swing();
				});
			}
			else{
				console.log('값 못받아옴....ㅠㅜ');
			}
		},error: function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}
</script>
</head>
<body>
<!-- 배송추적 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h1 class="modal-title" id="myModalLabel">배송추적</h1>
        <h1>
        
        <span class="glyphicon glyphicon-gift" aria-hidden="true"style="left:40px;position:absolute;top:83px;"></span>
      <span class="glyphicon glyphicon-arrow-right" id="tarrow" aria-hidden="true"></span>
      
      <span class="glyphicon glyphicon-home" aria-hidden="true" style="right:30px;position:absolute;top:83px;"></span>
      
      	</h1>
        	<div id="tprogresspt"></div>
	        
      </div>
      <!-- 상세정보 아코디언 -->
      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			  <div class="panel panel-default">
			    <div class="panel-heading" role="tab" id="headingOne" >
			      <h4 class="panel-title">
			        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
			        	  <h3> <span class="glyphicon glyphicon glyphicon-zoom-in" aria-hidden="true"></span> 상세정보</h3>
			        </a>
			      </h4>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			      <div class="panel-body">
			        	<div class="progress">
						  <div class="progress-bar progress-bar-success progress-bar-striped active" id="tprogress" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
						    <span class="sr-only"></span>
						  </div>
						</div>
			        <div class="modal-body" id="tracking-info">
			      </div>
			      </div>
			    </div>
			  </div>
</div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


	<%@include file="../header.jsp"%>
	<div class="row">
	
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm"
				style="padding: 0px; margih:0;">
						
				<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->
				<div id="submenulabel" style="background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; marg in:0px; padding:50px;  background-color: rgba(0, 0, 0, 0.3 );">
						<h1 style="color:white;">대출 / 예약</h1>
					</div>
				</div>
				<!-- 컨텐츠 실영역 -->
				<h3>대출</h3>
<!-- 대출 -->
<c:set var="loanlist" value="${loanlist}"/>
<div class="row" id="loanbook">
<c:choose>
    <c:when test="${empty loanlist}">
        대출하신 책이 없습니다.    
    </c:when>
    <c:when test="${loanlist ne null}">
            <c:forEach items="${loanlist}" var="list">
           			 <div class="col-sm-6 col-md-4">
					     <div class="thumbnail ">
					     <div class="text-center" style="margin:auto; width:100%;height:200px;" id="imgpannel">
					      <img src="${list.bk_url}" style="width:200px;height:200px;">
					     
					      </div>
					      <div class="caption ">
					        <h3>${list.bk_subject}</h3>
					        <p>
					        대출일 : ${list.lb_sd}<br>
					        반납예정일 : ${list.lb_ed}<br>
					        기타사항 : ${list.lb_etc }<br>
					        연장횟수 : ${list.lb_delay}<br>
					        </p>
					        <p><a href="#" class="btn btn-primary" role="button">대출연장</a></p>
					      </div>
					    </div>
					  </div>
        	</c:forEach>
    </c:when>
    
</c:choose>
</div>


<!-- 택배대출 -->
		<h3>택배대출</h3>
<c:set var="fedexlist" value="${fedexlist}"/>
<div class="row" id="fedexbook">
<c:choose>
   <c:when test="${empty fedexlist}">
        대출하신 책이 없습니다.    
   </c:when>
    <c:when test="${fedexlist ne null}">
            <c:forEach items="${fedexlist}" var="list">
           			 <div class="col-sm-6 col-md-4">
					     <div class="thumbnail ">
					     <div class="text-center" style="margin:auto; width:100%;height:200px;" id="imgpannel">
					      <img src="${list.bk_url}" style="width:200px;height:200px;">
					     
					     </div>
					      <div class="caption">
					        <h3>책제목 대출2</h3>
 
					        	<c:if test="${empty list.fedex_num}">
						        		 <p>
									       	대출일 : ${list.lb_sd}<br>
									        반납예정일 : ${list.lb_ed}<br>
									        기타사항 : ${list.lb_etc }<br>
									        연장횟수 : ${list.lb_delay}<br>
						       
							        	</p>
							        	<p>
							        		<a href="#" class="btn btn-primary" role="button">택배취소</a>
						        		</p>
					        	</c:if>
					       		<c:if test="${list.fedex_num ne null}">
							       		 <p>
										       	대출일 : ${list.lb_sd}<br>
										        반납예정일 : ${list.lb_ed}<br>
										        기타사항 : ${list.lb_etc }<br>
										        연장횟수 : ${list.lb_delay}<br>
										        운송장번호 : ${list.fedex_num}<br>
							        	</p>
							        	<p>
							       			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" onclick='trackbook(${list.fedex_num})'>
		  									배송추적
											</button>
										</p>
					       		</c:if>
					        	
					       
					        </div>
					    </div>
					  </div>
        	</c:forEach>
    </c:when>
    
</c:choose>
</div>
			
<hr>			
<!-- 예약 -->
<h3>예약</h3>	
<c:set var="yylist" value="${yeyaklist}"/>

<div class="row" id="yeyakbook">
<c:choose>
   <c:when test="${empty yylist}">
        대출하신 책이 없습니다.    
   </c:when>
   <c:when test="${yylist ne null}">
	   <c:forEach items="${yylist}" var="list">
			   	<div class="col-sm-6 col-md-4">
				    <div class="thumbnail ">
				      <div class="text-center" style="margin:auto; width:100%;height:200px; position:relative " id="imgpannel">
				      <img src="${list.bk_url}" style="width:200px;height:200px; position:absolute; z-index:0; ">
					      <c:if test="${list.ye_sunbun == 1}">
				      		<c:choose>
					      		<c:when test="${list.bk_take==0}">
					      		 	<img src="/lee/resources/member/img/canloan.png" alt="..." style="opacity:0.5; width:200px;height:200px; z-index:1; ">
					      	 	</c:when>
					      	 	<c:when test="${list.bk_take==1}">
					      	 		<img src="/lee/resources/member/img/loaning.png" alt="..." style="opacity:0.5; width:200px;height:200px; z-index:1; ">
					      	 	</c:when>
				      	 	</c:choose>
					      </c:if>
					      <c:if test="${list.ye_sunbun > 1}">
				      		
					      	 		<img src="/lee/resources/member/img/loaning.png" alt="..." style="opacity:0.5; width:200px;height:200px; z-index:1; ">
					      	
					      </c:if>
					      
				      </div>
				      
				      <div class="caption">
				        <h3>${list.bk_subject}</h3>
				        <p>
				        예약순번 : ${list.ye_sunbun}<br>
				        
				        </p>
				        <p><a href="#" class="btn btn-primary" role="button">예약취소하기</a></p>
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
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>
</div>
</body>
</html>