<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/orderList.css"
	rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="path/to/your/vue/component.js"></script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">주문서관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 주문서 관리</li>
		</ol>

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<div class="linelist" style="float: right; margin-bottom: 13px;">
							<button class="btn btn-primary" id="ordrBtn">
								<i class="fas fa-search"></i> 조회
							</button>
							<button class="btn btn-primary" id="ReBtn">
								<i class="fas fa-file"></i> 초기화
							</button>
						</div>
						<form name="searchFrm" id="searchFrm">
							<table class="table" style="vertical-align: middle;">
								<colgroup>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										
										<th>거래처명</th>
										<td>
											<div style="display: flex;">

												<input type="text" class="form-control" id="vendNm"
													name="vendNm" style="width: 150px;" class="input">
												<button type="button" class="btn btn-primary"
													id="openCompany" data-bs-toggle="modal"
													data-bs-target="#comModal" class="butt">
													<i class="fas fa-search"></i>
												</button>
												
											</div>
										</td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>제품명</th>
										<td>
											<div style="display: flex;">
												<input type="text" class="form-control" id="prdtNm"
													name="prdtNm" style="width: 150px;">
												<button type="button" class="btn btn-primary"
													id="openProduct" data-bs-toggle="modal"
													data-bs-target="#proModal">
													<i class="fas fa-search"></i>
												</button>
											</div>

										</td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>주문 일자</th>
										<td>
											<div style="display: flex;">
												<input type="date" id="start" name="start"
													class="form-control" style="width: 150px;"> <span
													style="padding: 5px;">-</span> <input type="date" id="end"
													name="end" class="form-control" style="width: 150px;">
											</div>
										</td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
								</tbody>
							</table>
							</form>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-primary" id="addBtn">
			<i class="fas fa-plus"></i> 추가
		</button>
		<button class="btn btn-primary" id="okBtn">
			<i class="fas fa-save"></i> 저장
		</button>
		<button class="btn btn-primary" id="delBtn">
			<i class="fas fa-minus"></i> 삭제
		</button>
		<div id="grid" class="card mb-4">
			<table id="datatablesSimple" class="table">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>주문번호</th>
						<th>제품코드</th>
						<th>거래처코드</th>
						<th>거래처</th>
						<th>주문일자</th>
						<th>납기일자</th>
						<th>제품명</th>
						<th>주문수량</th>
					</tr>
				</thead>

				<!-- ↓↓↓여기에 조회된 결과 출력 -->
				<tbody id="list">
					<c:forEach items="${salesList}" var="orders">
						</tr>
						<th><input type="checkbox"></th>
						<th>${order.orderNo}</th>
						<th>${order.edctsCd}</th>
						<th>${order.vendCd}</th>
						<th>${order.vendNm}</th>
						<th>${order.orderDt}</th>
						<th>${order.paprdDt}</th>
						<th>${order.prdtNm}</th>
						<th>${order.orderCnt}</th>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 제품코드 모달(등록) -->
	<div class="modal fade" id="edctsCdModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">제품 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="CdModal"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="confirmBtn" class="btn btn-primary"
						data-bs-dismiss="modal">확인</button>
					<button type="button" id="cancleAddProd" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 제품명 모달(조회) -->
<div class="modal fade" id="proModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">제품 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div id="proGrid" class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" id="confirmBtn" class="btn btn-primary"
					data-bs-dismiss="modal">확인</button>
				<button type="button" id="cancleProdBtn" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 거래처 모달(등록)-->
<div class="modal fade" id="vendGridModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">거래처 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="vendGrid"></div>
			</div>
			<div class="modal-footer">
				<button type="button" id="confirmBtn" class="btn btn-primary"
					data-bs-dismiss="modal">확인</button>
				<button type="button" id="cancleAddVendBtn"
					class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 거래처 모달(조회)-->
<div class="modal fade" id="comModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">거래처 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div id="comGrid" class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" id="confirmBtn" class="btn btn-primary"
					data-bs-dismiss="modal">확인</button>
				<button type="button" id="cancleVendBtn" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
