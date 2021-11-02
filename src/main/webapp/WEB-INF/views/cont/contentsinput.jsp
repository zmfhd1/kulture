<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist"); %>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<style>
table{
border : 1px solid;
width: 200px;
height: 100px;
}
</style>
<center>
<H3>이달의 추천</H3></center>
<form action=/contents>
<center><table>
	<thead>
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=120 height=150>
			<% } %>
			</th>
		</tr>
	</thead>
	<tbody>
 		<tr>
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><%=contentslist.get(i).getContent_title() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>
</center>
</form>


<p>
<center>
<input id="id" type="hidden" name="id" value="${sessionScope.id }">
<input type="button" onclick="goto()" value="Go to list">
</center>
</p>
<script src="/jquery-3.2.1.min.js"></script>
<script>

function goto(){
	
	var id = $("#id").val();
	console.log("'" + id + "'");
	if(id==""){
		alert("로그인이 필요합니다.");
		//location.reload();
	}else{
		location.href="/studylist";
	}
	//location.href="/studylist";
}
</script>
</body>
</html>