<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
		<!--  name은 tiles.xml에서 사용하는 이름과 같아야함 -->
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<tiles:insertAttribute name="main"></tiles:insertAttribute>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>