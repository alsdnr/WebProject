<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<script type ="text/javascript">
        //비동기 통신
         $.ajax({
            contentType : "application/json",
            type:"GET",
            url:"/notice/list",
            dataType:"html",
            success : function(data) {
            	console.log(data);
            	var e = $(data).find("#nlist");
            	console.log(e);
            	$("#noticeList").html(e);
            }
        });
        
        $.ajax({
            contentType : "application/json",
            type:"GET",
            url:"/board/list",
            dataType:"html",
            success : function(data) {
            	console.log(data);
            	var e = $(data).find("#blist");
            	console.log(e);
            	$("#boardList").html(e);
            }
        });
        
        $.ajax({
            contentType : "application/json",
            type:"GET",
            url:"/column/list",
            dataType:"html",
            success : function(data) {
            	console.log(data);
            	var e = $(data).find("#clist");
            	console.log(e);
            	$("#columnList").html(e);
            }
        });
</script> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div id="main">
	<div class="mainBoard"><a href="${pageContext.request.contextPath}/notice/list">공지</a>
		<div id="noticeList"></div>
	</div>
	<div class="mainBoard"><a href="${pageContext.request.contextPath}/board/list">게시판</a>
		<div id="boardList"></div>
	</div>
	<div class="mainBoard"><a href="${pageContext.request.contextPath}/column/list">칼럼</a>
		<div id="columnList"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
			