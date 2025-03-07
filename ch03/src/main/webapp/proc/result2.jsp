<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid3 = request.getParameter("uid3");
	String query3 = request.getQueryString();
	String pass3 = request.getParameter("pass3");	
	String name3 = request.getParameter("name3");
	String birth3 = request.getParameter("birth3");
	String gender3 = request.getParameter("gender3");
	String addr3 = request.getParameter("addr3");
	String[] hobbies3 = request.getParameterValues("hobby3"); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>request2</title>
</head>
<body>
	<h3>확인문제</h3>
	<p>
		쿼리스트링 : <%= query3 %><br>
		아이디 : <%= uid3 %> <br>
		비밀번호 : <%= pass3 %> <br>
		이름 : <%= name3 %> <br>
		생년월일 : <%= birth3 %> <br>
		성별 : <%= gender3 %> <br>
		주소 : <%= addr3 %> <br>
		취미 : 
		<% for(String hobby : hobbies3)
			out.print(hobby + ", ");
		%> <br>
	</p>
	<a href="../1_request.jsp">뒤로가기</a>
</body>
</html>