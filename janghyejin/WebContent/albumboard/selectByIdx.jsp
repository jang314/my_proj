<%@page import="com.javalec.VO.AlbumboardCommentList"%>
<%@page import="com.javalec.VO.AlbumboardVO"%>
<%@page import="com.javalec.VO.FreeboardCommentList"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.FreeboardVO"%>
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
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String id = request.getParameter("id");
		id = (String)session.getAttribute("id");
		String job = request.getParameter("job");
		AlbumboardVO vo = SelectService.getInstance().AlbumByIdx(idx);
		MemberVO mo = SelectService.getInstance().SelectById(id);
		
		
		if(id==null){
		out.println("<script>");
		out.println("alert('로그인 후 이용가능합니다. ')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
		}else{
			session.setAttribute("id", id);
			request.setAttribute("idx", idx);
			request.setAttribute("rn", "\r\n");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("mo", mo);
			request.setAttribute("vo", vo);
			if(job==null){
				AlbumboardCommentList comment = SelectService.getInstance().AlbumCommentList(idx);
				request.setAttribute("comment", comment);
				pageContext.forward("albumView.jsp");
			}else{
				pageContext.forward(job+".jsp");
			}
		}
%>
</body>
</html>