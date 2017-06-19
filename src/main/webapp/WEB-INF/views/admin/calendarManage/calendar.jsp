<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Insert title here</title>
 
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
 <link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
 <script type="text/javascript" src="/lee/resources/mainMenu/jquery.smartmenus.min.js"></script>
<link rel="stylesheet" href="/lee/resources/mainMenu/css/sm-core-css.css">
<link rel="stylesheet" href="/lee/resources/mainMenu/css/sm-clean/sm-clean.css">
 <style type="text/css">
	body{
		width: 90%;
		margin: auto;
	}
	@media (max-width: 768px) {
		body{
			width: auto;
			margin: 0 10%;
		}
	}
	#mainImg{
		height: 100px;
		background: yellow;
	}
	
	.main-menu-btn {
		position: relative;
		display: inline-block;
		width: 28px;
		height: 28px;
		text-indent: 28px;
		white-space: nowrap;
		overflow: hidden;
		cursor: pointer;
		-webkit-tap-highlight-color: rgba(0,0,0,0);
	}
	/* hamburger icon */
	.main-menu-btn-icon, .main-menu-btn-icon:before, .main-menu-btn-icon:after {
		position: absolute;
		top: 50%;
		left: 2px;
		height: 2px;
		width: 24px;
		background: #bbb;
		-webkit-transition: all 0.25s;
		transition: all 0.25s;
	}
	.main-menu-btn-icon:before {
		content: '';
		top: -7px;
		left: 0;
	}
	.main-menu-btn-icon:after {
		content: '';
		top: 7px;
		left: 0;
	}
	/* x icon */
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon {
		height: 0;
		background: transparent;
	}
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon:before {
		top: 0;
		-webkit-transform: rotate(-45deg);
		transform: rotate(-45deg);
	}
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon:after {
		top: 0;
		-webkit-transform: rotate(45deg);
		transform: rotate(45deg);
	}
	/* hide menu state checkbox (keep it visible to screen readers) */
	#main-menu-state {
		position: absolute;
		width: 1px;
		height: 1px;
		margin: -1px;
		border: 0;
		padding: 0;
		overflow: hidden;
		clip: rect(1px,1px,1px,1px);
	}
	/* hide the menu in mobile view */
	#main-menu-state:not(:checked) ~ #main-menu {
		display: none;
	}
	#main-menu-state:checked ~ #main-menu {
		display: block;
	}
	@media (min-width: 768px) {
		/* hide the button in desktop view */
		.main-menu-btn {
			position: absolute;
			top: -99999px;
		}
		/* always show the menu in desktop view */
		#main-menu-state:not(:checked) ~ #main-menu {
			display: block;
		}
	}
	
	@media (min-width: 768px) {
		#main-menu > li {
			float: none;
			display: table-cell;
			width: 1%;
			text-align: center;
		}
	}
	
	.loginColor{
		color : #0bd392;
	}
	.loginColor:HOVER {
		color: #1aa4ac;
	}
</style>
 
    

 <script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
 
 <!-- /* 캘린더 부분 시작*/ -->
 <link rel='stylesheet' href='/lee/resources/fullcalendar/fullcalendar.css' />
 <link href='/lee/resources/fullcalendar/scheduler.css' rel='stylesheet' />
 <script src='/lee/resources/fullcalendar/lib/jquery-ui.min.js'></script>
 <script src='/lee/resources/fullcalendar/lib/jquery.min.js'></script>
 <script src='/lee/resources/fullcalendar/lib/moment.min.js'></script>
 <script src='/lee/resources/fullcalendar/scheduler.js'></script>
  <script src='/lee/resources/fullcalendar/fullcalendar.js'></script>
   <script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
   <link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
   <link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
 <!-- /* 캘린더 부분 끝*/ -->
 <script type="text/javascript">
	 $(function() {
		$('#main-menu').smartmenus(
			{
				mainMenuSubOffsetX: -1
				, subMenusSubOffsetX: 10
				, subMenusSubOffsetY: 0
			}
		);
	}); 


 
 var datedata;
 var count=0;
 var eventDropStart;
 var eventDropStartmemo;
 var eventDropStop;
 var eventDropStopmemo;
 $(document).ready(function() {
  
  var d = new Date();
  
  var calendar = $('#calendar').fullCalendar({
   header: {
    left: 'today',
    center: 'title',
    right: 'month'
   },
   defaultDate: d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate(),
   monthNames:['01', '02', '03', '04', '05', '06', '07',
     '08', '09', '10', '11', '12'],
   editable: true,
   eventOverlap:false,
   draggable: false,
   selectable: true,
   
   //일정입력
   select: function(start, end, allDay) {
    
  
    var title = "";
    $(function(){
        alertify.prompt("안내", "일정을 입력하세요.",
    			  function(evt, value){
    			    title = value;
    				  calendar.fullCalendar('renderEvent',
    					      {
    						       title: title,
    						       start: start,
    						       end:start,
    						       allDay: allDay,
    						       id: title+start+end,
    						       color: '#1AA4AC'
    					      },
    					      true // make the event "stick"
    					     );
    					     
    							     $.ajax({
    						             url : "addHoliday.ju",
    						             type: "get",
    						             data : {"memo":title,"solar_date":start.format('YYYY-MM-DD')},
    						             success : function(datedata){
    						              $("#ajax").remove();
    						              	
    						                   if(!datedata){
    						                    alert("데이터를 받지 못함");
    						                   }else{
    						                     
    						                	   calendar.fullCalendar('unselect');
    						                   	
    						                   }   
    						             },
    						             error: function(request,status,error){
    						                 
    						                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
    						               }
    						          });
    			  }, // ok function
    			  function(){
    				  console.log("취소함");
    			  } // cancel function
    	);
        })
    
    
    
   },
   //일정선택
   eventClick: function(event,jsEvent,view){

   },
   
   //삭제하기...
   eventDragStop:function(event, jsEvent, ui, view , revertFunc){
	/* drop:function(date, jsEvent, ui, resourceId)  { */ 		
	   		var x = $('#calendarTrash').offset().left;
	   		var y = $('#calendarTrash').offset().top;
	   		var hei = $('#calendarTrash').outerHeight();
	   		var wid =  $('#calendarTrash').outerWidth();
	   		var ex = jsEvent.pageX;
	   		var ey = jsEvent.pageY;
		   /* alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvsent.pageY); */
		    
		    if( (ex >= x && ex <= x+wid) && (ey >= y && ey <= y+hei) ){
		    	
		    	var id = event.id;
		    	/* alert(event.id); */
			    	 $.ajax({
			              url : "delHoliday.ju",
			              type: "get",
			              data : {"memo":event.title,"solar_date":event.start.format('YYYY-MM-DD')},
			              success : function(datedata){
			               $("#ajax").remove();
			               
			               
			                    if(!datedata){
			                     alert("데이터를 받지 못함");
			                    }else{
			                    	
			                    	$('#calendar').fullCalendar('removeEvents',id);
			                    	
			                    }   
			              },
			              error: function(request,status,error){
			                  
			                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			                }
			           });
  			
		    }else{
		    	
		    }
		    
   },
   eventDragStart: function(event, jsEvent, ui, view ){
	  
	  eventDropStart = event.start.format();
	  eventDropStartmemo = event.title;
   },
   //이벤트 드래그로 이동
   eventDrop: function(event, delta, revertFunc) {
	   
	   alertify.confirm("안내", "정말 이동하시겠습니까 ?",
				  function(){
					   $.ajax({
			               url : "moveHolidayFC.ju",
			               type: "get",
			               data : {"memo":eventDropStartmemo,"beforedate":eventDropStart,"afterdate":event.start.format()},
			               dataType:"json",
			               success : function(responseData){
			                   
			                $("#ajax").remove();
			                   result = responseData;
			                   
			                     if(!result){
			                      alert("데이터를 받지 못함");
			                     }else{
			                         console.log('이벤트 이동성공!');
			                     }
			               }
			               , error : function(e) {
							console.log(e);
						}
			            });
				  }, // ok function
				  function(){
					  revertFunc();
				  } // cancel function
		);   
   
     

   },
   eventLimit: true, 
   events: function(start, end, timezone, callback) {
    
    
    var calendar = $("#calendar").fullCalendar("getDate");
    
    $('#calendar').fullCalendar('removeEvents');
   
          $.ajax({
              url : "getHolidayFC.ju",
              type: "get",
              data : {"yr":calendar.format('YYYY')},
              dataType:"json",
              
              success : function(responseData){
                  
               $("#ajax").remove();
                  datedata = responseData.hdto;
                  
                    if(!datedata){
                     alert("데이터를 받지 못함");
                    }else{
                    	
                     	
                      var events = [];
                      for(var i=0 ; i < datedata.length ; i++){
                       
                       if(datedata[i].memo){
                    	   
                        events.push({
                          title:datedata[i].memo,
                          start:datedata[i].solar_Date,
                          editable:true,
                          id: datedata[i].memo+datedata[i].solar_Date+datedata[i].solar_Date,
                          color: '#1AA4AC'
                        });
                        
                       }
                      }
                      count=1;
                      callback(events);
                    }   
              },
              error: function(request,status,error){
                  
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
                }
           });
   }
  }); 
 });
 
 $(function () {
  $('#my-prev-button').click(function() {
   
      $('#calendar').fullCalendar('prev');
      
  });
  
  $('#my-next-button').click(function() {
   
      $('#calendar').fullCalendar('next');
  });
 });
 </script>
</head>
<body>
<header>
<p class="text-left"/>
	<img src="/lee/resources/img/adlogo.png" style=" width:250px;">
	
<div class="row">
		<nav id="main-nav" role="navigation">
			<input id="main-menu-state" type="checkbox" />
			<label class="main-menu-btn" for="main-menu-state">
			  <span class="main-menu-btn-icon"></span> Toggle main menu visibility
			</label>
			<ul id="main-menu" class="sm sm-clean">
				<li><a href="adminIndex.ju"><img src="resources/img/home.png" height="40px"><br>관리자 홈으로</a></li>
				<li><a href="index.ju"><img src="resources/img/lib.png" height="40px"><br>도서관 홈으로</a></li>
				<li><a href="memberList.ju"><img src="resources/img/member.png" height="40px"><br>회원관리</a></li>
				<li><a href="bookList.ju"><img src="resources/img/book.png" height="40px"><br>일반도서관리</a></li>
				<li><a href="elibList.ju"><img src="resources/img/ebook.png" height="40px"><br>전자도서관리</a></li>
				<li><a href="loanbookList.ju"><img src="resources/img/loan.png" height="40px"><br>대출도서관리</a></li>
				<li><a href="adminSeatManage.ju"><img src="resources/img/seat.png" height="40px"><br>이용시설관리</a></li>
				<li><a href="learningList.ju"><img src="resources/img/learn.png" height="40px"><br>교육관리</a></li>
				<li><a href="fedexList.ju"><img src="resources/img/fedex.png" height="40px"><br>택배대출관리</a></li>
				<li><a href="calendar.ju"><img src="resources/img/calendar.png" height="40px"><br>캘린더관리</a></li>
			</ul>
		</nav>
</div> 

</header>
<div class="row">
	<div class="col-md-2">
		<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
	</div>
	<div class="col-md-9">
		
				<button id="my-prev-button" class="btn btn-primary col-md-2" style="background-color:#1AA4AC">
				       이전달</button>
				<button id="my-next-button" class="btn btn-primary col-md-2 col-md-offset-5" style="background-color:#1AA4AC">
				       다음달</button>
			
		<div class="row">
				 <div class="col-md-10"id='calendar'></div>
				 <div class="col-md-2" id='calendarTrash'>
				 <img src="../lee/resources/index/recyclebin.png" style="height:100px;"></div>
		</div>
	</div>		
</div>

</body>
</html>