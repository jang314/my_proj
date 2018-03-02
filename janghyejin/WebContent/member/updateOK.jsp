<%@page import="com.javalec.Service.UpdateService"%>
<%@page import="com.javalec.DAO.MemberDAO"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="com.javalec.VO.MemberVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%

	String id = (String)session.getAttribute("id");

	String birth1 = request.getParameter("birth1");
	String birth2 = request.getParameter("birth2");
	String birth3 = request.getParameter("birth3");
	
	String date = birth1+"-"+ birth2+"-"+birth3;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date birth =Date.valueOf(date);
	
	String post1 = request.getParameter("post1");
	String post2 = request.getParameter("post2");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String post= post1 + "-" + post2 + " " + addr1 ;
	String address = addr2;
	vo.setId(id);
	vo.setPost(post);
	vo.setBirth(birth);
	vo.setAddress(address);
	out.println(id);
	out.println(vo);

 	out.println("<script>");
	UpdateService.getInstance().UpdateMember(vo);
	out.println("alert('수정이 완료되었습니다.');");
	out.println("location.href='update.jsp?id="+id+"'");
	out.println("</script>");


%>
</body>
</html>