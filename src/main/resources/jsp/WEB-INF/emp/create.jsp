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
</head>
<body>
<h1>Emp Create 직원 추가</h1>
<hr>
<button type="button" class="btn btn-secondary"><a href="/" style="color: white; text-decoration: none;">Home</a></button>
<hr>
<button type="button" class="btn btn-secondary"><a href="/emp/list" style="color: white; text-decoration: none;">List</a></button>
<hr>
<section class="container">
 	<form action="/emp/create" method="post">  <!--form은 디폴트가 get방식이라 url에 정보가 담김-->
		<div class="mb-3">
			<label class="form-lable mb-2" for="empno">empno<span>*</span></label>
			<input class="form-control"    id="empno" name="empno" 		placeholder="직원번호를 입력하세요" value="${emp.empno}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="ename">ename<span>*</span></label>
			<input class="form-control"    id="ename" name="ename"   	 placeholder="직원이름을 입력하세요" value="${emp.ename}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="gender">gender</label><br>
			<label><input type="radio" name="gender" value="M" checked> M &nbsp;</label>
			<label><input type="radio" name="gender" value="F" checked> F</label>
<%-- 			<input class="form-control"    id="gender" name="gender" 	 placeholder="성별을 입력하세요" value="${emp.gender}"/> --%>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="job">job</label>
			<input class="form-control"    id="job" name="job" 		 	 placeholder="직업을 입력하세요" value="${emp.job}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="mgr">mgr</label>
			<input class="form-control"    id="mgr" name="mgr" 			 placeholder="직속상사번호를 입력하세요" value="${emp.mgr}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="hiredate">hiredate</label>
			<input class="form-control"    id="hiredate" name="hiredate" placeholder="입사일자를 입력하세요" value="${emp.hiredate}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="sal">sal</label>
			<input class="form-control"    id="sal" name="sal" 		 	 placeholder="급여를 입력하세요" value="${emp.sal}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="comm">comm</label>
			<input class="form-control"    id="sal" name="comm" 		 placeholder="커미션을 입력하세요" value="${emp.comm}"/>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="deptno">deptno</label>
			<input class="form-control"    id="deptno" name="deptno" 	 placeholder="부서번호를 입력하세요" value="${emp.deptno}"/>
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