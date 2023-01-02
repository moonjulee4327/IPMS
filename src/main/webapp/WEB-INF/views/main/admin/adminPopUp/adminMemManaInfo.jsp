<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<link rel="apple-touch-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
</head>
<body>

	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title" id="basic-layout-colored-form-control"
					style="font-size: 23px; color: #455DBD; font-family: noto sans, malgun gothic, AppleGothic, dotum;">회원
					정보</div>
				<hr>
			</div>
			<div class="card-content collapse show">
				<div class="card-body">
					<form class="form">
						<div class="form-body">
							<div class="row">
								<div class="col-4">
									<img class="gallery-thumbnail card-img-top"
										src="/resources/images/delivery-boy.png"
										style="width: 170px; height: 170px; margin-left: 18px; margin-top: 40px;"
										itemprop="thumbnail" alt="Image description">
								</div>
								<div class="col-8">
									<h4 class="form-section"
										style="font-family: noto sans, malgun gothic, AppleGothic, dotum; color: #455DBD;">
										<i class="feather icon-user" style="color: #455DBD;"></i> 기본
										정보
									</h4><br>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<label for="memEmail">아이디</label> <input type="text"
													id="memEmail" class="form-control border-secondary"
													name="memEmail" value="${data.memEmail}" disabled>
											</div>
											<div class="form-group">
												<label for="memName">회원명</label> <input type="text"
													id="memName" class="form-control border-secondary"
													name="memName" value="${data.memName}" disabled>
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<label for="memPhoneNumber">연락처</label> <input type="text"
													id="memPhoneNumber" class="form-control border-secondary"
													name="memPhoneNumber" value="${data.memPhoneNumber}" disabled>
											</div>
											<div class="form-group">
												<label for="memSgnupDate">가입 일자</label> <input type="text"
													id="memSgnupDate" class="form-control border-secondary"
													name="memSgnupDate" value="<fmt:formatDate value='${data.memSgnupDate}' pattern='yyyy-MM-dd'/>" disabled>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br><br>
							<h4 class="form-section"
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum; color: #455DBD;">
								<i class="feather icon-file" style="color: #455DBD;"></i>
								포트폴리오
							</h4>

							<div class="form-group">
								<label for="userinput5">Email</label> <input
									class="form-control border-secondary" type="email"
									placeholder="email" id="userinput5">
							</div>

							<div class="form-group">
								<label for="userinput5">Email</label> <input
									class="form-control border-secondary" type="email"
									placeholder="email" id="userinput5">
							</div>

							<div class="form-group">
								<label for="userinput5">Email</label> <input
									class="form-control border-secondary" type="email"
									placeholder="email" id="userinput5">
							</div>
						</div>

						<div class="form-actions right">
							<button type="reset" class="btn btn-secondary" onclick="f_close()">닫기</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- BEGIN: Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
	<!-- END: Page JS-->
</body>
</html>

<script>

	// 핸드폰 번호에 하이픈 추가
	let test= "${data.memPhoneNumber}";
	test =test.replace(/([0-9]{3})([0-9]{4})([0-9]{4})/,"$1-$2-$3");
	
	$("#memPhoneNumber").val(test);

	
	// 팝업 창 닫기~~
	function f_close() {
		
		window.close();
	}
	
</script>

