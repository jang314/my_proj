<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원수정</title>
<link rel = "stylesheet" href="/ex/resources/css/member1.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#js_pw").css("font-size", "12px");
	$("#js_pw").css("color", "gray");
	$("#js_repw").css("font-size", "12px");
	$("#js_repw").css("color", "gray");
	$("#js_email").css("font-size", "12px");
	
	/* 비밀번호 유효성 체크 */
	$('#password').focusout(function(){
				var password = $(this).val();
					$("#js_pw").css("color", "red");
				if(password.length < 8 || password.length > 16){
					$('#js_pw').html("!비밀번호는 8~16이내로 입력해주세요,");
				}else if(chkPw(password)){
					$('#js_pw').html("!문자, 숫자, 특수문자의 조합으로 입력해주세요. ");
					return false;
				}else{
					$('#js_pw').html("");
				}
		});
	
	/* 비밀번호 함수 */
	function chkPw(password){
		var password = $('#password').val();
		var alphaCount = 0;
		var numberCount = 0;
		var etcCount = 0;
		
		for(i=0; i<password.length; i++){
			if(password.charAt(i)>='A' && password.charAt(i)<='Z' || password.charAt(i)>='a' && password.charAt(i)<='z'){
				alphaCount++;
			}else if(password.charAt(i) >='0' && password.charAt(i)<='9'){
				numberCount++;
			}else{
				etcCount++;
			}
		}
		
		return alphaCount == 0 || numberCount == 0 || etcCount == 0;
	}
	
	/* 비밀번호 재입력 유효성 체크 */
	$('#repassword').focusout(function chkRepw(){
		var password = $('#password').val();
		var repassword=$('#repassword').val();
		if(repassword!=password){
			$('#js_repw').html("!비밀번호가 동일하지 않습니다.");
			$("#js_repw").css("color", "red");
			$("#js_repw").css("font-size", "12px");
			return false;
		}else{
			$('#js_repw').html("");
			return true;
		}
	});
	
	$('#deleteBtn').click(function(){
		var password = $('#password').val();
		var repassword=$('#repassword').val();
		
		if(repassword!=password){
			alert('비밀번호를 동일하게 입력해주세요.');
			return false;
		}
		return true;
	});
	
	/* submit 버튼 유효성 체크 */
	$('#member').submit(function(){
		var password = $('#password').val();
		var repassword=$('#repassword').val();
		var name = $('#name').val();
		var gender = $('input:radio[name="gender"]:checked').val();
		var email=$('#email').val();
		
		if(password.trim().length==0||name.trim().length==0||email.trim().length==0){
				alert('공란을 입력해주세요.');
				return false;
		}else if($(':radio[name="gender"]:checked').length == 0){
				alert('성별을 체크해주세요. ');
				return false;
		}else if(chkPw(password)||!chkEmail()||password.length<8){
			alert('입력하신 회원정보를 확인해주세요.');
			return false;
		}else if(repassword!=password){
			alert('비밀번호를 동일하게 입력해주세요.');
			return false;
		}
		return true;
	});
});
</script>
</head>
<body>
<%@ include file="/include/menu.jsp" %>
	<form:form modelAttribute="memberForm"  id="member" >
		<table class="m_table" >
				<caption>회원정보수정</caption>
				<tr>
					<td colspan="2">기본정보</td>
				</tr>
				<tr>
						<th>아이디</th>
						<td>
								<form:input path="id"  maxlength="10" readonly="true"/>
						</td>
				</tr>
				<tr>
						<th>비밀번호</th>
						<td>
								<form:password path="password"  maxlength="16"/>
								<div id="js_pw">특수문자/영문자/숫자를 혼합한 8~16자로 입력하세요.</div>
						</td>
				</tr>
				<tr>
						<th>비밀번호 확인</th>
						<td>
							<form:password path="repassword" maxlength="16"/>
							<div id="js_repw">비밀번호를 동일하게 재입력해주세요.</div>
						</td>
				</tr>
				<tr>
						<th>이름</th>
						<td>
								<form:input path="name" maxlength="10"/>
						</td>
				</tr>
				<tr>
						<th>성별</th>
						<td>
							<form:radiobutton path="gender" value="man" label="남자"/>
							<form:radiobutton path="gender" value="woman" label="여자"/>
						</td>
				</tr>
				<tr>
						<th>이메일</th>
						<td>
								<form:input path="email"  size="50" readonly="true"/><div id="js_email"></div>
						</td>
				</tr>
				<tr>
		</table>
						<div class="buttons">
									<input type = "submit" class="btn"  value = "회원수정"/>
									<input type = "button" class="btn" value = "회원탈퇴" id="deleteBtn" onclick="location.href='delete'"/>
						</div>
	</form:form>
</body>
</html>