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

<title>detail.jsp</title>
</head>
<body>
<h1>language Detail 국가언어 정보</h1>
<hr>
<a href="/">Home</a>
<hr>
<a href="/language/list">/language/list</a>
<hr>
<section class="container">
	<table class="table">
		<tbody>
			<tr><th>countryCode</th>  <td>${language.countryCode}</td></tr>
			<tr><th>language</th> 	  <td>${language.language}</td></tr>
			<tr><th>isOfficial</th>   <td>${language.isOfficial}</td></tr>
			<tr><th>percentage</th>   <td>${language.percentage}</td></tr>
		</tbody>
	</table>
	<hr>
	<sec:authorize access="hasRole('ADMIN')">
	<menu class="btn-group">
		<a href="/language/create" class="btn btn-primary">추가</a>
		<a href="/language/update?countryCode=${language.countryCode}&language=${language.language}" class="btn btn-secondary">수정</a>
		<a href="/language/delete?countryCode=${language.countryCode}&language=${language.language}" class="btn btn-danger">삭제</a>
	</menu>
	</sec:authorize>
	<hr>
	<ul>
		<li><a href="/language/create">/language/create</a></li>
		<li><a href="/language/update?countryCode=${language.countryCode}&language=${language.language}">/language/update?countryCode=${language.countryCode}&language=${language.language}</a></li>
		<li><a href="/language/delete?countryCode=${language.countryCode}&language=${language.language}">/language/delete?countryCode=${language.countryCode}&language=${language.language}</a></li>
	</ul>
</section>
</body>
</html>