<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리다이렉트 페이지#1</title>
</head>
<body>
	<h3>리다이렉트 페이지#1</h3>
	<%
		response.sendRedirect("../1_request.jsp");
	%>
</body>
</html>