<%@page import="com.javalec.Service.DeleteService"%>
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
			request.setCharacterEncoding("UTF-8");
	
			String id = (String)session.getAttribute("id");
			int idx = Integer.parseInt(request.getParameter("idx"));
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	%>
	
	<jsp:useBean id="guest" class="com.javalec.VO.GuestBookVO">
		<jsp:setProperty property="*" name="guest"/>
	</jsp:useBean>
	
	<%
			GuestBookVO vo = SelectService.getInstance().SelectByIdx(guest.getIdx());
			session.setAttribute("id", id);		
	
			out.println("<script>");
			if(guest.getPassword().equals(vo.getPassword())){
				DeleteService.getInstance().DeleteGuest(idx);
				out.println("alert('삭제가 완료되었습니다. ')");
			}else{
				out.println("alert('비밀번호가 올바르지 않습니다. ')");
			}
				out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
				out.println("</script>");
	%>
</body>
</html>