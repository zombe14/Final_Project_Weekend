<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div id="optionList">
			<c:forEach items="${clist}" var="c">
				 <div id = "${c.dnum}" class="optionListDiv">
					<div>
				    	${c.num} | ${c.dnum} | ${c.reg_date} | ${c.time} | ${c.seat} | ${c.price} 
			    	</div>
			    	<span class="delete" title="${c.dnum}">X</span>
			    </div>
		   	</c:forEach>
		</div>
		
		

<script type="text/javascript">

/* function getOptionsList(){
	$.ajax({
		type:'GET',
		url:'./optionList',
		data:{
			num:'${clist.num}'
		},
		success:function(data){
			data = data.trim();    	
			$('#optionList').html(data);
				
		}
	});
}

 
$('.delete').click(function() {
	 var dnum = $(this).attr('title');
	 var check = confirm('정말 삭제하시겠습니까?');
	 if(check){
		 $.ajax({
			 url : './optionDelete',
			 type: 'POST',
			 data: {dnum : dnum},
			 success:function(data){
				 if(data == '1'){
					getOptionsList()
				} else {
					alert('삭제 실패');
				}
			 }, error:function(data){
				console.log(data);
			 }
		 });
	 }
});
 */

</script>

</body>
</html>