<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript"
        src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/join.css">


<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/join.js"></script>
<script src="/resources/js/common.js"></script>
<!DOCTYPE html>
<head>
    <title>마이 페이지 - 초대/신청 현황 조회</title>
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/forms/validation/form-validation.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/datatables.min.css">
    <script>

        function fn_approve(memCode, projId) {
            console.log(memCode);
            console.log(projId);
            $.ajax({
                url: "/main/approveProject",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                        $("sbscrMmbtn").css('display', 'none');
                    } else {
                        alert("실패");
                    }
                }
            });
        }

        function fn_companion(memCode, projId) {
            console.log(memCode);
            console.log(projId);
            $.ajax({
                url: "/main/projectCompanionship",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                    } else {
                        alert(${msg});
                    }
                }
            });
        }

        function fn_acceptInvitationBtn(memCode , projId) {
            alert(memCode+":"+projId);
            $.ajax({
                url: "/main/acceptInvitation",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                    } else {
                        alert("실패");
                    }
                }
            });
        }

        function fn_refusalInvitation(memCode,projId) {
            alert(memCode+":"+projId);
            $.ajax({
                url: "/main/refusalInvitation",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                    } else {
                        alert("실패");
                    }
                }
            });
        }

    </script>
</head>

<body>
<!-- BEGIN: Content-->
<!-- users edit start -->
<div style="margin-top: 50px;" class="content-header-left col-md-6 col-12 mb-2">
    <h3 class="content-header-title mb-0"><b>초대/신청 현황 조회</b></h3>
    <div class="row breadcrumbs-top">
        <div class="breadcrumb-wrapper col-12"></div>
    </div>
</div>
<section class="users-edit">
    <div class="card" style="width: 65%;height: 250px">
        <div class="card-content">
            <div class="card-body">
                <ul class="nav nav-tabs mb-2" role="tablist">
                    <li class="nav-item"><a class="nav-link d-flex align-items-center active" id="account-tab"
                                            data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                            aria-selected="true"> <i class="feather icon-user mr-25"></i><span
                            class="d-none d-sm-block">초대된 프로젝트</span></a></li>
                    <li class="nav-item"><a
                            class="nav-link d-flex align-items-center" id="information-tab"
                            data-toggle="tab" href="#information" aria-controls="information"
                            role="tab" aria-selected="false">
                    </a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="account"
                         aria-labelledby="account-tab" role="tabpanel">
                        <!-- users edit account form start -->
                        <form novalidate>
                            <div class="col-xl-8 col-lg-12" style="overflow: auto;">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="table-responsive">
                                            <table id="recent-orders"
                                                   class="table table-hover mb-0 ps-container ps-theme-default">
                                                <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>프로젝트 아이디</th>
                                                    <th>프로젝트 이름</th>
                                                    <th>승인 여부</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" items="${invitationWaitingList}" varStatus="idx">
                                                    <tr>
                                                        <td class="text-truncate">${idx.count}</td>
                                                        <td class="text-truncate"><a href="#">${item.projId}</a></td>
                                                        <td class="text-truncate">${item.projName}</td>
                                                        <td class="text-truncate">
                                                            <button type="button" class="btn btn-success btn-sm"
                                                                    onclick="fn_acceptInvitationBtn('${item.memCode}','${item.projId}' )">수락</button>
                                                            <button type="button" class="btn btn-danger btn-sm"
                                                                    onclick="fn_refusalInvitation('${item.memCode}','${item.projId}' )">거절
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- users edit account form ends -->
                    </div>


                    <!---------------------------------------------------------------------------------------------------->
                    <div class="tab-pane" id="information"
                         aria-labelledby="information-tab" role="tabpanel">
                        <!-- users edit Info form start -->
                        <!-- users edit Info form ends -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card" style="width: 65%;height: 250px;margin-top: 100px;">
        <div class="card-content">
            <div class="card-body">
                <ul class="nav nav-tabs mb-2" role="tablist">
                    <li class="nav-item"><a
                            class="nav-link d-flex align-items-center active" id="invite-tab"
                            data-toggle="tab" href="#invite" aria-controls="invite"
                            role="tab" aria-selected="true"> <i
                            class="feather icon-user mr-25"></i><span
                            class="d-none d-sm-block">신청한 프로젝트</span>
                    </a></li>
                    <li class="nav-item"><a
                            class="nav-link d-flex align-items-center" id="apply-tab"
                            data-toggle="tab" href="#apply" aria-controls="apply" role="tab"
                            aria-selected="false"> <i class="feather icon-info mr-25"></i><span
                            class="d-none d-sm-block">신청한 회원</span>
                    </a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="invite"
                         aria-labelledby="invite-tab" role="tabpanel">
                        <!-- users edit account form start -->
                        <form novalidate>
                            <div class="col-xl-8 col-lg-12">
                                <div class="card" style="">
                                    <div class="card-content">
                                        <div class="table-responsive">
                                            <table id="recent-orders"
                                                   class="table table-hover mb-0 ps-container ps-theme-default">
                                                <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>프로젝트명</th>
                                                    <th>신청인</th>
                                                    <th>승인 여부</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" items="${projectsApplied}" varStatus="status">
                                                    <tr>
                                                        <td class="text-truncate">${status.count}</td>
                                                        <td class="text-truncate"><a href="#">${item.projId}</a></td>
                                                        <td class="text-truncate">${mvo.member.memName}</td>
                                                        <td class="text-truncate"><span
                                                                class="badge badge-warning">대기중</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- users edit account form ends -->
                    </div>
                    <div class="tab-pane" id="apply" aria-labelledby="apply-tab"
                         role="tabpanel">
                        <!-- users edit Info form start -->
                        <form novalidate>
                            <div class="col-xl-8 col-lg-12">
                                <div class="card" style="">
                                    <div class="card-content">
                                        <div class="table-responsive">
                                            <table id="recent-orders"
                                                   class="table table-hover mb-0 ps-container ps-theme-default">
                                                <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>프로젝트명</th>
                                                    <th>신청인</th>
                                                    <th>초대 승인</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <c:forEach var="item" items="${memberWhoApplied}" varStatus="status">
                                                    <div>
                                                    </div>
                                                    <tr>
                                                        <td class="text-truncate">&nbsp;${status.count}</td>
                                                        <td class="text-truncate">${item.projId}</td>
                                                        <td class="text-truncate">${mvo.member.memName}</td>
                                                        <td class="text-truncate">
                                                            <button type="button" id="sbscrMmbtn"
                                                                    class="btn btn-success btn-sm"
                                                                    onclick="fn_approve('${item.memCode}','${item.projId}' )">
                                                                승인
                                                            </button>
                                                            <button type="button" id="companionButton"
                                                                    class="btn btn-danger btn-sm"
                                                                    onclick="fn_companion('${item.memCode}','${item.projId}' )">
                                                                반려
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- users edit Info form ends -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/page-users.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/navs/navs.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/tables/datatables/datatable-styling.js"></script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>