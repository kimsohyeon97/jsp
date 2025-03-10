<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.Servlet</title>
	<!--
		서블릿(Servlet)
		 - Java를 이용해서 클라이언트 요청을 처리하고 응답하는 객체
		 - 서블릿은 HTML 작성이 어렵고 불편하기 때문에 JSP 기술로 대체
		 - 서블릿은 MVC 아키텍처에서 Controller 컴포넌트로 활용
		 - 서블릿은 등록(web.xml 또는 annotation)하고 주소맵핑(url-pattern)
	-->
</head>
<body>
	<h3>1.서블릿(Servlet)</h3>
	
	<a href="/ch09/hello.do">hello</a>
	<a href="/ch09/welcome.do">welcome</a>
	<a href="/ch09/greeting.do">greeting</a>
	
	<form action="/ch09/hello.do" method="post">
		<input type="submit" value="Hello POST 요청">
	</form>
	  <form action="/ch09/welcome.do" method="post">
        <input type="submit" value="Welcome POST 요청">
    </form>
	
</body>
</html>