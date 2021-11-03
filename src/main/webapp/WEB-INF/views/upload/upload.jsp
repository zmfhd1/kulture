<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
 
<div>
    <input type="file" id="file1" name="file1"> 
    <button id="btn_submit" onclick="uploadFile()">전송</button>    
</div>
    
<script>
//파일 업로드
function uploadFile(){
    var formData = new FormData();
    formData.append("file1", $("#file1")[0].files[0]);

    $.ajax({
        url: '/result',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(uploadData){
        	//String name = JSON.stringify(uploadData.filename1);
        	console.log(uploadData);
            alert("파일명 : " + uploadData + "전송완료");
        }
    });
}
</script>

<div>

</div>

</body>
</html>
