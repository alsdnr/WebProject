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
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var result = '<c:out value="${result}"/>';
    checkModal(result);
    history.replaceState({}, null, null);
    
    function checkModal(result) {
if (result === '' || history.state) {
return;
}
if (parseInt(result) > 0) {
  $(".modal-body").html(
	"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
}
$("#myModal").modal("show");
}
    
$("#regBtn").on("click", function() {
self.location = "/board/register";
});

var actionForm = $("#actionForm");

$(".paginate_button a").on("click", function(e) {
	e.preventDefault();
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
});
});
</script>
<title>List Page</title>
</head>
<body>
<div class="container">
  <h2>Basic Table</h2>
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
				<td><a class='move' href='/board/get?idx=<c:out value="${board.idx}"/>'>
				<c:out value="${board.title}" /></a></td>
				<td><c:out value="${board.writer}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
  <c:if test="${pageMaker.prev}">
  	<li class="paginate_button previous"><a	href="${pageMaker.startPage -1}">Previous</a></li>
  </c:if>
  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
		<a href="${num*10-9}">${num}</a>
	</li>
  </c:forEach>
  <c:if test="${pageMaker.next}">
	<li class="paginate_button next"><a	href="${pageMaker.endPage +1 }">Next</a></li>
  </c:if>
	<li class="paginate_button"><a href="${pageContext.request.contextPath}/board/register">글쓰기</a></li>
</div>
<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
			

<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</body>
</html>
<%@ include file="../include/footer.jsp"%>
