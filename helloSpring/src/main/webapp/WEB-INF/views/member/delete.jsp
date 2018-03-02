<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<link rel = "stylesheet" href="/ex/resources/css/member1.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#js_pw").css("font-size", "12px");
	$("#js_pw").css("color", "gray");
	$("#js_repw").css("font-size", "12px");
	$("#js_repw").css("color", "gray");
	
	/* 비밀번호 유효성 체크 */
	$('#password').focusout(function(){
				var id = $('#id').val();
				var password = $(this).val();
				var count = passwordCheck(id, password);
					$("#js_pw").css("color", "red");
				if(password.length < 8 || password.length > 16){
					$('#js_pw').html("!비밀번호는 8~16이내로 입력해주세요,");
				}else if(count==0){
					$('#js_pw').html("!비밀번호가 일치하지 않습니다. ");
					return false;
				}else{
					$('#js_pw').html("");
				}
		});
	
	
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
	
	/* 비밀번호 중복체크 함수 */
	function passwordCheck(id, password){
		var id = $('#id').val();
		var password = $('#password').val();
		var count = "";
		 $.ajax({
			 	type: 'POST',
				data: {'id' : id,'password':password},
				dataType: 'text',
				async: false,
				url: 'passwordCheck',
				success: function(rData, textStatux, xhr){
					  count = parseInt(rData);
				},
				error : function(xhr, status, e){
					$('#js_password').html(e);
				}
			});
					return count;
	}
	/* submit 버튼 유효성 체크 */
	$('#member').submit(function(){
		var id=$('#id').val();
		var password = $('#password').val();
		var repassword=$('#repassword').val();
		var count = passwordCheck(id, password);
		if(password.trim().length==0){
				alert('비밀번호를을 입력해주세요.');
				return false;
		}else if(count==0){
			alert('비밀번호가 일치하지 않습니다.');
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
				<caption>회원탈퇴</caption>
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
								<form:input path="name" maxlength="10" readonly="true"/>
						</td>
				</tr>
				<tr>
						<th>성별</th>
						<td>
							<form:radiobutton path="gender" value="man" label="남자" disabled="false"/>
							<form:radiobutton path="gender" value="woman" label="여자" disabled="false"/>
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
									<input type = "submit" class="btn"  value = "탈퇴하기"/>
									<input type = "reset" class="btn" value = "새로쓰기"/>
						</div>
	</form:form>
</body>
</html>