<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<!DOCTYPE html>

<style>
    td {
        padding-right: 53px;
        text-align: center;
    }

    .card-content {
        overflow: auto;
    }
</style>
<h3 class="text-uppercase">
    <b>하차 신청 멤버</b>
</h3>

<script>
    function fn_delete(memCode, projId) {
        alert(memCode);
        alert(projId);
        $.ajax({
            url: "/proj/dropMemListProcessing",
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
                    location.href = "redirect:/main/page";
                }
            }
        });
    }


    function fn_expulsionBtn(memCode , projId){
        alert(memCode);
        alert(projId);
        $.ajax({
            url: "/proj/extractionParticipants",
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
                    location.href = "redirect:/main/page";
                }
            }
        });
    }


    function fn_invitationBtn(memCode, projId , msg) {
        alert(memCode);
        alert(projId);
        $.ajax({
            url: "/proj/sendInvitation",
            type: "post",
            data: {"memCode": memCode, "projId": projId },
            dataType: "json",
            beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (division) {
                if (division == 1) {
                    alert("승인완료");
                    var msg = "${mvo.member.memName}이 프로젝트 초대함,"+memCode;
                    socket.send(msg);
                    console.log(msg)
                } else {
                    alert("실패");
                    location.href = "redirect:/main/page";
                }
            }
        });
    }
</script>


<div class="content-wrapper">

    <div class="content-body">
        <!-- Shopping cards section start -->
        <div class="container-fluid">
            <div class="row" style="height: 70px;">
                <div class="col-6  mt-3 mb-1 " style="height: 30px;">
                    <h3 class="text-uppercase ml-5">
                        <b>프로젝트 참여 인원</b>
                        <div id="disp"></div>
                    </h3>
                </div>
                <div class="col-4  mt-3 mb-1 ml-5" style="float: left;">
                    <h3 class="text-uppercase">
                        <b>하차 지원 인원</b>
                    </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 ml-5">
                    <div class="card text-center" style="height: 300px;  width:670px; ">
                        <div class="card-content">
                            <!-- 							<div class="container-fluid" style="width: 100%; height: 100%"> -->
                            <div class="table-responsive">
                                <table id="recent-orders"
                                       class="table table-hover mb-0 ps-container ps-theme-default">
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>회원코드</th>
                                        <th>프로젝트 아이디</th>
                                        <th>상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${ProjectParticipantsMem}" varStatus="idx">
                                        <tr>
                                            <td class="text-truncate">${idx.count}</td>
                                            <td class="text-truncate">${item.memCode}</td>
                                            <td class="text-truncate">${item.projId}</td>
                                            <td class="text-truncate"><span class="badge badge-success">참여</span>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!-- 							</div> -->

                        </div>
                    </div>
                </div>
                <div class="col-lg-5 offset-1">
                    <div class="card" style="height: 300px; width:670px; ">
                        <div class="card-content">
                            <!-- 							<div class="container-fluid"> -->
                            <div class="table-responsive">
                                <table id="recent-orders"
                                       class="table table-hover mb-0 ps-container ps-theme-default">
                                    <thead>
                                    <tr>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번호</th>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원코드</th>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프로젝트
                                            아이디
                                        </th>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;하차 승인</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${dropMemList}" varStatus="idx">
                                        <tr>
                                            <td class="text-truncate">${idx.count}</td>
                                            <td class="text-truncate">${item.memCode}</td>
                                            <td class="text-truncate">${item.projId}</td>
                                            <td class="text-truncate">
                                                <button class="badge badge-danger"
                                                        onclick="fn_delete('${item.memCode}','${item.projId}')">승인
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
            </div>
        </div>
        <div class="container-fluid">
            <div class="row" style="height: 70px;">
                <div class=" col-6  mt-3 mb-1 " style="height: 30p; display: flex;">
                    <h3 class="text-uppercase ml-5">
                        <b> 프로젝트 초대 인원</b>
                    </h3>
                    <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#success"
                            style="margin-bottom: 50px;">신청 목록 보기
                    </button>
                </div>
                <div class="col-4  mt-3 mb-1 ml-5" style="float: left;">
                    <h3 class="text-uppercase">
                        <b>참여 인원 추방</b>
                    </h3>

                </div>
                <%--                ====================--%>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="form-group">

                        <!-- Modal -->
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
                                                <th>번호</th>
                                                <th>회원코드</th>
                                                <th>이름</th>
                                                <th>기술스텍</th>
                                                <th>초대</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${projectInvitationList}" varStatus="idx">
                                            <tr>
                                                <td class="text-truncate">${idx.count}</td>
                                                <td class="text-truncate">${item.memCode}</td>
                                                <td class="text-truncate">${item.memName}</td>
                                                <td class="text-truncate">###</td>
                                                <td class="text-truncate">
                                                    <button id="invitationBtn" class="badge badge-success"
                                                            onclick="fn_invitationBtn('${item.memCode}','${projId}')">초대
                                                    </button>
                                                </td>
                                                </c:forEach>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn grey btn-outline-secondary"
                                                data-dismiss="modal">Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--                ====================--%>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-lg-5 ml-5">
            <div class="card text-center" style="height: 300px; width:670px;">

                <div class="card-content">
                    <!-- 								<div class="container-fluid"> -->
                    <div class="table-responsive">
                        <table id="recent-orders"
                               class="table table-hover mb-0 ps-container ps-theme-default">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>초대코드</th>
                                <th>회원코드</th>
                                <th>상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${unapprovedInvitationList}" varStatus="idx">
                            <tr>
                                <td class="text-truncate">${idx.count}</td>
                                <td class="text-truncate">${item.inviteNum}</td>
                                <td class="text-truncate">${item.memCode}</td>
                                <td class="text-truncate">
                                    <span class="badge badge-success">초대 완료</span>
                                </td>
                            </tr>
                                </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-5 offset-1">
            <div class="card" style="height: 300px; width:670px;">
                <div class="card-content">
                    <div class="container-fluid">
                        <div class="table-responsive">
                            <table id="" class="table table-hover mb-0 ps-container ps-theme-default">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>회원코드</th>
                                    <th>프로젝트 아이디</th>
                                    <th>추방</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${ProjectParticipantsMem}" varStatus="idx">
                                    <tr>
                                        <td class="text-truncate">${idx.count}</td>
                                        <td class="text-truncate">${item.memCode}</td>
                                        <td class="text-truncate">${item.projId}</td>
                                        <td class="text-truncate"><button class="badge badge-danger"  onclick="fn_expulsionBtn('${item.memCode}','${projId}')">추방</button>
                                        </td>
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