<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study</title>

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

<body>

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

/* Memo */
function savestudy(){
	var studyForm = document.studyform;
	var studyId = studyForm.study_id.value;
	var title = studyForm.title.value;
	var m1 = studyForm.study_memo1.value;
	var m2 = studyForm.study_memo2.value;
	
	if( !studyId || !title || !m1 || !m2 ){
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
				Enter Korean in the input box <br>
				(Max length. 200 Text)<br><br>
				<textarea class="textarea" id="input" rows="20" cols="30" maxlength=1000></textarea><br><br><br>
				
				Select the voice play speed :
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
	
	<div class="col-lg-4 col-md-4 text-center"> 
		<div id="Studyservice" align="center"> 
		<div><h2>Study</h2></div>
		<hr class="divider" />
			<div id="studyInput">
				<form action="/savestudy" name="studyform" method="post">	
					<div>
					    <input class="textarea" type="hidden" name="member_id" value="${sessionScope.id}"><br><br>
					</div>
					<div>
					    <textarea class="textarea" name="study_id" style="width: 10;" maxlength=1000 placeholder="study_id"></textarea><br><br>
					</div>
					<div>
					    <textarea class="textarea" name="title" id="title" maxlength="60" cols="10" placeholder="title"></textarea><br><br>
					</div>
					<div>
					    <textarea class="textarea" name="study_memo1" id="study_memo1" rows="10" cols="30" maxlength=1000 placeholder="memo1"></textarea> <br><br><br>
					</div>
					<div>
					    <textarea class="textarea" name="study_memo2" id="study_memo2" rows="10" cols="30" maxlength=1000 placeholder="memo2" ></textarea> <br><br><br>
					</div>
					<div>
					    <input class="textarea" type="hidden" name="study_date" value="<%=sf.format(nowTime) %>" style="width:300px;" ><br><br><br>	
					</div>
					<div>
						<input class="btn btn-primary btn-xl2"  onclick="savestudy()" type="button" value="Save">				
						<button class="btn btn-primary btn-xl2" type="reset" id="cancel">Refresh</button><br><br>
					</div>			
				</form>
					<button class="btn btn-primary btn-xl2" id="gotoList" onclick="location.href='/studylist'">to the list</button>
			</div>
		</div>
	</div>
</div>
</div>
<h1>gg</h1>
</body>
</html>