<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forward</title>
</head>
<body>
	<h3>포워드 페이지 #2</h3>
	<%
		//forward는 서버 자원내에서 제어권 이동이기 때문에 원격적 타 서버 자원으로 이동 불가
	 	pageContext.forward("https://naver.com"); //404에러
	%>
</body>
</html>