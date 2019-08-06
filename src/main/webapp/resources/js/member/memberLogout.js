$(function() {
	$('.memberLogout').click(function() {
		var id = $('#memberId').val();
		alert(id);
		$.ajax({
			data:{
				id : id
			},
			type: "POST",
			url: "..member/memberLogout",
			success:function(data){
				
			}
			
		});
	});
});