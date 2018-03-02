<%@page import="com.javalec.Service.DeleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="com.javalec.VO.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	String id = (String)session.getAttribute("id");
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));

 			out.println("<script>");
		try{
			if(id==null){
				out.println("alert('로그인 해주세요.')");
				out.println("location.href='../home.jsp'");
			}else{
				session.setAttribute("id", id);
				DeleteService.getInstance().DeleteBoard(vo.getIdx());
				out.println("alert('삭제가 완료되었습니다. ')");
				out.println("location.href='list.jsp?id=" + id + "&currentPage=" + currentPage +"'");
			}
		}catch(Exception e){
			out.println(e);
		}
				out.println("</script>"); 
%>
</body>
</html>