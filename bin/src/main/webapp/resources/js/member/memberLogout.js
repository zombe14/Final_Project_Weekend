$(function() {

	var id = $('#id').val();
	$('.memberLogout').click(function() {
		alert(id);
		location.href="${pageContext.request.contextPath}/member/memberLogout?id="+id;
	});
});