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
        <title>kulture: admin</title>
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

        
<title>Kulture: admin</title>
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
                <a class="navbar-brand" href="main3">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    	<li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                        <li class="nav-item"><a class="nav-link" href='/admin'>admin</a></li> 
                        <li class="nav-item"><a class="nav-link" href="/study">Study</a></li>
                        <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li>
                        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>
                     	

              
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
    background-color: #ffe3b8;
    font-size: 1.5em;
    font-family: Gmarket Sans;
}
td{
    border : 1px solid gray;
    width:7%;
    font-family: Gmarket Sans;
    }
</style>
        
        <section class="page-section">
        <div class="container px-4 px-lg-5">
        
<div class="text-center" style="font-size: 3em; font-family: Heebo black;">${msg }</div>
  <div id="space_little2"></div>

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
<form action="studylist">
	<td><input name="admin_id" type="submit" value="${membervo.id }"></td>
</form>
	<td><c:out value="${membervo.id }"/></td>
	<td><c:out value="${membervo.pw }"/></td>
	<td><c:out value="${membervo.name }"/></td>
	<td><c:out value="${membervo.email }"/></td>
	<td><c:out value="${membervo.phone_number }"/></td>
	<td><c:out value="${membervo.nickname }"/></td>
	<td><input id="<%=i %>" class="id" type="hidden" name="id" value="${membervo.id }">
<input id="${membervo.id}" type="button" value="삭제" onclick="deleteMember(this.id)"></td>
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



<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - Kulture</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>