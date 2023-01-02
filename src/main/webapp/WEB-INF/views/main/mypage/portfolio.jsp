<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<style type="text/css">
.a {
	overflow: auto;
}
</style>

<title>마이페이지 - 포트폴리오</title>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/page-users.css">
<!-- END: Page CSS-->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>
	<!-- BEGIN: Content-->
	<div style="bottom: 30px;"
		class="content-header-left col-md-12 col-10">
		<h3 class="content-header-title mb-0" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
			<b>포트폴리오</b>
		</h3>
		<button type="button" style="width: 110px; margin-left: 1070px;" class="btn btn-secondary btn-block">PDF 다운로드</button>
	</div>
	<div class="content-body" style="width: 1200px;">
		<!-- users view start -->
		<section class="users-view">
			<!-- users view card data start -->
			<div class="card">
				<div class="card-content">
					<div class="card-body">
						<div class="">
							<div class="col-12 col-md-12">
								<div>
									<div class="media mb-2">
										<a class="mr-1" href="#"> <img
											src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-26.png"
											alt="users view avatar"
											class="users-avatar-shadow rounded-circle" height="64"
											width="64">
										</a>
										<div class="media-body pt-25"> 
											<h4 class="media-heading" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
												<!-- 회원 이름 -->
												<span class="users-view-name">${member.memName}</span>
											</h4>
											<!-- 회원 아이디 -->
											<span class="users-view-id">${member.memEmail}</span>
										</div>
									</div>
								</div>
								<div style="display: flex;">
									<label class="badge badge-secondary round"
									style="width: 80px; float: left;">분야 </label>
									<!-- 분야 -->
									<div style="float: right;">&nbsp; 퍼블리셔</div>
								</div>
								<div style="display: flex;">
									<label class="badge badge-secondary round"
										style="width: 80px; float: left;">기술스택 </label>
									<!-- 기술 스택 -->
									<div style="float: right;">&nbsp; 이문주</div>
								</div>
							</div>
							<div style="display: flex; padding-left: 25px;">
								<div style="float: left; width: 550px;">
									<div class="">
										<div class="table-responsive">
											<span class="badge badge-success"
												style="height: 30px; font-size: 15px; margin-top: 30px; margin-bottom: 10px;">완료한
												프로젝트</span>
											<div class="a">
												<table class="table mb-0">
													<thead>
														<tr>
															<th style="color: #0D47A1;">프로젝트 명</th>
															<th style="color: #0D47A1;">프로젝트 기간</th>
															<th style="color: #0D47A1;">역할</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="completeProjSelect" items="${completeProjSelect}">
														<tr>
															<td>${completeProjSelect.projName}</td>
															<td><fmt:formatDate value="${completeProjSelect.projStrtDate}" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${completeProjSelect.projEndDate}" pattern="yyyy-MM-dd"/></td>
															<td>${completeProjSelect.memAuth}</td>
														</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
									<div style="float: right; width: 550px; padding-left: 30px;">
									<div class="">
										<div class="table-responsive">
											<span class="badge badge-info"
												style="height: 30px; font-size: 15px; margin-top: 30px; margin-bottom: 10px;">진행중인
												프로젝트</span>
											<table class="table mb-0">
												<thead>
													<tr>
														<th style="color: #0D47A1;">프로젝트 명</th>
														<th style="color: #0D47A1;">프로젝트 기간</th>
														<th style="color: #0D47A1;">역할</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="proceedingProjSelect" items="${proceedingProjSelect}">
														<tr>
															<td>${proceedingProjSelect.projName}</td>
															<td><fmt:formatDate value="${proceedingProjSelect.projStrtDate}" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${proceedingProjSelect.projEndDate}" pattern="yyyy-MM-dd"/></td>
															<td>${proceedingProjSelect.memAuth}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- users view card data ends -->
		</section>
		<!-- users view ends -->
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/page-users.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>