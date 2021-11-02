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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="/project_two/search" method="get">
		<fieldset>
			<legend>Search</legend>
				<label>검색</label>
				<input type = "text" name="word" value="" />
				<button id="searchBtn" type="submit">Search</button>
		</fieldset>
<table>
	<th>제목</th>
	<%for (int i=0; i < 1; i++) {%>
     	<td><a href="" ><%=searchlist.get(i).getTitle()%></a></td> 
     	<%} %>
	</tr>
</table>
	</form>
</div>
<style>
table{
	border : 2px solid;
	margin-left : auto;
	margin-right : auto;
}
td{
	border : 1px solid;
	width : 300px;
	height : 15px;
}

</style>
<input type="button" onclick="location.href='/studylist'" value="Return">


</body>
</html>