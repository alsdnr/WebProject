<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../include/header.jsp"%>

<sec:authentication property="principal" var = "pinfo"/>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Notice Modify</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Notice Modify</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/notice/modify" method="post">
     	 <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
        <%-- <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'> --%>
      
 
<div class="form-group">
  <label>No</label> 
  <input class="form-control" name='idx' 
     value='<c:out value="${board.idx }"/>' readonly="readonly">
</div>

<div class="form-group">
  <label>Title</label> 
  <input class="form-control" name='title' 
    value='<c:out value="${board.title }"/>' >
</div>

<div class="form-group">
  <label>Text area</label>
  <textarea class="form-control" rows="10" name='content' ><c:out value="${board.content}"/></textarea>
</div>

<div class="form-group">
  <label>Writer</label> 
  <input class="form-control" name='writer'
    value='<c:out value="${board.writer}"/>' readonly="readonly">            
</div>

<div class="form-group">
  <label>RegDate</label> 
  <input class="form-control" name='regDate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'  readonly="readonly">            
</div>
          
 <sec:authorize access="isAuthenticated()">
 <c:if test="${pinfo.username eq board.writer }" >
  	<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
  	<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
  </c:if>
 </sec:authorize>
  <button type="submit" data-oper='list' class="btn btn-info">List</button>
</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/notice/remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/notice/list").attr("method","get");
	      formObj.empty();
	    }
	    
	    formObj.submit();
	  });

});
</script>


<%@include file="../include/footer.jsp"%>
