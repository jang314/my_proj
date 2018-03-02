<%@page import="com.javalec.Service.InsertService"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 완료</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.javalec.VO.MemberVO" >
<jsp:setProperty property="*" name="vo"/>  
</jsp:useBean>
<%
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth3 = request.getParameter("birth3");
		
		String date = birth1+"-"+ birth2+"-"+birth3;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		out.println("<script>");
		try{
				Date birth =Date.valueOf(date);
				
				String post1 = request.getParameter("post1");
				String post2 = request.getParameter("post2");
				String addr1 = request.getParameter("addr1");
				String addr2 = request.getParameter("addr2");
				String post= post1 + "-" + post2 + " " + addr1 ;
				String address = addr2;
				
				vo.setPost(post);
				vo.setBirth(birth);
				vo.setAddress(address);
				
				InsertService.getInstance().insertMember(vo);
				out.println("alert('회원가입이 완료되었습니다. 로그인해주세요. ')");
				out.println("location.href='../index.jsp'");
				
		//		out.println(vo);
	}catch(Exception e){
			out.println("alert('회원가입에 실패하였습니다. ')");
			out.println("location.href='../index.jsp'");
	}
		out.println("</script>");
%>
</body>
</html>