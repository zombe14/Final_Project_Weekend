<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


[공연 캘린더]

<script>
	$(function() {
		$("캘린더 id").datepicker({
			dateFormat : 'yy-mm-dd',
			beforeShowDay : disableAllTheseDays
		});
	});
	var disabledDays = ["선택 가능한 날짜 입력"];

	function disableAllTheseDays(date) {
		var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
		for (i = 0; i < disabledDays.length; i++) {
			if ($.inArray(y + '-' + (m + 1) + '-' + d, disabledDays) != -1) {
				return [ true ];
			}
		}
		return [ false ];
	}
</script>

[축제 캘린더]
<script>
	$(function() {
		$("캘린더 id").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : new Date("축제 시작일"),
			maxDate : new Date("축제 종료일")
		});
	});
</script>

<iframe src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=Asia%2FSeoul&amp;src=ZXVlY3Jlb2Y4aXBpaTU1c3IzOGRxYWdjYW9AZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;src=a28uc291dGhfa29yZWEjaG9saWRheUBncm91cC52LmNhbGVuZGFyLmdvb2dsZS5jb20&amp;color=%23B39DDB&amp;color=%230B8043&amp;showTitle=0&amp;showNav=1&amp;showDate=1&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0" style="border-width:0" width="800" height="600" frameborder="0" scrolling="no"></iframe>