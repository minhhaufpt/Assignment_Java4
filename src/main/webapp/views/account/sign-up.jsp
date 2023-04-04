<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ProjectFinal/account/sign-up" method="post">
		<input name="username"> <input name="passwords" type="password">
		<input name="fullname"> <input name="email"> <input
			name="admin" type="hidden" value="false">
		<button>Dang ki</button>
	</form>
	<h4>${message}</h4>
</body>
</html>