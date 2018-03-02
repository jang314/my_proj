<%@page import="com.javalec.VO.AlbumboardVO"%>
<%@page import="com.javalec.VO.AlbumboardList"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.VO.FreeboardList"%>
<%@page import="com.javalec.VO.FreeboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index Content</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/content1.css">
</head>
<body>
	<%
		AlbumboardList album = SelectService.getInstance().albumlist(1);
		String id = (String)session.getAttribute("id");
		album.setPageSize(3);
	%>

	<table class="index-album">
		<tr>
			<th class="box_th" colspan="<%=album.getPageSize()%>" align="left">최근갤러리</th>
		</tr>
		<tr>
			<%
				if (album.getPageSize() >= album.getList().size()) {
					for (int i = 0; i < album.getList().size(); i++) {
						AlbumboardVO ao = album.getList().get(i);
						if(id!=null){
			%>
					<td><a href="#"><img src="/img/<%= ao.getImg()%>" style="width:300px; height:300px;"></a></td>
			<%
						}else{
							
			%>
					<td><a href="#"><img src="/img/<%= ao.getImg()%>" style="width:300px; height:300px;"></a></td>
			<%		
						}
					}
					for (int j = album.getList().size(); j < album.getPageSize(); j++) {
						out.println("<td style='width:300px; height:300px;'>최근 업로드된 사진이 없습니다.</td>'");
					}
				} else {
					for (int i = 0; i < album.getPageSize(); i++) {
						AlbumboardVO ao = album.getList().get(i);
			%>
			<td class="box_td"><img src="/img/<%=ao.getImg()%>" style="width: 350px; height: 300px;" /></td>
			<%
					}
				}
			%>
		</tr>
	</table>
</body>
</html>