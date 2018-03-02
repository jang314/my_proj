<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기</title>
<script type="text/javascript">

	function findForm(v, id){
		if(v=="findid"){
			document.getElementById(id).style.display = "none";
		}else if(v=="findpw"){
			document.getElementById(id).style.display = "";
		}
	}	
	
	function formCheck(obj) {
//		null이 아닌 값
		if(obj.find.value=="findid"){
			if(obj.name.value.trim().length == 0  ) {
				alert('이름을 입력하세요. ');
				obj.id.focus();
				return false;
			}
			if(isNaN(obj.phone.value.trim())){
				alert('연락처는 공백을 제외한 숫자로 입력해주세요. ');
				obj.phone.value = "";
				obj.phone.focus();
				return false;
			}
		}else if(obj.find.value="findpw"){
			if(obj.id.value.trim().length == 0) {
				alert('아이디를 입력하세요. ');
				obj.id.focus();
				return false;
			}
			if(obj.name.value.trim().length == 0  ) {
				alert('이름을 입력하세요. ');
				obj.id.focus();
				return false;
			}
			if(isNaN(obj.phone.value.trim())){
				alert('연락처는 공백을 제외한 숫자로 입력해주세요. ');
				obj.phone.value = "";
				obj.phone.focus();
				return false;
			}
			id = obj.id.value;
			count = 0;
			for(i=0; i<id.length; i++){
				if(id.charAt(i) >= 'a' && id.charAt(i) <= 'z' || id.charAt(i) >='0'&& id.charAt(i)<='9'){
					count++;
				}
			}
			if(count == 0){
				alert('아이디는 영소문자 또는 숫자로 입력해주세요.');
				obj.id.value = "";
				obj.id.focus();
				return false;
			}
		}
		
		
		
		return true; 
}
</script>
</head>
<body>
<form action="findOK.jsp" method="post" name = "guestForm" onsubmit = "return formCheck(this)" >
<table align="center">
<tr>
	<th align="center" colspan="2">
		<b><font size="4" color="gray" style="나눔스퀘어">아이디/비밀번호 찾기</font></b>
	</th>
</tr>
<tr><td colspan="2"><hr/></td></tr>
<tr>
		<td align="center"><input type="radio" name="find" value="findid" checked="checked" onclick="findForm(this.value,'f_id');">아이디 찾기</td>
		<td align="center"><input type="radio" name="find" value="findpw" onclick="findForm(this.value,'f_id');">비밀번호 찾기</td>
</tr>
<tr  id="f_id" style="display:none">
		<td>아이디</td>
		<td ><input type="text" name="id" /></td>
</tr>
<tr>
		<td>이름</td>
		<td><input type="text" name="name" ></td>
</tr>
<tr>
		<td>핸드폰 번호</td>
		<td><input type="text" name="phone" /></td>
</tr>
<tr>
		<td colspan="2" align="center"><input type="submit" value="찾기"/></td>
</tr>
</table>
</form>
    
</body>
</html>