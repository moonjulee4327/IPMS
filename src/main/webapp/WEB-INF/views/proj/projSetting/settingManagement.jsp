<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<head>
    <title>주문 하기</title>
    <link rel="stylesheet" type="text/css" href="/resources/GatherCss.css">
    <script src="/resources/GatherJs.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <link rel="stylesheet" href="/resources/css/order.css">
    <link rel="stylesheet" href="/resources/stack-admin-v4.0/stack-admin/src/scss/bootstrap-extended.scss">

    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
    <script src="/resources/js/jquery-3.6.0.js"></script>
    <script src="/resources/js/order.js"></script>
    <script src="/resources/js/join.js"></script>
    <script src="/resources/js/common.js"></script>
    <script>


        function handleOnChange(e) {
            // 선택된 데이터 가져오기
            const value = e.value;

            // 데이터 출력
            document.getElementById('result').val(value);
        }
    </script>
</head>
<body>
<div id="wrap">
    <div id="container">
        <div id="main">
            <div id="content">
                <div class="user_form">
                    <h1 class="h1_tit">프로젝트 설정</h1>
                    <div id="itemList" class="page_aticle order_goodslist">
                        <form action="/proj/modifyProjectSettings" method="post" enctype="multipart/form-data">
                            <c:forEach var="item" items="${listProjectSettings}">
                                <div class="order_section data_orderer">
                                    <table class="goodsinfo_table">
                                        <tbody>
                                        <tr class="active">
                                            <th>프로젝트 이름</th>
                                            <td>
                                                <input type="text" id="projName" class="form-control border-primary"
                                                       placeholder="프로젝트 이름" name="projName" value="${item.projName}"/>
                                            </td>

                                        </tr>

                                        <tr class="active">
                                            <th>프로젝트 이미지</th>
                                            <td>
                                                <input type='file' name='uploadFile' multiple/>
                                            </td>

                                        </tr>
                                        <tr class="active">
                                            <th>프로젝트 공개여부</th>
                                            <td>
                                                <select onchange="document.getElementById('projOpnWhth').value = this.options[this.selectedIndex].value">
                                                    <option value='y'>공개</option>
                                                    <option value='n'>비공개</option>
                                                </select>
                                                <input type="hidden" id="projOpnWhth" name="projOpnWhth" value="">
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>프로젝트 기간</th>
                                            <td>
                                                <div style="float: left">
                                                    <fm:formatDate value="${item.projStrtDate}"/>&nbsp;~&nbsp;
                                                </div>
                                                <div style="float:left;">
                                                    <input type="date" id="projEndDate" placeholder="End Date"
                                                           name="projEndDate"/>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <h2 class="tit_section" id="divAddressWrapper">프로젝트 내용
                                    <span class="desc">기본적인 프로젝트에 대한 소개를 작성하세요. </span>
                                </h2>

                                <div class="order_section order_address" id="dataDelivery">
                                    <div class="form-group col-12 mb-2">
                                <textarea id="userinput8" rows="5" class="form-control" name="projSmry"
                                          placeholder="소개">${item.projSmry}</textarea>
                                    </div>
                                </div>
                                <sec:csrfInput/>
                                <input type="hidden" name="projId" value="${projId}">
                                <input type="submit" id="modifyBtn" value="수정하기" class="btn btn-secondary"/>
                                <input type="button" value="탈퇴하기" class="btn btn-danger"/>
                            </c:forEach>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    CKEDITOR.replace('userinput8');
</script>