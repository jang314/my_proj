<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
		String id = (String)session.getAttribute("id");
		
			out.println("<script>");
		if(id!=null){
			session.removeAttribute("id");
			out.println("alert('로그아웃 되었습니다.')");
			out.println("location.href='../index.jsp'");
		}else{
			out.println("alert('로그인이 되지 않았습니다.')");
			out.println("location.href='../index.jsp'");
		}
			out.println("</script>");
%>
</body>
</html>