<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<h4>음성파일 업로드</h4>
<form action="fileupload"  method="post" enctype="multipart/form-data">
<</form>
	<input type="file" id="input" name="file1" onchange="handleFiles(this.files)">
	<script>
		const selectedFile = document.getElementById("input").files[0];
	</script>
	<button id="sendBtn" onclick="uploadResult()">전송</button> -->
	
<h4>음성파일 업로드</h4>
<!-- <form action="fileupload"  method="post" enctype="multipart/form-data"> -->
파일명1 : <input type="file" name="file1">
<button id="btn">업로드</button>

<script>
var myFormData = new FormData();
myFormData.append('pictureFile', pictureInput.files[0]);

$.ajax({
  url: '/fileupload',
  type: 'POST',
  processData: false, // important
  contentType: false, // important
  dataType : 'json',
  data: myFormData
});


/* $('#btn').on('click', function(){    
    var data = new FormData(); //formdata객체 생성
    data.append('input_file_name', $('your_file_input_selector').prop('files')[0]);
    // append other variables to data if you want: data.append('field_name_x', field_value_x);

    $.ajax({
        type: 'POST',               
        processData: false, // important
        contentType: false, // important
        data: data,
        url: your_ajax_path,
        dataType : 'json',  
        // in PHP you can call and process file in the same way as if it was submitted from a form:
        // $_FILES['input_file_name']
        success: function(jsonData){
            ...
        }
        ...
    }); 
}); */
</script>

<!-- </form> -->
</body>
</html>