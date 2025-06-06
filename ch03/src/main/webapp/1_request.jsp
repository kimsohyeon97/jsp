<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.request</title>
	<!-- JPS 내장객체 request 실습하기 -->
	<!-- 
	request 내장객체
	- 클라이언트의 요청 정보를 갖는 객체
	- 클라이언트 전송 데이터를 수신처리하기 위한 기능 제공(getParameter)
	
	get 전송방식
	- get은 기본 데이터 전송방식, 전송 데이터를 주소(URL)에 붙어 서버로 전송
	- get은 전송 데이터가 노출되기 때문에 보안에 취약하지만 Post 전송보다 빠름  
	
	Post 전송방식
	- 전송 데이터를 request 요청 객체 body에 저장해서 전송하는 방식
	- 전송 데이터가 주소에 노출되지 않기 때문에 보안에 유리하고 대량의 데이터 전송에 적합
	
	-->
</head>
<body>
	<h3>1.request 객체</h3>
	
	<h4>get방식 데이터 전송</h4> <!-- 정보 노출 됨 -->
	<form action="./proc/result1.jsp" method="get">
		<input type="text" name="uid1"><br>
		<input type="text" name="name1"><br>
		<input type="number" name="age1"><br>
		<input type="submit" value="전송하기">
	</form>
	
		<h4>Post방식 데이터 전송</h4> <!-- 정보 노출 안됨 -->
	<form action="./proc/result1.jsp" method="Post">
		<input type="text" name="uid2"><br>
		<input type="text" name="name2"><br>
		<input type="number" name="age2"><br>
		<input type="submit" value="전송하기">
	</form>
	
	<h4>확인문제</h4>
	<form action="./proc/result2.jsp" method="Post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid3" placeholder="아이디 입력"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass3" placeholder="비밀번호 입력"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name3" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth3" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<lable><input type="radio" name="gender3" value="F">여</lable>
					<label><input type="radio" name="gender3" value="M">남</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr3">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
				<label><input type="checkbox" name="hobby3" value="등산">등산</label>
				<label><input type="checkbox" name="hobby3" value="독서">독서</label>
				<label><input type="checkbox" name="hobby3" value="영화">영화</label>
				<label><input type="checkbox" name="hobby3" value="운동">운동</label>
				<label><input type="checkbox" name="hobby3" value="게임">게임</label>
				</td>
				</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="전송하기">
				</td>
			</tr>
		</table>
	</form>
	
	<h4>request 기타정보</h4>
		<p>
			헤더정보#1 : <%= request.getHeader("User-Agent") %> <br>
			헤더정보#2 : <%= request.getHeader("referer") %> <br>
			헤더정보#3 : <%= request.getHeader("cookie") %> <br>
			프로토콜 : <%= request.getProtocol() %> <br>
			서버이름 : <%= request.getServerName() %> <br>
			요청주소 : <%= request.getRequestURL() %> <br>
			요청경로 : <%= request.getRequestURI() %> <br>
			IP주소 : <%= request.getRemoteAddr() %> <br>
		</p>
</body>
</html>