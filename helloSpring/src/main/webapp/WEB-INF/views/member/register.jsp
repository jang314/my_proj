<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 양식</title>
<link rel = "stylesheet" href="/ex/resources/css/member1.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#js_id").css("font-size", "12px");
	$("#js_id").css("color", "gray");
	$("#js_pw").css("font-size", "12px");
	$("#js_pw").css("color", "gray");
	$("#js_repw").css("font-size", "12px");
	$("#js_repw").css("color", "gray");
	$("#js_email").css("font-size", "12px");
	
	var id=$('#id').val();
	var password=$('#password').val();
	var repassword=$('#repassword').val();
	var email=$('#email').val();
	
	/* 아이디 유효성 체크 */
	$('#id').focusout(function(){
			var id = $('#id').val();
			var count = idDuplication(id);
		
			$("#js_id").css("color", "red");
		    if(id.length < 4 || id.length > 10){
				$('#js_id').html("!아이디는 4~10이내로 입력해주세요,");
			}else if(!chkId(id)){
				$('#js_id').html("!공백/특수문자가 포함되었거나, 숫자로 시작 또는 숫자로만 이루어진 아이디는 사용할 수 없습니다.");
			}else if(count==1){
				$('#js_id').html("!이미 존재하는 아이디 입니다. ");
			}else{
				$('#js_id').html("사용가능한 아이디 입니다. ");
				$("#js_id").css("color", "black");
			}
	});
	
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
	
	/* 이메일 유효성 체크 */
	$('#email').focusout(function emailCheck(){
		var email = $('#email').val();
		var count = emDuplication(email);
		
		$("#js_email").css("color", "red");
		if(email.length==0||!chkEmail(email)){
			$('#js_email').html("!올바른 형식의 이메일을 입력해주세요. ");
		}else if(count==1){
			$('#js_email').html("!이미 가입된 이메일입니다.");
		}else{
			$('#js_email').html("사용가능한 이메일입니다.");
			$("#js_email").css("color", "black");
		}
	});
	
	/* 아이디 중복체크 함수 */
	function idDuplication(id){
		var id = $('#id').val();
		var count = "";
		 $.ajax({
			 	type: 'POST',
				data: 'id='+id,
				dataType: 'text',
				async: false,
				url: 'idDuplication',
				success: function(rData, textStatux, xhr){
					  count = parseInt(rData);
				},
				error : function(xhr, status, e){
					$('#js_id').html(e);
				}
			});
					return count;
	}
	
	/* 이메일 중복체크 함수 */
	function emDuplication(email){
		var email = $('#email').val();
		var count = "";
		 $.ajax({
			 	type: 'POST',
				data: 'email='+email,
				dataType: 'text',
				async: false,
				url: 'emailDuplication',
				success: function(rData, textStatux, xhr){
					  count = parseInt(rData);
				},
				error : function(xhr, status, e){
					$('#js_email').html(e);
				}
			});
					return count;
	}
		
	/* 아이디 정규식 함수 */
	function chkId(id){
		 var exptext = /^[a-z]+[a-z0-9]{3,9}$/g;
		 var id = $('#id').val();
		 return exptext.test(id);
	}

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
	
	/* 이메일 정규식 함수 */
	function chkEmail(email){
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var email = $('#email').val();
		
		return exptext.test(email);
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
	
	/* submit 버튼 유효성 체크 */
	$('#member').submit(function(){
		var id = $('#id').val();
		var password = $('#password').val();
		var repassword=$('#repassword').val();
		var name = $('#name').val();
		var gender = $('input:radio[name="gender"]:checked').val();
		var email=$('#email').val();
		
		if(id.trim().length==0||password.trim().length==0||name.trim().length==0||email.trim().length==0){
				alert('공란을 입력해주세요.');
				return false;
		}else if($(':radio[name="gender"]:checked').length == 0){
				alert('성별을 체크해주세요. ');
				return false;
		}else if(!chkId(id) || chkPw(password)||!chkEmail()||password.length<8){
			alert('입력하신 회원정보를 확인해주세요.');
			return false;
		}else if(repassword!=password){
			alert('비밀번호를 동일하게 입력해주세요.');
			return false;
		}else if(idDuplication(id)==1 || emDuplication(email)==1){
			alert('아이디 혹은 이메일이 중복되었습니다.');
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
				<caption>회원가입</caption>
				<tr>
					<td colspan="2">기본정보</td>
				</tr>
				<tr>
						<th>아이디</th>
						<td>
								<form:input path="id"  maxlength="10"/><div id="js_id">영소문자/숫자 4~10자로 입력하세요.</div>
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
								<form:input path="email"  size="50"/><div id="js_email"></div>
						</td>
				</tr>
				<tr>
		</table>
						<div class="buttons">
									<input type = "submit" class="btn"  value = "가입하기"/>
									<input type = "reset" class="btn" value = "새로쓰기"/>
						</div>
	</form:form>
</body>
</html>