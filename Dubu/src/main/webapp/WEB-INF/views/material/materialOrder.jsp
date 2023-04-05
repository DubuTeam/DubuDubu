<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="${pageContext.request.contextPath}/resources/css/material/materialOrdr.css"
	rel="stylesheet">

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
							<button style="margin-bottom: 3px" class="btn btn-primary" id="rscSearchBtn">
								<i class="fas fa-search"></i>
							</button>
						</td>
					<tr>
				</table>
				<br>
				<span><b>자재목록</b></span>
				
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
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
							<tr>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
							</tr>
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
					<button class="btn btn-primary" id="minusBtn">
						<i class="fas fa-minus"></i> 삭제
					</button>
					<button class="btn btn-primary" id="saveBtn">
						<i class="fas fa-save"></i> 발주
					</button>
					<br> <br>
				</div>

				<br><br>
				
				<span><b>자재발주</b></span>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>No.</th>
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
						<tbody id="list">
							<tr>
								<th><input type="checkbox"></th>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
							</tr>
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

