<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<script type="text/javascript">
		$().ready(function () {
			var childWindow = window.parent;
			var parentWindow = childWindow.opener;
			var order = parentWindow.document.getElementById("partner_order_id").value;
			alert(order);
			var token = "${token}";
			alert(token);
			parentWindow.location.href = "./approval?order="+order+"&token="+token;
			close();
		});
</script>
</head>
<body>
</body>
</html>