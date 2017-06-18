<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
		table>tbody>tr>th{
			text-align: right;
		}
		textarea{
			resize: none;
		}
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="/lee/resources/js/alertifyjs/alertify.min.js"></script>
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/alertify.min.css">
	<link rel="stylesheet" href="/lee/resources/js/alertifyjs/css/themes/default.min.css">
	
	<script type="text/javascript">
	$(function() {
		$("#bkList").addClass("open").children("ul").show();
		$("#bkList3").addClass("open").children("ul").show();
		
		var el_subject="";
		var el_writer="";
		var el_pub="";
		var el_lg="";
		var el_md="";
		var order="";
		
		changeGrup();
		noList(1);
		
		$("#searchButton").click(
			function() {
				search(1);
			}
		);
	}); // 기본 함수
	
	/*검색 그룹에 따른 대분류 ajax*/
	function changeGrup() {
		$("input[name=group]").change(
			function() {
				var groupNum=$("input[name=group]:checked").val();
				if(groupNum==0){
					var cateLgSelect='<select id="cateLg" name="cateMd" class="form-control" disabled="disabled"><option value="99" selected="selected">전체</option></select>';
					$("#cateMd").parent().parent().children("td").eq(0).html(cateLgSelect);
					var cateMdOption="<option value='99' selected='selected'>전체</option>";
					$("#cateMd").html(cateMdOption);
					$("#cateMd").prop("disabled", "disabled");
				}
				else{
					$("#cateMd").removeAttr("disabled");
					$.ajax({
						type : "GET"
						, url : "elibGrupLg.ju"
						, data : {groupNum : groupNum, admin : "list"}
						, dataType : "json"
						, success: function(data){
							$("#cateMd").parent().parent().children("td").eq(0).html(data.cateLg);
							changeLg();
						}
					});
				} // else
			} // change function
		);
		$("input[name=group]").eq(0).click();
	}
	/*검색 소분류 ajax*/
	function changeLg() {
		$("#cateLg").change(
			function() {
				var cateLgVal=$("#cateLg").val();
				$.ajax({
					type : "GET"
					, url : "elibCate.ju"
					, data : {cateLgVal : cateLgVal}
					, dataType : "json"
					, success: function(data){
						var cateMdArr=data.cateMd;
						var cateMdOption="<optgroup><option value='99'>전체</option></optgroup><optgroup>"
						if(cateMdArr!=null){
							for(var i=0 ; i<cateMdArr.length ; i++){
								cateMdOption+="<option value='" + i + "'>" + cateMdArr[i] + "</option>";
							}
						} // null if
						cateMdOption+="</optgroup>";
						$("#cateMd").html(cateMdOption);
					} // success function
				});
			}
		);
		$("#cateLg").change();
	}
	
	/*미검색*/
	function noList(page) {
		$.ajax({
			type : "GET"
			, url : "elibNoList.ju"
			, data : {page : page}
			, dataType : "json"
			, success: function(data){
				var elibArr=data.elibArr;
				var members=data.members;
				var intoHTML="";
				if(elibArr.length==0){
					intoHTML='<div class="alert alert-warning text-center" role="alert">등록 자료가 없습니다.</div>';
				}
				for(var i=0 ; i<elibArr.length ; i++){
					intoHTML+='<div class="panel panel-default">';
					intoHTML+='	<div class="panel-heading" role="tab" id="' + elibArr[i].el_idx + 'Header">';
					intoHTML+='		<h4 class="panel-title">';
					intoHTML+='			<a data-toggle="collapse" data-parent="#accordion" href="#' + elibArr[i].el_idx + '" aria-expanded="true" aria-controls="' + elibArr[i].el_idx + '">';
					intoHTML+=elibArr[i].el_subject;
					intoHTML+='			</a>';
					intoHTML+='		</h4>';
					intoHTML+='	</div>';
					intoHTML+='	<div id="' + elibArr[i].el_idx + '" class="panel-collapse collapse " role="tabpanel" aria-labelledby="' + elibArr[i].el_idx + 'Header">';
					intoHTML+='		<div class="panel-body">';
					intoHTML+='			<div class="row">';
					intoHTML+='				<div class="col-md-3">';
					intoHTML+='					<img src="' + elibArr[i].el_path + '" style="width: 200px; height: auto;">';
					intoHTML+='				</div>';
					intoHTML+='				<div class="col-md-9">';
					intoHTML+='					<table class="table table-bordered table-hover contentTable">';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">IDX</th>';
					intoHTML+='							<td class="col-md-8">';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_idx + '" disabled="disabled" data-idx="' +elibArr[i].el_idx+ '">'; 
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">제목</th>';
					intoHTML+='							<td class="col-md-8">';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_subject + '" disabled="disabled" data-subject="' +elibArr[i].el_subject+ '">'; 
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">저자</th>';
					intoHTML+='							<td class="col-md-8">';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_writer + '" disabled="disabled" data-writer="' +elibArr[i].el_writer+ '">'; 
					intoHTML+='							</td>'; 
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">출판사</th>';
					intoHTML+='							<td class="col-md-8">';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_pub + '" disabled="disabled" data-pub="' +elibArr[i].el_pub+ '">'; 
					intoHTML+='							</td>'; 
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">간략소개</th>';
					intoHTML+='							<td class="col-md-8">';
					intoHTML+='								<textarea class="form-control" rows="3"" disabled="disabled" data-info="' +elibArr[i].el_info+ '">' +elibArr[i].el_info+ '</textarea>';
					intoHTML+='							</td>'; 
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">구분</th>';
					intoHTML+='							<td class="col-md-8">';
					intoHTML+='								<label class="checkbox-inline">';
					if(elibArr[i].el_idx.indexOf("EB")=="0"){intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="7" checked="checked"> 전자도서';}
					else {												intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="7" > 전자도서'; }	
					intoHTML+='								</label>';
					intoHTML+='								<label class="checkbox-inline">';
					if(elibArr[i].el_idx.indexOf("EM")=="0"){intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="8" checked="checked"> 전자잡지';}
					else {												intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="8" > 전자잡지'; }	
					intoHTML+='								</label>';
					intoHTML+='								<label class="checkbox-inline">';
					if(elibArr[i].el_idx.indexOf("EE")=="0"){intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="9" checked="checked"> e-교육';}
					else {												intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="9" > e-교육'; }	
					intoHTML+='								</label>';
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<td id="tdLg_'+i+'" data-lg="' +elibArr[i].el_lg+ '" class="col-md-3">';
					intoHTML+=data.cateLg[i];
					intoHTML+='							</td>';
					intoHTML+='							<td id="tdMd_'+i+'" data-md="' +elibArr[i].el_md+ '" class="col-md-8">';
					intoHTML+=data.cateMd[i];
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">추천인 IDX</th>';
					intoHTML+='							<td class="col-md-8">' + elibArr[i].el_recommend.split("~").join("<br>") + '</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">추천수</th>';
					intoHTML+='							<td class="col-md-8">' + elibArr[i].el_recocount + '</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th class="col-md-3">대여 회원 IDX</th>';
					intoHTML+='							<td class="col-md-8">' + members[i].split("~").join("<br>") + '</td>';
					intoHTML+='						</tr>';
					intoHTML+='					</table>';
					intoHTML+='				</div> <!-- table 위 div -->';
					intoHTML+='			</div> <!-- 표지, 표 row -->';
					intoHTML+='			<div class="row text-center">';
					intoHTML+='				<button type="button" class="btn btn-default" onClick="eViewer(\''+elibArr[i].el_idx+'\')">뷰어로 보기</button>';
					intoHTML+='				<button type="button" class="btn btn-warning">수정</button>';
					intoHTML+='				<button type="button" class="btn btn-success" disabled="disabled">완료</button>';
					intoHTML+='				<button type="button" class="btn btn-danger">삭제</button>';
					intoHTML+='			</div>';
					intoHTML+='		</div> <!-- panel-body -->';
					intoHTML+='	</div> <!-- collapse -->';
					intoHTML+='</div> <!-- panel-default -->';
				}
				$("#accordion").html(intoHTML);
				$("#pagingDiv").html(data.paging);
				for(var i=0 ; i<elibArr.length ; i++){
					$("#cateLg_"+i).val(elibArr[i].el_lg).prop("selected", "selected").prop("disabled", "disabled");
					$("#cateMd_"+i).prop("disabled", "disabled");
				}
				$(".group").prop("disabled", "disabled");
				
				$("#pagingDiv>ul>li").removeClass("active");
				var pagingLength=$("#pagingDiv>ul>li").length;
				for(var i=0 ; i<pagingLength ; i++){
					if( $("#pagingDiv>ul>li").eq(i).data("page")==page ){
						$("#pagingDiv>ul>li").eq(i).addClass("active");
					}
				}
				
				$("#pagingDiv>ul>li").click(
					function() {
						var page=$(this).data("page");
						/*해당 버튼 사용 불가*/
						if($(this).hasClass("disabled")==true || $(this).hasClass("active")==true){
							return null;
						}
						$("body").scrollTop(0);
						/*<< >> 판단*/
						if( page=="before" || page=="after" ){
							if( page=="before" ){ page=$(this).next().data("page")-1; }
							else if( page=="after" ){ page=$(this).prev().data("page")+1; }
						}
						else{
							$("#pagingDiv>ul>li").removeClass("active");
							$(this).addClass("active");
						}
						noList(page);
					} // click function
				); // 페이징 click
				
				/*길이 제한 걸기*/
				$("input[type=text]").keyup(
					function(event) {
						if($(this).val().length > 30) {
							$(this).val($(this).val().substring(0, 30));
						}
					}
				);
				$("textarea").keyup(
					function(event) {
						if($(this).val().length > 1000) {
							$(this).val($(this).val().substring(0, 1000));
						}
					}
				);

				// 삭제 후 다시 자기 페이지로
				$(".btn-danger").click(
					function() {
						var page=$("#pagingDiv>ul>li.active").data("page");
						var num=$(".btn-danger").index(this);
						var el_idx=$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").val();
						
						alertify.confirm("안내", "해당 전자도서가 삭제됩니다. <br>삭제 하시겠습니까?",
							function(){
								$.ajax({
									type : "GET"
									, url : "elibDelete.ju"
									, data : {el_idx : el_idx}
									, dataType : "json"
									, success: function(data){
										noList(page);
										alertify.alert("타이틀", "삭제가 완료 되었습니다."
											, function() {
												alertify.warning("전자도서를 삭제 완료");
											}
										);
									} // success function
								}); // ajax 끝
							}, // ok function
							function(){
								alertify.message("전자도서 삭제 취소");
							} // cancel function
						); // confirm
						
					} // danger function
				); // danger click
				
				var cateLg="";
				var cateMd="";
				// 컨텐츠 수정
				$(".btn-warning").click(
					function() {
						var num=$(".btn-warning").index(this);
						var text=$(".btn-warning").eq(num).text();
						if(text=="수정"){
							$(".btn-success").eq(num).removeAttr("disabled");
							$(".btn-warning").eq(num).text("취소");
							$("input[name=contentGroup_"+num+"]").removeAttr("disabled");
							$("#cateLg_"+num).removeAttr("disabled");
							$("#cateMd_"+num).removeAttr("disabled");
							contentGroup(num);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").removeAttr("disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").removeAttr("disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").removeAttr("disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").removeAttr("disabled");
							cateLg=$("#tdLg_"+num).html();
							cateMd=$("#tdMd_"+num).html();
							alertify.alert("안내", "수정 모드"
								, function(){
									alertify.message("전자도서 수정 모드");
								}
							);
						}
						else if(text=="취소"){
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").data("subject")).prop("disabled", "disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").data("writer")).prop("disabled", "disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").data("pub")).prop("disabled", "disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").data("info")).prop("disabled", "disabled");
							var gropuNum=$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").data("idx").substring(0, 2);
							if(gropuNum=="EB"){
								gropuNum=0;
							}
							else if(gropuNum=="EM"){
								gropuNum=1;
							}
							else if(gropuNum=="EE"){
								gropuNum=2;
							}
							$("input[name=contentGroup_" +num+ "]").eq(gropuNum).prop("checked", "checked");
							$("input[name=contentGroup_" +num+ "]").prop("disabled", "disabled");
							$("#tdLg_"+num).html(cateLg);
							$("#cateLg_"+num)
								.val($("#tdLg_"+num).data("lg"))
								.prop("selected", "selected").prop("disabled", "disabled");
							$("#tdMd_"+num).html(cateMd);
							$("#cateMd_"+num)
								.val($("#tdMd_"+num).data("md"))
								.prop("selected", "selected").prop("disabled", "disabled");
							
							$(".btn-success").eq(num).prop("disabled", "disabled");
							$(".btn-warning").eq(num).text("수정");
							alertify.alert("안내", "수정 모드 취소"
								, function() {
									alertify.message("전자도서 수정 취소");
								}
							);
						}
					} // warning function
				); // warning click
				
				// 컨텐츠 완료
				$(".btn-success").click(
					function() {
						var num=$(".btn-success").index(this);
						
						var el_idx=$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").val();
						var el_subject=$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").val();
						var el_writer=$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").val();
						var el_pub=$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").val();
						var el_info=$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").val();
						var groupNum=$(".contentTable:eq("+num+")>tbody>tr>td:eq(5)>label>input[name=contentGroup_"+num+"]:checked").val();
						var el_lg=$("#cateLg_"+num).val();
						var el_md=$("#cateMd_"+num).val();

						if(el_subject.length==0){
							alertify.alert("Error", "제목을 입력하지 않으셨습니다."
								, function() {
									alertify.message("제목을 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").focus();
							return null;
						}
						if(el_writer.length==0){
							alertify.alert("Error", "저자를 입력하지 않으셨습니다."
								, function() {
									alertify.message("저자를 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").focus();
							return null;
						}
						if(el_pub.length==0){
							alertify.alert("Error", "출판사를 입력하지 않으셨습니다."
								, function() {
									alertify.message("출판사를 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").focus();
							return null;
						}
						if(el_info.length==0){
							alertify.alert("Error", "책정보를 입력하지 않으셨습니다."
								, function() {
									alertify.message("책정보를 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").focus();
							return null;
						}
						
						$.ajax({
							type : "GET"
							, url : "elibUpdate.ju"
							, data : {el_idx : el_idx, el_subject : el_subject, el_writer : el_writer, el_pub : el_pub, el_info : el_info, groupNum : groupNum, el_lg : el_lg, el_md : el_md}
							, dataType : "json"
							, success: function(data){
								$(".panel-title:eq(" +num+ ")>a").text(data.elibArr.el_subject);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").val(data.elibArr.el_idx).data("idx", data.elibArr.el_idx);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").prop("disabled", "disabled").val(data.elibArr.el_subject).data("subject", data.elibArr.el_subject);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").prop("disabled", "disabled").val(data.elibArr.el_writer).data("writer", data.elibArr.el_writer);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").prop("disabled", "disabled").val(data.elibArr.el_pub).data("pub", data.elibArr.el_pub);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").prop("disabled", "disabled").val(data.elibArr.el_info).data("info", data.elibArr.el_info);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(5)>label>input[name=contentGroup_"+num+"]:checked").prop("disabled", "disabled");
								$("#cateLg_"+num).prop("disabled", "disabled");
								$("#cateMd_"+num).prop("disabled", "disabled");
								$("#tdLg_"+num).data("md", data.elibArr.el_md);
								$("#tdMd_"+num).data("md", data.elibArr.el_md);
								
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(10)").html(data.members);
								
								cateLg=$("#tdLg_"+num).html();
								cateMd=$("#tdMd_"+num).html();
								
								alertify.alert("안내", "해당 전자도서 수정이 완료 되었습니다."
									, function() {
										alertify.success("전자도서 수정 완료");
									}
								);
								
								$(".btn-warning").eq(num).text("수정");
								$(".btn-success").eq(num).prop("disabled", "disabled");
							} // success
						});
						
					} // success function
				); // success click
				
			} // success function
		});
	} // noList function
	
	/*컨텐츠 내 수정 그룹 선택*/
	function contentGroup(num) {
		$("input[name=contentGroup_"+num+"]").change(
			function() {
				var groupNum=$("input[name=contentGroup_"+num+"]:checked").val();
				$.ajax({
					type : "GET"
					, url : "contentGrup.ju"
					, data : {groupNum : groupNum, num : num}
					, dataType : "json"
					, success: function(data){
						$("#tdLg_"+num).html(data.cateLg);
						contentLg(num);
						$("#cateLg_"+num).change();
					} // success
				}); // ajax
			} // function
		) // click
	} // contentGroup function
	
	
	
	/*컨텐츠 내 수정 대분류 선택*/
	function contentLg(num) {
		$("#cateLg_"+num).change(
			function() {
				var cateLgVal=$("#cateLg_"+num).val();
				$.ajax({
					type : "GET"
					, url : "elibCate.ju"
					, data : {cateLgVal : cateLgVal}
					, dataType : "json"
					, success: function(data){
						var cateMdArr=data.cateMd;
						var cateMdOption="<select id='cateMd_"+num+"' name='cateMd_"+num+"' class='form-control'>"
						for(var i=0 ; i<cateMdArr.length ; i++){
							cateMdOption+="<option value='" + i + "'>" + cateMdArr[i] + "</option>";
						}
						cateMdOption+="</select>"
						$("#tdMd_"+num).html(cateMdOption);
					}
				});
			}
		);
	}
	
	/*검색 실행*/
	function search(page) {
		el_subject=$("input[name=el_subject]").val();
		el_writer=$("input[name=el_writer]").val();
		el_pub=$("input[name=el_pub]").val();
		el_lg=$("#cateLg").val();
		el_md=$("#cateMd").val();
		order=$("input[name=order]:checked").val();
		$.ajax({
			type : "GET"
			, url : "elibAdminSearch.ju"
			, data : {el_subject : el_subject, el_writer : el_writer, el_pub : el_pub, el_lg : el_lg, el_md : el_md, order : order, page : page}
			, dataType : "json"
			, success: function(data){
				var elibArr=data.elibArr;
				var members=data.members;
				var intoHTML="";
				if(elibArr.length==0){
					intoHTML='<div class="alert alert-warning text-center" role="alert">검색 결과가 없습니다.</div>';
				}
				for(var i=0 ; i<elibArr.length ; i++){
					intoHTML+='<div class="panel panel-default">';
					intoHTML+='	<div class="panel-heading" role="tab" id="' + elibArr[i].el_idx + 'Header">';
					intoHTML+='		<h4 class="panel-title">';
					intoHTML+='			<a data-toggle="collapse" data-parent="#accordion" href="#' + elibArr[i].el_idx + '" aria-expanded="true" aria-controls="' + elibArr[i].el_idx + '">';
					intoHTML+=elibArr[i].el_subject;
					intoHTML+='			</a>';
					intoHTML+='		</h4>';
					intoHTML+='	</div>';
					intoHTML+='	<div id="' + elibArr[i].el_idx + '" class="panel-collapse collapse " role="tabpanel" aria-labelledby="' + elibArr[i].el_idx + 'Header">';
					intoHTML+='		<div class="panel-body">';
					intoHTML+='			<div class="row">';
					intoHTML+='				<div class="col-md-3">';
					intoHTML+='					<img src="' + elibArr[i].el_path + '" style="width: 200px; height: auto;">';
					intoHTML+='				</div>';
					intoHTML+='				<div class="col-md-9">';
					intoHTML+='					<table class="table table-bordered table-hover contentTable">';
					intoHTML+='						<tr>';
					intoHTML+='							<th>IDX</th>';
					intoHTML+='							<td>';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_idx + '" disabled="disabled" data-idx="' +elibArr[i].el_idx+ '">'; 
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>제목</th>';
					intoHTML+='							<td>';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_subject + '" disabled="disabled" data-subject="' +elibArr[i].el_subject+ '">'; 
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>저자</th>';
					intoHTML+='							<td>';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_writer + '" disabled="disabled" data-writer="' +elibArr[i].el_writer+ '">'; 
					intoHTML+='							</td>'; 
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>출판사</th>';
					intoHTML+='							<td>';
					intoHTML+='								<input type="text" class="form-control" value="'+ elibArr[i].el_pub + '" disabled="disabled" data-pub="' +elibArr[i].el_pub+ '">'; 
					intoHTML+='							</td>'; 
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>간략소개</th>';
					intoHTML+='							<td>';
					intoHTML+='								<textarea class="form-control" rows="3"" disabled="disabled" data-info="' +elibArr[i].el_info+ '">' +elibArr[i].el_info+ '</textarea>';
					intoHTML+='							</td>'; 
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>구분</th>';
					intoHTML+='							<td>';
					intoHTML+='								<label class="checkbox-inline">';
					if(elibArr[i].el_idx.indexOf("EB")=="0"){intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="7" checked="checked"> 전자도서';}
					else {												intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="7" > 전자도서'; }	
					intoHTML+='								</label>';
					intoHTML+='								<label class="checkbox-inline">';
					if(elibArr[i].el_idx.indexOf("EM")=="0"){intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="8" checked="checked"> 전자잡지';}
					else {												intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="8" > 전자잡지'; }	
					intoHTML+='								</label>';
					intoHTML+='								<label class="checkbox-inline">';
					if(elibArr[i].el_idx.indexOf("EE")=="0"){intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="9" checked="checked"> e-교육';}
					else {												intoHTML+='<input type="radio" class="group" name="contentGroup_' +i+ '"  value="9" > e-교육'; }	
					intoHTML+='								</label>';
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<td id="tdLg_'+i+'" data-lg="' +elibArr[i].el_lg+ '">';
					intoHTML+=data.cateLg[i];
					intoHTML+='							</td>';
					intoHTML+='							<td id="tdMd_'+i+'" data-md="' +elibArr[i].el_md+ '">';
					intoHTML+=data.cateMd[i];
					intoHTML+='							</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>추천인 IDX</th>';
					intoHTML+='							<td>' + elibArr[i].el_recommend.split("~").join("<br>") + '</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>추천수</th>';
					intoHTML+='							<td>' + elibArr[i].el_recocount + '</td>';
					intoHTML+='						</tr>';
					intoHTML+='						<tr>';
					intoHTML+='							<th>대여 회원 IDX</th>';
					intoHTML+='							<td>' + members[i].split("~").join("<br>") + '</td>';
					intoHTML+='						</tr>';
					intoHTML+='					</table>';
					intoHTML+='				</div> <!-- table 위 div -->';
					intoHTML+='			</div> <!-- 표지, 표 row -->';
					intoHTML+='			<div class="row text-center">';
					intoHTML+='				<button type="button" class="btn btn-default" onClick="eViewer(\''+elibArr[i].el_idx+'\')">뷰어로 보기</button>';
					intoHTML+='				<button type="button" class="btn btn-warning">수정</button>';
					intoHTML+='				<button type="button" class="btn btn-success" disabled="disabled">완료</button>';
					intoHTML+='				<button type="button" class="btn btn-danger">삭제</button>';
					intoHTML+='			</div>';
					intoHTML+='		</div> <!-- panel-body -->';
					intoHTML+='	</div> <!-- collapse -->';
					intoHTML+='</div> <!-- panel-default -->';
				}
				$("#accordion").html(intoHTML);
				$("#pagingDiv").html(data.paging);
				for(var i=0 ; i<elibArr.length ; i++){
					$("#cateLg_"+i).val(elibArr[i].el_lg).prop("selected", "selected").prop("disabled", "disabled");
					$("#cateMd_"+i).prop("disabled", "disabled");
				}
				$(".group").prop("disabled", "disabled");
				
				$("#pagingDiv>ul>li").removeClass("active");
				var pagingLength=$("#pagingDiv>ul>li").length;
				for(var i=0 ; i<pagingLength ; i++){
					if( $("#pagingDiv>ul>li").eq(i).data("page")==page ){
						$("#pagingDiv>ul>li").eq(i).addClass("active");
					}
				}
				
				$("#pagingDiv>ul>li").click(
					function() {
						var page=$(this).data("page");
						/*해당 버튼 사용 불가*/
						if($(this).hasClass("disabled")==true || $(this).hasClass("active")==true){
							return null;
						}
						$("body").scrollTop(0);
						/*<< >> 판단*/
						if( page=="before" || page=="after" ){
							if( page=="before" ){ page=$(this).next().data("page")-1; }
							else if( page=="after" ){ page=$(this).prev().data("page")+1; }
						}
						else{
							$("#pagingDiv>ul>li").removeClass("active");
							$(this).addClass("active");
						}
						search(page);
					} // click function
				); // 페이징 click
				
				/*길이 제한 걸기*/
				$("input[type=text]").keyup(
					function(event) {
						if($(this).val().length > 30) {
							$(this).val($(this).val().substring(0, 30));
						}
					}
				);
				$("textarea").keyup(
					function(event) {
						if($(this).val().length > 1000) {
							$(this).val($(this).val().substring(0, 1000));
						}
					}
				);
				
				// 삭제 후 다시 자기 페이지로
				$(".btn-danger").click(
					function() {
						var page=$("#pagingDiv>ul>li.active").data("page");
						var num=$(".btn-danger").index(this);
						var el_idx=$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").val();
						
						alertify.confirm("안내", "해당 전자도서가 삭제됩니다. <br>삭제 하시겠습니까?",
							function(){
								$.ajax({
									type : "GET"
									, url : "elibDelete.ju"
									, data : {el_idx : el_idx}
									, dataType : "json"
									, success: function(data){
										noList(page);
										alertify.alert("타이틀", "삭제가 완료 되었습니다."
											, function() {
												alertify.warning("전자도서를 삭제 완료");
											}
										);
									} // success function
								}); // ajax 끝
							}, // ok function
							function(){
								alertify.message("전자도서 삭제 취소");
							 } // cancel function
						); // confirm
						
					} // danger function
				); // danger click
				
				var cateLg="";
				var cateMd="";
				// 컨텐츠 수정
				$(".btn-warning").click(
					function() {
						var num=$(".btn-warning").index(this);
						var text=$(".btn-warning").eq(num).text();
						if(text=="수정"){
							$(".btn-success").eq(num).removeAttr("disabled");
							$(".btn-warning").eq(num).text("취소");
							$("input[name=contentGroup_"+num+"]").removeAttr("disabled");
							$("#cateLg_"+num).removeAttr("disabled");
							$("#cateMd_"+num).removeAttr("disabled");
							contentGroup(num);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").removeAttr("disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").removeAttr("disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").removeAttr("disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").removeAttr("disabled");
							cateLg=$("#tdLg_"+num).html();
							cateMd=$("#tdMd_"+num).html();
							alertify.alert("안내", "수정 모드"
								, function() {
									alertify.message("전자도서 수정 모드");
								}
							);
							
						}
						else if(text=="취소"){
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").data("subject")).prop("disabled", "disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").data("writer")).prop("disabled", "disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").data("pub")).prop("disabled", "disabled");
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea")
								.val($(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").data("info")).prop("disabled", "disabled");
							var gropuNum=$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").data("idx").substring(0, 2);
							if(gropuNum=="EB"){
								gropuNum=0;
							}
							else if(gropuNum=="EM"){
								gropuNum=1;
							}
							else if(gropuNum=="EE"){
								gropuNum=2;
							}
							$("input[name=contentGroup_" +num+ "]").eq(gropuNum).prop("checked", "checked");
							$("input[name=contentGroup_" +num+ "]").prop("disabled", "disabled");
							$("#tdLg_"+num).html(cateLg);
							$("#cateLg_"+num)
								.val($("#tdLg_"+num).data("lg"))
								.prop("selected", "selected").prop("disabled", "disabled");
							$("#tdMd_"+num).html(cateMd);
							$("#cateMd_"+num)
								.val($("#tdMd_"+num).data("md"))
								.prop("selected", "selected").prop("disabled", "disabled");
							
							$(".btn-success").eq(num).prop("disabled", "disabled");
							$(".btn-warning").eq(num).text("수정");
							alertify.alert("안내", "수정 모드 취소"
								, function() {
									alertify.message("전자도서 수정 취소");
								}
							);
						}
					} // warning function
				); // warning click
				
				// 컨텐츠 완료
				$(".btn-success").click(
					function() {
						var num=$(".btn-success").index(this);
						
						var el_idx=$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").val();
						var el_subject=$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").val();
						var el_writer=$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").val();
						var el_pub=$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").val();
						var el_info=$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").val();
						var groupNum=$(".contentTable:eq("+num+")>tbody>tr>td:eq(5)>label>input[name=contentGroup_"+num+"]:checked").val();
						var el_lg=$("#cateLg_"+num).val();
						var el_md=$("#cateMd_"+num).val();
						if(el_subject.length==0){
							alertify.alert("Error", "제목을 입력하지 않으셨습니다."
								, function() {
									alertify.message("제목을 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").focus();
							return null;
						}
						if(el_writer.length==0){
							alertify.alert("Error", "저자를 입력하지 않으셨습니다."
								, function() {
									alertify.message("저자를 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").focus();
							return null;
						}
						if(el_pub.length==0){
							alertify.alert("Error", "출판사를 입력하지 않으셨습니다."
								, function() {
									alertify.message("출판사를 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").focus();
							return null;
						}
						if(el_info.length==0){
							alertify.alert("Error", "책정보를 입력하지 않으셨습니다."
								, function() {
								alertify.message("책정보를 입력 하세요.");
								}
							);
							$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").focus();
							return null;
						}
						
						$.ajax({
							type : "GET"
							, url : "elibUpdate.ju"
							, data : {el_idx : el_idx, el_subject : el_subject, el_writer : el_writer, el_pub : el_pub, el_info : el_info, groupNum : groupNum, el_lg : el_lg, el_md : el_md}
							, dataType : "json"
							, success: function(data){
								$(".panel-title:eq(" +num+ ")>a").text(data.elibArr.el_subject);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(0)>input").val(data.elibArr.el_idx).data("idx", data.elibArr.el_idx);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(1)>input").prop("disabled", "disabled").val(data.elibArr.el_subject).data("subject", data.elibArr.el_subject);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(2)>input").prop("disabled", "disabled").val(data.elibArr.el_writer).data("writer", data.elibArr.el_writer);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(3)>input").prop("disabled", "disabled").val(data.elibArr.el_pub).data("pub", data.elibArr.el_pub);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(4)>textarea").prop("disabled", "disabled").val(data.elibArr.el_info).data("info", data.elibArr.el_info);
								$(".contentTable:eq("+num+")>tbody>tr>td:eq(5)>label>input[name=contentGroup_"+num+"]:checked").prop("disabled", "disabled");
								$("#cateLg_"+num).prop("disabled", "disabled");
								$("#cateMd_"+num).prop("disabled", "disabled");
								$("#tdLg_"+num).data("md", data.elibArr.el_md);
								$("#tdMd_"+num).data("md", data.elibArr.el_md);
								cateLg=$("#tdLg_"+num).html();
								cateMd=$("#tdMd_"+num).html();
								
								alertify.alert("안내", "해당 전자도서 수정이 완료 되었습니다."
									, function() {
										alertify.success("전자도서 수정 완료");
									}
								);
								
								$(".btn-warning").eq(num).text("수정");
								$(".btn-success").eq(num).prop("disabled", "disabled");
							} // success
						});
						
					} // success function
				); // success click
				
			} // success function
		});
	} // function search
	
	
	/*뷰어*/
	function eViewer(el_idx){
		var popupWidth=screen.availWidth;
		var popupHeight=screen.availHeight;
		var popupSize="width=" + popupWidth + "px,height=" + popupHeight + "px";
		window.open("/lee/eViewer.ju?el_idx="+el_idx, "eViewer", popupSize);
	}
	</script>
	
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"></jsp:include>
		</div>
	
		<div class="col-md-8">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="text-center" colspan="2" style="font-size: x-large;">전자 도서 검색</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="col-md-2">제목</th>
						<td class="col-md-4">
							<input type="text" class="form-control" placeholder="제목" name="el_subject">
						</td>
					</tr>
					<tr>
						<th class="col-md-2">저자</th>
						<td class="col-md-4">
							<input type="text" class="form-control" placeholder="저자" name="el_writer">
						</td>
					</tr>
					<tr>
						<th class="col-md-2">출판사</th>
						<td class="col-md-4">
							<input type="text" class="form-control" placeholder="출판사" name="el_pub">
						</td>
					</tr>
					<tr>
						<th class="col-md-2">구분</th>
						<td class="col-md-4">
							<label class="checkbox-inline">
								<input type="radio" name="group"  value="0"> 전체
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="group"  value="7"> 전자도서
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="group" value="8"> 전자잡지
							</label>
							<label class="checkbox-inline">
								<input	type="radio" name="group" value="9"> e-교육
							</label>
						</td>
					</tr>
					<tr>
						<td class="col-md-2"></td>
						<td class="col-md-4">
							<select id="cateMd" name="cateMd" class="form-control"></select>
						</td>
					</tr>
					<tr>
						<th class="col-md-2">정렬</th>
						<td class="col-md-4">
							<label class="checkbox-inline">
								<input type="radio" name="order"  checked="checked"  value="new"> 등록순
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="order" value="recommend"> 추천순
							</label>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th class="text-center" colspan="2">
							<button type="button" class="btn btn-default" id="searchButton">검색</button>
						</th>
					</tr>
				</tfoot>
			</table>
		
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			</div> <!-- 아코디언 -->
			
			<div class="text-center" id="pagingDiv">
			</div>
		</div> <!-- col-md-8 -->
	</div> <!-- row -->
	
</body>
</html>