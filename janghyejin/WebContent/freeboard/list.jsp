<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.DAO.FreeboardCommentDAO"%>
<%@page import="com.javalec.VO.FreeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.VO.FreeboardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
<body>
<%	
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		String item = request.getParameter("item");
		int currentPage = 1;
		
		if(item == null){
//			검색어가 없으면 저장된 검색어가 있는지 확인한다.
			item= (String)session.getAttribute("item");
		}else{
//			검색어가 있으면 세션에 저장한다.
			session.setAttribute("item" ,item);
		}
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(Exception e) { }
		
		ArrayList<FreeboardVO> notice = SelectService.getInstance().selectNotice();
		FreeboardList list = null;
		
		if(item == null || item.trim().length() == 0){
			 list = SelectService.getInstance().freeboardList(currentPage);
			} else {
			list = SelectService.getInstance().freeboardList(currentPage, item);			
			}
		
		session.setAttribute("id", id);
		request.setAttribute("rn", "\r\n");
		request.setAttribute("list", list);
		request.setAttribute("notice", notice);
		
		pageContext.forward("listView.jsp");
%>
</body>
</html>