<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp"/>
<title>${boardTitle} List</title>
</head>
<body>
	<h3>${boardTitle} List</h3>
	<table>
		<thead>
			<th>NUM</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>DATE</th>
			<th>HIT</th>
		</thead>
		<c:forEach items="${top}" var="top">
			<tr>
				<td>중요</td>
				<td>${top.title}</td>
				<td>${top.writer}</td>
				<td>${top.reg_date}</td>
				<td>${top.hit}</td>
			</tr>
		</c:forEach>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.num}</td>
				<td>${list.title}</td>
				<td>${list.writer}</td>
				<td>${list.reg_date}</td>
				<td>${list.hit}</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
	<a href = "./${board}Write">${board}Write</a>
</body>
</html>