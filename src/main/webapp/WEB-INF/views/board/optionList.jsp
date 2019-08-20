<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

</style>
		
		<table class="table" id="optionList">
			<thead>
				<th>번호</th>
				<th>날짜</th>
				<th>시간</th>
				<th>좌석</th>
				<th>가격</th>
				<th>삭제</th>
			</thead>
			<c:forEach items="${clist}" var="c" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${c.reg_date}</td>
				<td>${c.time}</td>
				<td>${c.seat}</td>
				<td>${c.price}</td>
				<td><a class="glyphicon glyphicon-remove delete" title="${c.dnum}" style="display: inline-block"></a></td>
			</tr>
			</c:forEach>
		</table>
		
		

<script type="text/javascript">

function getOptionsList(){
	$.ajax({
		type:'GET',
		url:'./optionList',
		data:{
			num:'${num}'
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


</script>

</body>
</html>