<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
<title>관리자 페이지 - 프로젝트 관리</title>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

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

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-contacts.css">
<!-- END: Page CSS-->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
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
							<h3 style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">프로젝트 관리</h3>
							<br>
							<div style="float: right;">
								<div class="btn-group mr-1 mb-1">
									<button type="button"
										class="btn btn-outline-secondary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">진행 여부 선택</button>
									<div class="dropdown-menu" x-placement="bottom-start"
										style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
										<a class="dropdown-item" href="#">취소</a> <a
											class="dropdown-item" href="#">진행중</a> <a
											class="dropdown-item" href="#">완료</a>
									</div>
								</div>
							</div>
							<div class="bug-list-search"
								style="padding-bottom: 15px; width: 1080px;">
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
								class="table table-white-space table-borderless row-grouping display no-wrap icheck table-middle text-center">
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th>선택</th>
										<th>프로젝트 번호</th>
										<th>프로젝트 명</th>
										<th>프로젝트 생성자</th>
										<th>진행 여부</th>
										<th>등록 일자</th>
										<th>시작 일자</th>
										<th>종료 일자</th>
									</tr>
								</thead>
								<tbody>
									<!-- 오늘 날짜 구해서 프로젝트 일자와 비교 후 프로젝트 진행 상황 출력 -->									
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									<c:forEach var="ProjManaVO" items="${ProjManaVO}">
									<fmt:formatDate value="${ProjManaVO.projEndDate}" pattern="yyyy-MM-dd" var="endDate"/>
										<tr>
											<td><input type='checkbox' id="ckbox" name="ckbox"
												value=""></td>
											<td>${ProjManaVO.projId}</td>
											<td><b><a href="javascript:f_projInfo('${ProjManaVO.projId}')" style="color: #455DBD;">${ProjManaVO.projName}</a></b></td>
											<td>${ProjManaVO.memCode}</td>
											<c:if test="${endDate < today}">
												<td><span class="badge badge-secondary">종료</span></td>
											</c:if>
											<c:if test="${endDate >= today}">
												<td><span class="badge badge-primary">진행중</span></td>
											</c:if>
											<c:if test="${ProjManaVO.deleteWhth ne '0'}">
												<td><span class="badge badge-danger">중단</span></td>
											</c:if>
										
											<td><fmt:formatDate value="${ProjManaVO.projCreatnDate}" pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${ProjManaVO.projStrtDate}" pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${ProjManaVO.projEndDate}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left;">
										<button type="button" class="btn"
											style="background-color: #546E7A; color: white;">삭제</button>
									</div>
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate" style="padding-left: 470px;">
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

</body>
<!-- END: Body-->

</html>

<script>

	function f_projInfo(param) {
		
		let v_open = "/main/adminProjDetail?projId="+param;
		

		let v_option = "width=700, height=855, top=100px, left=450px, scrollbars=yes";
		
		window.open(v_open, "프로젝트 정보", v_option);
		
	}

</script>