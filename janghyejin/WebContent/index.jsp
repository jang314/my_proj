<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/index2.css">
</head>
<body>
       		 <jsp:include page="top.jsp"/>
      <div id="content">
      	 	 <img src="<%=application.getContextPath()%>/img/main1.jpg" style="width: 90%; height: 450px;margin-left: 70px;"/>
       		 <jsp:include page="content.jsp"/>
      	</div>
      <div id="footer">
        <p>Copyright ⓒ Hyejin, JANG</p>
      </div>
      </body>
</html>