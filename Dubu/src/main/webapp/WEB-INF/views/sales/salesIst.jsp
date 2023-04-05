<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/salesIst.css"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">제품입고등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품입고등록</li>
		</ol>

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<div class="mb-4"></div>
						<div class="linelist" style="float: right;">
							<button type="button" class="btn btn-primary" id="dtSearchBtn">
								<i class="fas fa-search"></i> 조회
							</button>
							<button type="button" class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 등록
							</button>
							<button class="btn btn-primary" id="ReBtn">
								<i class="fas fa-file"></i> 초기화
							</button>
						</div>
						<form name="IstSearchFrm" id="IstSearchFrm">
							<label for="edctsIstDt" class="form-label">제품 입고일자</label>
							<div style="display: flex;">
								<input type="date" id="start" name="start" class="form-control"
									style="width: 150px;"> <span style="padding: 5px;">-</span>
								<input type="date" id="end" name="end" class="form-control"
									style="width: 150px;">
							</div>
							<table class="table" style="vertical-align: middle;">
								<colgroup>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>제품 입고번호</th>
										<td><input type="text" class="form-control"
											id="edctsIstNo" name="edctsIstNo" placeholder="등록시 자동생성"
											readonly style="width: 150px; margin-left: 6px;"></td>
										<th>완제품LOT번호</th>
										<td><div style="display: flex;">
												<input type="text" class="form-control" id="vendNm"
													name="vendNm" style="width: 150px;" class="input" readonly>
												<button type="button" class="btn btn-primary"
													id="openCompany" data-bs-toggle="modal"
													data-bs-target="#comModal" class="butt">
													<i class="fas fa-search"></i>
												</button>
											</div></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>검사수량</th>
										<td><input type="text" class="form-control" id="inspCnt"
											name="inspCnt" style="width: 150px; margin-left: 3px;"
											readonly></td>
										<th>제품 입고수량</th>
										<td><input type="text" class="form-control"
											id="edctsIstCnt" name="edctsIstCnt"
											style="width: 150px; margin-left: 0px;"></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
								</tbody>
								</div>
							</table>

						</form>
					</div>
				</div>

			</div>
		</div>
		<div id="grid" class="card mb-4"></div>

	</div>
	<!-- 완제품LOT번호 모달 -->
	<div class="modal fade" id="lotModal" tabindex="-1"
		aria-labelledby="elLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			xampleModa
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="lotModalLabel">검사완료 완제품LOT번호</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="lotNoGrid"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="confirmBtn" class="btn btn-primary"
						data-bs-dismiss="modal">확인</button>
					<button type="button" id="cancleLotBtn" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
		<!-- 모달 div끝 -->
	</div>
	<!-- /.container-fluid -->
</div>
</div>
<!-- End of Main Content -->

