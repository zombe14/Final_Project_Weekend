$(function() {
	$("#checkAll").click(function() {
		alert("dd");
		var c = $("#customCheck").prop('checked');
		$('.custom-control-input').prop('checked',c);
	});
	$('.check_sub').click(function() {
		var c = true;
		alert(c);
		$('#customCheck').prop('checked', c);
	});
	$('#checkAllfont1').click(function() {
		var c = true;
		alert(c);
	});
});



/*$('#checkAll').click(function() {
	var c = $(this).prop('checked');
	$('.check').prop('checked', c);
});
//*************************************

$('.check').click(function() {
	var c = true;
	$('.check').each(function() {
		if (!$(this).prop('checked')) {
			c = false;
		}
	});
	$('#checkAll').prop('checked', c);
});

//*************************************

$('#join').click(function() {
	var d = $('#checkAll').prop('checked');
	
<%-- 약관동의 필수와 선택 --%>
	var a = $('#checka').prop('checked');
	var b = $('#checkb').prop('checked');
	var c = $('#checkc').prop('checked');
	var r = true;
	*/