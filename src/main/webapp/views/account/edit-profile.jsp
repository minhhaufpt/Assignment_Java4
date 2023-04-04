<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/AssignmentJava4/account/edit-profile" method="post">
		<input name="username" value="${user.username}"> <input name="passwords"
			value="${user.passwords}"><input name="fullname"
			value="${user.fullname}"><input name="email"
			value="${user.email}"> <input name="admin" type="hidden"
			value="${user.admin}">
		<button>Cập nhật</button>
	</form>
	<h4>${message}</h4>
</body>
</html>