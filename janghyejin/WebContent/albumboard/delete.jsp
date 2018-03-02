<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	session.setAttribute("id", id);
%>
<form action="deleteOK.jsp" method="post">
   <jsp:include page="../top.jsp" flush="false"/>	
<input type="hidden" name="idx" value="${vo.idx}"/>
<input type="hidden" name="currentPage" value="${currentPage}"/>
<input type="hidden" name="img" value="${vo.img}"/>
<input type="hidden" name="id" value="${vo.id}"/>
<table class="free-form" border="0" width="900">
	<tr>
		<th class="head" colspan="2">갤러리 삭제</th>
	<tr>
		<td class="thead">작성자 </td><td class="input-form"><input type="text" name="name" value="${vo.name}" style="border: 0; font-family: 나눔스퀘어;"></td>
	</tr>
	<tr>
		<td class="thead">아이디</td><td class="input-form"><input type="text" name="id" value="${vo.id}" style="border: 0; font-family: 나눔스퀘어;"></td>
	<tr>
		<td class="thead">제목  </td><td class="input-form">${vo.title}</td>
	</tr>
		<tr>
		<td class="thead">파일  </td><td class="input-form">${vo.img}</td>
	</tr>
	<tr>
		<td class="thead">내용  </td><td  class="input-form">${vo.content }</td>
	</tr>
	<tr>
		<td colspan=2 align="center" height="100"><input class="button" type="submit" value="삭제하기"></td>
	</tr>
</table>
</form>
</body>
</html>