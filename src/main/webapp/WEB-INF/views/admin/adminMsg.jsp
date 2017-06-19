<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
 <script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
   <link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
   <link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
<script>
$(function() {
	
	alertify.alert("안내", "${msg}", function(){
		location.href='${page}';
              });
})
</script>
</head>
<body>

</body>
</html>