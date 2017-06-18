<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
<script>
function loadMsg(){
	alertify.alert("NOTICE", "${msg}", function() {
		location.href = "/lee/seatIndex.ju";
	});
}
</script>
<body onload="loadMsg()"></body>