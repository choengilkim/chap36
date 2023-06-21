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
<title>page.jsp</title>
<style>
button {
    position: static;
    top:50%;
    background-color:#4B0082 !important;
}
thead {
	background-color:#4B0082 !important;
	color: white;
}
.button {
	position: static;
	margin-left: 1230px;
}

ul{
   list-style:none;
   margin-left: auto;
   margin-right: auto;
}

</style>
</head>
<body>
<h1>게시판</h1>
<hr>
<button type="button" class="btn"><a href="/" style="color: white; text-decoration: none;">Home</a></button>
<hr>
<section class="container">
<table class="table table-striped table-bordered table-hover">
		<thead align="center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.bno}</td>
				<td><a style="color: blue" href="/board/detail/${e.bno}?pageNum=${paging.pageNum}&pageSize=${paging.pageSize}">${e.title}</a></td>
				<td>${e.writer}</td>
				<td>${e.regdate}</td>
				<td>${e.viewcnt}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<ul class="list-group list-group-horizontal">
		<li><a href="/board/page/${paging.navigateFirstPage-1}/${paging.pageSize}" class="list-group-item">Previous</a></li>
	<c:forEach var="n" items="${paging.navigatepageNums}">
		<c:choose>
			<c:when test="${n eq paging.pageNum}">
				<li class="list-group-item active"><a href="/board/page/${n}/${paging.pageSize}" class="text-danger">${n}</a></li>
			</c:when>
			<c:when test="${n ne paging.pageNum}">
				<li class="list-group-item 		 "><a href="/board/page/${n}/${paging.pageSize}">${n}</a></li>
			</c:when>
		</c:choose>
	</c:forEach>
		<li><a href="/board/page/${paging.navigateLastPage+1}/${paging.pageSize}" class="list-group-item">Next</a></li>
	</ul>
<button type="button" class="button"><a href="/board/create" style="color: white; text-decoration: none;">글작성</a></button>
</section>
<!-- <table border="1" width="600px"> -->
<!--     <tr> -->
<!--         <th>번호</th> -->
<!--         <th>제목</th> -->
<!--         <th>이름</th> -->
<!--         <th>날짜</th> -->
<!--         <th>조회수</th> -->
<!--     </tr> -->
<!--     forEach var="개별데이터" items="집합데이터" -->
<%-- <c:forEach var="row" items="${map.list}"> <!-- 컨트롤러에서 map안에 list를 넣었기 때문에 이렇게 받는다. --> --%>
<!--     <tr> -->
<%--         <td>${row.bno}</td> //글 번호 --%>
<%--         <td>${row.title}</td> //글 제목 --%>
<%--         <td>${row.writer}</td> // 작성자 이름 --%>
<%--         <td><fmt:formatDate value = "{row.regdate}" --%>
<%--             pattern="yyyy-MM-dd HH:mm:ss"    /></td> //날짜의 출력형식을 변경 --%>
<%--         <td>${row.viewcnt}</td> //조회수 --%>
<!--     </tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->
</body>
</html>