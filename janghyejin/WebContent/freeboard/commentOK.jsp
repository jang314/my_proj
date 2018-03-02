<%@page import="com.javalec.Service.DeleteService"%>
<%@page import="com.javalec.Service.InsertService"%>
<%@page import="com.javalec.Service.UpdateService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	int mode = Integer.parseInt(request.getParameter("mode"));
	
%>

<jsp:useBean id="vo" class="com.javalec.VO.FreeboardCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
 
<%
		
		out.println("<script>");
		session.setAttribute("id", id);
		switch(mode) {
		case 1:		//	댓글 저장
			InsertService.getInstance().insertComment(vo);
			out.println("alert('댓글이 등록되었습니다.')");
			break;
		case 2:		//	댓글 수정
			UpdateService.getInstance().UpdateComment(vo);
				out.println("alert('댓글이 수정되었습니다')");
			break;
		case 3:		//	댓글 삭제
			DeleteService.getInstance().DeleteComment(vo.getIdx());
			out.println("alert('댓글이 삭제되었습니다')");
			break;
	}
			out.println("location.href='selectByIdx.jsp?id="+id+"&currentPage="+currentPage+"&idx="+vo.getRef()+"'");
			out.println("</script>");

//	response.sendRedirect("selectByIdx.jsp?currentPage=" + currentPage + "&idx=" + co.getRef());
%>
</body>
</html>