<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel = "stylesheet" href="/ex/resources/css/member1.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	jQuery('#f_id').hide();
	$('input:radio[name=find]').click(function(){
	var b =$("input:radio[name='find']:checked").val() ;
	if(b=="findpw"){
		jQuery('#f_id').show();
	}else{
		jQuery('#f_id').hide();
	}
	});
	$('#member').submit(function(){
		var id = $('#id').val();
		var name = $('#name').val();
		var email=$('#email').val();
		var find = $('input:radio[name="find"]:checked').val();
		if(find=='findid'){
			if(name.trim().length==0 || email.trim().length==0){
				alert('공란을 입력해주세요.');
				return false;
			}
			return true;
		}else{
			if(id.trim().length==0 || name.trim().length==0 || email.trim().length==0){
				alert('공란을 입력해주세요.');
				return false;
			}
		return true;
		}
	});
});
</script>
</head>
<body>
<form:form modelAttribute="member"  name="member">
		<table class="login_table"  style="width:80%;padding-bottom: 10px;">
				<caption style="font-size: 30px; padding: 10px 10px;">아이디/비밀번호 찾기</caption>
				<tr>
						<td colspan="2">
								<input type="radio" name="find"  value="findid" checked="checked"/>아이디 찾기
								<input type="radio" name="find"  value="findpw"/>비밀번호 찾기
						</td>
				</tr>
				<tr  id="f_id" >
				<td>아이디</td>
				<td>
						<form:input path="id" />
				</td>
				</tr>
				<tr>
						<td>이름</td>
						<td>
								<form:input path="name"/>
						</td>
				</tr>
				<tr>
						<td>이메일</td>
						<td>
								<form:input path="email"/>
						</td>
				</tr>
				<tr>
						<td colspan="2" align="center">
								<input type="submit" value="찾기"/>
						</td>
				</tr>
		</table>
</form:form>
</body>
</html>