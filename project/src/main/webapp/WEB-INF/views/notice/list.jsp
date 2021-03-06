<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
  
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">공지</h1>
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				공지
				<button id='regBtn' type="button" class="btn btn-xs pull-right">
				글쓰기
				</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover" id="nlist">
    <thead>
      <tr>
        <th>No</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
   		<c:forEach items="${list}" var="board">
			<tr>
				<td><c:out value="${board.idx}" /></td>
				<td><a class='move' href='/notice/get?idx=<c:out value="${board.idx}"/>'>
				<c:out value="${board.title}" /></a></td>
				<td><c:out value="${board.writer}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
  <div class='pull-right'>
	<ul class="pagination">
	  <c:if test="${pageMaker.prev}">
	  	<li class="paginate_button previous"><a	href="${pageMaker.startPage-1}">Previous</a></li>
	  </c:if>
	  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
			<a href="${(num-1)*10}">${num}</a>
		</li>
	  </c:forEach>
	  <c:if test="${pageMaker.next}">
		<li class="paginate_button next"><a	href="${pageMaker.endPage +1 }">Next</a></li>
	  </c:if>
	</ul>
   </div>
</div>
<form id='actionForm' action="/notice/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
			



<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</div>
		<!--  end panel-body -->
</div>
	<!-- end panel -->
</div>
<!-- row -->
<script type="text/javascript">
$(document).ready(function() {
     var result = '<c:out value="${result}"/>';
     console.log(result);
    checkModal(result);
    
    function checkModal(result) {
	if (result === '') {
	return;
	}
	if (parseInt(result) > 0) {
 	 $(".modal-body").html(
		"게시글이 등록되었습니다.");
	}
	$("#myModal").modal('show');
	} 
    
$("#regBtn").on("click", function() {
self.location = "/notice/register";
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
<%@ include file="../include/footer.jsp"%>
