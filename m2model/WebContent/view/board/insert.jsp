<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="style.css">
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
<form action="BoardInsertAction.do" method="post"  name = "freeForm" onsubmit = "return formCheck(this)">
	<table class="free-form" border="0">
	<tr><th class="head" colspan="3">글쓰기</th></tr>
		<tr>
			<td  class="thead" align="center">아이디</td>
			<td align="left" class="input-form">
					<input type = "text" name = "id"  />
			</td>
			<td align="center" class="input-form">
					<input type = "checkbox" name="notice"  value="1"/>  공지글
			</td>
		</tr>
		<tr>
			<td  class="thead"  align="center">이름</td>
			<td class="input-form"  colspan="2"  align="left"><input type = "text"  name = "name" ></td>
		</tr>
		<tr>
			<td  class="thead" align="center">제목</td>
			<td class="input-form" colspan="2" ><input type = "text"  name = "title" size="80"/></td>
	</tr>
	<tr>
		<td  class="thead"  align="center">내용</td>
		<td class="input-form" colspan="2"><textarea rows="20" cols="90" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="3" align="center" height="100">
			<input type="submit" class="button" value="저장하기"/>
			<input type="reset" class="button"value="다시쓰기"/>
			<input type = "button" class="button" value="목록으로" onclick="location.href='BoardList.do'"/>
		</td>
	</tr>
	</table>
</form>
</body>
</html>