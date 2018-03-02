<%@page import="com.javalec.Service.InsertService"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String uploadPath ="C:/upload";
	int size = 10*1024*1024;
%>
<% 
	String id="";
	String name = "";
	String title ="";
	String content = "";
	String img= "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request,uploadPath, size, "UTF-8", new DefaultFileRenamePolicy() );
//		form의 enctype이 multipart/form-data이면 request가 아닌 MultipartRequest 객체로 받는다.
		id = multi.getParameter("id");
		name = multi.getParameter("name");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		
		Enumeration files = multi.getFileNames();
		// while(files.hasMoreElements()){} 여러개일경우 이명령으로 반복처리를 해야한다.
		String file = (String) files.nextElement();
		img = multi.getFilesystemName(file);

%>
<jsp:useBean id="vo" class="com.javalec.VO.AlbumboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	vo.setId(id);
	vo.setName(name);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setImg(img);
	
	out.println("<script>");
	InsertService.getInstance().insertAlbumboard(vo);
	session.setAttribute("id", id);
	request.setAttribute("uploadPath", uploadPath);
	out.println("alert('사진이 업로드 되었습니다.')");
	out.println("location.href='list.jsp'");
	out.println("</script>");
%>



<%
	}catch(Exception e){

	}
%>	

</body>
</html>