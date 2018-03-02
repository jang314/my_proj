<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" type="text/css" href="css/board2.css">
</head>
<body>
<br/>
<table  class="freeboard"  align="center" border="0" cellspacing="0">
<tr><th class="boardTitle" colspan="7">자유게시판</th></tr>
<tr>
			<td colspan="6" align="right">
				<input type="button" class="button" value="글쓰기" onclick="location.href='BoardInsert.do'"/>	
			</td>	
</tr>

 <c:if test="${list.totalCount == 0}">
		<tr class="content"><td align="center">글이 존재하지 않습니다.</td></tr> 
</c:if>
<c:if test="${list.totalCount != 0}">
		<tr>
			<td align="right" colspan="6" class="title"> 
				${list.totalCount} ( ${list.currentPage} / ${list.totalPage} ) pages 
			</td>
		</tr>
		<tr class="listTitle">
			<td width="70" align="center" class="title">글번호</td>
			<td width="160" align="center" class="title">작성자</td>
			<td width="500" align="center" class="title">제목</td>
			<td width="100" align="center" class="title">작성일</td>
			<td width="50" align="center" class="title">조회수</td>
		</tr>
			
		<!-- Date 클래스의 객체를 만들고 싶다. -->
		<!-- Date today = new Date(); -->
		<jsp:useBean id="today" class="java.util.Date"/>
		
		<!-- 공지글 목록 -->
		<c:forEach var="no" items="${notice}">
		<tr class="notice">
		<td align="center">${no.idx}</td>
		<td align="center">${no.name}(${no.id})</td>
		<td align="center"><c:set var="title" value="${no.title}"/>
										<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
										<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
										<a class="al" href="BoardView.do?idx=${no.idx}&currentPage=${list.currentPage}">${title}</a>
		<td align="center">
					<c:if test="${no.writeDate.year == today.year && no.writeDate.month == today.month 
									&& no.writeDate.date == today.date}">
						<fmt:formatDate value="${no.writeDate}" pattern="hh:mm:ss"/>
					</c:if>
					<c:if test="${no.writeDate.year != today.year || no.writeDate.month != today.month 
									|| no.writeDate.date != today.date}">
						<fmt:formatDate value="${no.writeDate}" pattern="yyyy-MM-dd"/>
					</c:if>
		</td>
		<td align="center">${no.readCount}</td>
		</tr>
		</c:forEach>
		<c:forEach var="vo" items="${list.list}">
			<tr class="line">
				<td align="center">${vo.idx}</td>
				<td align="center">${vo.name}(${vo.id})</td>
				<td align="center">
						<c:set var="title" value="${vo.title}"/>
						<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
						<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
						<a class="al"  href="BoardView.do?idx=${vo.idx}&currentPage=${list.currentPage}" class="no-uline">${title}</a>
				</td>
				<td align="center">
				<c:if test="${vo.writeDate.year == today.year && vo.writeDate.month == today.month 
									&& vo.writeDate.date == today.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="hh:mm:ss"/>
					</c:if>
					<c:if test="${vo.writeDate.year != today.year || vo.writeDate.month != today.month 
									|| vo.writeDate.date != today.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/>
					</c:if>
				</td>
				<td align="center">${vo.readCount}</td>
			</tr>
		
		</c:forEach>
		</c:if>

		<form action="BoardList.do" method="post">
		<tr>
			<td colspan="7" align = "center" height="100">
		            <select name="opt">
		                <option value="0">제목</option>
		                <option value="1">내용</option>
		                <option value="2">제목+내용</option>
		                <option value="3">글쓴이</option>
		            </select>
					<input type="text" size="30" name="item"/> &nbsp;
					<input type="submit" class="btn" value="검색"/>
			</td>
		</tr>
		</form>
		
		<tr>
		<td align="center" colspan="7" height="200">
			<c:if test="${list.startPage > 1}">
				<input type="button" class="pg_btn" value="start" onclick="location.href='BoardList.do?currentPage=1'"/>		
				<input type="button" class="pg_btn" value="<<" onclick="location.href='BoardList.do?currentPage=${list.startPage - 1}'"/>		
			</c:if>
			<c:if test="${list.currentPage > 1}">
				<input type="button" class="pg_btn" value="<" onclick="location.href='BoardList.do?currentPage=${list.currentPage - 1}'"/>		
			</c:if>
			<c:forEach var="i" begin="${list.startPage}" end="${list.endPage}" step="1">
				<c:if test="${list.currentPage == i}">
					<input type="button"  class="pg_btn" value="${i}" disabled="disabled"/>		
				</c:if>
				<c:if test="${list.currentPage != i}">
					<input type="button" value="${i}" class="pg_btn" onclick="location.href='BoardList.do?currentPage=${i}'"/>		
				</c:if>
			</c:forEach>
			<c:if test="${list.currentPage < list.totalPage}">
				<input type="button" class="pg_btn" value=">" onclick="location.href='BoardList.do?currentPage=${list.currentPage + 1}'"/>		
			</c:if>		
			<c:if test="${list.endPage < list.totalPage}">
				<input type="button" class="pg_btn" value=">>" onclick="location.href='BoardList.do?currentPage=${list.endPage + 1}'"/>		
				<input type="button" class="pg_btn" value="end" onclick="location.href='BoardList.do?currentPage=${list.totalPage}'"/>		
			</c:if>
		</td>
	</tr>	
</table>
</body>
</html>