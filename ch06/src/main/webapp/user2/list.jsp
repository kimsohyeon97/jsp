<%@page import="entity.User2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


	List<User2> users = new ArrayList<>();


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user2::list</title>
</head>
<body>
	<h3>user2 목록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>휴대폰</td>
			<td>나이</td>
			<td>관리</td>
		</tr>
		<% for (User2 user2 : users) { %>
		<tr>
			<td><%= user2.getUid() %></td>
			<td><%= user2.getName() %></td>
			<td><%= user2.getBirth() %></td>
			<td><%= user2.getHp() %></td>
			<td><%= user2.getAddr() %></td>
			<td>
				<a href="./modify.jsp?uid=<%=user2.getUid() %>">수정</a>
				<a href="./proc.delete.jsp?uid=<%=user2.getUid() %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>