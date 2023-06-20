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
</head>
<body>
<h1>Salgrade Delete 급여등급 삭제</h1>
<hr>
<button type="button" class="btn btn-primary"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn btn-primary"><a href="/salgrade/list" style="color: white">List</a></button>
<hr>
<section class="container">
 	<form action="/salgrade/delete" method="post">  <!--form은 디폴트가 get방식이라 url에 정보가 담김-->
		<div class="mb-3">
			<label class="form-lable mb-2" for="grade">grade<span>*</span></label>
			<input class="form-control"    id="grade" name="grade"   value="${salgrade.grade}" disabled="disabled"/>
			<input class="form-control"    id="grade" name="grade"   value="${salgrade.grade}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="losal">losal</label>
			<input class="form-control"    id="losal" name="losal"   value="${salgrade.losal}" disabled="disabled"/>
			<input class="form-control"    id="losal" name="losal"   value="${salgrade.losal}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="hisal">hisal</label>
			<input class="form-control"    id="hisal" name="hisal" 	 value="${salgrade.hisal}" disabled="disabled"/>
			<input class="form-control"    id="hisal" name="hisal"   value="${salgrade.hisal}" type="hidden"/>
		</div>
		<button type="submit" class="btn btn-primary">삭제</button>
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