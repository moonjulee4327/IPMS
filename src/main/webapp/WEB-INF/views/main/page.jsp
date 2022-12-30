<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>CSS</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <!-- jquery cdn 삽입 -->
    <script src="/resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <style>
        body {
            padding: 0px;
            margin: 0px;
        }

        .jb-box {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 100px auto;
            position: relative;
        }

        video {
            width: 100%;
            height: auto;
            position: relative
        }

        .jb-text {
            position: absolute;
            top: 50%;
            width: 100%;
        }

        .jb-text p {
            margin-top: -24px;
            text-align: center;
            font-size: 48px;
            color: #ffffff;
        }
    </style>


</head>


<!-- /horizontal menu content-->

<video muted autoplay loop>
    <source src="/resources/video/balanty%20portada.mp4" type="video/mp4">
    <strong>Your browser does not support the video tag.</strong>
</video>
<div class="jb-text">
    <p>IPMS </p>
    <br>
    <br>
    <P>Cooperation</P>
</div>


</html>