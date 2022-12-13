<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="/proj/fileUploadTest" method="post" enctype="multipart/form-data">
		<input type="file" id="fileTest" name="fileTest"/>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>