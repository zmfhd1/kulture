<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>STT 서비스 페이지</title>
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
</style>
</head>

<body>
<script>	
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
		success : function(sttData){
			console.log(sttData.text);
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
	
</script>

<div class="col-lg-4 col-md-4 text-center"> 
<div id="STTservice" align="center">
	<div><h2>Sound To Text</h2></div>
	<hr class="divider" />
	<div align="left">
	You can record your Korean voices<br><br>
	</div>
	<div>
		<div id="sound-clips">
		<button class="btn btn-primary btn-xl2" id="record">Record</button>
		<button class="btn btn-primary btn-xl2" id="stop">Stop</button><br>
		</div>
	</div><br>
	
	<hr class="divider" />
	<div align="left"><br>
	1. Upload your Korean audio file<br>
	2. Click the 'CONVERT TO TEXT' button<br>
	3. Audio data format supports mp3, aac, ac3, ogg, flac, and wav(Up to 10 MBbytes file)<br><br>
	</div>
	<div id="sttInput">
		<div id="uploadPart">			
		    <input type="file" id="file1" name="file1" value="select">	 
		</div><br>
		<div id="sttPart" class="txtarea">
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
</body>
</html>