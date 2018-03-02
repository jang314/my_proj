<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function setting(mode, idx, button, name, content){
	f = document.commentForm;
	f.mode.value = mode;
	f.idx.value = idx;
	f.commentBtn.value = button;
	f.name.value = name;
//	indexOf() : 문자열에서 괄호안의 문자가 나타는 위치를 얻어온다.
//	문자가 포함되어 있으면 0 이상의 값이 나오고
//	포함되어 있지 않으면 -1을 얻어온다.
	while(content.indexOf("<br/>") >= 0){
		content = content.replace("<br/>", "\r\n");
	}
	f.content.value = content;

}
function formCheck(obj) {
//	null이 아닌 값

	if(obj.content.value.trim().length == 0 ) {
		alert('댓글을 입력하세요. ');
		obj.content.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>

<% 
		String id = request.getParameter("id");
		id = (String)session.getAttribute("id");
		
		if(id!=null){
%>
   <jsp:include page="../top.jsp" flush="false"/>	
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
		<c:if test="${fn:trim(vo.id) == id}">
			<input type="button" class="button" value="수정하기" 
				onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'"/>
			<input type="button" class="button" value="삭제하기" 
				onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"/>
			<input type="button" class="button" value="목록보기" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
	</c:if>
	<c:if test="${fn:trim(vo.id) != id}">
			<input type="button" class="button" value="목록보기" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
	</c:if>	
		</td>
	</tr>
</table>
<form action="commentOK.jsp" method="post" name="commentForm"   onsubmit = "return formCheck(this)">
	<!-- 직접 입력받지 않는 내용은 hidden 타입으로 넘겨준다. -->
	<input type="hidden" name="currentPage" value="${currentPage}" size="5"/>
	<input type="hidden" name="idx" value="${vo.idx}" size="5"/>
	<input type="hidden" name="ref" value="${vo.idx}" size="5"/>
	<input type="hidden" name="name" value="${mo.name}"/>
	<input type="hidden" name="id" value="${id}" size="5"/>
	<input type="hidden" name="mode" value="1" size="5"/>
<table class="comment" align="center" border="0" cellspacing="0" >
	<tr>
		<th colspan="3" align="left">댓글</th>
	</tr>
	<tr align="left" >
		<td class="input-form" height="70" align="left" colspan="3">${mo.name}(${id}) :
			<input type="text" size="100" name="content"/>
			<input type="submit" class="btn" value="저장" name="commentBtn"/>
			<input type="button" class= "btn" value="취소" onclick="setting(1, 0, '저장', '', '')"/>
		</td>
	</tr>
	<c:if test="${comment.list.size() == 0}">
	<tr>
		<td class="input-form">
		 	댓글이 존재하지 않습니다.
		</td>
	</tr>
	</c:if>
	<c:if test="${comment.list.size() > 0 }">
		<c:forEach var="co" items="${comment.list}">
	<tr>
		<td  align="left" colspan="2">
	&nbsp;&nbsp;${co.name}(${co.id})&nbsp;&nbsp;<fmt:formatDate value="${co.writeDate}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<td width="100" class="input-form" align="left">&nbsp;&nbsp;:&nbsp;
			<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"/>
			<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
			<c:set var="content" value="${fn:replace(content, entercode, '<br/>')}"/>
					<input type="text" readonly="readonly" value="${content}" style="border: 0px; font-family: 나눔스퀘어;font-size: 15px;"/>
		</td>
		<td class="input-form" align="right">
		<c:if test="${fn:trim(co.id)==id}">
			<input class="pg_btn" type="button" id="m_btn" value="수정" onclick="setting(2, ${co.idx}, '수정', '${co.name}', '${co.content}')"/>
			<input class="pg_btn" type="button" value="삭제" id="d_btn"  onclick="setting(3, ${co.idx}, '삭제', '${co.name}', '${co.content}')"/>
		</c:if>
		</td>
	</tr>
		</c:forEach>
	</c:if>
</table>
</form>
<%
		}else{
			out.println("<script>");
			out.println("alert('로그인 해주세요. ')");
			out.println("location.href='list.jsp?currentPage=${currentPage}'");
			out.println("</script>");
		}
%>
</body>
</html>