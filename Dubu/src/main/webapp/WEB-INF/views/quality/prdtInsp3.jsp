<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link href="${pageContext.request.contextPath}/resources/css/prdcss/prdt.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">제품검사관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 품질관리</li>
			<li class="breadcrumb-item active">> 제품검사관리</li>
		</ol>
		<!-- 탭 메뉴 -->
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-insp-tab"
					data-bs-toggle="tab" data-bs-target="#nav-insp" type="button"
					role="tab" aria-controls="nav-insp" aria-selected="true">제품검사
					등록</button>
				<button class="nav-link" id="nav-info-tab" data-bs-toggle="tab"
					data-bs-target="#nav-info" type="button" role="tab"
					aria-controls="nav-info" aria-selected="false">제품검사 조회</button>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<!-- 검사등록 탭 -->
			<div class="tab-pane fade show active" id="nav-insp" role="tabpanel"
				aria-labelledby="nav-insp-tab">
				<!-- 내용 -->
				<div class="card mb-4">
					<div class="card-body">
						<div class="linelist" style="float: right;">
							<button class="btn btn-primary" id="newBtn">
								<i class="fas fa-file"></i> 새자료
							</button>
							<button class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 저장
							</button>
							<!--/* <button class="btn btn-primary" id="delBtn"><i class="fas fa-trash"></i> 삭제</button> */-->
							<br> <br>
						</div>
						
						<form id="dataForm" name="dataForm" action="#" method="post">
							<!-- 첫번 째 전환 탭 -->
							<table class="table" style="vertical-align: middle;">
								<colgroup>
									<col style="width: 150px">
									<col>
									<col style="width: 150px">
									<col>
									<col style="width: 150px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>주문번호 <strong class="blue">*</strong></th>
										<td><input class="form-control" type="text" id="orderNo"
											name="orderNo" style="width: 250px" maxlength="20"
											placeholder="주문서를 조회해주세요" readonly /> <!-- Button trigger modal -->
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												id="modalBtn">
												<i class="fas fa-search"></i>
											</button></td>
										<th>완제품코드 <strong class="blue">*</strong></th>
										<td><input class="form-control" type="text" id="edctsCd"
											name="edctsCd" style="width: 250px" maxlength="20" readonly /></td>
										<th>완제품명</th>
										<td><input class="form-control" type="text" id="edctsNm"
											name="edctsNm" style="width: 250px" maxlength="50" readonly /></td>
									</tr>
									<tr>
										<th>완제품LOT <strong class="blue">*</strong></th>
										<td><input class="form-control" type="text"
											id="edctsLotNo" name="edctsLotNo" style="width: 250px"
											maxlength="50" readonly /></td>
										<th>검사수량</th>
										<td><input class="form-control" type="text" id="inspCnt"
											name="inspCnt" style="width: 250px" maxlength="50" readonly /></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>검사일자</th>
										<td><input class="form-control" type="date" id="inspDt"
											name="inspDt" style="width: 250px" maxlength="50" /></td>
										<th>검사담당자</th>
										<td><input type="text" id="inspPsch" name="inspPsch"
											class="form-control" maxlength="50" style="width: 250px" /></td>
										<th>최종판정 <strong class="blue">*</strong></th>
										<td><select class="dataTable-selector" name="inspJm"
											id="inspJm" style="width: 250px">
												<option selected value="">==선택==</option>
												<option value="적합">적합</option>
												<option value="적합">부적합</option></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<!-- 주문서 Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">주문서 목록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<label for="" autofocus="autofocus">거래처명</label> <input
									type="text" class="form-control" id="modalSearch"
									name="modalSearch" style="width: 200px">
								<button class="btn btn-primary" id="modalSearchBtn">
									<i class="fas fa-search"></i> 검색
								</button>
								<br> <br>
								<div id="modalGrid"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" id="modalSelBtn">확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝 -->
				<div class="card mb-4">
					<div class="card-body">
						<div id="grid"></div>
					</div>
				</div>
			</div>
			<!-- 검사조회 탭 -->
			<div class="tab-pane fade" id="nav-info" role="tabpanel"
				aria-labelledby="nav-info-tab">
				<!-- 내용 -->
				<div class="card mb-4">
					<div class="card-body">
						<div class="linelist" style="float: right;">
							<button class="btn btn-primary" id="searchBtn">
								<i class="fas fa-search"></i> 조회
							</button>
							<button class="btn btn-primary" id="resetBtn">
								<i class="fas fa-file"></i> 초기화
							</button>
							<button class="btn btn-primary" id="excelBtn">
								<i class="fas fa-download"></i> Excel
							</button>
							<br> <br>
						</div>
						<form id="dataForm2" name="dataForm2" action="#" method="post">
							<table class="table" style="vertical-align: middle;">
								<colgroup>
									<col style="width: 150px">
									<col>
									<col style="width: 150px">
									<col>
									<col style="width: 150px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>검사일자 <strong class="blue">*</strong></th>
										<td colspan="3"><input class="form-control" type="date"
											id="startDt" name="startDt" style="width: 250px"
											maxlength="20" /> &nbsp; ~ &nbsp; <input
											class="form-control" type="date" id="endDt" name="endDt"
											style="width: 250px" maxlength="20" /></td>
										<th>
										<td></td>
										</th>
									</tr>
									<tr>
										<th>완제품LOT <strong class="blue">*</strong></th>
										<td><input class="form-control" type="text"
											list="browserdata" id="edctsLotNo" name="edctsLotNo"
											style="width: 250px" maxlength="50" autocomplete="off" /> <datalist
												id="browserdata" style="width: 250px">
												<option th:each="lot : ${lots}" th:value="${lot.edctsLotNo}"
													th:text="${lot.edctsLotNo}"></option>
											</datalist></td>
										<th>
										<td></td>
										</th>
										<th>
										<td></td>
										</th>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<div id="grid2"></div>
					</div>
				</div>
			</div>
			<!-- end nav-tabContent -->
			<!-- 성적서 모달 -->
			<div class="modal fade" id="inspModal" tabindex="-1"
				aria-labelledby="inspModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="inspModalLabel">검사상세조회</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="prdtInspPdf" method="post">
								<label for="inspModalNo" autofocus="autofocus">LOT </label> <input
									type="text" class="form-control" id="inspModalNo" name="param"
									style="width: 200px" readonly />
								<button class="btn btn-primary" id="pdfBtn">
									<i class="fas fa-download"></i> 성적서
								</button>
							</form>
							<br> <br>
							<div id="inspModalGrid"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary"
								id="inspModalSelBtn">확인</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 성적서 모달 end -->
		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
	function exam() {
		document.getElementById("ex").style.display = "none";
	}
</script>

