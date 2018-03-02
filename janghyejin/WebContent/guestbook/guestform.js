function setting(mode, idx, button, name, content) {
	f = document.commentForm;
	f.mode.value = mode;
	f.idx.value = idx;
	f.guestBtn.value = button;
	f.name.value = name;
	
//	indexOf() : 문자열에서 괄호 안의 문자가 나타나는 위치를 얻어온다.
//	문자가 포함되어 있으면 0 이상의 값이 나오고
//	포함되어 있지 않으면 -1을 얻어온다.
	while(content.indexOf("<br/>") >= 0) {
		content = content.replace("<br/>", "\r\n");
	}
	f.content.value = content;
}