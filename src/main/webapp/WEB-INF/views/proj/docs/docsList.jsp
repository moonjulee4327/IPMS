<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="apple-touch-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/sweetalert2.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<!-- END: Page CSS-->

<link rel="apple-touch-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/nestable.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/jstree/themes/default/style.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/bootstrap-treeview.min.css"> -->
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/extensions/ex-component-treeview.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->

<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
	h5 {
		font-family: 'MICEGothic Bold';
	}
</style>

<section class="row all-contacts">
	<div class="col-12">
		<div class="card">
			<div class="card-head">
				<div class="card-header">
					<h1 class="card-title" style="font-family: 'MICEGothic Bold'">문서함</h1>
					<div class="heading-elements mt-0">
						<button class="btn btn-primary btn-md" data-toggle="modal"
							data-target="#AddFoder">
							<i class="d-md-none d-block feather icon-plus white"></i> <span
								class="d-md-block d-none"><i class="icon-folder-alt"></i>&nbsp;폴더 만들기</span>
						</button>
						<!-- 폴더 모달창 시작 -->
						<div class="modal fade" id="AddFoder" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel1" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<section class="contact-form">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel1">폴더 만들기</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<fieldset class="form-group col-12">
													<input type="text" id="foldName" name="foldName" data-foldName="" class="contact-name form-control" placeholder="폴더명을 입력하세요.">
												</fieldset>
											</div>
											<div class="modal-footer">
												<fieldset
													class="form-group position-relative has-icon-left mb-0">
													<input type="button" id="makeFolderBtn" class="btn btn-info add-contact-item" value="생성하기">
														<i class="fa fa-paper-plane-o d-block d-lg-none"></i> <span
															class="d-none d-lg-block"></span>
												</fieldset>
											</div>
									</section>
								</div>
							</div>
						</div>
						<!-- 폴더 모달창 끝 -->
						<!-- 파일 모당창 시작 -->
						<div class="modal fade" id="AddFile" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel1" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<section class="contact-form">
										<form id="fileUploadForm" class="contact-input" action="/proj/docsFileUpload" method="post" enctype="multipart/form-data">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel1">파일 업로드</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<fieldset class="form-group col-12">
													<input type="file" name="docsFile" class="form-control-file"
														id="user-image">
												</fieldset>
											</div>
											<div class="modal-footer">
												<fieldset
													class="form-group position-relative has-icon-left mb-0">
													<input type="submit" id="docsFileUploadBtn" class="btn btn-info add-contact-item" data-dismiss="modal" value="업로드">
														<i class="fa fa-paper-plane-o d-block d-lg-none"></i> <span
															class="d-none d-lg-block"></span>
												</fieldset>
											</div>
											<sec:csrfInput/>
										</form>
									</section>
								</div>
							</div>
						</div>
						<!-- 파일 모당창 끝 -->
						<button class="btn btn-warning btn-md" data-toggle="modal"
							data-target="#AddFile">
							<i class="d-md-none d-block feather icon-plus white"></i> <span
								class="d-md-block d-none"><i class="feather icon-upload"></i>&nbsp;파일 업로드</span>
						</button>
					</div>
				</div>
			</div>
			<div class="card-content">
				<!-- jstree 시작 -->
				<div class="card-body border rounded jstree jstree-2 jstree-default"
					id="jstree-example-2" role="tree" aria-multiselectable="true"
					tabindex="0" aria-activedescendant="j2_1" aria-busy="false">
					
				</div>
				<!-- jstree 끝 -->
				<div class="card-body">
					<!-- Task List table -->
					<div class="table-responsive">
						<div id="users-contacts_wrapper"
							class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12">
									<table id="users-contacts"
										class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center dataTable"
										role="grid" aria-describedby="users-contacts_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Name: activate to sort column descending"
													style="width: 141.646px;" aria-sort="ascending">구분</th>
												<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Email: activate to sort column ascending"
													style="width: 159.844px;">명</th>
												<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Phone: activate to sort column ascending"
													style="width: 87.0625px;">등록자</th>
												<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Favorite: activate to sort column ascending"
													style="width: 57.75px;">등록일자</th>
														<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Favorite: activate to sort column ascending"
													style="width: 57.75px;">기능</th>
											</tr>
										</thead>
										<tbody>
											<tr role="row" class="odd">
												<!-- 구분 컬럼 -->
												<td class=""><i class="feather icon-folder"></i><i class="feather icon-file"></i>폴더</td>
												<!-- 명 컬럼 -->
												<td class="sorting_1">
													<div class="media">
														<div class="media-left pr-1">
															<span>
																<i></i>
															</span>
														</div>
														<div class="media-body media-middle mt-50">
															<a class="media-heading name" href="#">Margaret Govan</a>
														</div>
													</div>
												</td>
												<!-- 등록자 컬럼 -->
												<td class="text-center">
												<a class="email">margaret@example.com</a></td>
												<!-- 등록일자 컬럼 -->
												<td class="date">+125-654-564</td>
												<!-- 기능 컬럼 -->
												<td>
													&nbsp;
													<a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1">
														<i class="feather icon-download"></i>
													</a>
													 
													<a class="danger delete mr-1">
														<i class="fa fa-trash-o"></i>
													</a>
												</td>
											</tr>
											<!-- 폴더 조회 -->
											<c:forEach var="docsList" items="${docsList}">
											<tr role="row" class="odd">
												<!-- 구분 컬럼 -->
												<td class=""><i class="feather icon-folder"></i>폴더</td>
												<!-- 명 컬럼 -->
												<td class="sorting_1">
													<div class="media">
														<div class="media-left pr-1">
															<span>
																<i></i>
															</span>
														</div>
														<div class="media-body media-middle mt-50">
															<a class="media-heading name" href="/proj/docs?foldName=${docsList.foldName}">${docsList.foldName}</a>
														</div>
													</div>
												</td>
												<!-- 등록자 컬럼 -->
												<td class="text-center">
												<a class="email">${docsList.foldName}</a></td>
												<!-- 등록일자 컬럼 -->
												<td class="date">+125-654-564</td>
												<!-- 기능 컬럼 -->
												<td>
													&nbsp;
													<a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1">
														<i class="feather icon-download"></i>
													</a>
													 
													<a class="danger delete mr-1">
														<i class="fa fa-trash-o"></i>
													</a>
												</td>
											</tr>
											</c:forEach>
											
											<!-- 파일 조회 -->
											<c:forEach var="fileList" items="${fileList}">
											<tr role="row" class="odd">
												<!-- 구분 컬럼 -->
												<td class=""><i class="feather icon-file"></i>파일</td>
												<!-- 명 컬럼 -->
												<td class="sorting_1">
													<div class="media">
														<div class="media-left pr-1">
															<span>
																<i></i>
															</span>
														</div>
														<div class="media-body media-middle mt-50">
															<a class="media-heading name" href="#">${fileList.fileName}</a>
														</div>
													</div>
												</td>
												<!-- 등록자 컬럼 -->
												<td class="text-center">
												<a class="email">${fileList.fileName}</a></td>
												<!-- 등록일자 컬럼 -->
												<td class="date">${fileList.rgstDate}</td>
												<!-- 기능 컬럼 -->
												<td>
													&nbsp;
													<a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1">
														<i class="feather icon-download"></i>
													</a>
													 
													<a class="danger delete mr-1">
														<i class="fa fa-trash-o"></i>
													</a>
												</td>
											</tr>
											</c:forEach>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="users-contacts_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="users-contacts_previous"><a href="#"
												aria-controls="users-contacts" data-dt-idx="0" tabindex="0"
												class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="users-contacts" data-dt-idx="1" tabindex="0"
												class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="users-contacts" data-dt-idx="2" tabindex="0"
												class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="users-contacts" data-dt-idx="3" tabindex="0"
												class="page-link">3</a></li>
											<li class="paginate_button page-item next"
												id="users-contacts_next"><a href="#"
												aria-controls="users-contacts" data-dt-idx="4" tabindex="0"
												class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/sweetalert2.all.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/polyfill.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/extensions/sweet-alerts.js"></script>
<!-- END: Page JS-->


<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/nestable.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jstree.js"></script>
<!-- <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/bootstrap-treeview.min.js"></script> -->
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/ex-component-treeview.js"></script>
<!-- END: Page JS-->

<script type="text/javascript">
	
	$('#jstree-example-2').jstree({ 'core' : {
		  'data' : [
		      { "id" : "ajson1", "parent" : "#", "text" : "Simple root node","icon":"jstree-icon jstree-themeicon feather icon-image text-success jstree-themeicon-custom" },
		      { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
		      { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" ,"icon": "glyphicon glyphicon-leaf"},
		      { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" ,"icon": "glyphicon glyphicon-leaf"},
		    ]
		  } 
		});
	
	// 1.폴더 생성 모달창 버튼 이벤트 
	// 	 input 태그 초기화
	// 2. 폴더 이름 정규식 체크
	//    통과 못하면 alert 띄우기
	//    통과시 폴더 생성
	let makeFolderBtn = $("#makeFolderBtn");
	let foldName = $("#foldName");
	makeFolderBtn.on("click", function(){
		let newFoldName = foldName.val();
		// 특수 문자 체크(로직 상 안됨)
		const regExp1 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		const regExp2 = /\s/g;

		let reg1 = regExp1.test(newFoldName);
		let reg2 = regExp2.test(newFoldName);

		if(reg1){
			foldName.val("");
			Swal.fire({
				title: "특수문자는 사용할 수 없습니다.",
				animation: false,
				customClass: "animated flipInX",
				confirmButtonClass: "btn btn-danger",
				buttonsStyling: false
			});
			return;
		}else if(reg2 || newFoldName == ""){
			foldName.val("");
			Swal.fire({
				title: "공백은 허용되지 않습니다.",
				animation: false,
				customClass: "animated flipInX",
				confirmButtonClass: "btn btn-danger",
				buttonsStyling: false
			});
			return;
		}
		
		foldName.val("");
		$("#AddFoder").modal("hide");
		fn_makeFold("/",newFoldName);
	});

	// 폴더 생성 함수
	function fn_makeFold(path, newFoldName){
		var header = "${_csrf.headerName}";
		var token = "${_csrf.token}";
		$.ajax({
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			url : "/proj/docsMkdir",
			method : "post",
			data : {path : path, newFoldName : newFoldName},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(resp){
				if(resp){
					alert("폴더 생성 완료");
				}
			}
		});
	}


	// 폴더를 조회 할 경로를 파라미터로 넘긴다.
	// 폴더 추가 버튼 시작 ===================================================
// 	$("#insertFolderBtn").on("click", function(){
// 		// $("#insertFolder").submit();
// 		$.ajax({
// 			url : "",
// 			method : "",
// 			dataType : "",

// 		})



// 	});
	// 폴더 추가 버튼 끝 =====================================================

	// 파일 추가 버튼 시작 ===================================================
	$("#docsFileUploadBtn").on("click", function(){
		$("#fileUploadForm").submit();
	});
	// 파일 추가 버튼 끝 ===================================================
</script>
