<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forward</title>
</head>
<body>
	<h3>포워드 페이지 #1</h3>
	<%
	 	pageContext.forward("../1_request.jsp");
	%>
</body>
</html>