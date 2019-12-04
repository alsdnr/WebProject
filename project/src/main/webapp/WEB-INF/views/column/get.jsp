<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp"%>

<sec:authentication property="principal" var = "pinfo"/>

<script type="text/javascript">
$(document).ready(function() {
	
  console.log(ColumnService);
	
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/column/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#idx").remove();
    operForm.attr("action","/column/list")
    operForm.submit();
    
  });  
});
</script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function (){
		var idxValue = '<c:out value="${board.idx}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			ColumnService.getList({idx:idxValue, page: page || 1}, function(replyCnt, list) {
				console.log("replyCnt"+replyCnt);
				console.log("list"+list);
				console.log(list);
				
				if(page == -1){
				      pageNum = Math.ceil(replyCnt/10.0);
				      showList(pageNum);
				      return;
				    }
				      
				     var str="";
				     
				     if(list == null || list.length == 0){
				       return;
				     }
				     
				     for (var i = 0, len = list.length || 0; i < len; i++) {
				       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				       str +="  <div><div class='header'><strong class='primary-font'>"
				    	   +list[i].replyer+"</strong>"; 
				       str +="    <small class='pull-right text-muted'>"
				           +ColumnService.displayTime(list[i].replyDate)+"</small></div>";
				       str +="    <p>"+list[i].reply+"</p></div></li>";
				     }
				 replyUL.html(str);
				 
			     showReplyPage(replyCnt);
			});//end function
		}//end showList
		var modal = $(".modal");
	    var modalInputReply = modal.find("input[name='reply']");
	    var modalInputReplyer = modal.find("input[name='replyer']");
	    var modalInputReplyDate = modal.find("input[name='replyDate']");
	    
	    var modalModBtn = $("#modalModBtn");
	    var modalRemoveBtn = $("#modalRemoveBtn");
	    var modalRegisterBtn = $("#modalRegisterBtn");
	    
	    var replyer = null;
	    
	    <sec:authorize access="isAuthenticated()">
	    
	    	replyer ='<sec:authentication property="principal.username"/>';
	    
	    </sec:authorize>
	    
	    var csrfHeaderName = "${_csrf.headerName}";
	    var csrfTokenValue = "${_csrf.token}";
	    
	    $("#modalCloseBtn").on("click", function(e){
	    	
	    	modal.modal('hide');
	    });
	    
	    $("#addReplyBtn").on("click", function(e){
	      
	      modal.find("input").val("");
	      modal.find("input[name='replyer']").val(replyer);
	      modalInputReplyDate.closest("div").hide();
	      modal.find("button[id !='modalCloseBtn']").hide();
	      
	      modalRegisterBtn.show();
	      
	      $(".modal").modal("show");
	      
	    });
	    
	    //Ajax spring security
	    $(document).ajaxSend(function(e, xhr, options) {
	    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);	    
	    });
	    
	    modalRegisterBtn.on("click",function(e){
	        
	        var reply = {
	              reply: modalInputReply.val(),
	              replyer:modalInputReplyer.val(),
	              idx:idxValue
	            };
	        ColumnService.add(reply, function(result){
	          
	          alert(result);
	          
	          modal.find("input").val("");
	          modal.modal("hide");
	          
	          showList(1);
	        });
	      });
	  //댓글 조회 클릭 이벤트 처리 
	    $(".chat").on("click", "li", function(e){
	      
	      var rno = $(this).data("rno");
	      
	      ColumnService.get(rno, function(reply){
	      
	        modalInputReply.val(reply.reply);
	        modalInputReplyer.val(reply.replyer);
	        modalInputReplyDate.val(ColumnService.displayTime( reply.replyDate))
	        .attr("readonly","readonly");
	        modal.data("rno", reply.rno);
	        
	        modal.find("button[id !='modalCloseBtn']").hide();
	        modalModBtn.show();
	        modalRemoveBtn.show();
	        
	        $(".modal").modal("show");
	            
	      });
	    });
	   	
	  
	    modalModBtn.on("click", function(e){
	    	  
			var originalReplyer = modalInputReplyer.val();
	    	
	    	var reply = {
	    		rno:modal.data("rno"),
	    		reply:modalInputReply.val(),
	    		replyer:originalReplyer
	    	};
	    	
	     	  
	     if(!replyer){
	   		  modal.modal("hide");
	   		  return;
	   	  }
	   	  
	   	  
	   	  console.log("Original Replyer: " + originalReplyer);
	   	  
	   	  if(replyer  != originalReplyer){
	   		  
	   		  alert("자신이 작성한 댓글만 수정이 가능합니다.");
	   		  modal.modal("hide");
	   		  return;
	   		  
	   	  }
	     	  
	   	ColumnService.update(reply, function(result){
	     	        
	     	    alert(result);
	     	    modal.modal("hide");
	     	    showList(pageNum);
	     	    
	     	  });
	     	  
	     	});
	    
	    modalRemoveBtn.on("click", function (e){
	     	  
	     	  var rno = modal.data("rno");
	     	  console.log("RNO: " + rno);
	     	  console.log("REPLYER: " + replyer);
	     	  
	     	  if(!replyer) {
	     		  modal.modal("hide");
	     		  return;
	     	  }
	     	  
	     	  var originalReplyer = modalInputReplyer.val();
	     	  
	     	  console.log("Original Replyer: " + originalReplyer);
	     	  
	     	  if(replyer != originalReplyer){
	     		  alert("자신이 작성한 댓글만 삭제 가능합니다.");
	     		  modal.modal("hide");
	     		  return;
	     		  
	     	  }
	     	  
	     	 ColumnService.remove(rno, originalReplyer, function(result){
	     	        
	     	      alert(result);
	     	      modal.modal("hide");
	     	      showList(pageNum);
	     	      
	     	  });
	     	  
	     	});

	});
	 var pageNum = 1;
	    var replyPageFooter = $(".panel-footer");
	    
	    function showReplyPage(replyCnt){
	      
	      var endNum = Math.ceil(pageNum / 100.0) * 10;
	      if(endNum <= 0) {
	    	var startNum = endNum+1;
	    	var endNum = 10;
	      }else {
	      	var startNum = endNum - 9; 
	      }
	      var prev = startNum != 1;
	      var next = false;
	      
	      if(endNum * 10 >= replyCnt){
	        endNum = Math.ceil(replyCnt/10.0);
	      }
	      
	      if(endNum * 10 < replyCnt){
	        next = true;
	      }
	      
	      var str = "<ul class='pagination pull-right'>";
	      
	      if(prev){
	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	      }
	      
	      for(var i = startNum ; i <= endNum; i++){
	        
	        var active = pageNum == i? "active":"";
	        
	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+((i-1)*10)+"'>"+i+"</a></li>";
	      }
	      
	      if(next){
	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	      }
	      
	      str += "</ul></div>";
	      
	      console.log(str);
	      
	      replyPageFooter.html(str);
	    }
	    replyPageFooter.on("click","li a", function(e){
	        e.preventDefault();
	        console.log("page click");
	        
	        var targetPageNum = $(this).attr("href");
	        
	        console.log("targetPageNum: " + targetPageNum);
	        
	        pageNum = targetPageNum;
	        
	        showList(pageNum);
	      });     
</script>
	<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Column Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">Column Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
	  
	  <form role="form" action="/column/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />	
	  
          <div class="form-group">
          <label>No</label> <input class="form-control" name='idx'
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
			<a href="/column/modify?idx=<c:out value="${board.idx}"/>">Modify</a></button>
			</c:if>
		</sec:authorize>
        <button type="submit" data-oper='list' class="btn btn-info">
        <a href="/column/list" >List</a></button> 
		
	</form>
      </div>
      <!--  end panel-body -->
	
    </div>
    <!--  end panel-body -->
    <!-- /.panel -->
    <div class="panel panel-default">
    	<!-- <div class="panel-heading">
    		<i class="fa fa-comments fa-fw"></i>Reply
    	</div> -->
    	<!-- /.panel-heading -->
    	<div class="panel-heading">
    	<i class="fa fa-comments fa-fw"></i>Reply
    	<sec:authorize access="isAuthenticated()">
    		<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
    	</sec:authorize>
    	</div>
    	<div class="panel-body">
    		<ul class="chat">
    			<!-- start reply -->
    			<!-- end reply -->
    		</ul>
    		<!-- ./ end ul -->
    	</div>
    	<!-- ./panel .chat-panel -->
    	<div class="panel-footer">
    	</div>
    </div>
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
            </div>
			<div class="modal-footer">
		        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		        <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
      		</div>       
         </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<%@ include file="../include/footer.jsp"%>