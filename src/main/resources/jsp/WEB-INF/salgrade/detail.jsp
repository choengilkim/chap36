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
<style type="text/css">
table {
  border-collapse: separate;
  width: 100%;
  float: left;
  margin: 0 0 2em;
  border-top : 5px solid #4B0082 !important;
}
th {
  padding: 0.35em 0 .35em;
  font-weight: 400;
  text-align: left;
  font-size: 1.25em;
}
</style>
</head>
<body>
<h1>Salgrade Detail 급여등급 정보</h1>
<button type="button" class="btn btn-primary"><a href="/" style="color: white; text-decoration: none;">Home</a></button>
<hr>
<button type="button" class="btn btn-primary"><a href="/salgrade/list" style="color: white; text-decoration: none;">List</a></button>
<hr>
<section class="container">
	<table class="table">
		<tbody>
			<tr><th>grade</th><td>${salgrade.grade}</td></tr>
			<tr><th>losal</th> <td>${salgrade.losal}</td></tr>
			<tr><th>hisal</th>   <td>${salgrade.hisal}</td></tr>
		</tbody>
	</table>
	<hr>
	<sec:authorize access="hasRole('ADMIN')">
	<menu class="btn-group">
		<a href="/salgrade/create" class="btn btn-primary">추가</a>
		<a href="/salgrade/update?grade=${salgrade.grade}" class="btn btn-secondary">수정</a>
		<a href="/salgrade/delete?grade=${salgrade.grade}" class="btn btn-danger">삭제</a>
	</menu>
	</sec:authorize>
<!-- 	<hr> -->
<!-- 	<ul> -->
<!-- 		<li><a href="/salgrade/create">/salgrade/create</a></li> -->
<%-- 		<li><a href="/salgrade/update?grade=${salgrade.grade}">/salgrade/update?grade=${salgrade.grade}</a></li> --%>
<%-- 		<li><a href="/salgrade/delete?grade=${salgrade.grade}">/salgrade/delete?grade=${salgrade.grade}</a></li> --%>
<!-- 	</ul> -->
</section>
</body>
</html>