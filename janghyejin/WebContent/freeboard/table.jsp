<%@page import="com.javalec.VO.FreeboardVO"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.FreeboardList"%>
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
	FreeboardList free= SelectService.getInstance().hitList();

for(int i = 0; i <free.getList().size(); i++){
	FreeboardVO fo = free.getList().get(i);
	out.println(fo);
}
%>
</body>
</html>