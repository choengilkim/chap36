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
<title>delete.jsp</title>
<style type="text/css">
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
<h1>게시물 삭제</h1>
<hr>
<button type="button" class="btn"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn"><a href="/board/page/1/10" style="color: white">게시판 목록</a></button>
<hr>
<section class="container">
 	<form action="/board/delete" method="post">  <!--form은 디폴트가 get방식이라 url에 정보가 담김-->
		<div class="mb-3">
			<label class="form-lable mb-2" for="bno">게시물 번호<span>*</span></label>
			<input class="form-control"    id="bno" name="bno" 				 	value="${board.bno}" disabled="disabled"/>
			<input class="form-control"    id="bno" name="bno" 				 	value="${board.bno}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="writer">작성자<span>*</span></label>
			<input class="form-control"    id="writer" name="writer" 			value="${board.writer}" disabled="disabled"/>
			<input class="form-control"    id="writer" name="writer" 			value="${board.writer}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="title">제목</label>
			<input class="form-control"    id="title" name="title"   			value="${board.title}" disabled="disabled"/>
			<input class="form-control"    id="title" name="title"   			value="${board.title}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="content">내용</label>
			<input class="form-control"    id="content" name="content" 		 	value="${board.content}" disabled="disabled"/>
			<input class="form-control"    id="content" name="content" 		 	value="${board.content}" type="hidden"/>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</section>
<hr>
<c:if test="${binding.hasErrors()}">
<h2>Error Massage</h2>
<hr>
<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>	
</c:forEach>
<hr>
<c:forEach var="f" items="${binding.fieldErrors}">
	<div>${f.field} ${f.defaultMessage}</div>	
</c:forEach>

</c:if>


</body>
</html>