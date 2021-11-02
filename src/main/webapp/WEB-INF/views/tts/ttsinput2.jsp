<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shadow Service Page</title>
<style>
#STTservice{
	float: left;
	width: 700px;
	height : 1000px;
	border: 2px solid #09c;
}
#TTSservice{
	float: left;
	width: 700px;
	height : 1000px;
	border: 2px solid #09c;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 1. #data 공간에서 keyup이라는 이벤트가 발생했을 때
	$("#data").val();
	$("#data").keyup(function(){
		// 2. #out 공간에 #data의 내용이 출력된다.
		$("#out").text($("#data").val());
		// #out의 위치에 text로 데이터를 받는다.(setter)
		// 들어가는 데이터는 #data의 값(.val())이다. (getter)
		// 메서드 괄호 안에 아무것도 없으면 getter, 파라미터가 있으면 setter이다.
	});
});
</script>

</head>
<body>

<div class="container" id="TTSservice" align="center">
<h1>TTS 서비스 페이지</h1>

<% double speed[]={5,0};
String speedinform[]={"0.5배속", "표준속도"};
%>

<form action="/ttsinput" method="post">
한국어 입력창<br><br>
<textarea id="data" name="out" rows="10" cols="50"></textarea><br><br><br>

음성 속도 선택:
<% for(int i=0; i<speed.length; i++){ %>
<input type=radio name="speed" value=<%=speed[i] %>><%=speedinform[i]%>
<%} %>

<input type=submit value="음성듣기"> <br><br>
</form>

<audio id="audio" src="/naverimages/${ttsoutput}" controls="controls"></audio><br><br>
<script>
var mp3 = document.getElementById("mp3"); //${mp3file} document.getElementById("mp3");
mp3.play();
</script>
음성내용<br><br>
<textarea rows="10" cols="50">${out }</textarea>

</div>

<script>	
 	var txtArea = document.getElementById("txtArea");
	
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
	            alert("파일명 : " + uploadData + " 업로드 완료");
	            upload_resultData = uploadData;//파일명 저장
	        }//success
	    });//ajax
	}//uploadFile()
	
	function sttBtn(){
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
		})//ajax
	}//sttBtn()
	
</script>

<div id="free"></div>

<div class="container" id="STTservice" align="center">

	<div>
	<h1>STT 서비스 페이지</h1>
	</div>
	
	<div id="content">
		<div id="uploadPart">
		    <input type="file" id="file1" name="file1"> 
		    <button id="btn_submit" onclick="uploadFile()">전송</button><br><br>
		</div>
		<div id="sttPart" class="txtarea">
			<textarea cols="50" rows="10" id="txtArea"></textarea><br><br>
			<button id="sttBtn" onclick="sttBtn()">텍스트 변환</button><br><br>
		</div>
	
		<div id="papagoPart" class="txtarea">
			<textarea cols="50" rows="10" id="txtArea2"></textarea><br><br>
			<button id="sttBtn" onclick="papagoBtn()">영어 번역</button>
		</div>
	</div>

</div>


</body>
</html>