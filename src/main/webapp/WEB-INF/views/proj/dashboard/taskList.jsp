<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-content grouped-multiple-statistics-card">
          <div class="card-body">
            <div class="row">
              <div class="col-lg-3 col-md-6 col-12 border-right-blue-grey border-right-lighten-3">
                <div class="float-left pl-2">
                  <span class="font-large-3 text-bold-300">589</span>
                </div>
                <div class="float-left mt-2 ml-1">
                  <span class="blue-grey darken-1 block">승인된</span>
                  <span class="blue-grey darken-1 block">일감</span>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-12 border-right-blue-grey border-right-lighten-3">
                <div class="float-left pl-2">
                  <span class="font-large-3 text-bold-300">765</span>
                </div>
                <div class="float-left mt-2 ml-1">
                  <span class="blue-grey darken-1 block">진행중인</span>
                  <span class="blue-grey darken-1 block">일감</span>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-12 border-right-blue-grey border-right-lighten-3">
                <div class="float-left pl-2">
                  <span class="font-large-3 text-bold-300">693</span>
                </div>
                <div class="float-left mt-2 ml-1">
                  <span class="blue-grey darken-1 block">완료된</span>
                  <span class="blue-grey darken-1 block">일감</span>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 col-12">
                <div class="float-left pl-2">
                  <span class="font-large-3 text-bold-300">946</span>
                </div>
                <div class="float-left mt-2 ml-1">
                  <span class="blue-grey darken-1 block">미승인</span>
                  <span class="blue-grey darken-1 block">일감</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 1번째 끝 -->
  
  	<div class="row" style="text-align: center;top: 5%;">
		<div class="col-12">
			<div class="card">
					<div class="row">
 		<div class="col-5"></div>
  		<div class="col-1">
  			<input type="checkbox" id="memCode" value="my">본인일감<br>
  			<input type="checkbox" id="aprov" value="aprov">승인여부
  		</div>
 		<div class="col-1">
 			시작일
 			<input type="date" id="strDate">
 		</div>
 		
 		<div class="col-1">
 			종료일
 			<input type="date" id="endDate">			
 		</div>
  		<div class="col-3">
  			<input type="text" class="form-control form-control-xl input-xl" id="searchInput" style="height: 100%" placeholder="제목 검색">
		</div>
		<div class="col-1">
  			<button type="button" class="btn btn-secondary btn-block" id="search">검색</button>
  		</div>
  		</div>
					<div>
						<table class="table table-striped table-bordered base-style table-hover">
							<thead>
									<tr role="row">
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Name: activate to sort column ascending"
											style="width: 5px;">일감번호</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 450px;text-align: left">제목</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 90px;">상태</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 100px;">진척도</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 120px;">시작일</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 120px;">종료일</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 30px;">담당자</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 100px;">승인여부</th>
									</tr>
							</thead>
							<tbody id="taskList">
								<c:forEach items="${taskList}" var="list">
								<tr>
									<td>${list.taskId }</td>
									<td style="text-align: left;">${list.taskTitle }</td>
									<td>${list.taskStusCode }</td>
									<td>${list.taskPgres }%</td>
									<td><fmt:formatDate value="${list.taskStrtDate}" pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${list.taskEndDate}" pattern="yyyy-MM-dd" /></td>
									<td>${list.taskRepre }</td>
									<c:if test="${list.aprovWhth == 'n' }">
									<td>승인</td>
									</c:if>
									<c:if test="${list.aprovWhth != 'n' }">
									<td>미승인</td>
									</c:if>
								<tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row">
                        <!-- 페이징 처리 버튼 시작 -->
                        <div class="col-sm-12 col-md-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate">
                                <ul class="pagination"  style="text-align: center; float: right;">

                                    <!-- 이전 버튼 시작 -->
                                    <c:if test="${pageVO.prev }">
                                    <li class="paginate_button page-item previous" id="app-invoice-table_previous">
                                        <a href="/proj/${projId}/taskList?pageNum=${num -1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                    </li>
                                    </c:if>
                                    <!-- 이전 버튼 끝 -->
									
                                    <!-- 페이지 블록 시작 -->
                                    <!-- 현재페이지 -->
                                    <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
                                    <c:choose>
                                    <c:when test="${pageVO.pageNum eq num }">
	                                    <li class="paginate_button page-item active">
	                                        <a href="/proj/${projId}/taskList?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
	                                    </li>
                                    </c:when>
                                    <c:otherwise>
                                    	<li class="paginate_button page-item">
	                                        <a href="/proj/${projId}/taskList?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
	                                    </li>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    <!-- 페이지 블록 끝 -->

                                    <!-- 다음 버튼 시작 -->
                                    <c:if test="${pageVO.next }">
                                    <li class="paginate_button page-item next" id="app-invoice-table_next">
                                        <a href="/proj/${projId}/taskList?pageNum=${num +1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="6" tabindex="0" class="page-link">Next</a>
                                    </li>
                                    </c:if>
                                    <!-- 다음 버튼 끝 -->

                                </ul>
                            </div>
                        </div>
                        <!-- 페이징 처리 버튼 끝 -->
                    </div>
					</div>
				
			</div>
		</div>
	</div>
<script>
	$(function(){
		$("#search").on("click",function(){
			let keyword = $("#searchInput").val();
			let strDate = $("#strDate").val();
			let endDate = $("#endDate").val();
			let memCode = $("#memCode:checked").val();
			let aprov = $("#aprov:checked").val();
			
			if(memCode == undefined){
				memCode = "";
			}
			if(aprov == undefined){
				aprov = "";
			}
			location.href = "?keyword="+keyword+"&strDate="+strDate+"&endDate="+endDate+"&memCode="+memCode+"&aprov="+aprov;
		});
	});
</script>