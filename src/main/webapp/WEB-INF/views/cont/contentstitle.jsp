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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%for (int i=0; i <1 ; i++) { %>
<h1><%=contentslist.get(i).getContent_title()%></h1> 
<%} %>
<table>
<thead>
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents1?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=200 height=250>
			<% } %>
			</th>
		</tr>
	</thead>
	<tbody>
 		<tr>
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><%=contentslist.get(i).getContent_name() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>

<div>
<h1>Comming Soon</h1>
</div>

<table>
<thead>
		<tr>
			<% for (int i=0; i < contentslist.size(); i++) {%>
			<th>
			<img img onclick="location.href='./contents1?content_id=<%=contentslist.get(i).getContent_id() %>'"
			src=<%=contentslist.get(i).getContent_url() %> 
			style="cursor: pointer;" width=200 height=250>
			<% } %>
			</th>
		</tr>
	</thead>
	<tbody>
 		<tr>
 			<% for (int i=0; i < contentslist.size(); i++) {%>
	 		<td align="center"><%=contentslist.get(i).getContent_name() %></td>
			<% } %>
 		</tr>
 	</tbody>
</table>


</body>
</html>