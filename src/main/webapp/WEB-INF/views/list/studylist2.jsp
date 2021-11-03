<%@page import="users.StudyInfoVO"%>
<%@page import="java.util.List"%>
<%@ page import="users.TestController2" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//List<UsersVO> userslist = (List<UsersVO>)request.getAttribute("userslist");
List<StudyInfoVO> searchlist = (List<StudyInfoVO>)request.getAttribute("searchlist");
//String title = (String)request.getAttribute("userstitle");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>kulture: search</title>
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
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main2">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    	<li class="nav-item"><a class="nav-link">${sessionScope.nickname }</a></li>
                        <li class="nav-item"><a class="nav-link" href='/study'>Study</a></li>
                        <li class="nav-item"><a class="nav-link" href='/studylist'>My list</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage">My page</a></li> 
                        <li class="nav-item"><a class="nav-link" href='/logout'>Log out</a></li>
                        
              
                    </ul>
                </div>
            </div>
        </nav>
<br><br><br>
<center>
<div id="space_little2"></div>
<div class="col-lg-6 col-md-6 text-center">

<form action="/search" method="post">
	<fieldset>
		<!-- <legend>Search</legend> -->
			<label><img width="20" height="20" src="https://emojigraph.org/media/apple/magnifying-glass-tilted-left_1f50d.png"></label>
			<input type = "text" name="title"/>
			<input name = "member_id" type="hidden" value="${sessionScope.id }">
			<input class="btn btn-primary btn-xl2" id="searchBtn" type="submit" value="Search">
	</fieldset>
</form>
<div id="space_little2"></div>
</div>
</center>
<div class="container px-4 px-lg-5"  id="box1">
<form action="/delete" method="post">
<table>
	<th>Title</th>
    <%for(int i=0; i < searchlist.size(); i++){ %>
    <tr>
    	<td style="text-align:left">
    		<input id="title1" name="title1" type="checkbox" value="<%=searchlist.get(i).getTitle()%>" checkid='checked'></input>
     		<a href="/gotoStudy?title=<%=searchlist.get(i).getTitle()%>" ><%=searchlist.get(i).getTitle()%></a> 
    	</td>
	</tr>
   			<%} %>
</table>
<br>
<div align="right" style="margin-right:auto; margin-left: auto;">
<input class="btn btn-primary btn-xl2" id="delete" type="submit" value="Delete" >
<input class="btn btn-primary btn-xl2" id="write"  type="button" onclick="location.href='/study'" value="Write">
<input class="btn btn-primary btn-xl2" type="button" onclick="location.href='/studylist'" value="Return">
</div>
</form>
</div>


<script src="jquery-3.2.1.min.js"></script>

<style>
div#box1{
	display: flex;
	justify-content:center;
	align-items:center;
}
table{
	border : 2px solid;
	margin-left : auto;
	margin-right : auto;
	width: 1000px;
}
td{
	border : 1px solid;
	width : 500px;
	height : 30px;
	
}
tr{
	text-align: center;
}
th{
	font-size: xx-large;
	font-style: oblique;
}
input{
	text-align: center;
}

</style>


<div id="space"></div>
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