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
<title>방명록</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
<script type="text/javascript">
function formCheck(obj) {
//	null이 아닌 값
	if(obj.password.value.trim().length == 0 ) {
		alert('비밀번호를 입력하세요. ');
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
<!-- 방명록을 입력하는 폼(테이블) -->
<!-- 작성자, 비밀번호, 내용 -->
<%
		request.setCharacterEncoding("UTF-8");
%>
<% 
		String id = (String)session.getAttribute("id");

			try{
					if(id==null){
					out.println("<script>");
						out.println("alert('로그인 해주세요.')");
						out.println("location.href='../index.jsp'");
						out.println("</script>");
					}else{
						session.setAttribute("id", id);
						MemberVO vo = SelectService.getInstance().SelectById(id);
%>
   <jsp:include page="../top.jsp" flush="false"/>	
<table width="950" class="free-form" border="0" >
<tr><th class="boardTitle" align="center" >방명록</th></tr>
</table>
<!-- 방명록 입력 폼 -->
<form action="insertOK.jsp" method="post" name = "guestForm" onsubmit = "return formCheck(this)">
<table width="900" class="guest_t" align="center" border="0">
	<tr><th class="guest_head" colspan="2">방명록 작성</th></tr>
	<tr>
		<td  class="guest_th">아이디</td>
		<td class="guest_td"><input type="hidden" name="id" readonly="readonly" value="${id}"/>${id}</td>
	</tr>
	<tr>
	<td class="guest_th">이름</td>
		<td class="guest_td"><input type="hidden" name="name" readonly="readonly" value="<%=vo.getName()%>"/><%=vo.getName()%></td> 
	</tr>
	<tr>
		<td class="guest_th">비밀번호</td>
		<td class="guest_td"><input type="password" name="password"/></td> 
	</tr>
	<tr>
		<td class="guest_th">내용</td>
		<td class="guest_td">
			<textarea rows="10" cols="70" name="content"></textarea>
		</td> 
	</tr>
	<tr>
		<td colspan="2" height=80" align="center">
			<input class="button" type="submit" value="저장하기" name="guestBtn"/>
		</td>
	</tr>
</table>
</form>
<!--  방명록 목록 출력 -->
<form action="selectByIdx.jsp" method="post">
<c:forEach var="guest" items="${list.list}">
<table class="guest_t" width="900" align="center" border="0">
<c:if test="${list.totalCount==0}">
<tr>
	<td colspan="4"> 글이 존재하지 않습니다.</td>
</tr>
</c:if>
<c:if test="${list.totalCount > 0}">
	<tr>
		<td class="guest_th" align="center">글번호</td>
		<td class="guest_td">${guest.idx}</td>
		<td class="guest_th" align="center">작성일</td>
		<td class="guest_td">${guest.writedate }</td>
	</tr>
	<tr>
	<td class="guest_th" align="center">작성자</td>
		<td class="guest_td" colspan="3">${guest.name}(${guest.id})</td> 
	</tr>
	<tr>
		<td  class="guest_th" align="center">내용</td>
		<td class="guest_td" colspan="3" height="200" width="100">
			<c:set var="content" value="${fn:replace(guest.content, '>', '&gt;')}"/>
			<c:set var="content" value="${fn:replace(content, '<', '&lt;')}"/>
			<c:set var="content" value="${fn:replace(content, entercode, '<br/>')}"/>
			${content}
		</td> 
	</tr>
	<c:if test="${guest.id==id}">
	<tr>
		<td height="80" colspan="4" align="center">
			<input type="button" class="button" value="수정하기" onclick="location.href='selectByIdx.jsp?idx=${guest.idx}&currentPage=${currentPage}&job=update&id=${id}'"/>
			<input type="button"  class="button" value="삭제하기" onclick="location.href='selectByIdx.jsp?idx=${guest.idx}&currentPage=${currentPage}&job=delete&id=${id}'"/>
		</td>
	</tr>
	</c:if>
	</c:if>
</table>
<br/>
</c:forEach>
<table class = "guestbookw" width="600" align="center" border="0">
	<tr>
		<td align="center" colspan="6">
			<c:if test="${list.startPage > 1}">
				<input class="pg_btn" type="button" value="start" onclick="location.href='?currentPage=1'"/>		
				<input type="button" value="<<" onclick="location.href='?currentPage=${list.startPage - 1}'"/>		
			</c:if>
			<c:if test="${list.currentPage > 1}">
				<input class="pg_btn" type="button" value="<" onclick="location.href='?currentPage=${list.currentPage - 1}'"/>		
			</c:if>
			<c:forEach var="i" begin="${list.startPage}" end="${list.endPage}" step="1">
				<c:if test="${list.currentPage == i}">
					<input class="pg_btn" type="button" value="${i}" disabled="disabled"/>
				</c:if>
				<c:if test="${list.currentPage != i}">
					<input class="pg_btn" type="button" value="${i}" onclick="location.href='?currentPage=${i}'"/>		
				</c:if>
			</c:forEach>
			<c:if test="${list.currentPage < list.totalPage}">
				<input class="pg_btn" type="button" value=">" onclick="location.href='?currentPage=${list.currentPage + 1}'"/>		
			</c:if>		
			<c:if test="${list.endPage < list.totalPage}">
				<input class="pg_btn" type="button" value=">>" onclick="location.href='?currentPage=${list.endPage + 1}'"/>		
				<input class="pg_btn" type="button" value="end" onclick="location.href='?currentPage=${list.totalPage}'"/>		
			</c:if>
		</td>
	</tr>
</table>
</form>
<%
				}
		}catch(Exception e){	out.println(e);	}
			
%>

</body>
</html>