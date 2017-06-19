/*!
 *
 * WebRTC Lab 
 * @author dodortus (codejs.co.kr / dodortus@gmail.com)
 *
 */

$(function() {
  if (typeof webkitSpeechRecognition != 'function') {
    alert('크롬에서만 동작 합니다.');
    return false;
  }

  var recognition = new webkitSpeechRecognition();
  var isRecognizing = false;
  var ignoreOnend = false;
  var finalTranscript = '';
 	var audio = document.getElementById('audio');
  var $btnMic = $('#btn-mic');
 	var $result = $('#result');
 	var $iconMusic = $('#icon-music');
  recognition.continuous = true;
  recognition.interimResults = true;

  recognition.onstart = function() {
    console.log('onstart', arguments);
    isRecognizing = true;

    $btnMic.attr('class', 'on');
  };

  recognition.onend = function() {
    console.log('onend', arguments);
    isRecognizing = false;

    if (ignoreOnend) {
      return false;
    }

    // DO end process
    $btnMic.attr('class', 'off');
    if (!finalTranscript) {
      console.log('empty finalTranscript');
      return false;
    }

    if (window.getSelection) {
      window.getSelection().removeAllRanges();
      var range = document.createRange();
      range.selectNode(document.getElementById('final-span'));
      window.getSelection().addRange(range);
    }

  };

  recognition.onresult = function(event) {
    console.log('onresult', event);

    var interimTranscript = '';
    if (typeof(event.results) == 'undefined') {
      recognition.onend = null;
      recognition.stop();
      return;
    }

    for (var i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        finalTranscript += event.results[i][0].transcript;
      } else {
        interimTranscript += event.results[i][0].transcript;
      }
    }

    finalTranscript = capitalize(finalTranscript);
    final_span.innerHTML = linebreak(finalTranscript);
    interim_span.innerHTML = linebreak(interimTranscript);

    console.log('finalTranscript', finalTranscript);
    console.log('interimTranscript', interimTranscript);
    fireCommand(interimTranscript);
  };

  /**
   * changeColor
   *
   */
  /*
	  .red 		{ background: red; }
		.blue 	{ background: blue; }
		.green 	{ background: green; }
		.yellow { background: yellow; }
		.orange { background: orange; }
		.grey 	{ background: grey; }
		.gold   { background: gold; }
		.white 	{ background: white; }
		.black  { background: black; }
 	*/
  var cpage=1;
  function fireCommand(string) {
	  if(string.endsWith('오디오 북 실행')||string.endsWith('오디오북 실행')){
		  location.href='eAudio.ju';
		  
  	}else if(string.endsWith('뒤로 가기')||string.endsWith('뒤로가기')){
  		  window.history.back();
  		
  	}else if(string.endsWith('메뉴 설명')){
  		text='메뉴로는 도서관 소개, 일반도서 검색, 전자도서관, 이용예약, 평생교육, 고객지원서비스가 있습니다. 오디오북 카테고리를 듣고싶으시면 오디오북 카테고리 라고 말씀해 주세요.';
        	speechSynthesis.speak(new SpeechSynthesisUtterance(text));
        	
  	}else if (string.endsWith('오디오북 카테고리') || string.endsWith('알 람')) {
  		text='오디오북 카테고리로는 철학, 종교, 인문 과학, 자연과학, 예술, 언어, 문학, 역사 가 있습니다. 오디오북 카테고리를 다시 들으시려면 오디오북 카테고리라고 다시 말하세요.';
  		speechSynthesis.speak(new SpeechSynthesisUtterance(text));
  		
  	}else if (string.endsWith('오디오리스트')||string.endsWith('오디오 리스트')){
  		var listsize = document.getElementById('contentTbody').children.length;
  		for(var i=0; i < listsize ; i++){
  			var str = "";
  			switch(i){
  			case 0: str='첫';
  				break;
  			case 1: str="두"
  				break;
  			case 2: str="세"
  				break;
  			}
  			var text = str+"번째, "+document.getElementById('contentTbody').children[i].firstChild.nextSibling.firstChild.nextSibling.firstChild.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.innerText;
  			speechSynthesis.speak(new SpeechSynthesisUtterance(text));
  		}
  		speechSynthesis.speak(new SpeechSynthesisUtterance("현재 총 "+($("#pagingNav>ul>li").length-1)+"페이지가 있습니다."));
  		
  	
  	}else if (string.endsWith('첫번째 듣기')||string.endsWith('첫번째듣기')||string.endsWith('첫 번째 듣기')||string.endsWith('첫 번째 듣 기')){
  				$(function() {
					var selectNum=$("#contentTbody>tr>td").index(0);
					var el_idx=$("#contentTbody>tr").eq(selectNum).data("idx");
					$.ajax({
						type : "GET"
						, url : "audioContent.ju"
						, data : {el_idx : el_idx}
						, dataType : "json"
						, success: function(data){
							var idx = data.ebArr.el_idx;
							
							var intoHeaderHTML="";
							intoHeaderHTML+='<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
							intoHeaderHTML+='<h4 class="modal-title" id="myModalLabel">' + data.ebArr.el_idx + '</h4>';
							
							var intoBodyHTML="";
							if(data.mem_idx==null){
							intoBodyHTML+='<div class="panel panel-default">';
							intoBodyHTML+='	<div class="row">';
							intoBodyHTML+='		<div class="col-md-12">';
							intoBodyHTML+='			<div class="media">';
							intoBodyHTML+='				<div class="media-left media">';
							intoBodyHTML+='					<img class="media-object" src="'+data.ebArr.el_path+'" style="width: 100px; height: 150px;"  alt="..." >';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='				<div class="media-body">';
							intoBodyHTML+='					<div class="row">';
							intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">'+data.ebArr.el_writer+'</div>';
							intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">'+data.ebArr.el_pub+'</div>';
							intoBodyHTML+='						<div class="col-md-2">추천수</div><div class="col-md-10">'+data.ebArr.el_recocount+'</div>';
							intoBodyHTML+='					</div>';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='				<div class="col-md-12 text-right">';
							intoBodyHTML+='				<span id="ttip" data-toggle="tooltip" data-placement="top" title="로그인 하셔야 합니다.">';
							intoBodyHTML+='					<button type="button" id="ttip" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" disabled="disabled">추천하기</button>';
							intoBodyHTML+='				</span>';
							intoBodyHTML+='				<span  data-toggle="tooltip" data-placement="top" title="로그인 하셔야 합니다.">';
							intoBodyHTML+='					<button type="button" id="playbt" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" disabled="disabled">재생하기</button>';
							intoBodyHTML+='				</span>';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='			</div>';
							intoBodyHTML+='		</div>';
							intoBodyHTML+='	</div>';
							intoBodyHTML+='</div>';
							intoBodyHTML+='<div class="row">';
							intoBodyHTML+='	<table class="table">';
							intoBodyHTML+='		<tr>';
							intoBodyHTML+='			<td>';
							intoBodyHTML+='				<h4>작품소개</h4>';
							intoBodyHTML+=				data.ebArr.el_info;
							intoBodyHTML+='			</td>';
							intoBodyHTML+='		</tr>';
							intoBodyHTML+='	</table>';
							intoBodyHTML+='</div>';
							$(".modal-body").html(intoBodyHTML);
						}else if(data.mem_idx){
							intoBodyHTML+='<div class="panel panel-default" >';
							intoBodyHTML+='	<div class="row">';
							intoBodyHTML+='		<div class="col-md-12">';
							intoBodyHTML+='			<div class="media">';
							intoBodyHTML+='				<div class="media-left media">';
							intoBodyHTML+='					<img class="media-object" src="'+data.ebArr.el_path+'" style="width: 100px; height: 150px;"  alt="..." >';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='				<div class="media-body">';
							intoBodyHTML+='					<div class="row">';
							intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">'+data.ebArr.el_writer+'</div>';
							intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">'+data.ebArr.el_pub+'</div>';
							intoBodyHTML+='						<div class="col-md-2">추천수</div><div class="col-md-10 reCount">'+data.ebArr.el_recocount+'</div>';
							intoBodyHTML+='					</div>';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='				<div class="col-md-12 text-right">';
							intoBodyHTML+='					<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" onClick="eAudioRecommend(\''+idx+'\')">추천하기</button>';
							intoBodyHTML+='					<button type="button" id="playbt" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" onClick="aPlayer(\''+idx+'\')">재생하기</button>';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='			</div>';
							intoBodyHTML+='		</div>';
							intoBodyHTML+='	</div>';
							intoBodyHTML+=' </div>';
							intoBodyHTML+='<div class="row">';
							intoBodyHTML+='	<table class="table">';
							intoBodyHTML+='		<tr>';
							intoBodyHTML+='			<td>';
							intoBodyHTML+='				<h4>작품소개</h4>';
							intoBodyHTML+=				data.ebArr.el_info;
							intoBodyHTML+='			</td>';
							intoBodyHTML+='		</tr>';
							intoBodyHTML+='	</table>';
							intoBodyHTML+='</div>';
							$(".modal-body").html(intoBodyHTML);
						}
							
							$(".modal-header").html(intoHeaderHTML);
						}
					});
					$("#myModal").modal("show");
				});
			
  	}else if (string.endsWith('두번째 듣기')||string.endsWith('두번째듣기')||string.endsWith('두 번째 듣기')||string.endsWith('두 번째 듣 기')||string.endsWith('두번째 듣 기')){
  			
			$(function() {
				var selectNum=$("#contentTbody>tr>td").index(1);
				
				var el_idx=$("#contentTbody>tr").eq(1).data("idx");
				$.ajax({
					type : "GET"
					, url : "audioContent.ju"
					, data : {el_idx : el_idx}
					, dataType : "json"
					, success: function(data){
						var idx = data.ebArr.el_idx;
						
						var intoHeaderHTML="";
						intoHeaderHTML+='<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
						intoHeaderHTML+='<h4 class="modal-title" id="myModalLabel">' + data.ebArr.el_idx + '</h4>';
						
						var intoBodyHTML="";
						if(data.mem_idx==null){
						intoBodyHTML+='<div class="panel panel-default">';
						intoBodyHTML+='	<div class="row">';
						intoBodyHTML+='		<div class="col-md-12">';
						intoBodyHTML+='			<div class="media">';
						intoBodyHTML+='				<div class="media-left media">';
						intoBodyHTML+='					<img class="media-object" src="'+data.ebArr.el_path+'" style="width: 100px; height: 150px;"  alt="..." >';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="media-body">';
						intoBodyHTML+='					<div class="row">';
						intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">'+data.ebArr.el_writer+'</div>';
						intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">'+data.ebArr.el_pub+'</div>';
						intoBodyHTML+='						<div class="col-md-2">추천수</div><div class="col-md-10">'+data.ebArr.el_recocount+'</div>';
						intoBodyHTML+='					</div>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="col-md-12 text-right">';
						intoBodyHTML+='				<span id="ttip" data-toggle="tooltip" data-placement="top" title="로그인 하셔야 합니다.">';
						intoBodyHTML+='					<button type="button" id="ttip" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" disabled="disabled">추천하기</button>';
						intoBodyHTML+='				</span>';
						intoBodyHTML+='				<span  data-toggle="tooltip" data-placement="top" title="로그인 하셔야 합니다.">';
						intoBodyHTML+='					<button type="button" id="playbt" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" disabled="disabled">재생하기</button>';
						intoBodyHTML+='				</span>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='			</div>';
						intoBodyHTML+='		</div>';
						intoBodyHTML+='	</div>';
						intoBodyHTML+='</div>';
						intoBodyHTML+='<div class="row">';
						intoBodyHTML+='	<table class="table">';
						intoBodyHTML+='		<tr>';
						intoBodyHTML+='			<td>';
						intoBodyHTML+='				<h4>작품소개</h4>';
						intoBodyHTML+=				data.ebArr.el_info;
						intoBodyHTML+='			</td>';
						intoBodyHTML+='		</tr>';
						intoBodyHTML+='	</table>';
						intoBodyHTML+='</div>';
						$(".modal-body").html(intoBodyHTML);
					}else if(data.mem_idx){
						intoBodyHTML+='<div class="panel panel-default" >';
						intoBodyHTML+='	<div class="row">';
						intoBodyHTML+='		<div class="col-md-12">';
						intoBodyHTML+='			<div class="media">';
						intoBodyHTML+='				<div class="media-left media">';
						intoBodyHTML+='					<img class="media-object" src="'+data.ebArr.el_path+'" style="width: 100px; height: 150px;"  alt="..." >';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="media-body">';
						intoBodyHTML+='					<div class="row">';
						intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">'+data.ebArr.el_writer+'</div>';
						intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">'+data.ebArr.el_pub+'</div>';
						intoBodyHTML+='						<div class="col-md-2">추천수</div><div class="col-md-10 reCount">'+data.ebArr.el_recocount+'</div>';
						intoBodyHTML+='					</div>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="col-md-12 text-right">';
						intoBodyHTML+='					<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" onClick="eAudioRecommend(\''+idx+'\')">추천하기</button>';
						intoBodyHTML+='					<button type="button" id="playbt" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" onClick="aPlayer(\''+idx+'\')">재생하기</button>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='			</div>';
						intoBodyHTML+='		</div>';
						intoBodyHTML+='	</div>';
						intoBodyHTML+=' </div>';
						intoBodyHTML+='<div class="row">';
						intoBodyHTML+='	<table class="table">';
						intoBodyHTML+='		<tr>';
						intoBodyHTML+='			<td>';
						intoBodyHTML+='				<h4>작품소개</h4>';
						intoBodyHTML+=				data.ebArr.el_info;
						intoBodyHTML+='			</td>';
						intoBodyHTML+='		</tr>';
						intoBodyHTML+='	</table>';
						intoBodyHTML+='</div>';
						$(".modal-body").html(intoBodyHTML);
					}
						
						$(".modal-header").html(intoHeaderHTML);
					}
				});
				$("#myModal").modal("show");
			});
		
	}else if (string.endsWith('세번째 듣기')||string.endsWith('세번째듣기')||string.endsWith('세 번째 듣기')||string.endsWith('세 번째 듣 기')||string.endsWith('세번째 듣 기')){
			$(function() {
				var selectNum=$("#contentTbody>tr>td").index(2);
				var el_idx=$("#contentTbody>tr").eq(2).data("idx");
				$.ajax({
					type : "GET"
					, url : "audioContent.ju"
					, data : {el_idx : el_idx}
					, dataType : "json"
					, success: function(data){
						var idx = data.ebArr.el_idx;
						
						var intoHeaderHTML="";
						intoHeaderHTML+='<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
						intoHeaderHTML+='<h4 class="modal-title" id="myModalLabel">' + data.ebArr.el_idx + '</h4>';
						
						var intoBodyHTML="";
						if(data.mem_idx==null){
						intoBodyHTML+='<div class="panel panel-default">';
						intoBodyHTML+='	<div class="row">';
						intoBodyHTML+='		<div class="col-md-12">';
						intoBodyHTML+='			<div class="media">';
						intoBodyHTML+='				<div class="media-left media">';
						intoBodyHTML+='					<img class="media-object" src="'+data.ebArr.el_path+'" style="width: 100px; height: 150px;"  alt="..." >';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="media-body">';
						intoBodyHTML+='					<div class="row">';
						intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">'+data.ebArr.el_writer+'</div>';
						intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">'+data.ebArr.el_pub+'</div>';
						intoBodyHTML+='						<div class="col-md-2">추천수</div><div class="col-md-10">'+data.ebArr.el_recocount+'</div>';
						intoBodyHTML+='					</div>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="col-md-12 text-right">';
						intoBodyHTML+='				<span id="ttip" data-toggle="tooltip" data-placement="top" title="로그인 하셔야 합니다.">';
						intoBodyHTML+='					<button type="button" id="ttip" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" disabled="disabled">추천하기</button>';
						intoBodyHTML+='				</span>';
						intoBodyHTML+='				<span  data-toggle="tooltip" data-placement="top" title="로그인 하셔야 합니다.">';
						intoBodyHTML+='					<button type="button" id="playbt" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" disabled="disabled">재생하기</button>';
						intoBodyHTML+='				</span>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='			</div>';
						intoBodyHTML+='		</div>';
						intoBodyHTML+='	</div>';
						intoBodyHTML+='</div>';
						intoBodyHTML+='<div class="row">';
						intoBodyHTML+='	<table class="table">';
						intoBodyHTML+='		<tr>';
						intoBodyHTML+='			<td>';
						intoBodyHTML+='				<h4>작품소개</h4>';
						intoBodyHTML+=				data.ebArr.el_info;
						intoBodyHTML+='			</td>';
						intoBodyHTML+='		</tr>';
						intoBodyHTML+='	</table>';
						intoBodyHTML+='</div>';
						$(".modal-body").html(intoBodyHTML);
					}else if(data.mem_idx){
						intoBodyHTML+='<div class="panel panel-default" >';
						intoBodyHTML+='	<div class="row">';
						intoBodyHTML+='		<div class="col-md-12">';
						intoBodyHTML+='			<div class="media">';
						intoBodyHTML+='				<div class="media-left media">';
						intoBodyHTML+='					<img class="media-object" src="'+data.ebArr.el_path+'" style="width: 100px; height: 150px;"  alt="..." >';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="media-body">';
						intoBodyHTML+='					<div class="row">';
						intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">'+data.ebArr.el_writer+'</div>';
						intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">'+data.ebArr.el_pub+'</div>';
						intoBodyHTML+='						<div class="col-md-2">추천수</div><div class="col-md-10 reCount">'+data.ebArr.el_recocount+'</div>';
						intoBodyHTML+='					</div>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='				<div class="col-md-12 text-right">';
						intoBodyHTML+='					<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" onClick="eAudioRecommend(\''+idx+'\')">추천하기</button>';
						intoBodyHTML+='					<button type="button" id="playbt" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top" onClick="aPlayer(\''+idx+'\')">재생하기</button>';
						intoBodyHTML+='				</div>';
						intoBodyHTML+='			</div>';
						intoBodyHTML+='		</div>';
						intoBodyHTML+='	</div>';
						intoBodyHTML+=' </div>';
						intoBodyHTML+='<div class="row">';
						intoBodyHTML+='	<table class="table">';
						intoBodyHTML+='		<tr>';
						intoBodyHTML+='			<td>';
						intoBodyHTML+='				<h4>작품소개</h4>';
						intoBodyHTML+=				data.ebArr.el_info;
						intoBodyHTML+='			</td>';
						intoBodyHTML+='		</tr>';
						intoBodyHTML+='	</table>';
						intoBodyHTML+='</div>';
						$(".modal-body").html(intoBodyHTML);
					}
						
						$(".modal-header").html(intoHeaderHTML);
					}
				});
				$("#myModal").modal("show");
			});
		
	
	
		
	}else if (string.endsWith('다음 페이지')||string.endsWith('다음페이지')){
		
		var totalpage = $("#pagingNav>ul>li").length-1;
		if(cpage<totalpage){
			audioListFirst(cpage+1, "new");
			cpage += 1;
		}
		
  	}else if (string.endsWith('이전 페이지')||string.endsWith('이전페이지')){
		
		var totalpage = $("#pagingNav>ul>li").length-1;
		if(cpage>1){
			audioListFirst(cpage-1, "new");
			cpage -= 1;
		}
		
  	}else if (string.endsWith('재생하기')||string.endsWith('재생 하기')||string.endsWith('재 생하기')){
		$("#playbt").trigger("click");
  	}
	  
  }

  recognition.onerror = function(event) {
    console.log('onerror', event);

    if (event.error == 'no-speech') {
      ignoreOnend = true;
    } else if (event.error == 'audio-capture') {
      ignoreOnend = true;
    } else if (event.error == 'not-allowed') {
      ignoreOnend = true;
    }

    $btnMic.attr('class', 'off');
  };

  var two_line = /\n\n/g;
  var one_line = /\n/g;
  var first_char = /\S/;

  function linebreak(s) {
    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
  }

  function capitalize(s) {
    return s.replace(first_char, function(m) {
      return m.toUpperCase();
    });
  }

  function start(event) {
    if (isRecognizing) {
      recognition.stop();
      return;
    }
    recognition.lang = 'ko-KR';
    recognition.start();
    ignoreOnend = false;

    finalTranscript = '';
    final_span.innerHTML = '';
    interim_span.innerHTML = '';

  }

  /**
   * textToSpeech
   * 지원: 크롬, 사파리, 오페라, 엣지
   */
  function textToSpeech(text) {
    console.log('textToSpeech', arguments);

    /*
    var u = new SpeechSynthesisUtterance();
    u.text = 'Hello world';
    u.lang = 'en-US';
    u.rate = 1.2;
    u.onend = function(event) {
      log('Finished in ' + event.elapsedTime + ' seconds.');
    };
    speechSynthesis.speak(u);
    */

    // simple version
    speechSynthesis.speak(new SpeechSynthesisUtterance(text));
  }

  /**
   * requestServer
   * key - AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg
   */
  function requestServer() {
    $.ajax({
      method: 'post',
      url: 'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg',
      data: '/examples/speech-recognition/hello.wav',
      contentType: 'audio/l16; rate=16000;', // 'audio/x-flac; rate=44100;',
      success: function(data) {

      },
      error: function(xhr) {

      }
    });
  }

  /**
   * init
   */
  $btnMic.click(start);
  $('#btn-tts').click(function() {
    textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
  });
});
