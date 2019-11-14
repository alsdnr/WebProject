<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>logout</title>
</head>
<body>
<form action="/logout" method='post'>
<h2>로그아웃</h2>
<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
</form>
</body>
</html>