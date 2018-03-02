<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 수정폼</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
<script type="text/javascript">
function formCheck(obj) {
//	null이 아닌 값
	if(obj.title.value.trim().length == 0) {
		alert('제목을 입력하세요. ');
		obj.title.focus();
		return false;
	}

	if(obj.content.value.trim().length == 0 ) {
		alert('내용을 입력하세요. ');
		obj.content.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<form action="updateOK.jsp" method="post" enctype="multipart/form-data"  onsubmit = "return formCheck(this)">

           <jsp:include page="../top.jsp" flush="false"/>		
<input type="hidden" name="idx" value="${vo.idx}"/>
<input type="hidden" name="currentPage" value="${currentPage}"/>
<input type="hidden" name="existFile" value="${vo.img}"/>
<table class="free-form" border="0" align="center">
	<tr>
		<th class="head" colspan="2" align="left">갤러리 수정</th>
	<tr>
		<td class="thead">작성자 </td><td class="input-form"><input type="text" name="name" value="${vo.name}" style="border: 0; font-family: 나눔스퀘어;"></td>
	</tr>
	<tr>
		<td  class="thead">아이디</td><td class="input-form"><input type="text" name="id" value="${vo.id}" style="border: 0; font-family: 나눔스퀘어;"></td>
	<tr>
		<td  class="thead">제목  </td><td class="input-form"><input type="text" name="title" value="${vo.title}" size="50"></td>
	</tr>
		<tr>
		<td  class="thead">기존파일  </td><td class="input-form">${vo.img}</td>
	</tr>
	<tr>
		<td class="thead">파일  </td><td class="input-form"><input type="file" name="filename" ></td>
	</tr>
	<tr class="subject">
		<td class="thead">내용  </td><td  class="input-form"><textarea rows="20" cols="100" name="content">${vo.content }</textarea></td>
	</tr>
	<tr>
		<td colspan=2 align=center><input class="button" type="submit" value="수정하기"></td>
	</tr>
</table>
</div>
</form>
</body>
</html>