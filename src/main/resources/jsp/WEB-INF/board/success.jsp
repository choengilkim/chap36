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
<title>success.jsp</title>
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
<c:choose>
	<c:when test="${param.create ne null}"><h1>게시판 작성 성공</h1></c:when>
	<c:when test="${param.update ne null}"><h1>게시판 수정 성공</h1></c:when>
	<c:when test="${param.delete ne null}"><h1>게시판 삭제 성공</h1></c:when>
	<c:otherwise></c:otherwise>
</c:choose>
<hr>
<button type="button" class="btn"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn"><a href="/board/page/1/10" style="color: white">게시판 목록</a></button>
<hr>
<section class="container">
	<table class="table">
		<tbody>
				<tr><th>게시물 번호</th> <td>${board.bno}</td></tr>
				<tr><th>제목</th> 	  <td>${board.title}</td></tr>
				<tr><th>작성자</th> 	  <td>${board.writer}</td></tr>
				<tr><th>내용</th> 	  <td>${board.content}</td></tr>
		</tbody>
	</table>
	<hr>
</section>
</body>
</html>