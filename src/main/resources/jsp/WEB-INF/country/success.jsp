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
<h1>Country Successful 성공</h1>
<hr>
<button type="button" class="btn"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn"><a href="/country/page/1/10" style="color: white">Page</a></button>
<hr>
<c:choose>
	<c:when test="${param.create ne null}"><h1>국가 추가 성공</h1></c:when>
	<c:when test="${param.update ne null}"><h1>국가 수정 성공</h1></c:when>
	<c:when test="${param.delete ne null}"><h1>국가 삭제 성공</h1></c:when>
	<c:otherwise></c:otherwise>
</c:choose>

<hr>
<section class="container">
	<table class="table">
		<tbody>
				<tr><th>code</th>           <td>${country.code}</td></tr>             
				<tr><th>name</th>           <td>${country.name}</td></tr>             
				<tr><th>continent</th>      <td>${country.continent}</td></tr> 
				<tr><th>region</th>         <td>${country.region}</td></tr>           
				<tr><th>surfaceArea</th>    <td>${country.surfaceArea}</td></tr>      
				<tr><th>indepYear</th>      <td>${country.indepYear}</td></tr>        
				<tr><th>population</th>     <td>${country.population}</td></tr>       
				<tr><th>lifeExpectancy</th> <td>${country.lifeExpectancy}</td></tr>   
				<tr><th>gnp</th>            <td>${country.gnp}</td></tr>              
				<tr><th>gnpOld</th>         <td>${country.gnpOld}</td></tr>           
				<tr><th>localName</th>      <td>${country.localName}</td></tr>        
				<tr><th>governmentForm</th> <td>${country.governmentForm}</td></tr>   
				<tr><th>headOfState</th>    <td>${country.headOfState}</td></tr>      
				<tr><th>capital</th>        <td>${country.capital}</td></tr>          
				<tr><th>code2</th>          <td>${country.code2}</td></tr> 
		</tbody>
	</table>
	<hr>
</section>
</body>
</html>