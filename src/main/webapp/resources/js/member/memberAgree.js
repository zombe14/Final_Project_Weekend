$(function() {
	$("#checkAll").click(function() {
		var c = $("#customCheck").prop('checked');
		$('.custom-control-input').prop('checked',c);
	});
	$('.check_sub').click(function() {
		var c = true;
		$('.check_sub_sub').each(function() {
			if (!$(this).prop('checked')) {
				c = false;
			}
		});
		$('#customCheck').prop('checked', c);
	});
	$('#checkAllfont1').click(function() {
		var c = true;
	});
	$("#join").click(function() {
		var c1 = $("#customCheck1").prop('checked');
		var c2 = $("#customCheck2").prop('checked');
		var c3 = $("#customCheck3").prop('checked');
		if(c1&&c2&&c3){
			location.href="./memberJoin";
		}else{
			alert("필수 약관에 동의 하세요");
		}
	});
});