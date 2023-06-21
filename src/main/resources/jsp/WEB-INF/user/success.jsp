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
a{color:inherit;text-decoration:none}

img {
	width: 50px;
}
body {
	text-align: center;
	color:white;
	background-color: #3C5087;
}
</style>
</head>
<body>
<section class="container">
<form action="/user/login" method="post">
<h1>환영합니다!</h1><br>
<h2>회원가입을 축하합니다.<br>당신의 아이디는 ${user.id} 입니다.</h2>
<hr>
<h1><a href="/">Home<img src="/img/click.png"></a></h1>
<h1><a href="/user/login">로그인 하러가기<img src="/img/click.png"></a></h1>
</form>
</section>
</body>
</html>