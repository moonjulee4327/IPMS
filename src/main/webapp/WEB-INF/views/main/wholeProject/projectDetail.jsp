<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript"
        src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<head>
    <style>
        body {
            background-color: #edf1f5;
            margin-top: 20px;
        }

        .card {
            margin-bottom: 30px;
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid transparent;
            border-radius: 0;
        }

        .card .card-subtitle {
            font-weight: 300;
            margin-bottom: 10px;
            color: #8898aa;
        }

        .table-product.table-striped tbody tr:nth-of-type(odd) {
            background-color: #f3f8fa !important
        }

        .table-product td {
            border-top: 0px solid #dee2e6 !important;
            color: #728299 !important;
        }
    </style>
    <script>
    function fn_joinProject(projId){
        $.ajax({
            url: "/main/joinProject",
            type: "post",
            data: {"projId" : projId},
            beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (data) {
                alert("신청을 보냈습니다.")
              location.href="/main/wholeProject";
            },
            error:function(){
                alert("오류입니다.");
                location.href="/main/wholeProject";
            }
        })

    }
    </script>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container" style="margin-top: 50px;">
    <div class="card">
        <div class="card-body">
            <c:forEach var="item" items="${detailList}" varStatus="idx">
            <div style="margin-left: 30px;">
            <h3 class="card-title" style="font-size: xx-large">${item.projName}( <span class="card-subtitle">${projId}</span>)</h3>

            </div>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src="/resources/upload/img/${item.projImgRoute}"
                                                            class="img-responsive"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5"><strong>프로젝트 소개</strong></h4>
                    <br>
                    <p>${item.projSmry}</p>
                    <h2 class="mt-5">
                        <strong>프로젝트 기간</strong><small class="text-success">&nbsp;(<fm:formatDate
                            value="${item.projStrtDate}"/>~<fm:formatDate value="${item.projEndDate}"/>)</small>
                    </h2>
                    <br>
                    </c:forEach>
                    <h3 class="box-title mt-5"><strong>프로젝트 리더Info</strong></h3>
                    <c:forEach var="getDetailLeaderInfo" items="${getDetailLeaderInfo}">
                        <ul class="list-unstyled">
                            <br>
                            <li><i class="fa fa-check text-success"></i>이름 : ${getDetailLeaderInfo.memName}</li>
                            <br>
                            <li><i class="fa fa-check text-success"></i>이메일 : ${getDetailLeaderInfo.memEmail}</li>
                        </ul>
                    </c:forEach>

                    <br>
                    <br>
                    <c:forEach var="item" items="${checkMyProject}">
                        <c:if test="${item.memCode ne mvo.member.memCode}||${ projectsAlreadyApplied ne 1}">
                            <button class="btn btn-secondary btn-rounded" onclick="fn_joinProject('${projId}')">가입하기</button>
                        </c:if>
                    </c:forEach>

                    <button class="btn btn-primary btn-rounded">북마크</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>