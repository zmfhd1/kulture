<%@page import="users.StudyInfoVO"%>
<%@page import="java.util.List"%>
<%@ page import="users.TestController2" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<StudyInfoVO> studyinfolist = (List<StudyInfoVO>)request.getAttribute("studyinfolist");
%>
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
</head>
<body>
<br><br>
<div class="col-lg-6 col-md-6 text-center">

<form action="/search" method="post">
	<fieldset>
		<!-- <legend>Search</legend> -->
			<label></label><img width="20" height="20" src="https://emojigraph.org/media/apple/magnifying-glass-tilted-left_1f50d.png"></label>
			<input type = "text" name="title"/>
			<input name = "member_id" type="hidden" value="${sessionScope.id }">
			<input id="searchBtn" type="submit" value="Search">
	</fieldset>
</form>
<br>
</div>
<div class="container px-4 px-lg-5">
<form action="/delete" method="post">
<table>
	<th>Title</th>
    <%for(int i=0; i < studyinfolist.size(); i++){ %>
    <tr>
    	<td style="text-align:left">
    		<input id="title1" name="title1" type="checkbox" value="<%=studyinfolist.get(i).getTitle()%>" checkid='checked'></input>
     		<a href="/aboutstudy" ><%=studyinfolist.get(i).getTitle()%></a> 
    	</td>
	</tr>
   			<%} %>
</table>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;
<input style="width:65px; height:30px;" type="submit" value="Delete" >
<input style="width:65px; height:30px;" type="button" onclick="location.href='/study'" value="Write">
</form>
</div>
<!-- <button style="width:65px; height:30px;" onclick="deleteBtn()">Delete</button> -->


<script src="jquery-3.2.1.min.js"></script>
<script>
/* function deleteBtn(){
	var deletetitle = document.getElementsByName("title1");
	var deletelist = new Array();
	
	for (var i=0; i < deletetitle.length; i++){
		if(deletetitle[i].checked){
			deletelist.push(deletetitle[i].value);
		}
	}
	console.log(deletelist[0]);
	if (deletelist == null){
		alert("Error : Check title first!");
	}
	else{
			$.ajax({
				url : '/delete',
				data :'deletelist': deletelist,
				dataType : 'json',
				type : 'post',
				traditional : true,
				success : function(result){
					console.log(result);
				}			
			});
		
		}
	} */
</script>

<style>
table{
	border : 2px solid;
	margin-left : auto;
	margin-right : auto;
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
	font-size: x-large;
	font-style: oblique;
}
</style>


</body>
</html>