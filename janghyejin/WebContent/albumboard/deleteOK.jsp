<%@page import="com.javalec.Service.DeleteService"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제</title>
</head>
<body>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="com.javalec.VO.AlbumboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String id = request.getParameter("id");
		String img = vo.getImg();
		String path="C:/upload"+"/"+img;
		out.println(currentPage);
		out.println(id);
 		File file = new File(path);
		if(file.exists() == true){
			out.println("<script>");
			file.delete();
			DeleteService.getInstance().DeleteAlbum(vo.getIdx());
			session.setAttribute("id", id);
			out.println("alert('게시글이 삭제되었습니다. ')");
			out.println("location.href='list.jsp?id=" + id + "&currentPage=" + currentPage +"'");
			out.println("</script>");
		}
%>
</body>
</html>