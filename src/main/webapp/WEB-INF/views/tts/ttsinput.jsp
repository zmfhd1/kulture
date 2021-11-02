<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
function playBtn() {
	var input = document.getElementById("input").value;//텍스트 입력값 저장
    var speed = document.getElementsByName("speed");//재생속도 저장 변수
    var speedResult;//선택된 재생속도 저장 변수
    //var ttsResult;//생성된 음성파일명 저장 변수

    for (var i=0; i < speed.length; i++) {
    	if (speed[i].checked == true) {
    		//alert("입력 내용은 "+input+" 입니다.")
            //alert("선택한 재생 속도값은 "+speed[i].value+" 입니다");
            speedResult = speed[i].value;
            //alert("전달할 재생 속도값은 "+speedResult+" 입니다");
            
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

</script>

</head>
<body>

<div class="container" id="TTSservice" align="center">
	
	<div id="ttsInput">
		Please enter Korean in the input box below<br><br>
		<textarea id="input" rows="10" cols="30"></textarea><br><br><br>
		
		Select voice play speed :
		<input type="radio" name="speed" value="5" /> 0.5x
		<input type="radio" name="speed" value="0" checked="checked" /> 1.0x
		<button onclick="playBtn()">Play</button> <br><br>
	</div>
	
	<div id="ttsResult">	
		<audio id="audio" src="" controls="controls"></audio>
	</div>

</div>

</body>
</html>