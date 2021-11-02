<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Project</title>
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
        
        <!-- 제가 적용하는 style 및 sript 부분 -->
        <script src="/jquery-3.2.1.min.js"></script>
<style>
#modal {
display:none;

  position:fixed;
  width:100%;
  height:50%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   
</style>

<script>

$(document).ready(function(){
	$("#btnLogin").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();//입력포커스 이동
			return;//함수종료
		}
		if(pw==""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();//입력포커스 이동
			return;//함수종료
		}
		//폼 내부의 데이터를 전송할 주소
		//document.login.action="main2"
		//제출
		document.login.submit();
	});
});


</script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="http://localhost:9007/main">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9007/insertmember">Join</a></li>
                     	<div id="root">    
                        <li class="nav-item"><a class="nav-link" id="modal_open_btn">Log in</a></li>
                        </div>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9007/service">Service</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
              
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- 로그인 -->
        <div id="modal">
   
    <div class="modal_content">
        <h2>Log in</h2>
       
        <form action="main" name="login" method="post">
		ID: <input id="id" type="text" autofocus="autofocus" name="id" placeholder="10-digit" maxlength="10"><br>
		Password: <input id ="pw" name = "pw" type="password" name="pw" maxlength="4" placeholder="4-digit">
		<input id ="btnLogin" type="button" value="확인">
		</form>
        <button type="submit" id="modal_close_btn">닫기</button>      
       
    </div>
    <div class="modal_layer"></div>
</div>

<script>
    $("#modal_open_btn").click(function(){
        $("#modal").attr("style", "display:flex");
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").attr("style", "display:none");
    });
  
</script>

<style>
/* .servicepart{
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
} */
</style>
        
<title>Insert title here</title>
</head>




<%int i = 0;%>

<script src="/jquery-3.2.1.min.js"></script>
<script>
//회원탈퇴
function deleteMember(id){
	//var id = $("#").val();
	//console.log("id:::::", id);
	$.ajax({
		url:'/deletemember',
		type:'post',
		data:{'id': id},
		
		//dataType:'json',
		success: function(msg){
			alert("success");
		},//success
		error:function(e){alert("error")},
		//complete:function(){alert("완료 ")}
	});
	//새로고침
	location.reload();
};

</script> 

 <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="http://localhost:9007/main">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9007/insertmember">Join</a></li>
                     	<div id="root">    
                        <li class="nav-item"><a class="nav-link" id="modal_open_btn">Log in</a></li>
                        </div>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:9007/service">Service</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
              
                    </ul>
                </div>
            </div>
        </nav>
        
<style>
        table{
         text-align: center;
    border : 2px solid gray;
}
tr{
    text-align: center;
    border : 2px solid gray;
}
tr th{
    border : 1px solid gray;
    background-color: lightgreen;
}
td{
    border : 1px solid gray;
    width:7%;
    }
</style>
        
        <section class="page-section">
        <div class="container px-4 px-lg-5">
        
<h2 class="text-center">${msg }</h2>
  

<table>
<thead>
<tr>
<th>ID</th>
<th>PW</th>
<th>이름</th>
<th>이메일</th>
<th>전화번호</th>
<th>닉네임</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
<c:forEach items="${memberlist }" var="membervo">
<tr>
	<td><c:out value="${membervo.id }"/></td>
	<td><c:out value="${membervo.pw }"/></td>
	<td><c:out value="${membervo.name }"/></td>
	<td><c:out value="${membervo.email }"/></td>
	<td><c:out value="${membervo.phone_number }"/></td>
	<td><c:out value="${membervo.nickname }"/></td>
	<td><input id="<%=i %>" class="id" type="hidden" name="id" value="${membervo.id }">
<input id="${membervo.id}" type="button" value="삭제" class="deletebtn" onclick="deleteMember(this.id)"></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<br>
	<br>
	 
	
	

<%-- ${membervo.id }  ${membervo.pw } : ${membervo.name } : ${membervo.email } :${membervo.phone_number } :${membervo.nickname } 

<input id="<%=i %>" class="id" type="hidden" name="id" value="${membervo.id }">
<input id="${membervo.id}" type="button" value="삭제" onclick="deleteMember(this.id)"> 
<br>
<%i = i+1;%>
--%>






</div>

</section>




</body>

</html>