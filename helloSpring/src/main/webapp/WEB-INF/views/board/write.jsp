<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel = "stylesheet" href="/ex/resources/css/board5.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#uploadForm').submit(function() {
		var title = $('#title').val();
		var content = $('#content').val();
		/* var filename = $('#filename').val();*/
			if (title.trim().length == 0) {
			alert('제목은 필수항목입니다.');
			return false;
		} /* else if (filename.trim().length == 0) {
			alert('업로드할 파일을 선택해주세요. ');
			return false;
		} */ else if (content.trim().length == 0) {
			alert('내용은 필수항목입니다. ');
			return false;
		}
		return true;
	});
});
</script> 
</head>
<body>
<%@ include file="/include/menu.jsp" %>
<form:form modelAttribute="uploadForm" enctype="multipart/form-data"  id="uploadForm">
		<table class="board_form" >
			<caption>글쓰기</caption>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<form:input path="title" style="width:580px;"/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="hidden" name="id" value="${sessionScope.loginUser.id}"/>
					${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
				</td>
				<th>공지글</th>
				<td>
					<input type="checkbox" name="notice" value="1"/>
				</td>
			</tr>
			<tr>
				<th>첨부자료</th>
				<td  colspan="3">
					<input type="file"  name="attach" id="filename"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td  colspan="3">
					<form:textarea path="content" style="width:580px;" rows="15"/>
				</td>
			</tr>
		</table>	
		<div class="buttons">
					<input type="submit" class="btn" value="등록" style="height: 25px;"/>
					<input type="button"  class="btn" value="취소" style="height: 25px;" onclick="location.href='/ex/board/list'"/>
		</div>
	</form:form>
</body>
</html>