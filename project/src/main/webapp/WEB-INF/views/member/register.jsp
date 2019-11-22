<%@ page language="java" contentType= " text/html; charset=UTF-8 "
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<br/><br/><br/>
<div class="container">
  <h2>회원가입</h2>
  <form role="form" action="/member/register" method="post">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
    </div>
    <div>
      <label for="">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
    </div>
    <div>
      <label for="">Nickname:</label>
      <input type="text" class="form-control" id="nickName" placeholder="Enter NickName" name="nickName">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
  </form>
</div>
