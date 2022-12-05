<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<!-- Topbar -->
<nav
	class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-static-top navbar-light navbar-border navbar-brand-center fixed-top"
	data-nav="brand-center">
	<div class="navbar-wrapper">
		<div class="navbar-header">
			<ul class="nav navbar-nav flex-row">
				<li class="nav-item mobile-menu d-md-none mr-auto"><a
					class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i
						class="feather icon-menu font-large-1"></i></a></li>
				<li class="nav-item"><a class="navbar-brand"
										href="${pageContext.request.contextPath}/main/page" ><img
						class="brand-logo" alt="stack admin logo"
						src="${pageContext.request.contextPath}/resources/logoImage/logo.jpg"  style="width: 100px; height: auto;">
						 </a></li>
				<li class="nav-item d-md-none"><a
					class="nav-link open-navbar-container" data-toggle="collapse"
					data-target="#navbar-mobile"><i class="fa fa-ellipsis-v"></i></a></li>
			</ul>
		</div>
		<div class="navbar-container container center-layout">
			<div class="collapse navbar-collapse" id="navbar-mobile">
				<ul class="nav navbar-nav mr-auto float-left">
					<li class="nav-item d-none d-md-block"><a
						class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i
							class="feather icon-menu"></i></a></li>
					<li class="dropdown nav-item mega-dropdown d-none d-lg-block"><a
						class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">Mega</a>
						<!-- 드랍다운 방식 시작 ================================================-->
						<ul class="mega-dropdown-menu dropdown-menu row p-1">
							<li class="col-md-4 bg-mega p-2">
								<h3 class="text-white mb-1 font-weight-bold">Mega Menu
									Sidebar</h3>
								<p class="text-white line-height-2">Candy canes bonbon
									toffee. Cheesecake dragée gummi bears chupa chups powder
									bonbon. Apple pie cookie sweet.</p>
								<button class="btn btn-outline-white">Learn More</button>
							</li>
							<li class="col-md-5 px-2">
								<h6 class="font-weight-bold font-medium-2 ml-1">Apps</h6>
								<ul class="row mt-2">
									<li class="col-6 col-xl-4"><a
										class="text-center mb-2 mb-xl-3" href="app-email.html"
										target="_blank"><i
											class="feather icon-mail font-large-1 mr-0"></i>
											<p class="font-medium-2 mt-25 mb-0">Email</p> </a></li>
									<li class="col-6 col-xl-4"><a
										class="text-center mb-2 mb-xl-3" href="app-chat.html"
										target="_blank"><i
											class="feather icon-message-square font-large-1 mr-0"></i>
											<p class="font-medium-2 mt-25 mb-0">Chat</p> </a></li>
									<li class="col-6 col-xl-4"><a
										class="text-center mb-2 mb-xl-3 mt-75 mt-xl-0"
										href="app-todo.html" target="_blank"><i
											class="feather icon-check-square font-large-1 mr-0"></i>
											<p class="font-medium-2 mt-25 mb-0">Todo</p> </a></li>
									<li class="col-6 col-xl-4"><a
										class="text-center mb-2 mt-75 mt-xl-0" href="app-kanban.html"
										target="_blank"><i
											class="feather icon-file-plus font-large-1 mr-0"></i>
											<p class="font-medium-2 mt-25 mb-50">Kanban</p> </a></li>
									<li class="col-6 col-xl-4"><a
										class="text-center mb-2 mt-75 mt-xl-0"
										href="app-contacts.html" target="_blank"><i
											class="feather icon-users font-large-1 mr-0"></i>
											<p class="font-medium-2 mt-25 mb-50">Contacts</p> </a></li>
									<li class="col-6 col-xl-4"><a
										class="text-center mb-2 mt-75 mt-xl-0"
										href="invoice-template.html" target="_blank"><i
											class="feather icon-printer font-large-1 mr-0"></i>
											<p class="font-medium-2 mt-25 mb-50">Invoice</p> </a></li>
								</ul>
							</li>
							<li class="col-md-3">
								<h6 class="font-weight-bold font-medium-2">Components</h6>
								<ul class="row mt-1 mt-xl-2">
									<li class="col-12 col-xl-6 pl-0">
										<ul class="mega-component-list">
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-alerts.html" target="_blank">Alert</a></li>
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-callout.html" target="_blank">Callout</a></li>
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-buttons-basic.html" target="_blank">Buttons</a></li>
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-carousel.html" target="_blank">Carousel</a></li>
										</ul>
									</li>
									<li class="col-12 col-xl-6 pl-0">
										<ul class="mega-component-list">
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-dropdowns.html" target="_blank">Drop
													Down</a></li>
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-list-group.html" target="_blank">List
													Group</a></li>
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-modals.html" target="_blank">Modals</a></li>
											<li class="mega-component-item"><a class="mb-1 mb-xl-2"
												href="component-pagination.html" target="_blank">Pagination</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul></li>
					<li class="nav-item nav-search"><a
						class="nav-link nav-link-search" href="#"><i
							class="ficon feather icon-search"></i></a>
						<div class="search-input">
							<input class="input" type="text" placeholder="Explore Stack..."
								tabindex="0" data-search="template-search">
							<div class="search-input-close">
								<i class="feather icon-x"></i>
							</div>
							<ul class="search-list"></ul>
						</div></li>
				</ul>
				<ul class="nav navbar-nav float-right">
					<li class="dropdown dropdown-language nav-item">
						<div class="dropdown-menu" aria-labelledby="dropdown-flag">
							<a class="dropdown-item" href="#" data-language="en"><i
								class="flag-icon flag-icon-us"></i> English</a><a
								class="dropdown-item" href="#" data-language="fr"><i
								class="flag-icon flag-icon-fr"></i> French</a><a
								class="dropdown-item" href="#" data-language="pt"><i
								class="flag-icon flag-icon-pt"></i> Portuguese</a><a
								class="dropdown-item" href="#" data-language="de"><i
								class="flag-icon flag-icon-de"></i> German</a>
						</div></li>
					<li class="dropdown dropdown-notification nav-item"><a
						class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i
							class="ficon feather icon-bell"></i><span
							class="badge badge-pill badge-danger badge-up">5</span></a>
						<ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
							<li class="dropdown-menu-header">
								<h6 class="dropdown-header m-0">
									<span class="grey darken-2">Notifications</span><span
										class="notification-tag badge badge-danger float-right m-0">5
										New</span>
								</h6>
							</li>
							<li class="scrollable-container media-list ps"><a
								href="javascript:void(0)">
									<div class="media">
										<div class="media-left align-self-center">
											<i class="feather icon-plus-square icon-bg-circle bg-cyan"></i>
										</div>
										<div class="media-body">
											<h6 class="media-heading">You have new order!</h6>
											<p class="notification-text font-small-3 text-muted">Lorem
												ipsum dolor sit amet, consectetuer elit.</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">30 minutes ago</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left align-self-center">
											<i
												class="feather icon-download-cloud icon-bg-circle bg-red bg-darken-1"></i>
										</div>
										<div class="media-body">
											<h6 class="media-heading red darken-1">99% Server load</h6>
											<p class="notification-text font-small-3 text-muted">Aliquam
												tincidunt mauris eu risus.</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Five hour ago</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left align-self-center">
											<i
												class="feather icon-alert-triangle icon-bg-circle bg-yellow bg-darken-3"></i>
										</div>
										<div class="media-body">
											<h6 class="media-heading yellow darken-3">Warning
												notifixation</h6>
											<p class="notification-text font-small-3 text-muted">Vestibulum
												auctor dapibus neque.</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Today</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left align-self-center">
											<i class="feather icon-check-circle icon-bg-circle bg-cyan"></i>
										</div>
										<div class="media-body">
											<h6 class="media-heading">Complete the task</h6>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Last week</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left align-self-center">
											<i class="feather icon-file icon-bg-circle bg-teal"></i>
										</div>
										<div class="media-body">
											<h6 class="media-heading">Generate monthly report</h6>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Last month</time></small>
										</div>
									</div>
							</a>
							<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
									<div class="ps__thumb-x" tabindex="0"
										style="left: 0px; width: 0px;"></div>
								</div>
								<div class="ps__rail-y" style="top: 0px; right: 0px;">
									<div class="ps__thumb-y" tabindex="0"
										style="top: 0px; height: 0px;"></div>
								</div></li>
							<li class="dropdown-menu-footer"><a
								class="dropdown-item text-muted text-center"
								href="javascript:void(0)">Read all notifications</a></li>
						</ul></li>
					<li class="dropdown dropdown-notification nav-item">
						<ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
							<li class="dropdown-menu-header">
								<h6 class="dropdown-header m-0">
									<span class="grey darken-2">Messages</span><span
										class="notification-tag badge badge-warning float-right m-0">4
										New</span>
								</h6>
							</li>
							<li class="scrollable-container media-list ps"><a
								href="javascript:void(0)">
									<div class="media">
										<div class="media-left">
											<div class="avatar avatar-online avatar-sm rounded-circle">
												<img
													src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-1.png"
													alt="avatar"><i></i>
											</div>
										</div>
										<div class="media-body">
											<h6 class="media-heading">Margaret Govan</h6>
											<p class="notification-text font-small-3 text-muted">I
												like your portfolio, let's start.</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Today</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left">
											<span class="avatar avatar-sm avatar-busy rounded-circle"><img
												src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body">
											<h6 class="media-heading">Bret Lezama</h6>
											<p class="notification-text font-small-3 text-muted">I
												have seen your work, there is</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Tuesday</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left">
											<div class="avatar avatar-online avatar-sm rounded-circle">
												<img
													src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-3.png"
													alt="avatar"><i></i>
											</div>
										</div>
										<div class="media-body">
											<h6 class="media-heading">Carie Berra</h6>
											<p class="notification-text font-small-3 text-muted">Can
												we have call in this week ?</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">Friday</time></small>
										</div>
									</div>
							</a><a href="javascript:void(0)">
									<div class="media">
										<div class="media-left">
											<span class="avatar avatar-sm avatar-away rounded-circle"><img
												src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-6.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body">
											<h6 class="media-heading">Eric Alsobrook</h6>
											<p class="notification-text font-small-3 text-muted">We
												have project party this saturday.</p>
											<small> <time class="media-meta text-muted"
													datetime="2015-06-11T18:29:20+08:00">last month</time></small>
										</div>
									</div>
							</a>
							<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
									<div class="ps__thumb-x" tabindex="0"
										style="left: 0px; width: 0px;"></div>
								</div>
								<div class="ps__rail-y" style="top: 0px; right: 0px;">
									<div class="ps__thumb-y" tabindex="0"
										style="top: 0px; height: 0px;"></div>
								</div></li>
							<li class="dropdown-menu-footer"><a
								class="dropdown-item text-muted text-center"
								href="javascript:void(0)">Read all messages</a></li>
						</ul></li>
					<li class="dropdown dropdown-user nav-item">
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="user-profile.html"><i
								class="feather icon-user"></i> Edit Profile</a><a
								class="dropdown-item" href="app-email.html"><i
								class="feather icon-mail"></i> My Inbox</a><a class="dropdown-item"
								href="user-cards.html"><i class="feather icon-check-square"></i>
								Task</a><a class="dropdown-item" href="app-chat.html"><i
								class="feather icon-message-square"></i> Chats</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="login-with-bg-image.html"><i
								class="feather icon-power"></i> Logout</a>
						</div></li>
				</ul>
				<button type="button" id="loginBtn" class="btn btn-outline-secondary"><i class="fa fa-plug"></i>로그인</button>
				<button type="button" id="signUpBtn" class="btn btn-outline-secondary"><i class="fa fa-user-o"></i> 회원가입</button>
			</div>
		</div>
	</div>
</nav>

<!-- End of Topbar -->

<script type="text/javascript">
	$("#loginBtn").on("click", function() {
		location.href="/main/loginForm";	
	});
	
	$("#signUpBtn").on("click", function() {
		location.href="/main/signUpForm";	
	});
</script>

<!-- BEGIN: Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jquery.knob.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/extensions/knob.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/raphael-min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/morris.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jvector/jquery-jvectormap-2.0.3.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jvector/jquery-jvectormap-world-mill.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/data/jvector/visitor-data.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/chart.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/unslider-min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/dashboard-analytics.js"></script>
<!-- END: Page JS-->
