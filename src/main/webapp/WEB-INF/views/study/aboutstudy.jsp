<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Project</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<script src="jquery-3.2.1.min.js"></script>
      
<style>

#modal {
display:none;
position:fixed;
width:100%;
height:50%;
z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}

</style>

<script>
$(document).ready(function(){
	$("#btnLogin").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();//입력포커스 이동
			return;//함수종료
		}
		if(pw==""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();//입력포커스 이동
			return;//함수종료
		}
		//폼 내부의 데이터를 전송할 주소
		//document.login.action="main2"
		//제출
		document.login.submit();
	});
});
</script>
	
</head>
<body id="page-top">
    <!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="/main">Kulture</a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
		    <ul class="navbar-nav ms-auto my-2 my-lg-0">
		        <li class="nav-item"><a class="nav-link" href="/insertmember">Join</a></li>
		     	<div id="root">    
		        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>
		        </div>
		        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li>
		        <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>      
		    </ul>
		</div>
	</div>
</nav>

<!-- 로그인 -->
<div id="modal">
   
    <div class="modal_content">
        <h2>Log in</h2>
       
        <form action="main" name="login" method="post">
		ID: <input id="id" type="text" autofocus="autofocus" name="id" placeholder="10-digit" maxlength="10"><br>
		Password: <input id ="pw" name = "pw" type="password" name="pw" maxlength="4" placeholder="4-digit">
		<input id ="btnLogin" type="button" value="확인">
		</form>
        <button type="submit" id="modal_close_btn">닫기</button>      
       
    </div>
    <div class="modal_layer"></div>
</div>

<!-- login관련 javascript -->
<script>
    $("#modal_open_btn").click(function(){
        $("#modal").attr("style", "display:flex");
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").attr("style", "display:none");
    });  
</script>

<!-- Study관련  script -->
<script>
/* TTS */
function playBtn() {
	var input = document.getElementById("input").value;//텍스트 입력값 저장
    var speed = document.getElementsByName("speed");//재생속도 저장 변수
    var speedResult;//선택된 재생속도 저장 변수
    //var ttsResult;//생성된 음성파일명 저장 변수

    for (var i=0; i < speed.length; i++) {
    	if (speed[i].checked == true) {
            speedResult = speed[i].value;
            
		  	$.ajax({		  		
				url : '/tts2',
				data : {"input": input, "speed":speedResult},
				dataType : 'text',
				type : 'post',
				success : function(mp3file){
					ttsResult = mp3file;
					$("#audio").attr("src", "/naverimages/" + mp3file);
				}//success	
			});//ajax  
		}//if
	}//for	
}//playBtn()

/* STT */
//var txtArea = document.getElementById("txtArea");

//전역변수 선언
var upload_resultData; //파일명 저장 변수
var stt_resultData; //stt 결과 데이터 저장 변수

//파일 업로드
function uploadFile(){
    var formData = new FormData();
    formData.append("file1", $("#file1")[0].files[0]);

    $.ajax({
        url: '/uploadresult',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(uploadData){	        	
            console.log("파일명 : " + uploadData + " 업로드 완료");
            upload_resultData = uploadData;//파일명 저장
            stt();
        }//success
    });//ajax
}//uploadFile()

function stt(){
 	$.ajax({
		url : '/sttservice',
		
		data : {"file": upload_resultData},
		dataType : 'json',
		type : 'post',
		success : function(sttData){
			console.log(sttData);
			$("#txtArea").val(JSON.stringify(sttData.text));
			stt_resultData = JSON.stringify(sttData.text);//stt결과 저장
		}//success			
	})//ajax
}//sttBtn()

function papagoBtn(){
	$.ajax({
		url : '/papagoservice',
		data : {"text": stt_resultData},
		dataType : 'json',
		type : 'post',
		success : function(result){
			console.log(result);
			$("#txtArea2").val(JSON.stringify(result.message.result.translatedText));
		}//success			
	});//ajax
}


/* Memo */
function savestudy(){
	var str = "${result}"
	console.log(str)
	alert("저장 되었습니다.")
}

</script>      

<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
        
<!-- service -->
<section class="page-section">

<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5">
	<div class="col-lg-4 col-md-4 text-center">  		
		<div id="TTSservice" align="center">                        
			<div><h2>Text To Sound</h2></div>	
			<hr class="divider" />
			<div id="ttsInput">
				Please enter Korean in the input box below (Max length. 200 Text)<br><br>
				<textarea class="textarea" id="input" rows="20" cols="30" maxlength=1000></textarea><br><br><br>
				
				Select voice play speed :
				<input type="radio" name="speed" value="5" /> 0.5x
				<input type="radio" name="speed" value="0" checked="checked" /> 1.0x
				<button class="btn btn-primary btn-xl2" onclick="playBtn()">Play</button> <br><br>
			</div>
	
			<div id="ttsResult">	
				<audio id="audio" src="" controls="controls"></audio><br><br>
			</div>
		</div>
	</div>

 	<div class="col-lg-4 col-md-4 text-center"> 
		<div id="STTservice" align="center">
			<div><h2>Sound To Text</h2></div>
			<hr class="divider" />
			If you want to record your Korean, click RECORD button below <br><br>
			<div>
				<div id="sound-clips">
				<button class="btn btn-primary btn-xl2" id="record">Record</button>
				<button class="btn btn-primary btn-xl2" id="stop">Stop</button><br>
				</div>
			</div><br>
			
			<hr class="divider" />
		
			Please upload mp3file recording with Korean<br><br>
			<div id="sttInput">
				<div id="uploadPart">			
				    <input type="file" id="file1" name="file1" value="select">	 
				</div><br>
				<div id="sttPart" class="txtarea">
					<h5>STT Result</h5>
					<button class="btn btn-primary btn-xl2" id="sttBtn" onclick="uploadFile()">Convert to Text</button><br><br>
					<textarea class="textarea" cols="30" rows="5" id="txtArea" ></textarea><br><br>
				</div>		
				<div id="papagoPart" class="txtarea">
					<button class="btn btn-primary btn-xl2" id="sttBtn" onclick="papagoBtn()">Translate to English</button><br><br>
					<textarea class="textarea" cols="30" rows="5" id="txtArea2"></textarea><br><br>
				</div>
			</div>
		</div>		
	</div>
	
	<div class="col-lg-4 col-md-4 text-center"> 
	<div id="Studyservice" align="center"> 
	<div><h2>Study</h2></div>
	<hr class="divider" />
		<div id="studyInput">
			<form action="/savestudy" method="post">	
				<div>
				    <input class="textarea" type="hidden" name="member_id" value="${sessionScope.id}"><br><br>
				</div>
				<div>
				    <textarea class="textarea" name="study_id" style="width: 10;" maxlength=1000 placeholder="study_id"></textarea><br><br>
				</div>
				<div>
				    <textarea class="textarea" name="title" cols="10" placeholder="title"></textarea><br><br>
				</div>
				<div>
				    <textarea class="textarea" name="study_memo1" rows="10" cols="30" maxlength=1000 placeholder="memo1"></textarea> <br><br><br>
				</div>
				<div>
				    <textarea class="textarea" name="study_memo2" rows="10" cols="30" maxlength=1000 placeholder="memo2" ></textarea> <br><br><br>
				</div>
				<div>
				    <input class="textarea" type="hidden" name="study_date" value="<%=sf.format(nowTime) %>" style="width:300px;" ><br><br><br>	
				</div>
				<div>
					<button class="btn btn-primary btn-xl2" type="submit" id="submit" onclick="savestudy()">OK</button>					
					<button class="btn btn-primary btn-xl2" type="reset" id="cancel">Refresh</button>
				</div>			
			</form>
				<button class="btn btn-primary btn-xl2" id="gotoList" onclick="location.href='/studylist'">to the list</button>
		</div>
	</div>
	</div>
	</div>
</div>

<script>
/* mic */
const record = document.getElementById("record")
const stop = document.getElementById("stop")
const soundClips = document.getElementById("sound-clips")
if (navigator.mediaDevices) {
	const constraints = {
		audio: true
		}
	
	let chunks = []	
	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
		
		const mediaRecorder = new MediaRecorder(stream)//녹음기
		
		record.onclick = function() {//녹음 버튼 클릭시에
			mediaRecorder.start()// 음성 녹음 시작하라
			console.log(mediaRecorder.state)
			console.log("recorder started")
			record.style.background = "red"
			record.style.color = "black"
			}//record.onclick
			
		stop.onclick = function() {//정지 버튼 클릭시에
			mediaRecorder.stop()//녹음 정지시켜라
			console.log(mediaRecorder.state)
			console.log("recorder stopped")
			record.style.background = ""
			record.style.color = ""
			}//stop.onclick
				
		mediaRecorder.ondataavailable = function(e) {
			chunks.push(e.data)
			}
		//녹음 정지시킨 상태가 되면 실행하라
				
		mediaRecorder.onstop = function(e) {
			console.log("data available after MediaRecorder.stop() called.")
			
			//추가 구현 예정
			//3.audio태그를 재생한다-녹음내용 확인한다.
			var audio = document.createElement('audio');
			audio.setAttribute("controls", '');
			audio.cotrols = true;
			soundClips.appendChild(audio);
			
			const blob = new Blob(chunks, {'type' : "audio/mp3"});
			var mp3URL = URL.createObjectURL(blob);
			audio.src = mp3URL;
			
			//4. 다음 녹음파일을 위해 비워둔다
			chunks = [];
			//5. 파일 저장
			var a = document.createElement('a'); //audio ssrc = 'mp3 url' controls
			soundClips.appendChild(a); //div태그 내부 audio태그 추가한다 다음에 a태그 추가
			a.href = mp3URL;
			a.innerHTML = "Download your record file";
			a.download = "mictest.mp3";
			
			var now = new Date();
			var year = now.getFullYear();
			var month = ('0' + now.getMonth() + 1).slice(-2);
			var day = now.getDate();
			var dateString = year + month + day;
			console.log(dateString);
			
			a.download = "mictest" + dateString + ".mp3";
			//6. 스프링 서버로 업로드
			}//mediaRecorder.onstop
			
			})//then 
			.catch(function(err) {
				console.log('The following error occurred: ' + err)
				})
}
</script>
</section>
<div id="footer">footer</div>
</body>
</html>