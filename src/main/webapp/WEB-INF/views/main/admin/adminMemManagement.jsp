<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<!DOCTYPE html>
<head>
<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/extensions/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/icheck.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/custom.css">
<!-- END: Vendor CSS-->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-contacts.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>
	<!-- BEGIN: Content-->
	<section class="row all-contacts">
		<div class="col-12">
			<div class="card" style="width: 1300px;">
				<div class="card-content">
					<div class="card-body">
						<!-- Task List table -->
						<div class="table-responsive">
							<h3 style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">회원 관리</h3>
							<br>
							<div class="bug-list-search" style="padding-bottom: 15px;">
								<div class="bug-list-search-content">
									<div class="sidebar-toggle d-block d-lg-none">
										<i class="feather icon-menu font-large-1"></i>
									</div>
									<form action="#">
										<div class="position-relative">
											<input type="search" id="search-contacts"
												class="form-control" placeholder="Search">
											<div class="form-control-position">
												<i
													class="fa fa-search text-size-base text-muted la-rotate-270"></i>
											</div>
										</div>
									</form>
								</div>
							</div>
							<table id="users-contacts"
								class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
								<colgroup>
									<col width="5%">
									<col width="10%">
									<col width="25%">
									<col width="30%">
									<col width="20%">
									<col width="15%">
									<col width="5%">
								</colgroup>
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Name: activate to sort column ascending"
											style="width: 5px;">선택</th>
										<th>회원 코드</th>
										<th>회원명</th>
										<th>아이디</th>
										<th>핸드폰 번호</th>
										<th>가입 일자</th>
										<th>경고 횟수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="adminMemListVO" items="${adminMemListVO}">
									<tr>
										<td><input type='checkbox' id="ckbox" name="ckbox"
											value=""></td>
										<td class="text-center">${adminMemListVO.memCode}</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm rounded-circle"><img
														src="/resources/images/delivery-boy.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<b><a href="javascript:f_memInfo('${adminMemListVO.memCode}')" style="color: #455DBD;">${adminMemListVO.memName}</a></b>
												</div>
											</div>
										</td>
										<td class="text-center">${adminMemListVO.memEmail}</td>
										<td class="phone" id="memPhoneNumber">${adminMemListVO.memPhoneNumber}</td>
										<td><fmt:formatDate value="${adminMemListVO.memSgnupDate}" pattern="yyyy-MM-dd"/></td>
										<td class="text-center">${adminMemListVO.memProjQuit}회</td>

									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row" style="margin: auto; padding-top:5px;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left;">
										<button type="button" class="btn"
											style="background-color: #546E7A; color: white;">정지
										</button>
									</div>
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate" style="padding-left: 455px;">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="DataTables_Table_0_previous"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="0"
												tabindex="0" class="page-link">이전</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="1"
												tabindex="0" class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="2"
												tabindex="0" class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="3"
												tabindex="0" class="page-link">3</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="4"
												tabindex="0" class="page-link">4</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="5"
												tabindex="0" class="page-link">5</a></li>
											<li class="paginate_button page-item next"
												id="DataTables_Table_0_next"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="7"
												tabindex="0" class="page-link">다음</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END: Content-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/jquery.dataTables.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jquery.raty.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.rowReorder.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-contacts.js"></script>
	<!-- END: Page JS-->

<script type="text/javascript">

$(document).ready(function() {
	
	// 핸드폰 번호에 하이픈 추가
	let test= "${data.memPhoneNumber}";
	test =test.replace(/([0-9]{3})([0-9]{4})([0-9]{4})/,"$1-$2-$3");
	
	$("#memPhoneNumber").val(test);
})
</script>

<script>

	// 회원 정보 팝업창 띄우기
	function f_memInfo(param) {
		
	//	alert(param);
	
		let v_open = "/main/adminMemDetail?memCode="+param;

		let v_option = "width=750, height=800, top=100px, left=450px, scrollbars=yes";
		
		window.open(v_open, "회원 정보", v_option);
	}

</script>


</body>
<!-- END: Body-->

</html>
