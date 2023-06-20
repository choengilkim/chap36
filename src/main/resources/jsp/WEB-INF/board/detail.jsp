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
button {
    position: static;
    top:50%;
    background-color:#4B0082 !important;
}
a {
  text-decoration-line: none;
}
</style>
</head>
<body>
<h1>게시판 정보</h1>
<button type="button" class="btn"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn"><a href="/board/page/${param.pageNum}/${param.pageSize}" style="color: white">게시판 Page</a></button>
<hr>
<section class="container">
	<table class="table">
		<tbody>
				<tr><th>게시물 번호</th> 		<td>${board.bno}</td></tr>
				<tr><th>제목</th> 		<td>${board.title}</td></tr>
				<tr><th>내용</th><td>${board.content}</td></tr>
				<tr><th>작성자</th> 	<td>${board.writer}</td></tr>
				<tr><th>날짜</th> <td>${board.regdate}</td></tr>
				<tr><th>조회수</th> <td>${board.viewcnt}</td></tr>
		</tbody>
	</table>
	<hr>
	<sec:authorize access="hasRole('ADMIN')">
	<menu class="btn-group">
		<a href="/board/create" 				 class="btn btn-primary">추가</a>
		<a href="/board/update?bno=${board.bno}" class="btn btn-secondary">수정</a>
		<a href="/board/delete?bno=${board.bno}" class="btn btn-danger">삭제</a>
	</menu>
	</sec:authorize>
<!-- 	<hr> -->
<!-- 	<ul> -->
<!-- 		<li><a href="/city/create"				>/city/create</a></li> -->
<%-- 		<li><a href="/city/update?id=${city.id}">/city/update?id=${city.id}</a></li> --%>
<%-- 		<li><a href="/city/delete?id=${city.id}">/city/delete?id=${city.id}</a></li> --%>
<!-- 	</ul> -->
</section>

</body>
</html>