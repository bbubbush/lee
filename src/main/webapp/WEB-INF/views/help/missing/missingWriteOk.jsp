<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<HTML>
<head>
   <script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
   
   <!-- 하위 3개를 적어야 가능, JQ, 부트스트랩 밑에 작성 할 것 -->
   <script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
   <link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
   <link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
</head>
<body>
<script>
alertify.alert("안내",'${msg}',function(){location.href='missingList.ju';});
</script>
</body>
</HTML>