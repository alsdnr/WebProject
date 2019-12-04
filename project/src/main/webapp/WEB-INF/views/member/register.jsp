<%@ page language="java" contentType= " text/html; charset=UTF-8 "
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script language="javascript">
   function registerCheck() {
       var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       // 이메일이 적합한지 검사할 정규식

       var email = document.getElementById("email");
       var pw = document.getElementById("pw");
       var rpw = document.getElementById("rpw");
       var name = document.getElementById("name");
       var nickName = document.getElementById("nickName");

       // ------------ 이메일 까지 -----------

       if(email.value=="") {
           alert("이메일을 입력해 주세요");
           email.focus();
           return false;
       }

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }
       
       if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }

       if(pw.value != rpw.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           pw.value = "";
           rpw.focus();
           return false;
       }


       if(name.value=="") {
           alert("이름을 입력해 주세요");
           name.focus();
           return false;
       }
       
       if(nickName.value=="") {
           alert("닉네임을 입력해 주세요");
           nickName.focus();
           return false;
       }
       
       alert("회원가입이 완료되었습니다.");
   }
   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       //return false;
   }
</script>
</head>
<body>
<br/><br/>
	<div class="container">
	  <h2>회원가입</h2>
	  <form role="form" onsubmit="return registerCheck();" action="/member/register" method="post">
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
	    </div>
	    <div class="form-group">
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
	    </div>
	    <div class="form-group">
	      <label for="rpwd">RePassword:</label>
	      <input type="password" class="form-control" id="rpw" placeholder="Enter password" name="rpw">
	    </div>
	    <div>
	      <label for="">Name:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
	    </div>
	    <div>
	      <label for="">Nickname:</label>
	      <input type="text" class="form-control" id="nickName" placeholder="Enter NickName" name="nickName">
	    </div>
	    <br/>
	    <button type="submit" class="btn btn-primary">Submit</button>
	    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
	  </form>
	</div>
</body>
</html>
