<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp"%>

<sec:authentication property="principal" var = "pinfo"/>

<script type="text/javascript">
$(document).ready(function() {
	
	
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/notice/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#idx").remove();
    operForm.attr("action","/notice/list")
    operForm.submit();
    
  });  
});
</script>
	<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Notice Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">Notice Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
	  
	  <form role="form" action="/notice/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />	
	  
          <div class="form-group">
          <label>idx</label> <input class="form-control" name='idx'
            value='<c:out value="${board.idx }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='title'
            value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="10" name='content'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='writer'
            value='<c:out value="${board.writer }"/>' readonly="readonly">
        </div>
        
        <sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.username eq board.writer }" >
			<button type="submit" data-oper="modify" class="btn btn-default">
			<a href="/notice/modify?idx=<c:out value="${board.idx}"/>">Modify</a></button>
			</c:if>
		</sec:authorize>
        <button type="submit" data-oper='list' class="btn btn-info">
        <a href="/notice/list" >List</a></button> 
		
	</form>
      </div>
      <!--  end panel-body -->
	
    </div>
    <!--  end panel-body -->
    <!-- /.panel -->
    
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
     
<%@ include file="../include/footer.jsp"%>