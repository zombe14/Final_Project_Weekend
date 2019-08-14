<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div id="commentsList">
			<c:forEach items="${clist}" var="c">
				 <div id = "${c.cnum}">
					<div>
				    	${c.writer} | ${c.reg_date} | ${c.cnum}<br>
				    	${c.contents}
			    	</div>
			    	<div>
				    	<%-- <c:if test="${dto.writer eq member.nickname}"> --%>
				    		<a class="update" title = "${c.cnum}">수정</a>
				    		<a class="delete" title = "${c.cnum}">삭제</a>
				    	<%-- </c:if> --%>
				    		<a class="reCom" title = "${c.cnum}" name = "${c.ref}">댓글달기</a>
				    		<div id="${c.ref}ReComDiv" class="reComDiv">
					    	
							</div>
			    	</div>
			     </div>
			   	 <div id="${c.cnum}Update" class="updateDiv">
			   	 	<form action="./commentsWrite" id="${c.cnum}Frm">
			   	 		${c.writer}
			   	 		<input type="hidden" name="writer" value="${c.writer}">
			   	 		<div>
			   	 			<textarea rows="3" cols="100" style="resize: none;" id="${c.cnum}Con">${c.contents}</textarea>
			   	 			<a class="btn btn-default updateBtn" id="${c.cnum}Btn">수정</a>
			   	 		</div>
			   	 	</form>
			   	 </div>
			   	 <hr>
		   	</c:forEach>
		   
		</div>
		
		

<script type="text/javascript">
var ref = 0;
$('.reCom').click(function() {
	$('.reComDiv2').remove();
	ref = $(this).attr('name');
	$('#'+ref+'ReComDiv').show();
	var html ='';
	html += '<div id="${c.ref}ReComDiv2" class="reComDiv2">';
	html += '<input type="hidden" name="ref" value="'+ref+'">';
	html += '<input type="hidden" name = "writer" value="${member.nickname}Nick" id="'+ref+'Writer">';
	html += '<textarea rows="3" cols="100" style="resize: none;" id="'+ref+'Contents">'+ref+'</textarea>';
	html += '<a id="'+ref+'ReComBtn" style="cursor:pointer">댓글등록</a>';
	html += '</div>';
	$('#'+ref+'ReComDiv').html(html);
	console.log(ref);
	
	console.log('#'+ref+'ReComDiv')
});
	
$('#'+ref+'ReComDiv2').on('click','#'+ref+'ReComBtn',function(e){
	alert(ref);	
});


$('.updateDiv').hide();
/* 하나의 수정창만 열리게. 수정버튼 클릭했을 때 그 글의 cnum 저장 */
var cnum2 = 0;
$('.update').click(function() {
	var cnum = $(this).attr('title');
	cnum2 = cnum;
	$('.updateDiv').hide();
	$('#'+cnum2+'Update').show();
});

$('.updateBtn').click(function () {
	var contents = $("#"+cnum2+"Con").val();
	$.ajax({
		url:'./commentsUpdate',
		type:'POST',
		data:{
			contents:contents,
			cnum:cnum2
		},success:function(data){
			 if(data == '1'){
					getCommentsList()
				} else {
					alert('수정성공 실패');
			 }
		}, error:function(data){
				console.log(data);
		}
	});
 });

function getCommentsList(){
	$.ajax({
		type:'GET',
		url:'./commentsList',
		data:{
			num:'${pager.num}'
		},
		success:function(data){
			data = data.trim();    	
			$('#commentsList').html(data);
				
		}
	});
}

 
$('.delete').click(function() {
	 var cnum = $(this).attr('title');
	 var check = confirm('정말 삭제하시겠습니까?');
	 if(check){
		 $.ajax({
			 url : './commentsDelete',
			 type: 'POST',
			 data: {cnum : cnum},
			 success:function(data){
				 if(data == '1'){
					getCommentsList()
				} else {
					alert('삭제 실패');
				}
			 }, error:function(data){
				console.log(data);
			 }
		 });
	 }
});



 
</script>

</body>
</html>