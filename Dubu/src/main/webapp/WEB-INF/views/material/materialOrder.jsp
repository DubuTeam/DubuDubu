<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Grid -->
<!-- <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script> -->



<!-- CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/material/materialOrdr.css"
	rel="stylesheet">

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/material/materialOrder.js"></script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주관리</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body" >
				<table>
					<tr>
						<th>원자재명</th>
						<td>
							<input class="form-control" type="text" id="rscNm"
							name="rscNm" style="width: 150px">
						</td>
						<th>업체명</th>
						<td>
							<input class="form-control" type="text" id="vendNm"
							name="vendNm" style="width: 150px ; display: inline-block;">
							<button type="button" style="margin-bottom: 3px" class="btn btn-primary" id="rscSearchBtn">
								<i class="fas fa-search"></i>
							</button>
						</td>
					<tr>
				</table>
				<br>
				<span><b>자재목록</b></span>
				
				<div id="grid"></div>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="listTable" class="table">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>현재재고</th>
								<th>안전재고</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="list">
						<c:forEach items="${materialList}" var="material" varStatus="status">
								<tr class='eachRow <c:if test="${material.avalStc < material.safStc}">warn</c:if>' 
								ondblclick="materialOrder('${material.rscCd}','${material.rscNm}','${material.vendCd}','${material.vendNm}','${material.avalStc}','${material.safStc}', '${OrderCode}')">		
									<td>${status.count}</td>
									<td>${material.rscCd}</td>
									<td>${material.rscNm}</td>
									<td>${material.vendCd}</td>
									<td>${material.vendNm}</td>
									<td>${material.avalStc}</td>
									<td>${material.safStc}</td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">

				<div class="linelist" style="float: right;">
					<button type="button" class="btn btn-primary" id="minusBtn">
						<i class="fas fa-minus"></i> 삭제
					</button>
					<button type="button" class="btn btn-primary" id="saveBtn">
						<i class="fas fa-save"></i> 발주
					</button>
					<br> <br>
				</div>

				<br><br>
				
				<span><b>자재발주신청</b></span>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>발주코드</th>
								<th>발주수량</th>
								<th>현재재고</th>
								<th>안전재고</th>
								<th>예상재고량</th>
								<th>납기요청일</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="order">
						
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="linelist" style="float: right;">
					<button type="button" class="btn btn-primary" id="minusBtn">
						<i class="fas fa-minus"></i> 삭제
					</button>
					<button type="button" class="btn btn-primary" id="saveBtn">
						<i class="fas fa-save"></i> 수정
					</button>
					<br> <br>
				</div>
				<br><br>
				<span><b>자재발주목록</b></span>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list" class="table">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>발주코드</th>
								<th>발주수량</th>
								<th>현재재고</th>
								<th>안전재고</th>
								<th>예상재고량</th>
								<th>납기요청일</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="orderPrint">
						<c:forEach items="${materialOrderList}" var="materialOrder">
							<tr>
								<td><input type="checkbox"></td>
								<td>${materialOrder.rscCd}</td>
								<td>${materialOrder.rscNm}</td>
								<td>${materialOrder.vendCd}</td>
								<td>${materialOrder.vendNm}</td>
								<td>${materialOrder.ordrCd}</td>
								<td>${materialOrder.ordrCnt}</td>
								<td>${materialOrder.avalStc}</td>
								<td>${materialOrder.safStc}</td>
								<td>${materialOrder.expect}</td>
								<td><fmt:formatDate value="${materialOrder.paprdCmndDt}" pattern = "yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
<br>
</div>
<!-- End of Main Content -->

