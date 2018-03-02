<%@page import="com.javalec.Service.UpdateService"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
%>
<jsp:useBean id="vo" class="com.javalec.VO.AlbumboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	String uploadPath ="C:/upload";
	int size = 10*1024*1024;
	String name="";
	String id="";
	String title="";
	String content="";
	String existFile="";
	
	
	out.println("<script>");
	try{
		MultipartRequest multi = new MultipartRequest(request,uploadPath, size, "UTF-8", new DefaultFileRenamePolicy() );
		
		int idx = Integer.parseInt(multi.getParameter("idx"));
		int currentPage = Integer.parseInt(multi.getParameter("currentPage"));
		id = multi.getParameter("id");
		name = multi.getParameter("name");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		existFile = multi.getParameter("existFile");
		
		vo.setIdx(idx);
		vo.setId(id);
		vo.setName(name);
		vo.setTitle(title);
		vo.setContent(content);

		 Enumeration<String> filenames = multi.getFileNames();
		if(filenames.hasMoreElements()){
			String filename = filenames.nextElement();
			String updateFile = multi.getFilesystemName(filename);
			
			if(updateFile == null)
				vo.setImg(existFile);
			else
				vo.setImg(updateFile);
		} 
		session.setAttribute("id", id);
		UpdateService.getInstance().UpdateAlbum(vo);
		out.println("alert('수정이 완료되었습니다. ')");
		out.println("location.href='list.jsp?id=" + id + "&currentPage=" + currentPage +"'");
	}catch(Exception e){
		out.println("alert('업로드 수정에 실패하였습니다.')");
	}
		out.println("</script>");
%>
</body>
</html>