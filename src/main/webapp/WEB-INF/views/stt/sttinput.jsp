<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STT 서비스 페이지</title>
<style>
.servicepart{
	background-color: skyblue;	
}
.content{
	background-color: gray;
	float : left;
}
.button{
  padding: 6px 10px;
  background-color:#FF6600;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}


</style>
</head>

<body>
<script src="jquery-3.2.1.min.js"></script>
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
		});//ajax
	}//papagoBtn()
	
</script>

<div align="center">

	<div>
	<h1>STT 서비스 페이지</h1>
	</div>
	
	<div id="content">
		<div id="uploadPart">
		    <input type="file" id="file1" style="display: none;">
		    <label class="button" for="file1">Upload</label>
		    <button id="btn_submit" class="button" onclick="uploadFile()">전송</button><br><br>
		</div>
		<div id="sttPart" class="txtarea">
			<textarea cols="50" rows="30" id="txtArea"></textarea>
			<button id="sttBtn" class="button" onclick="sttBtn()">텍스트 변환</button>
		</div>
	
		<div id="papagoPart" class="txtarea">
			<textarea cols="50" rows="30" id="txtArea2"></textarea>
			<button id="sttBtn" class="button" onclick="papagoBtn()">영어 번역</button>
		</div>
	</div>

</div>
</body>
</html>