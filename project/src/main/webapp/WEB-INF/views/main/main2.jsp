<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<html lang="en">
<!-- Start Head -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Programming Community</title>

	<link rel="stylesheet" href=<c:url value="/resources/assets/css/style.min.css" /> />
	<link rel="stylesheet" href=<c:url value="/resources/assets/css/modules.css" /> />
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- <script type ="text/javascript">
        //비동기 통신
        $.ajax({
            beforeSend : function(jqXHR) {
                console.log(jqXHR);
                jqXHR.setRequestHeader("AJAX", true);
            },
            contentType : "application/json",
            type:"GET",
            url:"/board/list",
            data: "json",
            success : function(data) {
            	console.log(data);
            },
            error : function(jqXHR) {
                if (jqXHR.status == 401) {
                    //alert("401");
                } else if (jqXHR.status == 403) {
                    alert("error");
                    location.replace('../loginforms');
                } else {
                    alert("예외가 발생했습니다. 관리자에게 문의하세요.");
                }
            }
        });

     
	</script> -->
</head>
<body class="default">
<div id="main">
	<div class="thumbnails" id="thumb">
<%-- <c:forEach items="${list}" var="board">
	<div class="box">
		<div class="inner">
			<div class="writer">${board.writer}</div>
			<div class="date"><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}"/></div>
			<div class="content"><textarea cols="30" rows="4">${board.content}</textarea></div>
			<div>
				<div class="good"></div>
				<div class="comment">
				 <button type="button">comment</button>
				 </div>
			</div>
		</div>
	</div>
</c:forEach> --%>
</div>
</div>
</body>
</html>

<%@ include file="../include/footer.jsp"%>
			