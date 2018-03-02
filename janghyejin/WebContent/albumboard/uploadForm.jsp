<%@page import="com.javalec.VO.MemberVO"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 입력폼</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
<script type="text/javascript">
function formCheck(obj) {
//	null이 아닌 값
	if(obj.title.value.trim().length == 0) {
		alert('제목을 입력하세요. ');
		obj.title.focus();
		return false;
	}
	if(obj.filename.value.trim().length==0){
		alert('파일을 첨부해주세요. ');
		obj.filename.focus();
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
		
		if(id==null){
			out.println("<script>");
			out.println("alert('로그인 해주세요. ')");
			out.println("location.href='../member/login.jsp'");
			out.println("</script>");
		}else{
		session.setAttribute("id", id);
		MemberVO mo = SelectService.getInstance().SelectById(id);
%>
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data" onsubmit = "return formCheck(this)">
           <jsp:include page="../top.jsp" flush="false"/>		

<table class="free-form" border="0" align="center" >
	<tr>
		<th class="head" colspan="2">파일 업로드 폼</th>
	<tr>
		<td  class="thead">작성자 </td><td class="input-form"><input type="text" name="name" value="<%=mo.getName()%>" readonly="readonly" style="border: 0; font-family: 나눔스퀘어;"></td>
	</tr>
	<tr>
		<td  class="thead">아이디</td><td class="input-form"><input type="text" name="id" value="<%=id%>"readonly="readonly" style="border: 0; font-family: 나눔스퀘어;"></td>
	<tr>
		<td class="thead">제목  </td><td class="input-form"><input type="text" name="title" size="50"></td>
	</tr>
	<tr>
		<td class="thead">파일  </td><td class="input-form"><input type="file" name="filename" ></td>
	</tr>
	<tr>
		<td class="thead">내용  </td><td  class="input-form"><textarea rows="20" cols="100" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align=center height="100"><input class="button" type="submit" value="전송"></td>
	</tr>
</table>
</form>
<%
	}
%>
</body>
</html>