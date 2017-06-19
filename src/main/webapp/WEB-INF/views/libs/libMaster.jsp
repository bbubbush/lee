<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<style type="text/css">
.name{width:320px;height:320px; padding:200px 1px 1px 1px;}
</style>

<script type="text/javascript"
   src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript">
   
</script>
</head>

<body>
   <div class="row">
      <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
   </div>
   <div class="row">
      <div class="col-md-3">
         <jsp:include page="/WEB-INF/views/anal/analSide.jsp"></jsp:include>
      </div>
      <div class="col-md-9">
         <div class="row">
            <div class="col-md-4">
               <h2>도서관장 인사말</h2>
            </div>



            <div class="col-md-12">
               <h1>
                  <strong><u><span class='text-info'>"반갑습니다."</span><br>
                        <span class='text-primary'>"저희 도서관을 방문해주셔서 감사합니다."</span></u></strong>
               </h1>
            </div>
         </div>
         <div class="row">
            <div class="col-md-5">
               <img src="/lee/resources/syj/master.jpg" class="img-responsive"
                  style="width: 320px; height: 350px" alt="Image">
            </div>
            <div class="col-md-7">
               <div class="row">
                  <div class="name"><h2><br>리북 도서관장 서 영 주</h2></div>
               </div>
            </div>

            <div class="row">
               <div class="col-md-12">
                  <img src="/lee/resources/syj/master3.jpg" class="img-responsive"
                     style="width: 80%; height: 80%" alt="Image"
                     background-attachment:scroll>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>