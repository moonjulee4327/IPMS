<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<!-- BEGIN: Content-->
<div class="content-body">
	<!-- Basic form layout section start -->
	<section id="basic-form-layouts">
		<div class="row match-height">
			<div class="col-md-12">
				<div class="card">
					<br>
					<div class="card-header" style="text-align:center;">
						<h4 class="form-section" style="font-family: 'MICEGothic Bold';">
							<i class="feather icon-edit"
								style="color: #0D47A1; padding-right: 5px;"></i>글 등록하기
						</h4>
					</div>
					<div class="card-content collapse show">
						<div class="card-body">
							<form class="form">
								<div class="row justify-content-md-center">
									<div class="col-md-6">
										<div class="form-body">
											<div class="form-group">
												<label for="eventInput1">제목</label> 
												<input type="text" id="eventInput1" class="form-control" placeholder="제목을 입력해주세요." name="qnaTitle" required>
											</div>

											<div class="form-group">
												<label for="eventInput3">내용</label> 
												<input type="text" id="eventInput3" class="form-control" placeholder="내용을 입력해주세요." name="qnaCts" id="content" required>
											</div>

											<div class="form-group">
												<label>첨부파일</label><br><label id="projectinput7" class="file center-block"> 
													<input type="file" id="file"> 
													<span class="file-custom"></span>
												</label>
											</div>
										</div>
										<div class="form-actions center" style="padding-top:50px; padding-bottom:120px;">
											<input type="submit" class="btn btn-primary"> 
												<i class="fa fa-check-square-o"></i> 등록
											</button>
											<input type="reset" class="btn btn-secondary mr-1">
												<i class="feather icon-x"></i> 취소
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- // Basic form layout section end -->
</div>
<!-- END: Content-->

<script type="text/javascript">
	CKEDITOR.replace('content');
</script>