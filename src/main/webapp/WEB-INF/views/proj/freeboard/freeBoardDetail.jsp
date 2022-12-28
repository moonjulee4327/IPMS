<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<input type="text" id="projBdId0" name="projBdId0" value="${param.projBdId}" />
<input type="text" id="writer0" name="writer0" value="<sec:authentication property='principal.member.memCode'/>" />

<!DOCTYPE html>
<!-- BEGIN: Head-->
<head>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body>

	<!-- BEGIN: Content-->
	<div class="content-wrapper">
		<!-- 		<div class="content-header row justify-content-md-center" style="text-align:center;"> -->
		<!-- 			<div class="content-header-left col-md-6 col-12 mb-2"> -->
		<!-- 				<h3 class="content-header-title mb-0">FREE BOARD DETAIL</h3> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<div class="content-body">
			<!-- App invoice wrapper -->
			<section class="app-invoice-wrapper">
				<div class="row justify-content-md-center">
					<div style="width: 1200px;">
						<!-- using a bootstrap card -->
							<div class="card">
								<!-- card body -->
								<div class="card-body p-2">
									<!-- card-header -->
									<div class="card-header px-0">
										<div class="row">
											<div class="col-md-12 col-lg-7 col-xl-4 mb-50">
												<span class="invoice-id font-weight-bold">No. </span> <span>${data.projBdId}</span>
												<input type="hidden" class="form-control" id="projBdId" name="projBdId" value="${data.projBdId}">
											</div>
											<div class="col-md-12 col-lg-5 col-xl-8">
												<div
													class="d-flex align-items-center justify-content-end justify-content-xs-start">
													<div class="issue-date pr-2">
														<span><fmt:formatDate value="${data.projBdWriteDate}" pattern="yyyy-MM-dd" /></span>
														<input type="hidden" class="form-control" id="projBdWriteDate" name="projBdWriteDate"
															value="${data.projBdWriteDate}">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="invoice-logo-title row py-2">
										<div
											class="col-6 d-flex flex-column justify-content-center align-items-start">
											<h2 class="text-primary"
												style="font-family: 'MICEGothic Bold';">${data.projBdTitle}</h2>
											<input type="hidden" class="form-control" id="projBdTitle" name="projBdTitle" value="${data.projBdTitle}">
											<span>작성자: ${data.writer}</span>
											<input type="hidden" class="form-control" id="writer" name="writer" value="${data.writer}">
										</div>
									</div>
									<hr>

									<!-- 글 내용 -->
									<div class="row invoice-adress-info py-2">
										<div class="col-6 mt-1 from-info">
											${data.projBdCts}
											<input type="hidden" class="form-control" id="projBdCts" name="projBdCts" value="${data.projBdCts}">
										</div>
									</div>
									<hr>
<!-- 								<div class="form-group" id="itgrnAttachFileNum"> -->
<!-- 									<label for="itgrnAttachFileNum"><i -->
<!-- 										class="feather icon-link"></i>첨부파일:</label><br> -->

<!-- 									</label> -->
<!-- 								</div> -->
								<div style="float: right;">
										<button type="button" class="btn btn-danger" id="freeDel">
											<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
										</button>
<!-- 										<button type="button" class="btn btn-secondary" id="updateFree"> -->
<!-- 											<i class="feather icon-edit mr-25 common-size"></i>수정 -->
<!-- 										</button> -->
										<a href="/proj/freeBoardUpdate?projBdId=${data.projBdId}" class="btn btn-warning">
											<i class="feather icon-edit mr-25 common-size"></i>수정
										</a> <a href="/proj/{projId}/freeboard" class="btn btn-secondary"><i
											class="fa fa-reply-all mr-25 common-size"></i>목록</a>
									</div>
								</div>
							</div>
						<input type="hidden" class="form-control" id="projId" name="projId" value="${data.projId}">
						<input type="hidden" class="form-control" id="deleteYn" name="deleteYn" value="${data.deleteYn}">
					</div>
					<!-- ---------------------- 댓글 입력 창 ------------------------------ -->					
					<div class="card mb-2" style="width: 1200px; height: auto;" id="inputCmt">
						<div class="card-body">
							<div>
								<form class="form-horizontal">
									<div class="row">
										<div class='col-sm-10'>
											<input type="text" class="form-control" id="projBdCmtCts" name="projBdCmtCts"
												placeholder="내용을 입력하세요." />
										</div>
										<div class='col-sm-2'>
											<button type="button" class="btn btn-secondary"
												style="width: 150px;" id="freeCmtAdd">댓글
												등록</button>
										</div>
									</div>
<%-- 									<input type="hidden" class="form-control" id="projBdCmtId" name="projBdCmtId" value="${freeboardCmtVO.projBdCmtId}"> --%>
									<input type="hidden" class="form-control" id="writerCmt" name="writer" value="${freeboardCmtVO.writer}">
									<input type="hidden" class="form-control" id="deleteYnCmt" name="deleteYn" value="${freeboardCmtVO.deleteYn}">
								</form>
							</div>
						</div>
					</div>
					<!-- ---------------------- 댓글 입력 끝 ------------------------------ -->
					<div
						class="card mb-2 card border-top-info border-top-2 box-shadow-0"
						style="width: 1200px; height: auto;">
						<div class="card-header"
							style="padding: 13px; color: #455A64; font-size: 15px;">
							Comments&nbsp;<i class="fa fa-comment fa"></i>
						</div>
						<div class="card-body" id="cmtList">
								<div class="user-block">
									<c:forEach var="freeboardCmtVO" items="${dataCmt}" varStatus="stat">	
									<div>
									<form class="form-horizontal">
										<div style="padding-bottom: 5px;">
											<span class="username"> <a href="#" style="font-size:15px;">${freeboardCmtVO.writer}</a>&nbsp;&nbsp;<span
												style="font-size: 8px; color: grey;"><fmt:formatDate value="${freeboardCmtVO.projBdCmtWriteDate}" pattern="yyyy-MM-dd HH:mm" /></span>
												<span id="fnEdit${stat.index}">
													<button type="button" class="btn btn-danger btn-sm cmtDelete" style="float:right;" id="cmtDelete" 
														onclick="fn_delete(${freeboardCmtVO.projBdCmtId})">삭제</button>&nbsp;
													<button type="button" class="btn btn-warning btn-sm cmtModify" style="float:right; margin-right:3px;" id="cmtModify" 
														onclick="fn_update('${freeboardCmtVO.projBdCmtId}','${stat.index}')">수정</button>
												</span>
												<span id="fnSave${stat.index}" style="display:none;">
													<button type="button" class="btn btn-secondary btn-sm" style="float:right;"  
														onclick="fn_updateGo(${freeboardCmtVO.projBdCmtId}, '${stat.index}')">등록</button>&nbsp;
													<a href="/proj/freeBoardDetail?projBdId=${param.projBdId}" class="btn btn-danger btn-sm" style="float:right; margin-right:3px;"  
														>취소</a>
												</span>
											</span> <span class="description"></span>
										</div>
										<div id="cmtCts">
											<span id="span${stat.index}">${freeboardCmtVO.projBdCmtCts}</span>
											<input type="text" id="projBdCmtCts${stat.index}" name="projBdCmtCts" value="${freeboardCmtVO.projBdCmtCts}" 
												style="display:none; width:900px; height:35px;" />
										</div>
										<br>
										<div style="padding-top: 10px;">
											<button type="button" class="btn mr-1 mb-1 btn-secondary btn-sm">ㄴ 댓글</button>
										</div>
										<hr>
										<input type="hidden" class="form-control" id="projBdCmtId" name="projBdCmtId" value="${freeboardCmtVO.projBdCmtId}">
										<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
									</form>
									</div>
									</c:forEach>
								</div>
						</div>
					</div>

				</div>
			</section>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>

<script type="text/javascript">

	$(function() {
		
		// 글 삭제 버튼 꾸욱
		$("#freeDel").on("click", function() {
			
			let projBdId = $("#projBdId").val(); // 글 번호 가져와
			
			let data = {"projBdId":projBdId};		// 제이슨~
			
			console.log("data: " + JSON.stringify(data));
			
			// 아자작
			$.ajax({
				url:"/proj/freeBoardDelete",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
		   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					
					console.log("result: " + JSON.stringify(result));
					
					let str = result.result;
					
					console.log("str : " + str);
					
					// result가 0보다 크면 성공, 아니면 실패
					if(str > 0) {
						alert("글을 삭제하였습니다.");
						location.href="/proj/freeboard";
					} else {
						alert("삭제 실패. 다시 시도해주세요.");
					}
				}
			})	// ajax end
		});
		

		// 댓글 등록
		$("#freeCmtAdd").on("click",function() {
			
			alert("댓글 등록 떠라");
			
			let projBdId = $("#projBdId0").val();						// 게시글 번호
 			let writerCmt = $("#writer0").val();						// 댓글 작성자
 			let projBdCmtCts = $("#projBdCmtCts").val();				// 댓글 내용
 			//let projBdCmtId = $("#projBdCmtId").val();					// 댓글 번호
 			//let projBdCmtWriteDate = $("#projBdCmtWriteDate").val();	// 댓글 작성일
 			
			console.log("projBdId: " + projBdId);
			console.log("writerCmt: " + writerCmt);
			console.log("projBdCmtCts: " + projBdCmtCts);
// 			console.log("projBdCmtId: " + projBdCmtId);
// 			console.log("projBdCmtWriteDate: " + projBdCmtWriteDate);

			let data = {"projBdId":projBdId,"writerCmt":writerCmt,"projBdCmtCts":projBdCmtCts};	
			
			$.ajax({
				url:"/proj/insertFreeCmt",
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

				//	location.href="/proj/freeBoardDetail?projBdId="+${freeboardVO.projBdId};
					location.reload();
				},
				error:function(request,status,error){
                    alert("댓글 작성 실패. 다시 시도해주세요.");
                }
			});	// ajax end
			
			$("#projBdCmtCts").val("");
		});
		
	});
	
	
	// 댓글 삭제 -----------------------------------
	
	function fn_delete(param){
		
		alert("삭제 눌렀엉");
		
		console.log("this: ",param);
		
		let projBdCmtId = $("#projBdCmtId").val(); // 댓글 번호

		let data = {"projBdCmtId":projBdCmtId};
		
		console.log("data: " + JSON.stringify(data));
		
		// 아자작
		$.ajax({
			url:"/proj/deleteFreeCmt",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			
			console.log("result: " + JSON.stringify(result));
			
			// result가 0보다 크면 성공, 아니면 실패
			if(result > 0) {
				alert("댓글을 삭제하였습니다.");
				location.reload();
			} else {
				alert("삭제 실패. 다시 시도해주세요.");
			}
		}
		}); // ajax end
		
	}; // 댓글 삭제 end
	
	
	// 댓글 수정 -----------------------------------
	
	// 수정 창 열기
	function fn_update(param, idx) {

 		let data = {"projBdCmtId":param, "idx":idx};

		console.log("data: " + JSON.stringify(data));
		
		$("#projBdCmtCts"+idx).css("display","block");
		$("#fnSave"+idx).css("display","block");
		$("#span"+idx).css("display","none");
		$("#fnEdit"+idx).css("display","none");
		
	}
	
	// 수정 버튼
	function fn_updateGo(param, idx) {
		
		alert("수정버튼");
		
		let projBdCmtCts = $("#projBdCmtCts"+idx).val();	
		let projBdCmtId = param;

		let data = {"projBdCmtId":projBdCmtId,"projBdCmtCts":projBdCmtCts};
		
		console.log("data: " + JSON.stringify(data));
		
		$.ajax({
			url:"/proj/updateFreeCmt",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
	   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				console.log("result : " + result);
				
				if(result > 0) {
					alert("댓글을 수정하였습니다.");
					location.reload();
				} else {
					alert("수정 실패. 다시 시도해주세요.");
				}
			},

		});	// ajax end
	}
	
</script>


