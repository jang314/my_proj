<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>앨범게시판 리스트</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
</head>
<body>
   <jsp:include page="../top.jsp" flush="false"/>
<table class="freeboard" border="0" align="center">
	<tr><th  class="boardTitle" colspan="2">갤러리</th></tr>
	<tr><td colspan="2" align="right"><input class="button" type="button" value="글쓰기" onclick="location.href='uploadForm.jsp'"/></td></tr>
<c:if test="${list.totalCount == 0}">
	<tr><td colspan="2">등록된 글이 없습니다.</td></tr>
</c:if>
</table>
<c:if test="${list.totalCount > 0}">
	<c:forEach var="vo" items="${list.list}">
	<table class="album_t" border="0">
		<tr class="album_tr">
			<td  style="font-family: 나눔바른고딕; text-align: center;">
					<a  href="increment.jsp?idx=${vo.idx}&currentPage=${list.currentPage}&id=${id}" class="no-uline">
		  				<img src="/img/${vo.img}" class="album"> 
					</a>
			</td>
		<tr>	
			<td  style="font-family: 나눔바른고딕; text-align: center; font-weight: bold; font-size: 20px;">
						<c:set var="title" value="${vo.title}"/>
						<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
						<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
						<a class="al" href="increment.jsp?idx=${vo.idx}&currentPage=${list.currentPage}&id=${id}" class="no-uline">
						${title}
						</a>
			</td>
			</tr>
			<tr>
			<td style="font-family: 나눔바른고딕; text-align: center;  font-size: 15px; color: gray;">
				${vo.name}(${vo.id})
			</td>
		</tr>
	<tr>
			<td style="font-family: 나눔바른고딕; text-align: center; font-size: 15px;  color: gray;">
				조회수 : (${vo.hit})
			</td>
		</tr>
		<tr>
			<td style="font-family: 나눔바른고딕; text-align: center; font-size: 13px;">
				<fmt:formatDate value="${vo.writeDate}"  pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
		</tr>
</table>
	</c:forEach>
</c:if>


<table width="900" class="no_bord" border="0" align="center">
<tr>
		<td align="center" colspan="7">
			<c:if test="${list.startPage > 1}">
				<input type="button" class="pg_btn" value="start" onclick="location.href='?currentPage=1'"/>		
				<input type="button" class="pg_btn" value="<<" onclick="location.href='?currentPage=${list.startPage - 1}'"/>		
			</c:if>
			<c:if test="${list.currentPage > 1}">
				<input type="button" class="pg_btn" value="<" onclick="location.href='?currentPage=${list.currentPage - 1}'"/>		
			</c:if>
			<c:forEach var="i" begin="${list.startPage}" end="${list.endPage}" step="1">
				<c:if test="${list.currentPage == i}">
					<input type="button"  class="pg_btn" value="${i}" disabled="disabled"/>		
				</c:if>
				<c:if test="${list.currentPage != i}">
					<input type="button" value="${i}" class="pg_btn" onclick="location.href='?currentPage=${i}'"/>		
				</c:if>
			</c:forEach>
			<c:if test="${list.currentPage < list.totalPage}">
				<input type="button" class="pg_btn" value=">" onclick="location.href='?currentPage=${list.currentPage + 1}'"/>		
			</c:if>		
			<c:if test="${list.endPage < list.totalPage}">
				<input type="button" class="pg_btn" value=">>" onclick="location.href='?currentPage=${list.endPage + 1}'"/>		
				<input type="button" class="pg_btn" value="end" onclick="location.href='?currentPage=${list.totalPage}'"/>		
			</c:if>
		</td>
	</tr>
	<tr>

	</tr>		
</table>
</body>
</html>