//유효성 검사에 사용할 정규표현식
const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName  = /^[가-힣]{2,10}$/ 
const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

document.addEventListener('DOMContentLoaded', function(){ // 페이지가 모든 HTML 요소를 로드한 후 실행
	
	// 유효성 검사에 사용할 상태 변수
	let isUidOk = false;
	let isPassOk = false;
	let isNameOk = false;
	let isNickOk = false;
	let isEmailOk = false;
	let isHpOk = false;
	
	// 1. 아이디 유효성, 중복체크 검사
	const btnCheckUid = document.getElementById('btnCheckUid'); // 아이디 중복확인 버튼 저장
	const uidResult = document.getElementsByClassName('uidResult')[0]; // 아이디 유효성, 중복 확인 결과 
	
	btnCheckUid.onclick = function(){ // 아이디 중복 확인 버튼을 클릭했을 때						
		const value = formRegister.uid.value; // 사용자가 입력한 아이디 값 가져와서 저장
		
		// 아이디 유효성 검사
		if(!value.match(reUid)){ // 서버와 중복체크 하기 전에 유효하지 않은 아이디 걸러내서 서버의 부하를 줄임
			uidResult.innerText = '아이디 형식에 맞지 않습니다.';
			uidResult.style.color = 'red';
			isUidOk = false; // 아이디 유효성 검사는 거짓
			return; // function 종료
		}
		
		// 아이디 중복 체크
		fetch('/jboard/user/check.do?type=uid&value='+value) // check.do URL에 type=uid, value=value 값을 포함한 GET 요청
			.then(response => response.json()) // 서버에서 받은 응답을 JSON으로 변환
			.then((data)=>{ // 반환된 JSON 데이터를 data 매개변수로 저장
				console.log(data);
				
				if(data.count > 0){ // JSON 객체의 count property 값을 가져옴
					// 이미 사용중인 아이디
					uidResult.innerText = '이미 사용중인 아이디 입니다.';
					uidResult.style.color = 'red';
					isUidOk = false;
				}else{
					// 사용 가능한 아이디
					uidResult.innerText = '사용 가능한 아이디 입니다.';
					uidResult.style.color = 'green';
					isUidOk = true;
				}
			})
			.catch((err)=>{
				console.log(err);
			});
	}
	
	// 2.비밀번호 유효성 검사
	const passResult = document.getElementsByClassName('passResult')[0]; // 비밀번호 유효성 검사 결과
	
	formRegister.pass2.addEventListener('focusout', function(){ // 비밀번호 확인에서 focusout 됐을 때
		
		const value1 = formRegister.pass1.value; // 비밀번호 값
		const value2 = formRegister.pass2.value; // 비밀번호 확인 값
		
		if(!value1.match(rePass)){ //비밀번호 유효성 검사
			passResult.innerText = '비밀번호는 숫자, 소문자, 대문자, 특수문자 조합 8자리';
			passResult.style.color = 'red';
			isPassOk = false;
			return;
		}
		
		if(value1 === value2){
			passResult.innerText = '사용 가능한 비밀번호 입니다.';
			passResult.style.color = 'green';
			isPassOk = true;
		}else{
			passResult.innerText = '비밀번호가 일치하지 않습니다.';
			passResult.style.color = 'red';
			isPassOk = false;
		}
	});
	
	// 3.이름 유효성 검사
	const nameResult = document.getElementsByClassName('nameResult')[0]; // 이름 유효성 검사 결과 
	
	formRegister.name.addEventListener('focusout', function(){ 
		
		const value = this.value; // name의 값
		
		if(!value.match(reName)){ // 이름 유효성 검사
			nameResult.innerText = '이름이 유효하지 않습니다.';
			nameResult.style.color = 'red';
			isNameOk = false;
		}else{
			nameResult.innerText = '';
			isNameOk = true;
		}
	});			
	
	// 4.별명 유효성, 중복체크 검사
	const btnCheckNick = document.getElementById('btnCheckNick'); // 별명 중복확인 버튼 저장
	const nickResult = document.getElementsByClassName('nickResult')[0]; // 별명 유효성, 중복체크 검사 결과
	
	btnCheckNick.onclick = async function(){ // 비동기 함수 - 서버에서 데이터를 가져오는 동안 다른 코드가 실행 가능
		
		const value = formRegister.nick.value; // 별명의 값
		
		if(!value.match(reNick)){ // 별명 유효성 검사
			nickResult.innerText = '유효하지 않은 별명 입니다.';
			nickResult.style.color = 'red';
			isNickOk = false;
			return;
		}
		
		try {
			const response = await fetch('/jboard/user/check.do?type=nick&value='+value); // fetch()는 서버에서 응답을 받을 때까지 시간이 걸리므로 await가 필요
			const data = await response.json(); // 서버의 응답을 JSON으로 변환하고 data 변수에 저장
			console.log(data);
			
			if(data.count > 0){
				nickResult.innerText = '이미 사용중인 별명 입니다.';
				nickResult.style.color = 'red';
				isNickOk = false;
			}else{
				nickResult.innerText = '사용 가능한 별명 입니다.';
				nickResult.style.color = 'green';
				isNickOk = true;
			}
		}catch(err){
			console.log(err);
		}
	}
	
	// 5. 이메일 유효성, 중복체크, 인증번호 검사
	const btnSendEmail = document.getElementById('btnSendEmail'); // 이메일 인증번호 받기 버튼 저장
	const emailResult = document.querySelector('.emailResult'); // 이메일 유효성, 중복체크, 인증번호 검사 결과
	const auth = document.querySelector('.auth'); // 인증번호 입력 필드 저장
	let preventDoubleClick = false; // 이중 클릭 방지
	
	btnSendEmail.onclick = async function(){ 
		
		const value = formRegister.email.value;
		
		// 이중 클릭 방지
		if(preventDoubleClick){
			return;
		}
		
		if(!value.match(reEmail)){ // 이메일 유효성 검사
			emailResult.innerText = '이메일이 유효하지 않습니다.';
			emailResult.style.color = 'red';
			isEmailOk = false;
			return;
		}
		
		preventDoubleClick = true; // 인증번호 받기 버튼을 한번 누르고 이중 클릭 방지를 위해 true로 전환
		const response = await fetch('/jboard/user/check.do?type=email&value='+value);
		const data = await response.json();
		
		if(data.count > 0){ // 이메일 중복체크
			emailResult.innerText = '이미 사용중인 이메일 입니다.';
			emailResult.style.color = 'red';
			isEmailOk = false;
		}else {
			// 인증번호 입력 필드 출력 
			auth.style.display = 'block';
		}
	}
	
	const btnAuthEmail = document.getElementById('btnAuthEmail'); // 인증번호 확인 버튼 저장
	
	btnAuthEmail.onclick = async function(){ // 인증번호 확인 버튼 누름
		
		const value = formRegister.auth.value; // 인증번호 값 저장
		
		// 폼 데이터 생성 - method: POST를 쓰기위해 사용
		const formData = new URLSearchParams(); 
		formData.append("authCode", value); // formData 객체에 value를 authCode라는 이름으로 저장
		
		// 서버 전송
		const response = await fetch('/jboard/user/check.do', { // /jboard/user/check.do URL로 POST 전송
										method: 'POST',
										headers: {'Content-Type': 'application/x-www-form-urlencoded'},
										body: formData
									});
		
		const data = await response.json(); // 서버로 부터 받은 인증번호 확인 값을 json으로 data에 저장
		console.log(data);
		
		if(data.result > 0){ // 인증번호 확인
			emailResult.innerText = '이메일이 인증 되었습니다.';
			emailResult.style.color = 'green';
			isEmailOk = true;
		}else{
			emailResult.innerText = '유효한 인증코드가 아닙니다.';
			emailResult.style.color = 'red';
			isEmailOk = false;
		}
		
	} // btnAuthEmail.onclick end
	
	// 6.휴대폰 유효성, 중복체크 검사
	const hpResult = document.getElementsByClassName('hpResult')[0]; // 휴대폰 유효성, 중복체크 검사 결과
	
	formRegister.hp.addEventListener('focusout', async function(){
		
		const value = this.value; // hp 값 저장
		
		if(!value.match(reHp)){ // 휴대폰 유효성 검사
			hpResult.innerText = '휴대폰번호가 유효하지 않습니다.(- 포함)';
			hpResult.style.color = 'red';
			isHpOk = false;
			return;
		}
		
		// 휴대폰 중복체크
		const response = await fetch('/jboard/user/check.do?type=hp&value='+value);
		const data = await response.json();
		
		if(data.count > 0){
			hpResult.innerText = '이미 사용중인 휴대폰번호 입니다.';
			hpResult.style.color = 'red';
			isHpOk = false;
		}else{
			hpResult.innerText = '사용 가능한 휴대폰번호 입니다.';
			hpResult.style.color = 'green';
			isHpOk = true;
		}
	});
	
	// 최종 폼 전송 이벤트
	formRegister.onsubmit = function(e){
		
		// 1) 아이디 유효성 검사 결과
		if(!isUidOk){
			return false; // 폼 전송 취소
		}
		
		// 2) 비밀번호 유효성 검사 결과
		if(!isPassOk){
			return false;
		}
		
		// 3) 이름 유효성 검사 결과
		if(!isNameOk){
			return false;
		}
		
		// 4) 별명 유효성 검사 결과
		if(!isNickOk){
			return false;
		}
		
		// 5) 이메일 유효성 검사 결과
		if(!isEmailOk){
			return false;
		}
		
		// 6) 휴대폰 유효성 검사 결과
		if(!isHpOk){
			return false;
		}
		
		return true; // 폼 전송 시작
	} // 최종 폼 전송 이벤트 끝
	
	
});