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
  <div class="row" style="height: 10%;">
  		<div class="col-1">
  			<button type="button" class="btn btn-secondary btn-block">자신의 일감</button>
  		</div>
 		<div class="col-1">
 			<input type="date">
 		</div>
 		<div class="col-1">
 			<input type="date">			
 		</div>
 		<div class="col-3"></div>
  		<div class="col-4">
  			<input type="text" class="form-control form-control-xl input-xl" id="iconLeft1" placeholder="Explore Stack ...">
		</div>
		<div class="col-2">
  			<button type="button" class="btn btn-secondary btn-block">검색</button>
  		</div>
  </div>
  <div class="row">
  	<div class="col-12">
  		테이블 넣을 곳
  	</div>
  </div>