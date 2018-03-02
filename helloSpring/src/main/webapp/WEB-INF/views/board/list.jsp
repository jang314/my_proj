<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<link rel = "stylesheet" href="/ex/resources/css/board5.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").css("height", "30px");
	$("#btnWrite").click(function(){
		 location.href = "write";
	});
	
	$("#search").submit(function(){
		var item = $('#item').val();
		if(item.trim().length==0){
			alert('검색창을 입력하세요');
			return false;
		}
		return true;
	});
	
});

function pageList(currentPage){
		location.href="list?currentPage="+currentPage+"&searchOption=${hmap.searchOption}"+"&item=${hmap.item}";;
}
</script>
</head>
<body>
<%@ include file="/include/menu.jsp" %>
<table class="list_table"  align="center" border="0" cellspacing="0">
<caption>업로드 게시판</caption>
		<tr>
			<td colspan="6" align="right" style="height:20px; padding-bottom:10px;">
					<input type="button" class="btn" value="글쓰기"  id="btnWrite"/>	
			</td>	
		</tr>
		<tr>
				<td align="right" colspan="6" > 
							${list.totalCount} ( ${list.currentPage} / ${list.totalPage} ) pages 
				</td>
		</tr>
		<tr>
				<th width="70" align="center" class="title">글번호</th>
				<th width="160" align="center" class="title">작성자</th>
				<th width="500" align="center" class="title">제목</th>
				<th width="100" align="center" class="title">작성일</th>
				<th width="50" align="center" class="title">조회수</th>
		</tr>
		 <c:if test="${list.totalCount == 0}">
				<tr><td colspan="6">글이 존재하지 않습니다.</td></tr> 
		</c:if>
		
		<jsp:useBean id="today" class="java.util.Date"/>
		
		<!-- 공지글 목록 -->
		<c:forEach var="no" items="${notice}">
		<tr class="notice">
				<td align="center">${no.uploadno}</td>
				<td align="center">${no.membervo.id}(${no.membervo.name})</td>
				<td align="center">
										<c:set var="title" value="${no.title}"/>
										<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
										<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
										<a href="detail?uploadno=${no.uploadno}&currentPage=${currentPage}">${title}
										[${no.commentCount}]
										</a> 
										<c:if test="${no.regdate.year == today.year && no.regdate.month == today.month 
									&& no.regdate.date == today.date}">
											<img src="/ex/resources/image/new.png"/>
										</c:if>
										<c:if test="${no.readcount >= 100}">
											<img src="/ex/resources/image/hot.gif"/>
										</c:if>
		</td>
		<td align="center">
					<c:if test="${no.regdate.year == today.year && no.regdate.month == today.month && no.regdate.date == today.date}">
						<fmt:formatDate value="${no.regdate}" pattern="hh:mm:ss"/>
					</c:if>
					<c:if test="${no.regdate.year != today.year || no.regdate.month != today.month || no.regdate.date != today.date}">
						<fmt:formatDate value="${no.regdate}" pattern="yyyy-MM-dd"/>
					</c:if>
		</td>
		<td align="center">${no.readcount}</td>
		</tr>
		</c:forEach>
		
		<!-- 업로드 목록 -->
		<c:forEach var="vo" items="${list.list}">
			<tr class="upload">
				<td align="center">${vo.uploadno}</td>
				<td align="center">${vo.membervo.id}(${vo.membervo.name})</td>
				<td align="center">
						<c:set var="title" value="${vo.title}"/>
						<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
						<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
						<a href="detail?uploadno=${vo.uploadno}&currentPage=${currentPage}">${title}
						[${vo.commentCount}]
						</a>
						<c:if test="${vo.regdate.year == today.year && vo.regdate.month == today.month 
									&& vo.regdate.date == today.date}">
											<img src="/ex/resources/image/new.png"/>
										</c:if>
										<c:if test="${vo.readcount >= 100}">
											<img src="/ex/resources/image/hot.gif"/>
										</c:if>
				</td>
				<td align="center">
						<c:if test="${vo.regdate.year == today.year && vo.regdate.month == today.month  && vo.regdate.date == today.date}">
								<fmt:formatDate value="${vo.regdate}" pattern="hh:mm:ss"/>
						</c:if>
						<c:if test="${vo.regdate.year != today.year || vo.regdate.month != today.month || vo.regdate.date != today.date}">
								<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</c:if>
				</td>
				<td align="center">${vo.readcount}</td>
			</tr>
		</c:forEach>
</table>
<!-- 검색기능 -->
<div class="buttons">
<form action="list" method="get" id="search">
				            <select name="searchOption">
					                <option value="title">제목</option>
					                <option value="content">내용</option>
					                <option value="comb">제목+내용</option>
					                <option value="id">글쓴이</option>
				            </select>
					<input type="text" size="30" name="item" id="item"/> &nbsp;
					<input type="submit" class="btn" value="검색"/>
		</form>
</div>

<!-- 페이징 -->
<div class="buttons" id = "pagingBox">
	<c:if test="${list.currentPage==1 }">
			<input type="button" class="pg_btn" value="[처음]" disabled="disabled"/>
			<input type="button" class="pg_btn" value="◀◀"  disabled="disabled"/>
	</c:if>
	<c:if test="${list.startPage > 1}">
					<input type="button" class="pg_btn" value="◀◀" onclick="javascript:pageList('${list.startPage-1}')"/>		
	</c:if>
	<c:if test="${list.currentPage > 1}">
				<input type="button" class="pg_btn" value="[처음]" onclick="javascript:pageList('1')"/>		
				<input type="button" class="pg_btn" value="◀◀"  disabled="disabled"/>		
	</c:if>
			<c:forEach var="i" begin="${list.startPage}" end="${list.endPage}" step="1">
				<c:if test="${list.currentPage == i}">
					<input type="button"  class="pg_btn" value="${i}" disabled="disabled" style="font-size: 15px; font-weight: bold; text-decoration: underline;"/>
				</c:if>
				<c:if test="${list.currentPage != i}">
					<input type="button" value="${i}" class="pg_btn" onclick="javascript:pageList('${i}')"/>		
				</c:if>
			</c:forEach>
			<c:if test="${list.currentPage < list.totalPage}">
				<input type="button" class="pg_btn" value="▶▶"  disabled="disabled"/>
				<input type="button" class="pg_btn" value="[맨끝]" onclick="javascript:pageList('${list.totalPage}')"/>				
			</c:if>		
			<c:if test="${list.endPage <list.totalPage}">
				<input type="button" class="pg_btn" value="▶▶" onclick="javascript:pageList('${list.endPage + 1}')"/>		
				<input type="button" class="pg_btn" value="[맨끝으로]" onclick="javascript:pageList('${list.totalPage}')"/>		
			</c:if>
			<c:if test="${list.currentPage==list.totalPage }">
				<input type="button" class="pg_btn" value="▶▶" disabled="disabled"/>		
				<input type="button" class="pg_btn" value="[맨끝으로]" disabled="disabled"/>	
			</c:if>
</div>
</body>
</html>