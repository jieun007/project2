<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/t" method="POST">
	    <textarea name="original"></textarea>
	    <input type="submit" value="번역">
	</form>
	
	<p>${translated}</p>
</body>
</html>