<%@page import="com.javalec.Service.InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	한글이 깨지지 않도록 처리하고 insert.jsp에서 넘어오는 데이터를 받는다.
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.javalec.VO.GuestBookVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	String id = (String)session.getAttribute("id");
	
	out.println("<script>");
		try{
			InsertService.getInstance().insertGuest(vo);
			out.println("alert('방명록이 등록되었습니다.')");
			out.println("location.href='list.jsp'");
		}catch(Exception e){
			out.println("alert('방명록 등록에 실패하였습니다.')");
			out.println("location.href='list.jsp'");
		}
		out.println("</script>");
		
%>
</body>
</html>

