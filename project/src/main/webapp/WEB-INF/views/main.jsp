<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Programming Community</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href=<c:url value="/resources/assets/css/main.css" /> />
	</head>
	<body class="is-preload">
			<h2><c:out value="${error}"/></h2>
			<h2><c:out value="${logout}"/></h2>
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">
				<!-- Header -->
					<header id="header">
						<h1>Programming Community</h1>
							<nav>
						   	<div>
						   	<form method="post" action="/login">
						      <label for="uname"><b>Email</b></label>
						      <input type="text" style ="color:#424242" placeholder="Enter Email" name="email">
						      <label for="psw"><b>Password</b></label>
						      <input type="password" style ="color:#424242" placeholder="Enter Password" name="pw">
						      <button type="submit">Login</button></br>
						      <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
						    </form>
							<a href="${pageContext.request.contextPath}/member/register">Sign Up</a>	
         					 </div>
						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						<span class="copyright">&copy; 2019 company </span>
					</footer>

			</div>
		</div>
		<script>
			window.onload = function() { document.body.classList.remove('is-preload'); }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>