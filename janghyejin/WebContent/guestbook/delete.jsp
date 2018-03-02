<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 삭제</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/board2.css">
<script type="text/javascript">
function formCheck(obj) {
//	null이 아닌 값
	if(obj.password.value.trim().length == 0 ) {
		alert('비밀번호를 입력하세요. ');
		obj.id.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String id = (String)session.getAttribute("id");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
			try{
					if(id==null){
					out.println("<script>");
						out.println("alert('로그인 해주세요.')");
						out.println("location.href='../home.jsp'");
						out.println("</script>");
					}else{
						session.setAttribute("id", id);
%>
<form action="deleteOK.jsp" method="post" name = "guestForm" onsubmit = "return formCheck(this)">
<input type="hidden" name="idx" value="${vo.idx}"/>
<input type="hidden" name="currentPage" value="${currentPage}"/>
   <jsp:include page="../top.jsp" flush="false"/>	

<table class="guest_t" width="900" align="center" border="0" style="margin-top: 100px;">
	<tr><th class="guest_head" colspan="2">방명록 삭제</th></tr>
	<tr>
		<td class="guest_th" width="100" align="center">아이디</td>
		<td class="guest_td"><input type="text" class="txtform" name="id" readonly="readonly" value="${id}" style="border:0; font-size:15px; font-family: 나눔스퀘어; padding-left: 10px;"/></td>
	</tr>
	<tr>
	<td class="guest_th">이름</td>
		<td class="guest_td"><input type="text" class="txtform" name="name" readonly="readonly" value="${vo.name}" style="border:0; font-size:15px; font-family: 나눔스퀘어; padding-left: 10px;" /></td> 
	</tr>
	<tr>
		<td class="guest_th">비밀번호</td>
		<td class="guest_td"><input type="password" name="password" style="padding-right: 0px;"/></td> 
	</tr>
	<tr>
		<td class="guest_th">내용</td>
		<td class="guest_td">
			<textarea rows="10" cols="70" name="content" readonly="readonly" style="border:0; font-size:13px; font-family: 나눔스퀘어; padding-left: 10px;">${vo.content}</textarea>
		</td> 
	</tr>
	<tr>
		<td height="100" colspan="2" align="center">
			<input class="button" type="submit" value="삭제하기"/>
			<input class="button"  type="button" value="목록보기" onclick="location.href='list.jsp'"/>
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