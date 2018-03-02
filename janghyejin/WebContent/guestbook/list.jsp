<%@page import="com.javalec.VO.GuestBookVO"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.GuestbookList"%>
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
//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
//	넘어오는 페이지 번호가 정상적인 숫자가 아니라\면 1페이지를 꺼내오게 한다.
	int currentPage = 1;
	String id = (String)session.getAttribute("id");
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage")); 
	} catch(Exception e) { }

//	테이블에서 화면에 출력할 한 페이지 분량의 글을 얻어온다.
	GuestbookList list = SelectService.getInstance().selectList(currentPage);
/* 	for(GuestBookVO vo : list.getList()) {
		out.println(vo + "<br/>");
	} */

//	한 페이지 분량의 글을 request 영역에 저장한다.
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("list", list);
	session.setAttribute("id", id);
	pageContext.forward("guestlist.jsp");
%>
</body>
</html>