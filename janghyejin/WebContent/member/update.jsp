<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정양식</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/member.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="formCheck.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	
	try{
		if(id==null){
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("location.href='../index.jsp'");
			out.println("</script>");
			}else{
			session.setAttribute("id", id);
			MemberVO vo	= SelectService.getInstance().SelectById(id);
			Date birth =vo.getBirth();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String to = sdf.format(birth);
			String year = to.substring(0,4);
			String month = to.substring(5, 7);
			String day = to.substring(8, 10); 
			
			String post = vo.getPost();
			String post1 = post.substring(0, 3);
			String post2 = post.substring(4, 7);
			String addr1 =post.substring(8, post.length());
	
%>
<form action = "updateOK.jsp" method="post" name = "memberForm" onsubmit = "return formCheck(this)" >
   <jsp:include page="../top.jsp" flush="false"/>	
		<table class="member"align="center"  border="0">
	<tr>
		<th class="thead" align="left" colspan="2">정보수정</th>
	</tr>
	
		<tr height="30">
			<td  class="content">
				기본정보
			</td>
			<td  class="content" align="right">
			<span style="font-size:10pt;font-family: 나눔스퀘어;color:#EAEAEA">*회원정보를 위한 필수입력 항목을 입력해 주세요.*</span>
			</td>
		</tr>
		
		<tr>
			<td class="hm">
					아이디
			</td>
			<td class="content">
							<input type = "hidden" name= "idx" value = "<%=vo.getIdx()%>"/>
							<input type = "text"  name = "id" size = "40" value="<%=id%>"readonly="readonly"/>			
			</td>	
			<tr>
			<td  class="hm">
				비밀번호
				<span  style="font-size: 7pt; float:inherit;font-family: 나눔스퀘어;" >
				특수문자/영문자/숫자를 혼합한  8~16자 내로 입력해주세요.
				</span>
			</td>
			<td  class="content">
				<input type = "password"  name = "password" size = "40">

			</td>
		</tr>
		<tr height="20" >
			<td  class="hm">
				비밀번호 확인
			</td>
			<td  class="content">
			<input type = "password"  name = "repassword" size = "40">
			</td>
		</tr>
		
		<tr>
			<td  class="hm">이름</td>
			<td  class="content">
			<input type = "text"  name = "name" value="<%=vo.getName() %>" size = "40">
			</td>
		</tr>
		
	<tr>
			<td  class="hm">생년월일</td>
			<td class="content" >
				<input type = "text"  name = "birth1" value="<%=year %>" size = "5"> 년 
				<input type = "text"  name = "birth2" value="<%=month %>" size = "5"> 월 
				<input type = "text"  name = "birth3" value="<%=day %>" size = "5"> 일
			</td>
		</tr>
		
		<tr>
			<td  class="hm">성별</td>
			<td class="content">
			<%
			if(vo.getGender().equals("man")){
			%>
			<input type = "radio"  name = "gender" value = "man" checked="checked" ><span style="font-size:10pt;font-family: 나눔스퀘어;"> 남자
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "radio"  name = "gender" value = "woman"> 여자</span>
			<%}else{%>
			<input type = "radio"  name = "gender" value = "man" ><span style="font-size:10pt;font-family: 나눔스퀘어;"> 남자
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "radio"  name = "gender" value = "woman" checked="checked"> 여자</span>
			<% 
			}
			%>
			</td>
		</tr>
		
		<tr>
			<td class="hm">연락처
				<span  style="font-size: 7pt; float:inherit;font-family: 나눔스퀘어;" >
				'-'를 제외한 숫자로 입력해주세요.
				</span>
			</td>
		<td class="content">
				<input type = "text"  name = "phone" value="<%=vo.getPhone() %>" size = "40">
			</td>
		</tr>
		
		<tr>
			<td  class="hm" >주소</td>
			<td  class="content">
				<input id="post1" readonly="readonly" size="5" name="post1" value="<%=post1%>"> - <input id="post2" readonly="" size="5" name="post2" value="<%=post2%>">
				<input onclick="openDaumPostcode(this)" type="button" class="btn" value="우편번호찾기"><br>
				<span style="LINE-HEIGHT: 10%"><br></span>
				<input id="addr1" readonly="readonly" size="40" name="addr1" placeholder="도로명주소" value="<%=addr1 %>"><br>
				<span style="LINE-HEIGHT: 10%; font-family: 나눔스퀘어;" ><br></span>
				<input id="addr2" size="40" name="addr2" placeholder="지번주소" value="<%=vo.getAddress()%>">		
			</td>
		</tr>		
		
			<tr>
				<td  class="hm">이메일</td>
				<td class="content">
					<input type = "text"  name = "email" value="<%=vo.getEmail() %>"size = "40">
			</td>
		</tr>

		<tr>
			<td align = "center" colspan="2">
				<input class="btn" type = "submit" value = "수정하기"/>
			</td>
		</tr>	
	</table>
	</form>
	<%
	}
	}catch(Exception e){
		out.println(e);
	}
	%>
</body>
</html>