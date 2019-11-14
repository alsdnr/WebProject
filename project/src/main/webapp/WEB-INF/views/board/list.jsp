<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <link rel="stylesheet" href=<c:url value="/resources/assets/css/style.min.css" /> />
  <link rel="stylesheet" href=<c:url value="/resources/assets/css/modules.css" /> />
<title>List Page</title>
</head>
<body>
<div class="container">
  <h2>Basic Tablde</h2>
  <table class="table">
    <thead>
      <tr>
        <th>No</th>
        <th>title</th>
        <th>writer</th>
        <th>regdate</th>
      </tr>
    </thead>
    <tbody>
   		<c:forEach items="${list}" var="board">
			<tr>
				<td><c:out value="${board.idx}" /></td>
				<td><a class='move' href='<c:out value="${board.idx}"/>'><c:out value="${board.title}" /></a></td>
				<td><c:out value="${board.writer}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>
