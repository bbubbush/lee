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
span {
    font-weight: bold;
}
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
               <h2>도서관 이용안내</h2>
            </div>
            <img src="/lee/resources/syj/guide.PNG" class="img-responsive"
               style="width: 600px; height: 600px" alt="Image">
         </div>
         <div class="row">
            <div class="col-md-12">
               <h4>1. 도서관 책 이용안내</h4>
               -저희 도서관의 대출이용시간은 09:00부터18:00까지입니다.<br> -도서관 회원에 한 해, 1인당 최대
               3권까지 대출이 가능하며 대출기간은 14일입니다.<br> -도서 연장 신청 기한은 반납예정일 1일전부터 가능하며
               7일단위로 연장이 가능합니다.연체 중인 경우나, 예약 자료인 경우 연장 불가합니다.연장은 2주단위로 1회 가능합니다.<br>
               -도서 예약은 홈페이지 로그인 > 자료 검색 > 해당 도서 검색 > 해당 도서 정보 > 예약하기 클릭 <br>
               -도서 연장은 자료실 안내데스크 방문 하시거나, 도서관 홈페이지 로그인 > 마이페이지 > 대출내역조회 > 도서연장 에서 가능
               합니다 <br> <br>
               <h4>2. 열람실 이용안내</h4>
               -저희 열람실은 07:00부터 23:00까지입니다.<br> -도서관 회원에 한해, 당일 예약할 수 있으며 1인당
               2시간의 기본시간이 주어집니다.<br> -열람실 예약은 도서관 홈페이지 로그인 > 원하는 열람실 클릭 >
               열람실 예약 클릭 <br> -열람실 연장은 도서관 홈페이지 로그인 > 열람실 연장 클릭<br> <br>
               <h4>3. 스터디룸 이용안내</h4>
               -저희 스터디룸은 09:00부터 21:00까지 3파트로 나눠 운영되며, 주말에는 운영하지 않습니다.<br>
               -도서관 회원에 한 해, 2주 전부터 예약이 가능하며 1팀당 4시간의 기본시간이 주어집니다. <br> -스터디룸
               예약은 도서관 홈페이지 로그인 > 스터디룸 예약 클릭<br> -스터디룸 연장은 불가합니다. <br> <br>
               <h4>4. 자료실 이용안내</h4>
               -저희 자료실은 09:00부터 18:00까지입니다. <br> -도서관 회원에 한 해, 당일 예약할 수 있으며,
               1인당 1시간의 기본시간이 주어집니다.<br> -자료실 예약은 도서관 홈페이지 로그인 > 자료실 예약 클릭<br>
               -자료실 연장이 불가합니다.<br> <br>
               <h4>5. E-Book 서비스이용</h4>
               -저희 도서관은 홈페이지 내에서 E-Book 서비스를 운영중입니다.<br> -회원에 한 해, 이용가능하며 한
               사람당 최대 5권 대여 가능하며 기간은 14일 입니다.<br> -북마크 서비스는 한 권당 최대 6개까지
               가능합니다.<br> -E-Book 대여는 한 권당 10명까지 열람 가능하며 해당 도서의 예약이 없을 때 연장이
               가능합니다.<br> -E-Book 예약은 도서관 홈페이지 로그인 > 전자도서관 > 해당컨텐츠 > 예약하기 클릭<br>
               -E-Book 연장은 도서관 홈페이지 로그인 > 전자도서관 > 해당컨텐츠 > 예약하기 클릭 <br> <br>
               <h4>* 도서관에 손실을 가할 경우(연체 및도서 파손)</h4>
               -도서 연체시 그 기간만큼 대출이 불가능하며 5번 누적시 회원이용이 정지됩니다.<br> -도서를 분실 하거나
               구분이 불가능 할 정도로 파손 하였을 경우에도 정지됩니다.<br> -알 수 없는 사유로 정지되었을 경우 관리자용
               이메일로 문의하시거나 연락주시기 바랍니다 ( khmaster2017@gmail.com, 010-5543-4458)<br>
               -사유에 따른 정지기간은 다음 표를 참고하시기 바랍니다.
            </div>
         </div>
         <div class="row">
            <div class="col-md-6">
               <table class="table table-striped" border="1">
                  <tr>
                     <td color="red">사유</td>
                     <td>정지 사유</td>
                  </tr>
                  <tr>
                     <td style=>기물파손</td>
                     <td><ins><span class='text-danger'>5일</span></ins></td>
                  </tr>
                  <tr>
                     <td>도서분실</td>
                     <td><ins><span class='text-danger'>3일</span></ins></td>
                  </tr>
                  <tr>
                     <td>지속적인 연애</td>
                     <td><ins><span class='text-danger'>7일</span></ins></td>
                  </tr>
                  <tr>
                     <td>풍기문란</td>
                     <td><ins><span class='text-danger'>2일</span></ins></td>
                  </tr>
                  <tr>
                     <td>허위사실 유포</td>
                     <td><ins><span class='text-danger'>1일</span></ins></td>
                  </tr>
                  <tr>
                     <td>열람실 내 취식</td>
                     <td><ins><span class='text-danger'>7일</span></ins></td>
                  </tr>
                  <tr>
                     <td>모태솔로</td>
                     <td><ins><span class='text-danger'>10일</span></ins></td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div>
</body>
</html>