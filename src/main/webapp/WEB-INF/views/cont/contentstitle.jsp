<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentstitle"); %>
<html>
<head>
 <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>kulture: contents category</title>
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
/*
 #wapper div{border:5px solid #C27438; }
.divcontents{border-radius:15px; width:1100px; height:395px;}*/


#space_little3{
padding-bottom: 30px;
}

</style>


<header class="masthead2">
<section class="page-section">

<!-- #BC5200 -->
<!-- #C27438 -->

<!-- 카테고리 이름 출력 -->
<div id=title_name class="text-center">
<%for (int i=0; i < 1; i++){ %>
<%=contentslist.get(i).getContent_title()%>
<%} %>
<!-- <hr class="divider2" /> -->
</div>

 <br>

 
<center>  
<div id=wapper>

	<div class="title divcontents">


<table>
<thead>
		<tr> 
		<!-- 이미지 나오는 곳 -->
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents1?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=210 height=300>
			<!-- <div id="space4"></div> -->
			<% } %>
			</th>
			
		</tr>
	</thead>
	<br>
	<tbody>
 		<tr>
 		<!-- 제목 나오는 곳 -->
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><br><h6 id="contents_title"><%=contentslist.get(i).getContent_name() %></h6></td>
			<% } %>
 		</tr>
 	</tbody>
</table>
</div>
</div>
<!-- <div id="space_little2"></div>
<p id="enjoy_typo">Enjoy our contents!</p> -->
	</center>  
</header>

<div id="space_little2"></div>

<div class="text-center">
<h2>Comming Soon..</h2>
</div>

<div></div>
 <br>



<center>  
<div class="container px-4 px-lg-5">

<table>
<thead>
		<tr>
			<th>
			<img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzA5MDlfOTUg%2FMDAxNTA0OTI3MjA4Njcw.
			CZ3khVYO1iAns7Fe_lXoOfMyRY7erx_twMKFL_DiJZYg.1BIjwUrgbclWtlGvoecCJV9HpR-HCBoB6uA29zku3Jkg.JPEG.sulijk00%2FNaverBlog_20170909_
			122005_37.jpg&type=sc960_832"
			width=150 height=200>
			<img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F112%2F2021%2F09%2F16%2F202109160856164695701
			_20210916085645_01_20210916085811226.jpg&type=sc960_832"
			width=150 height=200>
			<img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F469%2F2018%2F05%2F24%2F0000302046_
			001_20180525045342233.jpg&type=sc960_832"	
			width=150 height=200>
			<img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNjExMDNfMjIz%2FMDAxNDc4MTUyMzk3MjM3.AWDIXhMFLd9RMUoF_
			947Ff2o7qT3e-8addbVnr09400g.BJCiyXkuz3qCdpPU1KZRJxZsQsXrPVbj7Ksb_buG8dUg.JPEG.dlgkdms0034%2FIMG_20161103_144722.jpg&type=sc960_832"
			width=150 height=200>
			<img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F109%2F2017%2F03%2F16%2F201703161440779651_
			58ca25b64245a_99_20170316144304.jpg&type=sc960_832"
			width=150 height=200>
			<img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MDJfMzcg%2FMDAxNjI3ODk1MDczMDg3.VpMnR_
			8lxvakr3AcWQVty6hEqG9ftQdN3ki14lZVy0Mg.lFUSQg2FBo3btZrcKeCZkaAEBTkcp7b72hyBgYy-naAg.JPEG.cylab%2FASTRO%2528%25BE%25C6%25BD%25BA%25C6%25AE%25B7%25CE%2529_-_After_Midnight.jpg&type=sc960_832"
			width=150 height=200>
			</th>
		</tr>
	</thead>
	<br>
	<tbody>
 		<tr>
			
 		</tr>
 	</tbody>
</table>
</div>
</center> 


  <!-- Contact-->
       <section class="page-section" id="contact">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">Please Send Me the Contents!</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">Please contact me about the Korean content you want. <br> I'll prepare it quickly and update it!</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                       <!-- ---------------------------------------------------------------------- -->
                        <form action="content_mail" >
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your nick-name..."  />
                                <label for="name">Nick-name</label>
                               
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com"  />
                                <label for="email">Your Email</label>

                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890"  />
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" >A phone number is required.</div>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" ></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback">A message is required.</div>
                            </div>
                            
                             <div class="d-grid"><input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="submit"></div>
                			 
                			<!--  <div class="d-grid"><button type="button" class="btn btn-primary btn-xl" id="btn" 
							onclick="location.href='/content_mail'">submit</button> -->
                    		<!--  <div class="d-grid"><input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="submit"></div> -->
                            <br> </form>
                          
                            
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-4 text-center mb-5 mb-lg-0">
                        <i class="bi-phone fs-2 mb-3 text-muted"></i>
                        <div> dbekdms27@gmail.com </div>
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
