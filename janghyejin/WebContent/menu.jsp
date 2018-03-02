<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/index.css">
<style type="text/css">
table.nav_menu {
 height: 50px;
 width:100%;
 list-style-type:none;
 background: black;
 padding:0px 0px 0px 0px;
 text-align: center;
 border-collapse: collapse;
}

.menutxt{
	width:25%;
}
 
/* 특별하게 정해지지 않은 링크 속성에 모두 적용할 스타일 : 흰글씨 / 밑줄없앰 */
.menu_font{
margin-top:10px;
 font-family:나눔손글씨 붓;
 font-size:30px;
 text-decoration:none;
 color:#FFFFFF;
}
/* 링크에 마우스 롤오버시 적용되는 스타일 : 하단에 노란 밑줄이(border-bottom) 생김 */
.menu_font:hover {
 color:yellow;
 text-decoration: none;
}
</style>
</head>
<body>
<div id="menu">
<table	class="nav_menu" border="1">
<tr class="menutxt" align="center">
	<td class="menutxt">
		<a href="<%=application.getContextPath()%>/albumboard/list.jsp" class="menu_font">갤러리</a>
	</td>
	<td class="menutxt">
		<a href="<%=application.getContextPath()%>/freeboard/list.jsp" class="menu_font">커뮤니티</a>
	</td>
	<td class="menutxt">
		<a href="<%=application.getContextPath()%>/guestbook/list.jsp" class="menu_font">방명록</a>
	</td>


</tr>

</table>
</div>
</body>
</html>