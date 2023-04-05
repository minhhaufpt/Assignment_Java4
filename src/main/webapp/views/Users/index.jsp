<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div style="width: 54rem;">
		<c:forEach var="video" items="${videos}" begin="1" end="6">
			<jsp:include page="items.jsp">
				<jsp:param
					value="${video.poster}"
					name="poster" />
				<jsp:param value="${video.title}" name="title" />
			</jsp:include>
		</c:forEach>
		<br>
		<div class="text-center">
			<button class="btn btn-success m-3">First</button>
			<button class="btn btn-success m-3">Last</button>
			<button class="btn btn-success m-3">Next</button>
			<button class="btn btn-success m-3">End</button>
		</div>
	</div>


</body>
</html>