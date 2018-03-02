<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글보기</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
<script type="text/javascript">
function confirm_delete(){
	if(!confirm('정말로 삭제하시겠습니까?')){
		return ;
	}
	location.href = 'BoardDeleteAction.do?idx=${vo.idx}&currentPage=${currentPage}';
}
</script>
</head>
<body>
<table   width="1000" class="free-form" align="center" border="0" cellspacing="0">
	<tr><th class="head" colspan="4">게시글 확인 </th></tr>
	<tr>
		<td  class="thead" align="center" width="70">글번호</td>
		<td  class="thead" align="center" width="320">작성자</td>
		<td  class="thead" align="center" width="140">작성일</td>
		<td  class="thead"align="center" width="70">조회수</td>
	</tr>
	<tr class="input-form">
		<td class="thead" align="center">${vo.idx}</td>
		<td class="input-form" align="center">${vo.name}(${vo.id})</td>
		<td class="input-form" align="center">
			<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd(E)"/>
		</td>
		<td class="input-form" align="center">${vo.readCount}</td>
	</tr>
	<tr >
		<td class="thead" align="center">제목</td>
		<td class="input-form" colspan="3">
			<c:set var="title" value="${fn:replace(vo.title, '>', '&gt;')}"/>
			<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
			${title}
		</td>
	</tr>
	<tr class="line">
		<td class="thead" align="center" height="300">내용</td>
		<td class="input-form" colspan="3">
			<c:set var="content" value="${fn:replace(vo.content, '>', '&gt;')}"/>
			<c:set var="content" value="${fn:replace(content, '<', '&lt;')}"/>
			<c:set var="content" value="${fn:replace(content, entercode, '<br/>')}"/>
			${content}
		</td>
	</tr>
	</table>
	<table class="freeboard"  align="center" border="0" cellspacing="0" style="margin-top: 20px;">
	<tr>
		<td colspan="4" align="center" style="margin-top: 10px;" >

			<input type="button" class="button" value="수정하기" 
				onclick="location.href='BoardUpdate.do?idx=${vo.idx}&currentPage=${currentPage}'"/>
			<input type="button" class="button" value="삭제하기" 
				onclick="confirm_delete();"/>
			<input type="button" class="button" value="목록보기" onclick="location.href='BoardList.do?currentPage=${currentPage}'"/>

		</td>
	</tr>
</table>
</body>
</html>