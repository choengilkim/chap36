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
<title>create.jsp</title>
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
<h1>Language Create 국가언어 추가</h1>
<hr>
<button type="button" class="btn"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn"><a href="/language/page/1/10" style="color: white">Page</a></button>
<hr>
<section class="container">
 	<form action="/language/create" method="post">  <!--form은 디폴트가 get방식이라 url에 정보가 담김-->
		<div class="mb-3">
			<label class="form-lable mb-2" for="countryCode">countryCode<span>*</span></label>
			<input class="form-control"    id="countryCode" name="countryCode" 		placeholder="국가코드를 입력하세요" value="${language.countryCode}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="language">language<span>*</span></label>
			<input class="form-control"    id="language" name="language"   			placeholder="언어를 입력하세요" value="${langage.language}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="isOfficial">isOfficial</label><br>
			<label><input type="radio" name="isOfficial" value="T" checked> T &nbsp;</label>
			<label><input type="radio" name="isOfficial" value="F" checked> F</label>
<%-- 			<input class="form-control"    id="isOfficial" name="isOfficial" 		placeholder="공식적으로 사용되는 언어인지(참,거짓)" value="${langage.isOfficial}"/> --%>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="percentage">percentage</label>
			<input class="form-control"    id="percentage" name="percentage" 		placeholder="백분율을 입력하세요" value="${langage.percentage}"/>
		</div>
		<button type="submit" class="btn btn-primary">추가</button>
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