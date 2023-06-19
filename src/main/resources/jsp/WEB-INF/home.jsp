<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Londrina+Shadow&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<title>home.jsp</title>
<style type="text/css">
a.button {
  display: block;
  position: relative;
  float: left;
  width: 120px;
  padding: 0;
  margin: 10px 20px 10px 0;
  font-weight: 600;
  text-align: center;
  line-height: 50px;
  color: #FFF;
  border-radius: 5px;
  transition: all 0.2s ;
}
.btnPush:hover {
  margin-top: 15px;
  margin-bottom: 5px;
}
.btnOrange {
  background: #FFAA40;
}
.btnOrange.btnPush {
  box-shadow: 0px 5px 0px 0px #A66615;
}
.btnOrange.btnPush:hover {
  box-shadow: 0px 0px 0px 0px #A66615;
}
.btnPurple {
  background: #A74982;
}
.btnPurple.btnPush {
  box-shadow: 0px 5px 0px 0px #6D184B;
}
.btnPurple.btnPush:hover {
  box-shadow: 0px 0px 0px 0px #6D184B;
}

.six h1 {
    text-align: center;
    color:#222; font-size:50px; font-weight:400;
    word-spacing: 1px; letter-spacing:2px; color:#c50000;
}
.six h1 span {
    line-height:2em; padding-bottom:15px;
    text-transform: none;
    font-size:.7em;
    font-weight: normal;
    font-family: 'Londrina Shadow', cursive;
    color:#999; letter-spacing:-0.005em; word-spacing:1px;
    letter-spacing:none;
}
.div1 {
	display: flex;
	align-items: center;
	margin-left:auto; 
    margin-right:auto;
	width: 50%;
	font-size: 30px;
}
.div1 div {
	margin-left: 20%;
}
.div2 img {
	width: 100%;
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-left:40px;
    margin-top: 65px;
}
h3 {
	margin-left: 43%;
}
h5 {
	float: right;
	margin-right: 70px;
}
</style>
</head>
<body>
<div class="six">
  <h1>HOME PAGE<br>
    <span>Portfolio Projects</span>
  </h1>
</div>
<h5>  
<sec:authorize access="isAuthenticated()">
<sec:authentication property="name"/>님 환영합니다! <a href="/user/logout" style="text-decoration: none;"> &nbsp로그아웃</a>
</sec:authorize>
</h5><br>
<h5>
	<sec:authorize access="isAnonymous()">
	<a href="/user/login" style="text-decoration: none;">login &nbsp</a>|
	<a href="/user/login" style="text-decoration: none;">&nbsp회원가입</a>
	</sec:authorize>
</h5><br>
<hr>
    <h3>마우스를 올려보세요.</h3>
	<div class="div1">
		<div class="dropdown">
			<div class="container">
    			<a title="Button push purple" class="button btnPush btnPurple" style="text-decoration: none;">List</a>
  			</div>
		  	<ul class="dropdown-menu">
		    	<li><a class="dropdown-item" href="/dept/list">dept</a></li>
		   	 	<li><a class="dropdown-item" href="/emp/list">emp</a></li>
		   	 	<li><a class="dropdown-item" href="/salgrade/list">salgrade</a></li>
		  	</ul>
		</div>
		
		<div class="dropdown">
			<div class="container">
		  		<a title="Button push orange" class="button btnPush btnOrange" style="text-decoration: none;">Page</a>
		 	</div> 
		  	<ul class="dropdown-menu">
		    	<li><a class="dropdown-item" href="/city/page/1/10">city</a></li>
		    	<li><a class="dropdown-item" href="/country/page/1/10">country</a></li>
		    	<li><a class="dropdown-item" href="/language/page/1/10">language</a></li>
		 	 </ul>
		</div>		
	</div>
	
		
<div class="div2"><img src="img/homebackground.jpg"></div>

<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/dept/list"	>/dept/list</a></li> -->
<!-- 	<li><a href="/emp/list"		>/emp/list</a></li> -->
<!-- 	<li><a href="/salgrade/list">/salgrade/list</a></li> -->
<!-- </ul> -->
<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/dept/detail/10"	  >/dept/detail/10</a></li> -->
<!-- 	<li><a href="/emp/detail/1001"	  >/emp/detail/1001</a></li> -->
<!-- 	<li><a href="/salgrade/detail/1"  >/salgrade/detail/1</a></li> -->
<!-- </ul> -->
<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/dept/create"	  >/dept/create</a></li> -->
<!-- 	<li><a href="/emp/create"	  >/emp/create</a></li> -->
<!-- 	<li><a href="/salgrade/create">/salgrade/create</a></li> -->
<!-- </ul> -->
<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/dept/update?deptno=10"  	   >/dept/update?deptno=10</a></li> -->
<!-- 	<li><a href="/emp/update?empno=1001"	   >/emp/update?empno=1001</a></li> -->
<!-- 	<li><a href="/salgrade/update?grade=1"	   >/salgrade/update?grade=1</a></li> -->
<!-- </ul> -->
<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/dept/delete?deptno=10"  	>/dept/delete?deptno=10</a></li> -->
<!-- 	<li><a href="/emp/delete?empno=1001"	>/emp/delete?empno=1001</a></li> -->
<!-- 	<li><a href="/salgrade/delete?grade=1"	>/salgrade/delete?grade=1</a></li> -->
<!-- </ul> -->
<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/city/list">/city/list</a></li> -->
<!-- 	<li><a href="/city/page/1/10">/city/page</a></li> -->
<!-- 	<li><a href="/country/list">/country/list</a></li> -->
<!-- 	<li><a href="/country/page/1/10">/country/page</a></li> -->
<!-- 	<li><a href="/language/list">/language/list</a></li> -->
<!-- 	<li><a href="/language/page/1/10">/language/page</a></li> -->
<!-- </ul> -->
<!-- <hr> -->
<!-- <ul> -->
<!-- 	<li><a href="/city/create">/city/create</a></li> -->
<!-- 	<li><a href="/city/update?id=2331">/city/update?id=2331</a></li> -->
<!-- 	<li><a href="/city/delete?id=2331">/city/delete?id=2331</a></li> -->
<!-- </ul> -->
</body>
</html>