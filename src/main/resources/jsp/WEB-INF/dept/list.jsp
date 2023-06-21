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
<h1>Dept List <button type="button" class="btn btn-secondary">${list.size()}</button></h1>
<hr>
<button type="button" class="btn btn-dark"><a href="/" style="color: white;text-decoration: none;">Home</a></button>
<hr>
<section class="container">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr class="table-dark">
				<th>deptno</th>
				<th>dname</th>
				<th>loc</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="e" items="${list}">
			<tr class="table-secondary">
				<td><fmt:formatNumber pattern="0000" value="${e.deptno}"/></td>
				<td><b><a style="color: gray" href="/dept/detail/${e.deptno}">${e.dname}</a></b></td>
				<td>${e.loc}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>
<!-- <hr> -->
<%-- <section class="container"> --%>
<!-- 	<table class="table table-striped table-bordered table-hover"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>deptno</th> -->
<!-- 				<th>dname</th> -->
<!-- 				<th>ename</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
<%-- 		<c:forEach var="e" items="${list}"> --%>
<!-- 			<tr> -->
<%-- 				<td>${e.deptno}</td> --%>
<%-- 				<td>${e.dname}</td> --%>
<%-- 				<td>${e.emps}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</tbody> -->
<!-- 	</table> -->
<%-- </section> --%>



</body>
</html>