<%@page import="contents.ContentsVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ContentsVO> contentslist = (List<ContentsVO>)request.getAttribute("contentslist");
int j = (int)request.getAttribute("j");
int i = j - 1;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
img{
width : 400px;
height : 550px;
}
div{
border: 1px solid;
}
/* .desc{
position:fixed;

} */
</style>

<th><img img  
src=<%=contentslist.get(i).getContent_quotesurl() %> ></th>


<div class="quotes">
	<h4>Quotes</h4>
  	<p><%=contentslist.get(i).getContent_quotes() %> </p>  
</div>	

<div class="desc">
	<H4>Content introduction</H4>
	<p><%=contentslist.get(i).getContent_name() %></p>
	<p><%=contentslist.get(i).getContent_description() %></p>
</div>

<div class="character">
	<h4>Character</h4>
	<p><%=contentslist.get(i).getContent_characters() %></p>
</div>

<div class="slang">
	<h4>Hidden Meaning</h4>
	<p><%=contentslist.get(i).getContent_slang() %></p>
	<p><%=contentslist.get(i).getContent_slang_desc() %></p>
</div>


</body>
</html>