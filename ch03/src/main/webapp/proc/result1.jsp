<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신 처리
	String query1 = request.getQueryString();
	String uid1 = request.getParameter("uid1");
	String name1 = request.getParameter("name1");
	String age1 = request.getParameter("age1");
	
	String query2 = request.getQueryString();
	String uid2 = request.getParameter("uid2");
	String name2 = request.getParameter("name2");
	String age2 = request.getParameter("age2");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>result1</title>
</head>
<body>
	<h3>get방식 데이터 수신</h3>
	<p>
		쿼리스트링 : <%= query1 %><br>
		아이디 : <%= uid1 %> <br>
		이름 : <%= name1 %> <br>
		나이 : <%= age1 %> <br>
	</p>
	
	<h3>Post방식 데이터 수신</h3>
	<p>
		쿼리스트링 : <%= query2 %><br>
		아이디 : <%= uid2 %> <br>
		이름 : <%= name2 %> <br>
		나이 : <%= age2 %> <br>
	</p>
	
	<a href="../1_request.jsp">뒤로가기</a>
</body>
</html>