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
            <div class="col-md-12">
               <h2>도서관 장서정보</h2>
               <div class="col-md-9">
                  <h3>도서 장서현황</h3>
               </div>
               <div class="col-md-2">
                  <h5><2017.6월 기준></h5>
               </div>
               <table class="table table-striped" border="1">
                  <tr>
                     <th>구분</th>
                     <th>철학</th>
                     <th>종교</th>
                     <th>인문과학</th>
                     <th>자연과학</th>
                     <th>예술</th>
                     <th>언어</th>
                     <th>문학</th>
                     <th>역사</th>
                     <th>교육</th>
                     <th>잡지</th>
                  </tr>
                  <tr>
                     <th>권 수</th>
                     <th>7</th>
                     <th>6</th>
                     <th>5</th>
                     <th>333</th>
                     <th>?</th>
                     <th>?</th>
                     <th>?</th>
                     <th>?</th>
                     <th>?</th>
                     <th>?</th>
                  </tr>
               </table>
               <div class="row">
                  <hr>
                  <div class="col-md-9">
                     <h3>비도서 장서현황</h3>
                  </div>
                  <div class="col-md-2">
                     <h5><2017.6월 기준></h5>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <table class="table table-striped" border="1">
                        <tr>
                           <th>구분</th>
                           <th>전자도서</th>
                           <th>오디오북</th>
                           <th>E-Magazine</th>
                           <th>교육</th>
                        </tr>
                        <tr>
                           <th>권 수</th>
                           <th>7</th>
                           <th>6</th>
                           <th>6</th>
                           <th>6</th>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>