function formCheck(obj) {
//	null이 아닌 값
	if(obj.id.value.trim().length == 0 ) {
		alert('아이디를 입력하세요. ');
		obj.id.focus();
		return false;
	}
	if(obj.idDuplication.value != "idCheck"){
        alert("아이디 중복체크를 해주세요.");
        return false;
    }

	if(obj.password.value.trim().length == 0){
		alert('비밀번호를 입력하세요. ');
		obj.password.focus();
		return false;
	}
	if(obj.name.value.trim().length == 0){
		alert('이름을 입력하세요. ');
		obj.name.focus();
		return false;
	}
	if(obj.birth1.value.trim().length == 0 || obj.birth2.value.trim().length == 0 || obj.birth3.value.trim().length == 0){
		alert('생년월일을 입력하세요.');
		obj.birth1.focus();
		return false;
	}
	if(obj.gender.value.trim().length == 0){
		alert('성별을 선택하세요.');
		return false;
	}
	if(obj.phone.value.trim().length == 0){
		alert('연락처를 입력하세요. ');
		obj.phone.focus();
		return false;
	}
	
	if(obj.post1.value.trim().length == 0 || obj.post2.value.trim().length == 0 || obj.addr1.value.trim().length == 0 || obj.addr2.value.trim().length == 0){
		alert('주소를 입력하세요. ');
		obj.addr2.focus();
		return false;
	}
	if(obj.email.value.trim().length == 0){
		alert('이메일을 입력하세요. ');
		return false;
	}

	var req = document.memberForm.req.checked;
	if(!req){
		alert('약관에 동의해주세요. ');
		return false;
	}
	
  	id = obj.id.value;
	count = 0;
	for(i=0; i<id.length; i++){
		if(id.charAt(i) >= 'a' && id.charAt(i) <= 'z' || id.charAt(i) >='0'&& id.charAt(i)<='9'){
			count++;
		}
	}
	if(count == 0){
		alert('아이디는 영소문자 또는 숫자로 입력해주세요.');
		obj.id.value = "";
		obj.id.focus();
		return false;
	}
 	
	if(id.length < 4 || id.length >10){
		alert('아이디는 4~10자 이내로 입력해주세요. ');
		obj.id.value = "";
		obj.id.focus();
		return false;
	} 
	
	if(obj.password.value != obj.repassword.value){
		alert('비밀번호를 동일하게 입력해주세요.');
		obj.repassword.value = "";
		obj.repassword.focus();
		return false;
	}
	
	
	
	password = obj.password.value;
	alphaCount = 0, numberCount = 0, etcCount = 0;
	
	for(i=0; i<password.length; i++){
		if(password.charAt(i)>='A' && password.charAt(i)<='Z' || password.charAt(i)>='a' && password.charAt(i)<='z'){
			alphaCount++;
		}else if(password.charAt(i) >='0' && password.charAt(i)<='9'){
			numberCount++;
		}else{
			etcCount++;
		}
	}
	
	if(alphaCount == 0 || numberCount == 0 || etcCount == 0){
		alert('비밀번호는 영문자/숫자/특수문자를 포함해야합니다.');
		obj.password.value="";
		obj.password.focus();
		return false;
	}
	
	if(password.length < 8 || password.length > 16){
		alert('비밀번호는 8~16자 사이로 입력해주세요.');
		obj.password.value="";
		obj.password.focus();
		return false;
	}
	
	if(isNaN(obj.birth1.value.trim()) || isNaN(obj.birth2.value.trim()) || isNaN(obj.birth3.value.trim())) {
		alert('생년월일은 공백을 제외한 숫자로 입력해주세요.');
		obj.birth1.focus();
		return false;
	}
	
	if(isNaN(obj.phone.value.trim())){
		alert('연락처는 공백을 제외한 숫자로 입력해주세요. ');
		obj.phone.value = "";
		obj.phone.focus();
		return false;
	}
	if(obj.req.value.trim().length == 0){
		alert('약관동의를 체크해주세요. ');
		return false;
	}
	return true;
}

function openDaumPostcode() {
    var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정
    new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById('addr2').focus();
        }
    }).open({
        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
    });
}

var openWin;
function openIdChk(){
			var id = document.memberForm.id.value;
			 if(id.trim().length == 0 ) {
	        		alert('아이디를 입력하세요. ');
	        		obj.id.focus();
	        		return false;
	        	}
			 count = 0;
	        	for(i=0; i<id.length; i++){
	        		if(id.charAt(i) >= 'a' && id.charAt(i) <= 'z' || id.charAt(i) >='0'&& id.charAt(i)<='9'){
	        			count++;
	        		}
	        	}
	        	if(count == 0){
	        		alert('아이디는 영소문자 또는 숫자로 입력해주세요.');
	        		obj.id.value = "";
	        		obj.id.focus();
	        		return false;
	        	}
	         	
	        	if(id.length < 4 || id.length >10){
	        		alert('아이디는 4~10자 이내로 입력해주세요. ');
	        		obj.id.value = "";
	        		obj.id.focus();
	        		return false;
	        	}else{
	        		window.open("IdCheckForm.jsp?id="+id,"","width=500, height=300")
	        	}
}

function inputIdChk(){
    	document.memberForm.idDuplication.value ="idUncheck";
}


