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
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>login.jsp</title>
<style type="text/css">
body{
  margin:0;
  color:#6a6f8c;
  background:#c8c8c8;
  font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none;}

.login-wrap{
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:670px;
  position:relative;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;
  background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
  top:0;
  left:0;
  right:0;
  bottom:0;
  position:absolute;
  transform:rotateY(180deg);
  backface-visibility:hidden;
  transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
  display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
  text-transform:uppercase;
}
.login-html .tab{
  font-size:22px;
  margin-right:15px;
  padding-bottom:5px;
  margin:0 15px 10px 0;
  display:inline-block;
  border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
  color:#fff;
  border-color:#1161ee;
}
.login-form{
  min-height:345px;
  position:relative;
  perspective:1000px;
  transform-style:preserve-3d;
}
.login-form .group{
  margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
  width:100%;
  color:#fff;
  display:block;
}
.login-form .group .input,
.login-form .group .button{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
  text-security:circle;
  -webkit-text-security:circle;
}
.login-form .group .label{
  color:#aaa;
  font-size:12px;
}
.login-form .group .button{
  background:#1161ee;
}
.login-form .group label .icon{
  width:15px;
  height:15px;
  border-radius:2px;
  position:relative;
  display:inline-block;
  background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
  content:'';
  width:10px;
  height:2px;
  background:#fff;
  position:absolute;
  transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
  left:3px;
  width:5px;
  bottom:6px;
  transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
  top:6px;
  right:0;
  transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
  color:#fff;
}
.login-form .group .check:checked + label .icon{
  background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
  transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
  transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
  transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
  transform:rotate(0);
}

.hr{
  height:2px;
  margin:60px 0 50px 0;
  background:rgba(255,255,255,.2);
}
.foot-lnk{
  text-align:center;
}
.checkId {
	border:none;
	border-radius: 25px;
	background:rgba(255,255,255,.1);
	margin-left: 10px;
	color: white;
}
</style>

</head>
<body>
<h1><a href="/">Home</a></h1>
<hr>
<div class="login-wrap">
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
    <div class="login-form">
      <div class="sign-in-htm">
      <form action="/user/login" method="post">
        <div class="group">
          <label for="user" class="label">ID</label>
          <input id="user" name="username" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">Password</label>
          <input id="pass" name="password" type="password" class="input" data-type="password">
        </div>
        <div class="group">
          <input id="check" name="remember-me" type="checkbox" class="check" checked>
          <label for="check"><span class="icon"></span> 로그인 유지</label>
        </div>
        <div class="group">
          <input type="submit" class="button" value="로그인">
        </div>
        <c:if test="${exception ne null}">
 		<h5>${exception.message}</h5> 
 		</c:if>
        <div class="hr"></div>
        <div class="foot-lnk">
          <a href="#forgot">Forgot Password?</a>
        </div>
      </form>
      </div>
      
      <div class="sign-up-htm">
      <form action="/user/register" method="post">
        <div class="group">
		  <label for="id" class="label">ID</label><br>
		  <input id="id" type="text" class="input" value="${user.id}"/>
		  <button type="button" id ="checkIdButton">Check Duplication</button>
		  <span id="idStatus"></span>
		</div>
        <div class="group">
          <label for="password" class="label">Password</label>
          <input id="password" name="password" type="password" class="input" data-type="password" value="${user.password}" />
        </div>
        <div class="group">
          <label for="email" class="label">Email 주소</label>
          <input id="email" name="email" type="text" class="input" value="${user.email}" />
        </div>
        <div class="group">
          <input type="submit" class="button" value="회원 가입">
        </div>
<%--         <c:if test="${binding.hasErrors()}"> --%>
<%-- 		<c:forEach var="g" items="${binding.globalErrors}"> --%>
<%-- 			<div>${g.code} ${g.defaultMessage}</div>	 --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:forEach var="f" items="${binding.fieldErrors}"> --%>
<%-- 			<div>${f.field} ${f.defaultMessage}</div>	 --%>
<%-- 		</c:forEach> --%>
<%-- 		</c:if> --%>
        <div class="hr"></div>
        </form>
      </div>
    </div>
  </div>
</div>
<%-- <section class="container"> --%>
<!-- 	<form action="/user/login" method="post"> -->
<%-- 		<input class="form-control" name="username" value="${param.username}"/> --%>
<!-- 		<hr> -->
<%-- 		<input class="form-control" name="password" type="password" value="${param.password}"/> --%>
<!-- 		<hr> -->
<!-- 		<input name="remember-me" type="checkbox" checked="checked"> Remember me -->
<!-- 		<hr> -->
<!-- 		<input class="btn btn-primary" type="submit"/> -->
<!-- 	</form> -->
<%-- </section> --%>
<!-- <hr> -->
<%-- <c:if test="${exception ne null}"> --%>
<%-- 	<h1>${exception.message}</h1> --%>
<%-- </c:if> --%>
<script type="text/javascript">
$(document).ready(function() {
	  var idInput = $("#id");
	 
	  $("#checkIdButton").click(function() {
	    var id = idInput.val();
	    
	    $.ajax({
	      url: "/user/checkId",
	      type: "POST",
	      data: { id:id },
	      success: function(response) {
	        if (response === 1) {
 	          alert("이미 사용중인 ID입니다.");
	          idInput.val(""); 
	        } else {
 	            alert("사용가능한 ID입니다.");
	          }
	        }
	      });
	    });
	});
</script>
</body>
</html>