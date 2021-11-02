<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
      <textarea cols="50" rows="30" id="text">${speechresult }</textarea>
      <br />
      <button id="test"></button>
      <input type="button" id="btn" value="Download" />
      <script>
      var testbtn = document.getElementById("test");
      var dwbtn = document.getElementById("btn");
      
      function download(filename, textInput) {
      var element = document.createElement('a');
      element.setAttribute('href','data:text/plain;charset=utf-8, ' + encodeURIComponent(textInput));
      element.setAttribute('download', filename);
      document.body.appendChild(element);
      element.click();
      //document.body.removeChild(element);
      }
      dwbtn.addEventListener("click", function () { 
    	  //이벤트란 마우스킬릭, 키보드 입력, 문서 로딩 등 사용자 입력 행위등을 코드에게 알리는 통지
    	  //발생한 이벤트에 적절히 대처하기 위해 작성된 코드
            var text = document.getElementById("text").value;
            var filename = "output.txt";
            download(filename, text);
      }, false);

            
            
      </script>
      
      
	</body>
</html>