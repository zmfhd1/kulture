<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist"); %>
<!DOCTYPE html>
<html lang="en">
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
  height:100%;
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
  width:400px;
  height:320px;
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

#space{
padding-bottom: 400px;
}

#space_little{
padding-bottom: 20px;
}

#space_little2{
padding-bottom: 80px;
}


#toReveal {
  position: absolute;
  opacity: 0;
  /*margin-left: -100px;
  margin-top: 200px;*/
  transition: all 2s;
}

#toReveal.revealed {
  opacity: 1;
  transform:translate(100px,0px);
}

#monthly_typo{
color: white;
font-size: 1.8em
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


$(window).on("scroll", function() {
	  var winTop = $(window).scrollTop();
	  if (winTop >= 100)  {
	    $("#toReveal").addClass("revealed");
	 }
});

</script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">Kulture</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/insertmember">Join</a></li>
                     	<div id="root">    
                        <li class="nav-item"><a class="nav-link" id="modal_open_btn">Log in</a></li>
                        </div>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
              
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- 로그인 -->
        <div id="modal">
   
    <div class="modal_content">
        <center>
        <h2>Log in</h2>
       <div id="space_little"></div>
        <form action="main" name="login" method="post">
		ID: <input class="textarea2" id="id" type="text" autofocus="autofocus" name="id" placeholder="10-digit" maxlength="10">
		<div id="space_little"></div>
		Password: <input class="textarea2" id ="pw" name = "pw" type="password" name="pw" maxlength="4" placeholder="4-digit">
		<div id="space_little"></div>
		<input class="btn-primary btn-xl2" id ="btnLogin" type="button" value="confirm" >
        <input class="btn-primary btn-xl2" type="button" id="modal_close_btn" value="close">
		</form>
        </center> 
       
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
        
        
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                   <!--<div class="col-lg-8 align-self-end">
                      
                        <h1 class="text-white font-weight-bold"></h1>
                        <h1 class="text-white font-weight-bold"></h1>
                         <hr class="divider" /> 
                    </div>-->
                    <div class="col-lg-8 align-self-baseline">
                        <!--<p class="text-white-75 mb-5"></p>-->
<!-- ==================================================================================== -->
                        <!-- 타이틀 테스트 -->
<div class="container" id="typo">
<div id="space_little2"></div>
<!--
<style>
#toReveal {
  position: absolute;
  opacity: 0;
  margin-left: -100px;
  margin-top: 200px;
  transition: all 2s;
}

#toReveal.revealed {
  opacity: 1;
  transform:translate(100px,0px);
}
</style><div style="height: 1000px;">
  <img src="http://placehold.it/100" id="toReveal" />
  Scroll Down
</div>

<script>
$(window).on("scroll", function() {
  var winTop = $(window).scrollTop();
  if (winTop >= 100)  {
    $("#toReveal").addClass("revealed");
  }
});
</script>-->
<!-- ==================================================================================== -->                        
                        <!-- 이 달의 추천 -->
         <div id="space"></div>
                        <div>
                        	<div id="monthly_typo">Monthly Recommendation</div>
                       	</div>
                        <div id="space_little"></div>
<div class="container" id="contents" align="center">				
<form action=/contents>
<center><table>
	<thead>
		<tr>
			<% for (int i=0; i < 3; i++) {%>
			<th>
			<a target="_blank" href="●">
			<img onclick="location.href='./contents?content_title=<%=contentslist.get(i).getContent_title() %>'"
			src=<%=contentslist.get(i).getContent_url()%> style="width:10em; height:15em;"></a>
			<% } %>
			
			</th>
		</tr>
	</thead>
	<tbody>
 		<tr>
 			<% for (int i=0; i < 3; i++) {%>
	 		<td style="color: white; font-size: 1em" align="center" name="imagetitle" value="<%=contentslist.get(i).getContent_title() %>"><%=contentslist.get(i).getContent_title() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>
</center>
</form>
</div>
                        
                        <div id="space_little"></div>
                        <a class="btn btn-primary btn-xl" href="/studylist">Let's Study</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- ==================================================================== -->
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">What is Kulture?</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-6 col-md-6 text-center"> <!-- col-lg-6 : 50% -->
                        <div class="mt-5">
                         <div id="toReveal">
                         <h4>"Kulture" was inspired by "Korean Kulture".</h4> <br>
                         Our service is for people who are interested in Korean Kulture.
                         </div>	
				
                        </div>
                        
                    </div>
  
                </div>
            </div>
        </section>
        
        <div id="space"></div>
 
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="https://img.vogue.co.kr/vogue/2020/05/style_5ec3376f1cd53-643x930.jpeg" title="Project Name">
                            <img class="img-fluid" src="https://img.vogue.co.kr/vogue/2020/05/style_5ec3376f1cd53-643x930.jpeg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/2.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/3.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/4.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/5.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="assets/img/portfolio/fullsize/6.jpg" title="Project Name">
                            <img class="img-fluid" src="assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
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
