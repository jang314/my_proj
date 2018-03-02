<%@page import="com.javalec.VO.MemberVO"%>
<%@page import="com.javalec.Service.SelectService"%>
<%@page import="com.javalec.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>아이디 중복 체크</title>
 <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:visible;
        }
 
   </style>
    
    <script type="text/javascript">
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("userId").value = opener.document.memberForm.id.value;
        }

        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
      	    opener.document.memberForm.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
 //           opener.document.memberForm.id.value = document.getElementById("userId").value;
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
   </script>   
</head>
<body onload="pValue()">
<%
	String id = request.getParameter("id");
	MemberVO vo = SelectService.getInstance().SelectById(id);
%>
<div id="wrap">
    <br>
    <b><font size="4" color="gray" style="나눔스퀘어">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
<%
        	if(vo==null){
        		out.println(id+"는 사용가능한 아이디 입니다. "+"<br/><br/>");
        		out.println("<input id='useBtn' type='button' value='확인' onclick='sendCheckValue()'>");
        		out.println("<input id='cancelBtn' type='button' value='취소' onclick='window.close()'>");
        	}else{
        		out.println(id+"이미 존재하는 아이디 입니다. "+"<br/><br/>");
        		out.println("<input id='cancelBtn' type='button' value='닫기' onclick='window.close()'>");
        	} 
 %>
        </form>
        <div id="msg"></div>
        <br>

    </div>
</div>    


</body>
</html>