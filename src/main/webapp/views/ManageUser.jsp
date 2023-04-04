<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD User</title>
<style>
</style>
</head>
<body>
	<c:url var="url" value="/Assignment_Java4/user">
	</c:url>
	<c:url var="url1" value="/Assignment_Java4/user1">
	</c:url>
	<form method="post">
		<div>
			<input placeholder="Username" type="text" name="username"
				value="${idInfor.username}"> <br> <input
				placeholder="Password" type="text" name="passwords"
				value="${idInfor.passwords}"><br> <input
				placeholder="Fullname" type="text" name="fullname"
				value="${idInfor.fullname}"> <br> <input
				placeholder="Email" type="text" name="email"
				value="${idInfor.email}"><br>
			<div>
				Admin <input type="radio" name="admin" value="true"
					${idInfor.admin ? 'checked':''}> User <input type="radio"
					name="admin" value="false" ${idInfor.admin ? '':'checked'}>
			</div>
		</div>
		<h5>${alert}</h5>
		<hr>

		<div>
			<button formaction="/Assignment_Java4/user/create">create</button>
			<button formaction="/Assignment_Java4/user/update">update</button>
			<button formaction="/Assignment_Java4/user/delete">delete</button>
			<a href="/Assignment_Java4/reset">reset</a>
		</div>
	</form>

	<table border="1">
		<thead>
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>Fullname</th>
				<th>Email</th>
				<th>Role</th>
				<th>Function</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${Users}">
				<tr>
					<th>${user.username}</th>
					<th>${user.passwords}</th>
					<th>${user.fullname}</th>
					<th>${user.email}</th>
					<th>${user.admin?'Admin':'User'}</th>
					<th><a href="/Assignment_Java4/user/edit/id?id=${user.username}">edit</a></th>
				</tr>
			</c:forEach>

		</tbody>
	</table>


</body>
</html>