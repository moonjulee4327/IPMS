<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script>
        $(document).ready(function () {
            $("#addBtn").on("click", function () {
                $("#addInputBtn").css("display", "block");
            });
        });

        function fn_addStack() {
            let commonCodeValue = $("#commonCodeValue").val();
            let commonCodeEplntn = $("#commonCodeEplntn").val();
            $.ajax({
                type: 'post',
                url: '/main/addSkillStack',
                dataType: 'json',
                data: {"commonCodeValue": commonCodeValue , "commonCodeEplntn":commonCodeEplntn},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data == 1) {
                        alert("추가 되었습니다.");
                        setTimeout(function () {
                            location.reload();
                        });
                    } else {
                        alert(data);
                    }
                }
            });
        }

        function fn_techDelete(param) {

            $.ajax({
                type: 'post',
                url: '/main/clearSkillStack',
                dataType: 'json',
                data: {"commonCodeValue": param},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data == 1) {
                        alert("삭제 되었습니다.");
                        setTimeout(function () {
                            location.reload();
                        });
                    } else {
                        alert(data);
                    }
                }
            });
        }
    </script>
</head>

<body>
<!-- BEGIN: Content-->
<section class="row all-contacts">
    <div class="col-12">
        <div class="card" style="width: 1000px;">
            <div class="card-content">
                <div class="card-header">
                    <h3 style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">기술스텍 관리</h3>
                      <span><button type="button" class="btn btn-sm" data-toggle="modal" data-target="#success" style="margin-bottom: 50px;">신청 목록 보기</button></span>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>기술스텍</th>
                                <th>삭제 버튼</th>
                            </tr>
                            </thead>
                            <c:forEach var="item" items="${list}" varStatus="idx">
                                <tbody>
                                <tr>
                                    <th scope="row">${idx.count}</th>
                                    <td>${item.commonCodeValue}</td>
                                    <td>
                                        <button class="btn mr-1 mb-1 btn-danger btn-sm"
                                                onclick="fn_techDelete('${item.commonCodeValue}')">삭제
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade text-left" id="success" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel9" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success white">
                    <h4 class="modal-title" id="myModalLabel9"> 초대 가능한 인원</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover mb-0 ps-container ps-theme">
                        <thead>
                        <tr>
                            <th>기술스텍</th>
                            <th>소개</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="text" id="commonCodeValue" name="commonCodeValue" class="form-control" placeholder="기술스텍"></td>
                            <td><input type="text" id="commonCodeEplntn" name="commonCodeEplntn" class="form-control" placeholder="소개"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn grey btn-outline-secondary" onclick="fn_addStack()">등록</button>
                    <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
<!-- END: Body-->

</html>
