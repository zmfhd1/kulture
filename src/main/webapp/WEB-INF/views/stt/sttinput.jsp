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
</body>
</html>