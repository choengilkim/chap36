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
<h1>Dept Detail 부서 정보</h1>
<hr>
<button type="button" class="btn btn-dark"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn btn-secondary"><a href="/dept/list" style="color: white">list</a></button>
<hr>
<section class="container">
	<table class="table table-responsive">
		<tbody>
			<tr><th>deptno</th><td>${dept.deptno}</td></tr>
			<tr><th>dname</th> <td>${dept.dname}</td></tr>
			<tr><th>loc</th>   <td>${dept.loc}</td></tr>
		</tbody>
	</table>
	<sec:authorize access="hasRole('ADMIN')">
	<menu class="btn-group">
		<a href="/dept/create" class="btn btn-outline-info">추가</a>
		<a href="/dept/update?deptno=${dept.deptno}" class="btn btn-outline-warning">수정</a>
		<a href="/dept/delete?deptno=${dept.deptno}" class="btn btn-outline-danger">삭제</a>
	</menu>
	</sec:authorize>
<!-- 	<hr> -->
<!-- 	<ul> -->
<!-- 		<li><a href="/dept/create">/dept/create</a></li> -->
<%-- 		<li><a href="/dept/update?deptno=${dept.deptno}">/dept/update?deptno=${dept.deptno}</a></li> --%>
<%-- 		<li><a href="/dept/delete?deptno=${dept.deptno}">/dept/delete?deptno=${dept.deptno}</a></li> --%>
<!-- 	</ul> -->
</section>
</body>
</html>