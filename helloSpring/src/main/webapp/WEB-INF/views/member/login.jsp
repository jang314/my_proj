<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<link rel = "stylesheet" href="/ex/resources/css/member1.css">
<script type="text/javascript" src="/ex/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/ex/resources/js/jquery.cookie.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	var userInputId = getCookie("userInputId");
	
    if(userInputId != "undefined") {
        //아이디에 쿠키값을 담는다
        $("input[name='id']").val(userInputId);
        //아이디저장 체크박스 체크를 해놓는다
        $("#idSaveCheck").prop("checked",true);
    }else{
    	$("#idSaveCheck").prop("checked", false);
    }

    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays===undefined) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
	$('#member').submit(function(){
		var id = $('input[name=id]').val();
		var password = $('input[name=password]').val();
		var userInputId = $("input[name='id']").val();
		
		if(id.trim().length==0 || password.trim().length==0){
			alert('아이디와 비밀번호는 필수 항목입니다. ');
			return false;
		}
		return true;
	});
});

function openFindMember(){
	window.open("mfind","","width=500, height=300, resizable = no, scrollbars = no");
}
</script>
</head>
<body>
<%@ include file="/include/menu.jsp" %>
<form action="login" id="member" method="post" >
		<table class="login_table" >
		<caption>로그인</caption>
		<tr>
				<td>
						<input type="text" name="id"  placeholder="아이디"/>
				</td>
		</tr>
		<tr>
				<td>
						<input type="password" name="password" placeholder="비밀번호"/>
				</td>
		</tr>
		<tr>
				<td>
							<input type="checkbox"  id="idSaveCheck" name="idSaveCheck"/>아이디 저장하기
				</td>
		</tr>
		<tr>
				<td class="buttons">
							<input type="submit"  value="로그인"/>
				</td>
		</tr>
		<tr class="buttons">
				<td>
							<a href="register">회원가입</a>&nbsp;&nbsp;|
							<a href="javascript:openFindMember();" >아이디/비밀번호 찾기</a>
				</td>
		</tr>
		</table>
</form>
</body>
</html>