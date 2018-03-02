<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.AlbumboardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>앨범리스트</title>
</head>
<body>
<%	
		String id = request.getParameter("id");
		 id = (String)session.getAttribute("id");
		int currentPage = 1;
		
		try{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}catch(Exception e){
				out.println("페이지번호가 숫자가 아닙니다. ");
		}
		
		AlbumboardList list = SelectService.getInstance().albumlist(currentPage);
		session.setAttribute("id", id);
		request.setAttribute("rn", "\r\n");
		request.setAttribute("list", list);
		pageContext.forward("albumlist.jsp");
%>
</body>
</html>