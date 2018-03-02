<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 양식</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/member.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="formCheck.js"></script>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");	
		String id = (String)session.getAttribute("id");
		
		if(id==null){
%>
<jsp:include page="../top.jsp"/>
<div id="content">
<form action = "joinOK.jsp" method="post" name = "memberForm" onsubmit = "return formCheck(this)" >
<table class="member"align="center"  border="0">
	<tr>
		<th class="thead" align="left" colspan="2">회원가입</th>
	</tr>
		<tr height="30">
			<td  class="content">
				기본정보
			</td>
			<td  class="content" align="right">
			<span style="font-size:10pt;font-family: 나눔스퀘어;color:#EAEAEA">*회원가입을 위한 필수입력 항목을 입력해 주세요.*</span>
			</td>
		</tr>
		<tr>
			<td class="hm">
					아이디
					<span  style="font-size: 7pt; float:inherit;font-family: 나눔스퀘어;" >
					영문 소문자/숫자 , 4~10자로 입력해 주세요.
				</span>
			</td>
			<td class="content">
							<input type = "text"  name = "id" size = "40" onkeydown="inputIdChk()">
							<input class="btn" type = "button" name="idBtn" value="중복확인" onclick="openIdChk(this)"/>
							<input type="hidden" name="idDuplication" value="idUncheck" >
				</td>
			</tr>
		
		<tr>
			<td  class="hm">
				비밀번호
				<span  style="font-size: 7pt; float:inherit;font-family: 나눔스퀘어;" >
				특수문자/영문자/숫자를 혼합한  8~16자 내로 입력해주세요.
				</span>
			</td>
			<td  class="content">
				<input type = "password"  name = "password" size = "40">

			</td>
		</tr>
		
		<tr height="20" >
			<td  class="hm">
				비밀번호 확인
			</td>
			<td  class="content">
			<input type = "password"  name = "repassword" size = "40">
			</td>
		</tr>
		
		<tr>
			<td  class="hm">이름</td>
			<td  class="content">
				<input type = "text"  name = "name" size = "40">
			</td>
		</tr>
		
		<tr>
			<td  class="hm">생년월일</td>
			<td class="content" >
				<input type = "text"  name = "birth1" size = "5">년
				<input type = "text"  name = "birth2" size = "5">월
				<input type = "text"  name = "birth3" size = "5">일
			</td>
		</tr>
		
		<tr>
			<td  class="hm">성별</td>
			<td class="content">
				<input type = "radio"  name = "gender" value = "man" >남자
				<input type = "radio"  name = "gender" value = "woman"> 여자
			</td>
		</tr>
		
		<tr>
			<td class="hm">연락처
				<span  style="font-size: 7pt; float:inherit;font-family: 나눔스퀘어;" >
				'-'를 제외한 숫자로 입력해주세요.
				</span>
			</td>
			<td class="content">
				<input type = "text"  name = "phone" size = "40">
			</td>
		</tr>
		
		<tr>
			<td  class="hm" >주소</td>
			<td  class="content">
				<input id="post1" readonly="readonly" size="5" name="post1"> - <input id="post2" readonly="readonly" size="5" name="post2">
				<input onclick="openDaumPostcode(this)" class="btn" type="button" value="우편번호찾기"><br>
				<span style="LINE-HEIGHT: 10%"><br></span>
				<input id="addr1" readonly="readonly" size="40" name="addr1" placeholder="도로명주소"><br>
				<span style="LINE-HEIGHT: 10%; font-family: 나눔스퀘어;" ><br></span>
				<input id="addr2" size="40" name="addr2" placeholder="지번주소">		
			</td>
		</tr>		
		
		<tr>
			<td  class="hm">이메일</td>
			<td class="content">
			<input type = "text"  name = "email" size = "40">
			</td>
		</tr>
	</table>
	<table class="member"  cellspacing="0" border="0">
		<tr>
			<th >약관동의</th>
		</tr>
		<tr>
			<td align="center"  class="content">
					<textarea rows="20" cols="100" readonly="readonly">
가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
   </textarea>
   <br><br>
			</td>
		</tr>
		<tr>
			<td align="center"><input type="checkbox" id="req" value="req"> 개인정보 수집 및 이용에 동의합니다.</td>
		</tr>
	</table>
	
	<table class="member">
		<tr>
			<td align = "center">
				<input class="btn" type = "submit" value = "가입하기"/>
				<input type = "reset" class="btn" value = "새로쓰기"/>
			</td>
		</tr>	
	</table>
</div>
</form>
<%
		}else{
			out.println("<script>");
			out.println("alert('잘못된 접근입니다. ');");
			out.println("location.href='../index.jsp'");
			out.println("</script>");
		}
%>
</body>
</html>