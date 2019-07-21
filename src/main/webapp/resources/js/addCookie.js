//쿠키 설정하는 함수 - setCookie('myHobby', 'game', '3'); - 저장확인 document.cookie;
function setCookie(cookie_name, value, days) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + days);
	// 설정 일수만큼 현재시간에 만료값으로 지정

	//escape를 사용하는 경우는 ,를 구분자로 사용한 경우 cookie가 ,를 포함할 수 없어 escape로 변환해서 저장하는데
	//이경우 컨트롤러에서 불러오는 값이 escape로 변환된 값이라서 unescape 상태로 컨트롤러가 받지 못하기 때문에 별도의 처리가 필요한데
	//그 방법을 찾지 못해서 임시로 ,값 대신 /값을 쿠키 구분자로 사용함
	var cookie_value = value + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	//var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	document.cookie = cookie_name + '=' + cookie_value;
}

//쿠키를 가져오는 함수
function getCookie(cookie_name) {
	var x, y;
	var val = document.cookie.split(';');

	for (var i = 0; i < val.length; i++) {
		x = val[i].substr(0, val[i].indexOf('='));
		y = val[i].substr(val[i].indexOf('=') + 1);
		x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		if (x == cookie_name) {
			return unescape(y); // unescape로 디코딩 후 값 리턴
		}
	}
}

//쿠키를 추가하는 함수  - id값 가져오기 addCookie() - 새로운 id값 추가하기 addCookie(productNo)
function addCookie(productNo) {
	var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
	var maxItemNum = 5; // 최대 저장 가능한 아이템개수
	var expire = 1; // 쿠키값을 저장할 기간
	if (items) {
		var itemArray = items.split('/');
		//var itemArray = items.split(',');
		if (itemArray.indexOf(productNo) != -1) {
			// 이미 존재하는 경우 종료
			console.log('Already exists.');
		}
		else {
			// 새로운 값 저장 및 최대 개수 유지하기
			itemArray.unshift(productNo);
			if (itemArray.length > maxItemNum ) itemArray.length = 5;
			items = itemArray.join('/');
			//items = itemArray.join(',');
			setCookie('productItems', items, expire);
		}
	}
	else {
		// 신규 id값 저장하기
		setCookie('productItems', productNo, expire);
	}
}