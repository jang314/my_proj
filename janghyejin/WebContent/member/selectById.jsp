<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberVO vo = SelectService.getInstance().SelectById(id);
		if(vo!=null){
			if(vo.getId().equals(id)){
				if(vo.getPassword().equals(password)){
				    out.println("<script>");
					out.println("alert('로그인되었습니다.');");
					out.println("location.href='loginOK.jsp?id="+id+"'");
					out.println("</script>");
				}else{
					out.println("<script>");
					out.println("alert('비밀번호 오류입니다.');");
					out.println("location.href='login.jsp'");
					out.println("</script>");
				}
			}
		}else{
			out.println("<script>");
			out.println("alert('아이디 오류입니다.');");
			out.println("location.href='../home.jsp'");
			out.println("</script>");
		}
%>
</body>
</html>