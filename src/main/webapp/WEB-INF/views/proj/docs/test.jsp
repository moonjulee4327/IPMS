<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" id="testBtn" value="클릭">
	<div class="content area"></div>
</body>
<script type="text/javascript">
$("#testBtn").on("click", function () {
	$.ajax({
		url : "/docTest",
		method : "get",
		dataType : "json",
		success : function (resp) {
			console.log("resp : " + resp);
		}
	})
})
</script>
</html>