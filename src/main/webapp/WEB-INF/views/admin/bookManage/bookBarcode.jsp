<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12" id="submenulabel" style=" background-image: url('/lee/resources/member/img/sul.png')">
		<div style="width: 100%; height: 100%; margin: 0px; padding: 50px; background-color: rgba(26, 164, 172, 0.5);">
			<h2 style="color: white;">도서 바코드</h2>
		</div>
	</div>
					
			<!-- 카드 발급 부분 -->
			<div class="col-md-12" id="displaybarcode" style="padding:10px;">
				<form>
							 
					<input type="hidden" name="barcode" id="barcode_input" value="${barcode_input}">	<!-- 	추후 value에 회원 idx 입력 -->
					
							
				</form>
			</div>
					
				<div class="col-md-12" id="memberIdcardDiv"
						style="">

						<h3 style="font-weight: bolder;">출력 바코드</h3>
						
						
						<div id="memberIdcard" style="margin:10px; padding:50px; ">
						</div>
				</div>
				<div class="col-md-12" id="memberIdcardDiv"
						style="">

						<h3 style="font-weight: bolder;"></h3>
						
						
					<div id="memberIdcard" style="margin:10px; padding:50px; ">
					</div>
				</div>
				
</body>
</html>