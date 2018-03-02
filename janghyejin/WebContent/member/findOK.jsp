<%@page import="com.javalec.VO.MemberList"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("find");
//		String id = request.getParameter("id");
//		String name = request.getParameter("name");
//		String phone = request.getParameter("phone");
%>

<jsp:useBean id="idvo" class="com.javalec.VO.MemberVO">
	<jsp:setProperty property="*" name="idvo"/>
</jsp:useBean>
<table align="center">
<tr>
	<th align="center" colspan="2">
		<b><font size="4" color="gray" style="나눔스퀘어">아이디/비밀번호 찾기</font></b>
	</th>
</tr>
<tr><td colspan="2"><hr/></td></tr>
<tr>
		<td align="center">
<%
		if(action.equals("findid")){
			MemberList list = SelectService.getInstance().findId(idvo);
			if(list.getList().size()==0){
				out.println("등록되지 않은 회원입니다.");
				out.println("회원가입을 해주세요. <br/><br/>");
				out.println("<input type='button' value='뒤로' onclick='javascript:history.back()'/>");
				out.println("<input type='button' value='닫기' onclick='window.close()'/>");
			}else{
			for(int i = 0; i<list.getList().size(); i++){
				MemberVO vo = list.getList().get(i);
					out.println("회원님의 아이디는 <br/>"+vo.getId()+"<br/>입니다. <br/><br/>");
					out.println("<input type='button' value='확인' onclick='window.close()'/>");
			}
			}
		}else{
			MemberList list = SelectService.getInstance().findPw(idvo);
			if(list.getList().size()==0){
				out.println("등록되지 않은 회원입니다.");
				out.println("회원가입을 해주세요. ");
			}else{
			for(int i = 0; i<list.getList().size(); i++){
				MemberVO vo = list.getList().get(i);
				out.println("회원님의 비밀번호는");
				out.println(vo.getPassword());
				out.println("입니다.");
			}
			}
		}
%>
		</td>
</tr>
	
<tr>
</tr>
</table>

</body>
</html>