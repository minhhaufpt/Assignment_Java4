<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video</title>
</head>
<body>
	<h2>Bài 2</h2>
	<form method="post">
		<div>
			<input placeholder="Username" type="text" name="username" value="">
			<button formaction="/Assignment_Java4/find_user">sreach</button>
		</div>
		<h5>${alert}</h5>
	</form>

	<div>
		<p>Fullname : ${user.fullname}</p>
		<p>Email : ${user.email}</p>
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="favorite" items="${favorites}">
				<tr>
					<th>${favorite.video.id}</th>
					<th>${favorite.video.title}</th>
					<th>${favorite.video.views}</th>
					<th>${favorite.video.active}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<hr>
	<form method="post">
		<div>
			<input placeholder="Title" type="text" name="title" value="">
			<button formaction="/Assignment_Java4/find_title">sreach</button>
		</div>
		<h5>${alert2}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videos}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<hr>
	<form method="post">
		<div>
			<input placeholder="Video_ID" type="number" name="videoid" value="">
			<button formaction="/Assignment_Java4/find_videoid">sreach</button>
		</div>
		<h5>${alert3}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Username</th>
				<th>Fullname</th>
				<th>Email</th>
				<th>Role</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<th>${user.username}</th>
					<th>${user.fullname}</th>
					<th>${user.email}</th>
					<th>${user.admin}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<hr>
	<form method="post" action="/Assignment_Java4/find_videolike">
		<div>
			<input type="radio" name="favorite" value="true"> Favorite <input
				type="radio" name="favorite" value="false"> Not favorite
			<button type="submit">Sreach</button>
		</div>
		<h5>${alert4}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active?</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videosLike}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<hr>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Favorite Count</th>
				<th>Newest Date</th>
				<th>Oldest Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${Report}">
				<tr>
					<th>${video.group}</th>
					<th>${video.likes}</th>
					<th><fmt:formatDate pattern = "HH:mm:ss dd/MM/yyyy" value = "${video.newest}"/></th>
					<th><fmt:formatDate pattern = "HH:mm:ss dd/MM/yyyy" value = "${video.oldest}"/></th>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<h2>Bài 3</h2>

	<form method="post">
		<div>
			<input placeholder="keyword" type="text" name="keyword" value="">
			<button formaction="/Assignment_Java4/find_keyvideo">sreach</button>
		</div>
		<h5>${alert7}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${keyvideos}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<hr>
	<form method="post">
		<div>
			<input placeholder="Username" type="text" name="keyuser" value="">
			<button formaction="/Assignment_Java4/find_keyuser">sreach</button>
		</div>
		<h5>${alert7}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videoByUser}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>


	<hr>
	<form method="post">
		<div>
			<input placeholder="Form Date" type="date" name="formdate" value="">
			<input placeholder="To Date" type="date" name="todate" value="">
			<button formaction="/Assignment_Java4/find_forDate">sreach</button>
		</div>
		<h5>${alert7}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videoByForDate}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<hr>
	<form method="post">
		<div>
			<input placeholder="" type="checkbox" name="month" value="1">
			1 <input placeholder="" type="checkbox" name="month" value="2">
			2 <input placeholder="" type="checkbox" name="month" value="3">
			3 <input placeholder="" type="checkbox" name="month" value="4">
			4 <input placeholder="" type="checkbox" name="month" value="5">
			5 <input placeholder="" type="checkbox" name="month" value="6">
			6 <input placeholder="" type="checkbox" name="month" value="7">
			7 <input placeholder="" type="checkbox" name="month" value="8">
			8 <input placeholder="" type="checkbox" name="month" value="9">
			9 <input placeholder="" type="checkbox" name="month" value="10">
			10 <input placeholder="" type="checkbox" name="month" value="11">
			11 <input placeholder="" type="checkbox" name="month" value="12">
			12 <br>
			<button formaction="/Assignment_Java4/find_month">sreach</button>
		</div>
		<h5>${alert7}</h5>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videoByMonth}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<h2>Bài 4</h2>

	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Views</th>
				<th>Active</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${listramdom}">
				<tr>
					<th>${video.id}</th>
					<th>${video.title}</th>
					<th>${video.views}</th>
					<th>${video.active}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<hr>
	<form method="post">
		<select name="year">
			<option value="2021">2021</option>
			<option value="2022">2022</option>
			<option value="2023">2023</option>
			<option value="2024">2024</option>
		</select>
		<button formaction="/Assignment_Java4/report_year">sreach</button>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>Id</th>
				<th>Favorite Count</th>
				<th>Newest Date</th>
				<th>Oldest Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${ReportYear}">
				<tr>
					<th>${video.group}</th>
					<th>${video.likes}</th>				
					<th><fmt:formatDate pattern = "HH:mm:ss dd/MM/yyyy" value = "${video.newest}"/></th>
					<th><fmt:formatDate pattern = "HH:mm:ss dd/MM/yyyy" value = "${video.oldest}"/></th>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</body>
</html>