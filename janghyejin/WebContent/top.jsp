<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/index2.css">
<style type="text/css">
table.home {
    width:100%;
    text-align: right;
    font-family: 나눔스퀘어;
    font-size: 13px;
    border: 0px solid #ccc;
    float: right;
}
.wa:link {text-decoration: none; color: #333333;} 
.wa:visited {text-decoration: none; color: #333333;}
.wa:active {text-decoration: none; color: #333333;}
.wa:hover {text-decoration: none; color: gray;}
.welcome{
	font-family: 나눔스퀘어;
	font-size: 13px;
	text-align:left;
	color: #d2d2d2;
}
</style>
</head>
<body>
<%
	String id = request.getParameter("id");
	 id = (String)session.getAttribute("id");
%>
<div id="top">
<table class="home" align="left" border="0" width="300px">
<%
	if(id!=null){
		session.setAttribute("id", id);
%>
<tr>
	<td><%=id%>님이 접속중입니다.</td>
</tr>
<tr>
<td><a href="<%=application.getContextPath()%>/member/logout.jsp" class="wa">로그아웃</a>   |
<a href="<%=application.getContextPath()%>/member/update.jsp" class="wa">정보수정</a>  |
<a href="<%=application.getContextPath()%>/member/delete.jsp" class="wa">회원탈퇴</a>
</td>
</tr>
<%
	}else{
%>
<tr>
<td><a href="<%=application.getContextPath()%>/member/login.jsp" class="wa">로그인</a>   |
<a href="<%=application.getContextPath()%>/member/join.jsp" class="wa">회원가입</a></td>
</tr>
	<%
	}
	%>
</table>
</div>
      <div id="header">
        <a href="<%=application.getContextPath()%>/index.jsp" class="wa"><h1>Jang Hye Jin</h1></a>
      </div>
      <jsp:include page="menu.jsp"/>
</body>
</html>