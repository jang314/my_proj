<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.GuestBookVO"%>
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
		String id = (String)session.getAttribute("id");
		String job = request.getParameter("job");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		GuestBookVO vo = SelectService.getInstance().SelectByIdx(idx);	
//		out.println(vo);

		session.setAttribute("id", id);
		request.setAttribute("vo", vo);
		request.setAttribute("currentPage", currentPage);
		pageContext.forward(job+".jsp");
%>
</body>
</html>