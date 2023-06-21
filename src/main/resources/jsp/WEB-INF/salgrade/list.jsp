<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "icon" href="favicon.png">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>

<title>list.jsp</title>
</head>
<body>
<h1>Salgrade List <button type="button" class="btn btn-danger">${list.size()}</button></h1>
<br>
<button type="button" class="btn btn-warning"><a href="/" style="color: black; text-decoration: none;">Home</a></button>
<hr>
<section class="container">
	<table class="table table-warning table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>grade</th>
				<th>losal</th>
				<th>hisal</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.grade}</td>
				<td><b><a style="color: red" href="/salgrade/detail/${e.grade}">${e.losal}</a></b></td>
				<td>${e.hisal}</td>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>

</body>
</html>