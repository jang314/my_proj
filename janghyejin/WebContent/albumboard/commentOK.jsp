<%@page import="com.javalec.Service.DeleteService"%>
<%@page import="java.io.File"%>
<%@page import="com.javalec.Service.UpdateService"%>
<%@page import="com.javalec.Service.InsertService"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 처리</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");
	String uploadPath ="C:/comment";
	int size = 10*1024*1024;

	String id="";
	String name = "";
	String content = "";
	String image= "";

	try{
		MultipartRequest multi = new MultipartRequest(request,uploadPath, size, "UTF-8", new DefaultFileRenamePolicy() );
//		form의 enctype이 multipart/form-data이면 request가 아닌 MultipartRequest 객체로 받는다.
		int idx = Integer.parseInt(multi.getParameter("idx"));
		int currentPage = Integer.parseInt(multi.getParameter("currentPage"));
		int ref = Integer.parseInt(multi.getParameter("ref"));
		int mode = Integer.parseInt(multi.getParameter("mode"));
		id = multi.getParameter("id");
		name = multi.getParameter("name");
		content = multi.getParameter("content");
		
		Enumeration files = multi.getFileNames();
		// while(files.hasMoreElements()){} 여러개일경우 이명령으로 반복처리를 해야한다.
		String file = (String) files.nextElement();
		image= multi.getFilesystemName(file);
%>
<jsp:useBean id="vo" class="com.javalec.VO.AlbumboardCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
			out.println("<script>");
			session.setAttribute("id", id);
			switch(mode) {
			case 1:		
				vo.setRef(ref);
				vo.setId(id);
				vo.setName(name);
				vo.setContent(content);
				if(image!=null){
					vo.setImg(image);
				}
				InsertService.getInstance().insertAlbumComment(vo);
				out.println("alert('댓글이 등록되었습니다.')");
				break;
			
			case 2:
				String img = multi.getParameter("img");
				vo.setIdx(idx);
				vo.setRef(ref);
				vo.setId(id);
				vo.setName(name);
				vo.setContent(content);
				vo.setImg(image);
				if(image==null){
					vo.setImg(img);
				}else{
					vo.setImg(image);
				}
				UpdateService.getInstance().UpdateAlbumComment(vo);
				out.println("alert('댓글이 수정되었습니다.')");
				break;
				
			case 3:
				 img = multi.getParameter("img");
				String path="C:/comment"+"/"+img;
				File deleteimg = new File(path);
				vo.setRef(ref);
				if(deleteimg.exists() == true){
					deleteimg.delete();					
				}
					DeleteService.getInstance().DeleteAlbumComment(idx);
					out.println("alert('게시글이 삭제되었습니다. ')");
					break;

				}
					out.println("location.href='selectByIdx.jsp?id="+id+"&currentPage="+currentPage+"&idx="+vo.getRef()+"'");
				out.println("</script>");
			



	}catch(Exception e){
		out.println(e);
	} 
%>
</body>
</html>