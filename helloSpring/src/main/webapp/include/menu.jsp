<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
<link rel = "stylesheet" href="/ex/resources/css/menu.css">
</head>
<body>
<div id="header">
	<div class="title">
		<c:if test="${empty sessionScope.loginUser}">
			로그인 후에 이용 가능합니다.
		</c:if>
	<c:if test="${not empty sessionScope.loginUser}">
			${sessionScope.loginUser.id}님 환영합니다.
	</c:if>
	</div>	
	<div class="links">
		<c:if test="${empty sessionScope.loginUser}">
			<a href="/ex/member/login">로그인</a>
			<a href="/ex/member/register">회원가입</a>
		</c:if>
		<c:if test="${not empty sessionScope.loginUser}">
			<a href="/ex/member/logout">로그아웃</a>
			<a href="/ex/member/update">정보수정</a>
			<a href="/ex/member/delete">회원탈퇴</a>
			<a href="/ex/board/list">게시판</a>
		</c:if>
	</div>
</div>
</body>
</html>