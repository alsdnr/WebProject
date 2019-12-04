<%@ page language="java" contentType= "text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%@include file="../include/header.jsp"%> --%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 정보</h1>
	</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/member/memberInfo" method="post">
					<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />	
					<div class="form-group">
						<label>Email</label> <input class="form-control" name='email'
						value='<c:out value="${member.email }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Name</label> <input class="form-control" name='name'
						value='<c:out value="${member.name }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>NickName</label> <input class="form-control" name='nickName'
						value='<c:out value="${member.nickName }"/>' readonly="readonly">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%-- <%@include file="../include/footer.jsp"%> --%>