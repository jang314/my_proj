<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.DAO.MemberDAO"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@page import="com.javalec.Service.DeleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴완료</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = (String) session.getAttribute("id");
	String password = request.getParameter("password");
	MemberVO vo = SelectService.getInstance().SelectById(id);
	
	   if(password.equals(vo.getPassword())){
		DeleteService.getInstance().DeleteMember(vo);
		session.removeAttribute("id");
		out.println("<script>");
		out.println("alert('회원탈퇴가 완료되었습니다. ');");
		out.println("location.href='../index.jsp'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('비밀번호가 맞지않습니다. ');");
		out.println("location.href='delete.jsp'");
		out.println("</script>");
	} 

%>
</body>
</html>