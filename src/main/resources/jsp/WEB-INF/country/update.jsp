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
<title>update.jsp</title>
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
<h1>Country Update 국가 수정</h1>
<hr>
<button type="button" class="btn"><a href="/" style="color: white">Home</a></button>
<hr>
<button type="button" class="btn"><a href="/country/page/1/10" style="color: white">Page</a></button>
<hr>
<section class="container">
 	<form action="/country/update" method="post">  <!--form은 디폴트가 get방식이라 url에 정보가 담김-->
		<div class="mb-3">
			<label class="form-lable mb-2" for="code">code<span>(필수입력*)</span></label>
			<input class="form-control"    id="code" name="code" 				 value="${country.code}" disabled="disabled"/>
			<input class="form-control"    id="code" name="code" 				 value="${country.code}" type="hidden"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="name">name<span>(필수입력*)</span></label>
			<input class="form-control"    id="name" name="name"   				 placeholder="국가이름을 입력하세요" value="${country.name}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="continent">continent</label><br>
			<label><input type="radio" name="continent" value="Asia"         ${country.continent == 'Asia' ? 'checked' : ''}>         Asia &nbsp;        </label>
			<label><input type="radio" name="continent" value="Europe"       ${country.continent == 'Europe' ? 'checked' : ''}>       Europe &nbsp;      </label>
			<label><input type="radio" name="continent" value="NorthAmerica" ${country.continent == 'NorthAmerica' ? 'checked' : ''}> NorthAmerica &nbsp;</label>
			<label><input type="radio" name="continent" value="Africa"       ${country.continent == 'Africa' ? 'checked' : ''}>       Africa &nbsp;      </label>
			<label><input type="radio" name="continent" value="Oceania"      ${country.continent == 'Oceania' ? 'checked' : ''}>      Oceania &nbsp;     </label>
			<label><input type="radio" name="continent" value="Antarctica"   ${country.continent == 'Antarctica' ? 'checked' : ''}>   Antarctica &nbsp;  </label>
			<label><input type="radio" name="continent" value="SouthAmerica" ${country.continent == 'SouthAmerica' ? 'checked' : ''}> SouthAmerica &nbsp;</label>
<%-- 			<input class="form-control"    id="continent" name="continent" 		 placeholder="대륙이름을 입력하세요" value="${country.continent}"/> --%>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="region">region</label>
			<input class="form-control"    id="region" name="region" 		 placeholder="지역을 입력하세요" value="${country.region}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="surfaceArea">surfaceArea</label>
			<input class="form-control"    id="surfaceArea" name="surfaceArea" 		 placeholder="면적을 입력하세요" value="${country.surfaceArea}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="indepYear">indepYear</label>
			<input class="form-control"    id="indepYear" name="indepYear" 		 placeholder="년도를 입력하세요" value="${country.indepYear}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="population">population</label>
			<input class="form-control"    id="population" name="population" 		 placeholder="인구를 입력하세요" value="${country.population}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="lifeExpectancy">lifeExpectancy</label>
			<input class="form-control"    id="lifeExpectancy" name="lifeExpectancy" 		 placeholder="기대수명을 입력하세요" value="${country.lifeExpectancy}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="gnp">gnp</label>
			<input class="form-control"    id="gnp" name="gnp" 		 placeholder="국민총소득을 입력하세요" value="${country.gnp}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="gnpOld">gnpOld</label>
			<input class="form-control"    id="gnpOld" name="gnpOld" 		 placeholder="옛날국민총소득을 입력하세요" value="${country.gnpOld}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="localName">localName</label>
			<input class="form-control"    id="localName" name="localName" 		 placeholder="지역이름을 입력하세요" value="${country.localName}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="governmentForm">governmentForm</label>
			<input class="form-control"    id="governmentForm" name="governmentForm" 		 placeholder="정부형태를 입력하세요" value="${country.governmentForm}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="headOfState">headOfState</label>
			<input class="form-control"    id="headOfState" name="headOfState" 		 placeholder="대통령이름을 입력하세요" value="${country.headOfState}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="capital">capital</label>
			<input class="form-control"    id="capital" name="capital" 		 placeholder="수도를 입력하세요" value="${country.capital}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="code2">code2</label>
			<input class="form-control"    id="code2" name="code2" 		 placeholder="코드(2자리)를 입력하세요" value="${country.code2}"/>
		</div>
		<button type="submit" class="btn btn-primary">수정</button>
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