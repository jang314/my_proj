<%@page import="com.javalec.Service.UpdateService"%>
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
//listView.jsp에서 넘어오는 데이터를 받는다.
		String tempIdx = request.getParameter("idx");
		String tempPage = request.getParameter("currentPage");
		String id = request.getParameter("id");
		id = (String)session.getAttribute("id");
//넘어온 데이터가 null이 아닌지 검사한다.
		if(tempIdx != null && tempPage != null) {
			
		//	넘어온 데이터가 정상적인 숫자인지 검사한다.
			try {
				int idx = Integer.parseInt(tempIdx);
				int currentPage = Integer.parseInt(tempPage);
				if(id != null){
		//		조회수를 증가시킬 글이 있는지 검사하고 조회수를 증가시킨다. (있으면 1, 없으면 0)
				int result = UpdateService.getInstance().increment(idx);
				out.println(result);
				 if(result == 1) {
		//			조회수를 증가시켰으면 글 한 건을 꺼내오는 페이지(selectByIdx.jsp)로 이동한다.
					response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage +"&id=" + id);
				} else {
					out.println("<script>");
					out.println("alert('" + idx + "번 글이 없습니다.')");
					out.println("location.href='list.jsp'");
					out.println("</script>");
				} 
				}else{
					out.println("<script>");
					out.println("alert('로그인 해주세요. ')");
					out.println("location.href='../member/login.jsp'");
					out.println("</script>");
				}
			} catch(Exception e) {
				out.println("<script>");
				out.println("alert('글 번호 또는 페이지 번호가 숫자가 아닙니다.')");
				out.println("location.href='list.jsp'");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('글 번호 또는 페이지 번호가 넘어오지 않았습니다.')");
			out.println("location.href='list.jsp'");
			out.println("</script>");
		}
%>
</body>
</html>