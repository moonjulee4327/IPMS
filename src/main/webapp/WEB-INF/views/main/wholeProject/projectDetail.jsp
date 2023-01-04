<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mvo"
	value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="auth"
	value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
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
                alert("이미 신청한 프로젝트입니다.");
                location.href="/main/wholeProject";
            }
        })

    }
    </script>
</head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<body>
	<div class="container" style="margin-top: 30px;">
		<div class="card">
			<div class="card-body">
				<div class="row" style="margin: 3%; align-items: center;">
					<div class="col-5" style="align-items: center">
						<c:forEach var="item" items="${detailList}" varStatus="idx">
							<div>
								<img src="/resources/upload/img/${item.projImgRoute}"
									class="img-responsive">
							</div>
					</div>
					<div class="col-7" style="padding-left: 55px; align-items: center;">
						<div>
							<h2 class="text-primary"
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
								${item.projName}(<span class="card-subtitle">${projId}</span>)
							</h2>
						</div>
						<hr>
						<div style="padding-top: 10px; padding-bottom: 30px;">
							<h4
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
								<strong>프로젝트 기간</strong><small class="text-primary">&nbsp;(<fmt:formatDate
										value="${item.projStrtDate}" />~<fmt:formatDate
										value="${item.projEndDate}" />)
								</small>
							</h4>
						</div>
						<div style="padding-bottom: 6px;">
							<h4
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
								<strong>프로젝트 리더</strong>
							</h4>
						</div>
						<div>
							<c:forEach var="getDetailLeaderInfo"
								items="${getDetailLeaderInfo}">
								<ul class="list-unstyled">
									<li><i class="fa fa-check text-success"></i>&nbsp;이름 :
										${getDetailLeaderInfo.memName}</li>
								</ul>
							</c:forEach>
						</div>
						<div>
							<h4
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum; padding-top: 20px; padding-bottom: 20px;">
								<strong>프로젝트 소개</strong>
							</h4>
							<div class="form-control border-secondary"
								style="width: 627px; height: 220px; overflow: auto; padding-bottom: 10px;">
								<p>${item.projSmry}</p>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="row"
					style="width: 38%; justify-content: center; align-items: center; padding-left: 80px;">
					<div>
						<c:forEach var="item" items="${checkMyProject}">
							<c:if test="${item.memCode ne mvo.member.memCode}">
								<button class="btn btn-secondary btn-rounded"
									onclick="fn_joinProject('${projId}')">가입 신청</button>
							</c:if>
						</c:forEach>
					</div>
					<div>
						<button class="btn btn-primary btn-rounded" style="margin: 10px;">북마크</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 입력 창----------------------------------------------------------------------- -->
		<div class="card mb-2" style="width: 1340px; height: auto;"
			id="inputCmt">
			<div class="card-body">
				<div>
					<form class="form-horizontal">
						<div class="row">
							<div class='col-sm-10'>
								<input type="text" class="form-control" id="projSmryCmtCts"
									name="projSmryCmtCts" placeholder="내용을 입력하세요." />
							</div>
							<div class='col-sm-2'>
								<button type="button" class="btn btn-secondary"
									style="width: 150px;" id="projCmtAdd">댓글 등록</button>
							</div>
						</div>
						<input type="hidden" class="form-control" id="projBdCmtId" name="projBdCmtId" value="${ProjSmryCmtVO.projSmryCmtNum}">
						<input type="hidden" class="form-control" id="memCode" name="memCode" value="${ProjSmryCmtVO.memCode}">
						<input type="hidden" class="form-control" id="projId" name="projId" value="${projId}">
					</form>
				</div>
			</div>
		</div>
		<!-- 댓글 입력 창 끝 ------------------------------------------------------------------------->
		<div class="card mb-2 card border-top-info border-top-2 box-shadow-0"
			style="width: 1340px; height: auto;">
			<div class="card-header"
				style="padding: 13px; color: #455A64; font-size: 15px;">
				Comments&nbsp;<i class="fa fa-comment fa"></i>
			</div>
			<div class="card-body" id="cmtList">
				<div class="user-block">
					<!-- ------------------------------------------------- -->
					<c:forEach var="ProjSmryCmtVO" items="${dataCmt}">
						<c:if test="${ProjSmryCmtVO.highCmtId eq null}">
							<!-- 상위댓글 view -->
							<div>
							<form style="padding-bottom: 10px;" class='form-horizontal'>
								<div class='user-block'>
									<div>
										<div style='padding-bottom: 5px;'>
											<div style='font-size: 15px; color:#02b5b8;'>
												<i class='fa fa-user-o'></i>&nbsp;&nbsp;<b>${ProjSmryCmtVO.memCode}</b>
											</div>
											<span class='username'> <span style='font-size: 8px; color: grey;'>
												<fmt:formatDate value="${ProjSmryCmtVO.projSmryCmtWriteDate}" pattern="yyyy-MM-dd HH:mm" /></span>
											</span>
										</div>
										<div id="cmtCts" style="display:flex; align-items:center;">
											<div>${ProjSmryCmtVO.projSmryCmtCts}</div>&nbsp;&nbsp;
											<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<div>
													<a style='font-size: 12px; text-decoration: underline;' type='button'>댓글작성</a>&nbsp;&nbsp;
													<a style='color: red; font-size: 12px; text-decoration: underline;' id='cmtDelete' type='button'>삭제</a>
			                            			<a style='color: grey; font-size: 12px; text-decoration: underline;' id='cmtModify' type='button'>수정</a>
												</div>
	                            			</div>
										</div>
									</div>
								</div>
								<input type="hidden" class="form-control" id="projSmryCmtNum" name="projSmryCmtNum" value="${ProjSmryCmtVO.projSmryCmtNum}">
								<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
							</form>
							<!-- ------------------------------------------------ -->
							</div>
						</c:if>
						<!-- 하위댓글 view -->
						<c:forEach var="ProjSmryCmtVO2" items="${dataCmt}">
							<c:if test="${ProjSmryCmtVO.projSmryCmtNum eq ProjSmryCmtVO2.highCmtId}">
								<div>
									<form style="padding-bottom: 10px;" class='form-horizontal'>
										<div>
											<div style="padding-bottom: 5px;" id="${ProjSmryCmtVO2.projSmryCmtNum}">
												<span class="username"> </span>
												<div style="font-size: 15px; color:#3B4897;">
													<i class="feather icon-corner-down-right"></i><b>${ProjSmryCmtVO2.memCode}</b><i
													class="feather icon-user"></i> <span
													style="font-size: 8px; color: grey;"><fmt:formatDate value="${ProjSmryCmtVO2.projSmryCmtWriteDate}" pattern="yyyy-MM-dd HH:mm" /></span>
												</div>
											</div>
											<div id="modidiv51" style="display: flex;">
												<div style="display: flex;" id="repContent51">&nbsp;&nbsp;&nbsp;&nbsp;${ProjSmryCmtVO2.projSmryCmtCts}&nbsp;&nbsp;</div>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input style="width: 400px;" type="hidden" id="repInput51" value="${ProjSmryCmtVO2.projSmryCmtCts}">
												<a style="color: red; font-size: 12px; text-decoration: underline;" id="cmtDelete51" onclick="" type="button">삭제</a>
												&nbsp;
												<a style="color: grey; font-size: 12px; text-decoration: underline;" id="cmtModify51" onclick="" type="button">수정</a>
											</div>
										</div>
										<br>
										<input type="hidden" class="form-control" id="projSmryCmtNum" name="projSmryCmtNum" value="${ProjSmryCmtVO2.projSmryCmtNum}">
										<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
									</form>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
												<!-- <input type="text" id="projSmryCmtCts" name="projSmryCmtCts"
<%-- 												value="${ProjSmryCmtVO.projSmryCmtCts}" style="display: none; width: 500px; height: 35px;" /> --%> -->

<script type="text/javascript">

var mine = "${mvo.member.memCode}";

// 댓글 등록
	$("#projCmtAdd").on("click",function() {
		
		alert("댓글 등록 떠라");
		
		let projId = $("#projId").val();
		let projSmryCmtNum = $("#projSmryCmtNum").val();		// 댓글 번호
		let memCode = mine;						// 댓글 작성자
		let projSmryCmtCts = $("#projSmryCmtCts").val();		// 댓글 내용
		
		console.log("projId: " + projId);
		console.log("projSmryCmtNum: " + projSmryCmtNum);
		console.log("memCode: " + memCode);
		console.log("projSmryCmtCts: " + projSmryCmtCts);
	
		let data = {"projId":projId,"projSmryCmtNum":projSmryCmtNum,"memCode":memCode,"projSmryCmtCts":projSmryCmtCts};	
		
		$.ajax({
			url:"/main/{projId}/projCmtInsert",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
	   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				console.log("result : " + result);
				
				alert("댓글 작성 성공!");
	
				location.reload();
			},
			error:function(request,status,error){
	            alert("댓글 작성 실패. 다시 시도해주세요.");
	        }
		});	// ajax end
		
		$("#projSmryCmtCts").val("");
		
});

</script>

</body>
</html>