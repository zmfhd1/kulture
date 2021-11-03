<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>    
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="users.StudyInfoVO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Kulture</title>
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
</head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main2">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                        <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>
                        <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li> 
                        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>

              
                    </ul>
                </div>
            </div>
        </nav>


	
</head>
<body id="page-top">
    <!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="/main2">Kulture</a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
		    <ul class="navbar-nav ms-auto my-2 my-lg-0">
		        <li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>
                <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li> 
                <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>     
		    </ul>
		</div>
	</div>
</nav>
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
				url : '/ttsservice',
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
//전역변수 선언
var upload_resultData; //파일명 저장 변수
var stt_resultData; //stt 결과 데이터 저장 변수

function FunLoadingBarStart(){
	var backHeight = $(document).height(); //뒷 배경의 상하 폭
	var backWidth = window.document.body.clientWidth; //뒷 배경의 좌우 폭
	var backGroundCover = "<div id='back'></div>"; //뒷 배경을 감쌀 커버
	var loadingBarImage = ''; //가운데 띄워 줄 이미지
	loadingBarImage += "<div id='loadingBar'>";
	loadingBarImage += " <img src='assets/img/load-unscreen.gif' width='100px' height='auto' '> "; //로딩 바 이미지
	loadingBarImage += "</div>";
	$('body').append(backGroundCover).append(loadingBarImage);
	$('#back').css({ 'width': backWidth, 'height': backHeight, 'opacity': '0.3' });
	$('#back').show();
	$('#loadingBar').show();
}

function FunLoadingBarEnd() {
	$('#back, #loadingBar').hide();
	$('#back, #loadingBar').remove();
}

function regExp(str){
	var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi; //특수문자 검증
	
	if(reg.test(str)){ //특수문자 제거후 리턴
		return str.replace(reg, "");
	}
	else {//특수문자가 없으므로 본래 문자 리턴
		return str;
	}	
}

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
            //papagoBtn();
        }//success
    });//ajax
}//uploadFile()

function stt(){
 	$.ajax({
		url : '/sttservice',		
		data : {"file": upload_resultData},
		dataType : 'json',
		type : 'post',
		beforeSend : function(){
			FunLoadingBarStart();
		},
		complete : function(){
			FunLoadingBarEnd();
		},	
		success : function(sttData){
			var param = JSON.stringify(sttData.text);
			var result = regExp(param);
			console.log("result = ",result);
			$("#txtArea").val(result);
			stt_resultData = result;//stt결과 저장	
		}//success			
	})//ajax
}//sttBtn()

function papagoBtn(){
	$.ajax({
		url : '/papagoservice',
		data : {"text": stt_resultData},
		dataType : 'json',
		type : 'post',
		success : function(trans){
			var param = JSON.stringify(trans.message.result.translatedText);
			var result = regExp(param);			
			console.log(result);
			$("#txtArea2").val(result);
		}//success			
	});//ajax
}

/* Memo */
function savestudy(){
	var studyForm = document.studyform;
	var title = studyForm.title.value;
	var m1 = studyForm.study_memo1.value;
	var m2 = studyForm.study_memo2.value;
	
	if( !title || !m1 || !m2 ){
		alert("Please enter the content and save it.")
	}
	else{
		studyForm.submit();
		var str = "${result}"
		console.log(str)
		alert("Saved")
	}
}

</script>      

<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
        
<!-- service -->
<section class="page-section">

<div class="container px-4 px-lg-5">
<div class="row gx-4 gx-lg-5" >
	
	<div class="col-lg-4 col-md-4 text-center">  		
		<div id="TTSservice" align="center">                        
			<div><h2>Text To Sound</h2></div>	
			<hr class="divider" />
			<div id="ttsInput">
			<div style="height: 50px">
			Input Korean and listen to the voice. <br><br>
			</div>
			<div class="form-floating mb-3">
                <textarea class="form-control" name="input" id="input" style="height: 500px;" maxlength=2000 required="required"></textarea>
                <label style="text-align: left;" for="input">(200 text limit)</label>
            </div>				
				Select the voice play speed :<br>
				<input type="radio" name="speed" value="5" /> 0.5x
				<input type="radio" name="speed" value="0" checked="checked" /> 1.0x 
				<button class="btn btn-primary btn-xl2" onclick="playBtn()">Play</button><br><br>
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
			<div style="height: 50px">
			Check your Korean pronunciation by recording<br><br>
			</div>
			<div>
			<div id="sound-clips">
				<button class="btn btn-primary btn-xl2" id="record">Record</button>
				<button class="btn btn-primary btn-xl2" id="stop">Stop</button>
			</div>
			</div>
			
			<hr class="divider" />
			<div>
			Convert Korean audio files to text<br><br>
			</div>
			<div style="text-align: left; font-size: 14px;" >			
			1. Upload your Korean audio file<br>
			2. Click the 'CONVERT TO TEXT' button<br>
			3. Supports only mp3, aac, ac3, ogg, flac, wav<br><br><br>
			</div>
			<div id="sttInput">
				<div id="uploadPart">			
				    <input type="file" id="file1" name="file1" value="select">	 
				</div><br>
				<div id="sttPart" >
					<button class="btn btn-primary btn-xl2" id="sttBtn" onclick="uploadFile()">Convert to Text</button><br><br>
					<div class="form-floating mb-3">
                        <textarea class="form-control" name="txtArea" id="txtArea" style="height: 200px; background-color: white;" readonly="readonly"></textarea>
                    </div>
				</div>		
				<div id="papagoPart" >
					<button class="btn btn-primary btn-xl2" id="sttBtn" onclick="papagoBtn()">Translate to English</button><br><br>
					<div class="form-floating mb-3">
                        <textarea class="form-control" name="txtArea" id="txtArea2" style="height: 200px; background-color: white;" readonly="readonly"></textarea>
                    </div>
				</div>
			</div>
		</div>		
	</div>
	
	<div class="col-lg-4 col-md-4 text-center"> 
		<div id="Studyservice" align="center"> 
		<div><h2>Study</h2></div>
		<hr class="divider" />
			<div id="studyInput">
				<form action="/updatestudy" method="post">	
				<c:forEach items="${result }" var="memberlist">
					<div>
						 <input class="textarea" type="hidden" name="member_id" value="${sessionScope.id}" ><br><br>
					   
					</div>
					<div>
					    <input class="textarea" type="hidden" name="num" value="${memberlist.num }"><br><br>
					</div>
					<div class="form-floating mb-3">
                        <textarea class="form-control" name="title" id="title" maxlength="60" >${memberlist.title }</textarea>
                        <label for="title">title</label>
                    </div>
					<div class="form-floating mb-3">
                        <textarea class="form-control" name="study_memo1" id="study_memo1" style="height: 350px;" maxlength=1000 >${memberlist.study_memo1 }</textarea>
                        <label for="study_memo1">memo</label>
                    </div>
   					<div class="form-floating mb-3">
                        <textarea class="form-control" name="study_memo2" id="study_memo2" style="height: 350px;" maxlength=1000 >${memberlist.study_memo2 }</textarea>
                        <label for="study_memo2">memo</label>
                    </div>
					<div>
					    <input class="textarea" type="hidden" name="study_date" value="<%=sf.format(nowTime) %>" style="width:300px;" >
					</div>
					</c:forEach>
					<div>
						<!-- <input class="btn btn-primary btn-xl2"  onclick="savestudy()" type="button" value="Save"> -->	
						<button class="btn btn-primary btn-xl2" id="submit" type="submit">edit</button>			
						<button class="btn btn-primary btn-xl2" type="reset" id="cancel">Refresh</button>
						<button class="btn btn-primary btn-xl2" id="gotoList" onclick="location.href='/studylist'">to the list</button>
					</div>			
				</form>
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
<!-- Footer-->
	<footer class="bg-light py-5">
	    <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - Kulture</div></div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>