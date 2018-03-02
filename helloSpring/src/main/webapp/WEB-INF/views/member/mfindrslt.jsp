<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기 결과창</title>
<link rel = "stylesheet" href="/ex/resources/css/member1.css">
<link rel = "stylesheet" href="/ex/resources/css/menu.css">
</head>
<body>
<table class="login_table"  style="width:80%;padding-bottom: 10px;">
				<caption style="font-size: 30px; padding: 10px 10px;">아이디/비밀번호 찾기</caption>
				<tr style="font:20px;">
						<td>${massage}</td>
				</tr>
		</table>
		<div class="buttons"><input type="button" class="btn" value="닫기"  onclick='window.close()'/></div>
</body>
</html>