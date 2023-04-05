<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card float-start" style="width: 18rem;">
		<img src="${param.poster}" class="card-img-top" alt="No found image">
		<div class="card-body">
			<h5 class="card-title">${param.title}</h5>
			<p class="card-text">Content</p>
			<a href="#" class="btn btn-primary" style="margin-right: 20px">Like</a>
			<a href="#" class="btn btn-info">Share</a>
		</div>
	</div>
</body>
</html>