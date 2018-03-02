<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/member.css">
<script type="text/javascript">
function openFindMember(){
	window.open("findMember.jsp","","width=500, height=300, resizable = no, scrollbars = no");
}
</script>
</head>
<body>
<%	
		request.setCharacterEncoding("UTF-8");	
		String id = (String)session.getAttribute("id");
		try{
		if(id==null){
%>
<jsp:include page="../top.jsp" flush="false"/>
<form action="selectById.jsp" method="post" name = "login(this)" onsubmit="return formCheck(this)">	 
	<table class="login"  border ="0" align="center" >
		<tr>
			<th class="lhead" align="center" colspan="2">
					로그인
			</th>
		</tr>
		
		<tr>
			<td class="ltd" width="60" >
					아이디
			</td>
		
			<td class="ltr"> 
				<input type="text"  name="id"/>
			</td>
		</tr>

			<tr>
				<td class="ltd" width="60" align="right">
						비밀번호
				</td>
				<td class="ltr">
		 				<input type="password" name = "password" size="20"/><br/>
		 		</td>
		 	</tr>
		
			<tr>
				<td colspan="2" align="center">
					<input class="lbutton" type="submit" value ="로그인"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input class="lbutton" type="button" value ="회원가입" onclick="location.href='join.jsp'"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"align= "center"><br><a class="la" href="javascript:openFindMember();">아이디/비밀번호찾기</a>
 				</td>
			</tr>
</table>
</form>
<%
		}else{
			out.println("<script>");
			out.println("alert('잘못된 접근입니다. ');");
			out.println("location.href='../index.jsp'");
			out.println("</script>");
		}
		}catch(Exception e){ out.println(e); }
%>
</body>
</html>