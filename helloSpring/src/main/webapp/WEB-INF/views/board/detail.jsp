<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="/ex/resources/css/board5.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#commentForm').submit(function(){
		var form = $('#content').val();
		if(form.trim().length==0){
				alert('댓글을 입력해주세요. ');
				return false;
		}
		return true;
	});
});
function actionPage(job, uploadfileno){
	location.href=job+"?currentPage="+${currentPage}+"&uploadno="+${upload.uploadno};;
}

function pageList(currentPage){
	location.href="detail?currentPage="+currentPage+"&uploadno=${upload.uploadno}";;
}

function setting(mode, no, button, content){
	f = document.commentForm;
	f.mode.value = mode;
	f.no.value = no;
	f.commentBtn.value = button;
//	indexOf() : 문자열에서 괄호안의 문자가 나타는 위치를 얻어온다.
//	문자가 포함되어 있으면 0 이상의 값이 나오고
//	포함되어 있지 않으면 -1을 얻어온다.
	while(content.indexOf("<br/>") >= 0){
		content = content.replace("<br/>", "\r\n");
	}
	f.content.value = content;

}
</script>
</head>
<body>
	<%@ include file="/include/menu.jsp"%>
	
	<table class="board_form" id="uploadForm">
		<caption>글 상세보기</caption>
		<tr>
					<th>제목</th>
					<td>${upload.title}</td>
					<th>작성일</th>
					<td><fmt:formatDate value="${upload.regdate}"  pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
					<th>작성자</th>
					<td>${upload.membervo.id}(${upload.membervo.name})</td>
					<th>조회수</th>
					<td>${upload.readcount}</td>
		</tr>
		<tr>
			<th>첨부자료</th>
			<td colspan="3">
								<c:if test="${fn:length(files)==0}">
									첨부파일이 업로드 되지 않았습니다.
								</c:if> 
								<c:if test="${fn:length(files)>0}">
									<c:forEach var="file" items="${files}">
										<a href="download?uploadfileno=${file.uploadfileno}">${file.userfilename} </a> &nbsp;
										[${file.downloadCount}]
									</c:forEach>
								</c:if>
			</td>
		</tr>
		<tr>
					<th>내용</th>
					<td colspan="3">${upload.content}</td>
		</tr>
		<c:forEach var="file" items="${files}">
		<c:if test="${fn:length(files)>0}">
		<tr>
					<th>미리보기</th>
					<td colspan="3"><img class="img" src="/img/${file.savedfilename}"/></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	<div class="buttons">
	<c:if test="${upload.membervo.id eq sessionScope.loginUser.id}">
		<input type="button" class="btn" value="수정" style="height: 25px;"onclick="javascript:actionPage('update');"/> 
		<input type="button" class="btn" value="삭제" style="height: 25px;" onclick="javascript:actionPage('delete');"/> 
	</c:if>
		<input type="button" class="btn" value="목록" style="height: 25px;" onclick="location.href='/ex/board/list'" />
	</div>
	
<!-- 댓글 폼 -->
	<form:form modelAttribute="commentForm" name="commentForm">
			<table class="comment_form" align="center" border="0" cellspacing="0" >
				<caption align="left">댓글</caption>
				<tr>
					<td colspan="3" style="padding-top:20px; padding-bottom:20px;">${sessionScope.loginUser.name}(${sessionScope.loginUser.id}) :
							<input type="hidden" name="currentPage" value="${currentPage}"/>
							<input type="hidden" name="mode" value="1" size="5"/>
							<form:hidden path="uploadno"/>
							<form:textarea path="content"  rows="1" cols="80" id="content"/>
							<input type="submit" class="btn" value="저장"  name="commentBtn"/>
							<input type="button" class= "btn" value="취소" onclick="setting(1, 0, '저장', '', '')"/>
					</td>
				</tr>
				
				<c:if test="${list.totalCount==0}">
				<tr>
						<td>댓글이 존재하지 않습니다.</td>
				</tr>
				</c:if>
				<c:forEach var="comment" items="${list.commentList}">
				<tr>
				</tr>
				<tr>
						<td width="120" >
							${comment.membervo.id}(${comment.membervo.name })	: <br/>
							<span style="font-size: 10px;"><fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd"/></span>
						</td>
						<td align="left" width="600">
								${comment.content}
						</td>
						<td width="100">
								<input type="hidden" name="no"	value="${comment.no}"/>
								<c:if test="${comment.membervo.id eq sessionScope.loginUser.id}">
								<input type="button" name="co_update" id="co_update" value="수정" class="co_btn"  onclick="setting(2, ${comment.no}, '수정', '${comment.content}')"/>
								<input type="button" name="co_delete" id="co_delete" value="삭제" class="co_btn"  onclick="setting(3, ${comment.no}, '삭제', '${comment.content}')"/>
								</c:if>
						</td>
				</tr>
				</c:forEach>
		</table>
		
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
	</form:form>
</body>
</html>