<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Gallery Hover Effects - Stack Responsive Bootstrap 4
	Admin Template</title>
<link rel="apple-touch-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/gallery.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>

<style type="text/css">
.btn btn-secondary round btn-min-width mr-1 mb-1 {
	background-color: #448AFF;
}

.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
</head>
<div class="col-md-6" style="display: flex; float: left; width: 1000px;">
	<div class="card-content collapse show">
		<div class="card-body">
			<div>
				<h4 class="form-section">
					<i class="feather icon-monitor"></i> Project Setting ManageMent
				</h4>
				<hr style="width: 650px; float: left" />
				<br />
				<br />
				<br />
				<br />
				<div class="pace  pace-inactive">
					<div class="pace-progress" data-progress-text="100%"
						data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
						<div class="pace-progress-inner"></div>
					</div>
					<div class="pace-activity"></div>
				</div>
				<div class="content-overlay"></div>
				<div class="content-body">
					<div class="card-content collapse show">
						<div class="grid-hover"">
							<div class="col-md-6 ml-5" style="width: 1000px; height: 800px;">
								<div>
									<i class="feather icon-image">&nbsp;</i><b>대표 이미지</b>
								</div>
								<figure class="effect-romeo">
									<img
										src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/18.jpg"
										alt="img18">
									<figcaption>
										<h2>
											Wild <span>Romeo</span>
										</h2>
										<p>Romeo never knows what he wants. He seemed to be very
											cross about something.</p>
										<a href="#">View more</a>
									</figcaption>
								</figure>
								<br />

								<div style="text-align: center;">
									<button type="button" class="btn btn-secondary"
										style="padding: 11px 60px; background-color: #448AFF; color: white;">
										<i class="feather icon-settings">&nbsp;&nbsp;</i>대표이미지 변경
									</button>
									<br />
									<br />
								</div>
								<div style="text-align: center;">
									<button type="button" class="btn btn-danger"
										data-toggle="modal" data-target="#danger"
										style="color: white; padding-left:20px; width:245px; height:43px; text-size:7px;" id="projDelete">
										<i class="fa fa-window-close">&nbsp;&nbsp;</i>프로젝트
										중도 해산
									</button>
									<br />
									<br />
								</div>
								<br />
								<!------------------------------ 프로젝트 해산 Modal ---------------------------- -->
								<div class="modal fade text-left" id="danger" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel10"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header bg-danger white">
												<h4 class="modal-title" id="myModalLabel10" style="text-align:center;">프로젝트 중도 해산</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h5 style="text-align:center;">정말로 프로젝트를 삭제하시겠습니까?</h5>
												<!-- 부여받은 캡차 사이트 키 -->
												<div style="display: flex; justify-content: center;" class="g-recaptcha" data-sitekey=""></div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-outline-danger" onclick='return check_recaptcha();'>해산하기</button>
												<button type="button" class="btn grey btn-outline-secondary"
													data-dismiss="modal">취소</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<!-- 			zzz---------------------------------------------------------------------------------------------------------------- -->
<div class="col-md-6" style="float: right; width: 1000px;">
	<div class="card-content collapse show">
		<div class="card-body">
			<div>
				<div class="form-body">
					<h4 class="form-section" style="padding-bottom: 5px;">
						<i class="fa fa-file-text"></i> information
					</h4>
					<hr />
					<br />
					<br />
					<br />
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="userinput1">Project Name</label> <input type="text"
									id="userinput1" class="form-control border-primary"
									placeholder="Project Name" name="name" />
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<div style="float: left">
									<label for="userinput3">Project Start Date</label> <input
										type="date" id="userinput3"
										class="form-control border-primary" placeholder="Start Date"
										name="username" />
								</div>
								<div style="float: right;">
									<label for="userinput3">Project End Date</label> <input
										type="date" id="userinput3"
										class="form-control border-primary" placeholder="End Date"
										name="username" />
								</div>
							</div>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="userinput8">Project Introduce</label>
						<textarea style="width: 500px; resize: none;" id="userinput8"
							rows="9" class="form-control border-primary"
							placeholder="Project Introduce"></textarea>
					</div>
					<button class="btn btn-primary">수정</button>
					<button class="btn btn-primary">목록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="sidenav-overlay"
	style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
<div class="drag-target"
	style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>

<!-- BEGIN: Page Vendor JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/modal/components-modal.js"></script>
<!-- END: Page JS-->
</body>
<!-- END: Body-->
</html>


<script>
	function check_recaptcha(){
		var v = grecaptcha.getResponse();
		if (v.length ==0) {
			alert ("'로봇이 아닙니다.'를 체크해주세요.");
			return false;
		} else {
			location.reload();
			return true;
		}
	}
</script>
