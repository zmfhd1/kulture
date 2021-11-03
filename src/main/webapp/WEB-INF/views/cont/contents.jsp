<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist");
int j = (int)request.getAttribute("j");
int i = j - 1;
%>

<!DOCTYPE html>
<html>
<head>

 <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>kulture: contents</title>
        
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

   
</head>


<body id="page-top">
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
        


<style>
img{
width : 550px;
height : 700px;
}

#wapper div{
/* border:1px solid #f4623a; */
padding:20px;
font-family: 'Heebo black';
background-color: #F7EFE2;
 
}
.divcontents{border-radius:10px;}

h4 {
font-family: Heebo black;
font-size: 2rem;
}



/* .desc{
position:fixed;

} */

</style>

<section class="page-section">

<!-- 컨텐츠 제목 -->
<div class="content_name">
	 	<h1 class="text-center" id="category_title"><%=contentslist.get(i).getContent_name() %></h1>
	</div>
<div id="space_little3"></div>


<div class="container px-4 px-lg-1">
 <div class="row gx-4 gx-lg-5">
	<div class="row col-lg-5 col-md-6">

<!--컨텐츠 사진-->	
		<img img src=<%=contentslist.get(i).getContent_quotesurl() %> >
		
	
	 	
 <!-- 컨텐츠 링크 -->	
 			<div>
		   <center><a href="<%=contentslist.get(i).getContent_link()%>"> 
	 	  <img src=<%=contentslist.get(i).getContent_link_desc() %> style= "width:60px; height:60px;"></a>  
	 	 <div id=space4_2></div>
	 	  <div class="text-center" style="display: inline-block; font-family: Heebo black; font-size: 1.5rem;"> Go to see it!</div></div>
	  </center>
	</div>

<!-- 컨텐츠 내용들========================================================================================= -->	
<div class="col-lg-7 col-md-7"> 
	 
 <!-- 컨텐츠 소개글 -->	

 <div id=wapper>
	<div class="desc divcontents">
		<br><H4 class="text-center">Content introduction</H4>
			<hr class="divider3" />
			<p class="text-left"><%=contentslist.get(i).getContent_description() %></p>
			 <p id="ko_content"><%=contentslist.get(i).getContent_description_ko() %></p>
	
	 <br>		
<!-- 컨텐츠 등장인물 -->		
	<!-- <div class="characters"> -->	
		<h4 class="text-center">Character</h4>	
		<hr class="divider3" />
			<p class="text-center"><%=contentslist.get(i).getContent_characters() %></p>

	 <br>
<!-- 컨텐츠 인용구(명대사) -->		
<!-- 	<div class="quotes divcontents"> -->
		<h4 class="text-center">Quotes</h4>
			<hr class="divider3" />	
	  		<p class="text-center"><%=contentslist.get(i).getContent_quotes() %></p>
	  		 <p id="ko_content"><%=contentslist.get(i).getContent_quotes_ko() %> </p>
	
	 <br>
<!-- 컨텐츠 은어, 은어설명 -->	
	<!-- <div class="slang divcontents"> -->
		<h4 class="text-center">Hidden Meaning</h4>
			<hr class="divider3" />
			<p class="text-center" id="ko_content"><%=contentslist.get(i).getContent_slang() %></p>
			<p class="text-left"><%=contentslist.get(i).getContent_slang_desc() %></p>
			 <p id="ko_content"><%=contentslist.get(i).getContent_slang_desc_ko() %></p>
	 </div>
	</div>
  </div>
 </div>
 </div>
</div>
</section>
<div id="space_little"></div>

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