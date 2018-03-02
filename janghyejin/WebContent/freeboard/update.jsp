<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정하기</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
<script type="text/javascript">
function formCheck(obj) {
//	null이 아닌 값
	if(obj.title.value.trim().length == 0) {
		alert('제목을 입력하세요. ');
		obj.id.focus();
		return false;
	}
	if(obj.content.value.trim().length == 0 ) {
		alert('내용을 입력하세요. ');
		obj.id.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
		String id = (String)session.getAttribute("id");
	
		try{
			if(id==null){
			out.println("<script>");
				out.println("alert('로그인 해주세요.')");
				out.println("location.href='../home.jsp'");
				out.println("</script>");
			}else{
				session.setAttribute("id", id);
				MemberVO vo = SelectService.getInstance().SelectById(id);

%>
<form action="updateOK.jsp" method="post" name = "freeForm" onsubmit = "return formCheck(this)">

   <jsp:include page="../top.jsp" flush="false"/>	
<table class="free-form"  align = "center" border="0">
	<tr><th class="head" colspan="4" >게시글 수정</th></tr>
	<tr>
		<td class="thead" align="center">글번호</td>
		<td class="input-form" align="center" width="80">
		${vo.idx}
		<input type="hidden" name="idx" value="${vo.idx}"/>
		<input type="hidden" name="currentPage" value="${currentPage}"/>
		</td>
		<td class="input-form" colspan="2" align="center">
			<!-- 문자열을 비교하고 싶을 때 (.trim()) -->
			<%-- <c:if test="${fn:trim(vo.notice) == 'notice'}"></c:if> --%>
			<c:if test="${vo.notice == 1}">
				<input type="checkbox" name="notice" value="1" checked="checked"/>
			</c:if>
			<c:if test="${vo.notice == 0}">
				<input type="checkbox" name="notice" value="1"/>
			</c:if>
			&nbsp;공지글
		</td>
	</tr>
	<tr>
		<td class="thead" align="center">작성자
		<input type="hidden" name="name" value="${vo.name}"/>
		<input type="hidden" name="id" value="${vo.id}"/>
		</td>
		<td  class="input-form" align="center">${vo.name}(${vo.id})</td>
		<td class="thead" align="center" width="70">작성일
		</td>
		
		<td class="input-form" align="center" width="150"><fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd(E)"/>
		</td>
	</tr>
	
	<tr>
		<td class="thead"  align="center">제목</td>
		<td class="input-form" colspan="3"  align="center">
		<c:set var="title" value="${fn:replace(vo.title, '>', '&gt;')}"/>
			<c:set var="title" value="${fn:replace(title, '<', '&lt;')}"/>
			<input type="text" size="100" name="title" value="${title}"/>
			</td>
	</tr>
	<tr>
		<td  class="thead"align="center">내용</td>
		<td class="input-form" colspan="3"align="center"><c:set var="content" value="${fn:replace(vo.content, '>', '&gt;')}"/>
			<c:set var="content" value="${fn:replace(content, '<', '&lt;')}"/>
			<c:set var="content" value="${fn:replace(content, entercode, '<br/>')}"/>
			<%-- <input type="text" name="content" value="${content}"/> --%>
			<textarea rows="30" cols="100" name="content">${content}</textarea></td>
	</tr>
	<tr>
		<td colspan="4" height="100" align="center">
			<input type="submit" class="button" value="수정하기"/>
			<input type="button"class="button" value="목록보기" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
		</td>
	</tr>
</table>
</div>
</form>
<%
				}
		}catch(Exception e){	
		}
			
%>
</body>
</html>