<%@page import="com.javalec.Service.InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 글등록</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.javalec.VO.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
		String id = (String)session.getAttribute("id");

 		out.println("<script>");
 		session.setAttribute("id", id);
			try{
				InsertService.getInstance().insertFreeboard(vo);
				out.println("alert('게시판 글이 등록되었습니다.')");
				out.println("location.href='list.jsp'");
			}catch(Exception e){
				out.println("alert('게시판 글 등록에 실패하였습니다.')");
				out.println("location.href='list.jsp'");
			}
			out.println("</script>"); 
%>
</body>
</html>