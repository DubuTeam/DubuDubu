<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/sales/salesOust.css"
	rel="stylesheet" type="text/css">
<!-- fontawesome 사용! -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="container-fluid px-4">
		<h1 class="mt-4" style="margin-left: 20px;">제품출고등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item" style="margin-left: 25px;"><a
				href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품출고등록</li>
		</ol>
		<!-- 본문내용 끝 -->

		<!-- 주문서,출고 등록 그리드 -->
		<div id="cont">
			<div class="container-fluid px-4">
				<div class="card mb-4"></div>
				<div class="row">
					<div class="col-lg-6">
						<div class="card mb-4" style="margin-right: 10px;">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> 진행중 주문서 현황
							</div>
							<div class="card-body">
								<div id="grid"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> 출고 등록 현황

							</div>
							<div class="card-body">
								<div id="grid2"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 주문서,출고 등록 그리드 끝 -->

		<!--검사완료 완제품 재고 모달-->
		<div class="modal fade" id="StcGridModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">완제품 재고</h5>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="StcGrid"></div>
					</div>
					<div class="modal-footer">
						주문수량<input type="text" id="orderCntOut" name="orderCntOut"
							class="form-control" style="width: 150px" disabled> <input
							type="text" id="edctsOustCntOut" class="form-control"
							placeholder="출고수량 입력" style="width: 150px">
						<button class="btn btn-primary" id="addBtn">
							<i class="fas fa-save"></i> 등록
						</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!--검사완료 완제품 재고 모달 끝-->
</body>
</html>