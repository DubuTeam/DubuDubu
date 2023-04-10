<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/ag-grid-community@25.3.0/dist/styles/ag-grid.css">
<link rel="stylesheet"
	href="https://unpkg.com/ag-grid-community@25.3.0/dist/styles/ag-theme-alpine.css">
<script
	src="https://unpkg.com/ag-grid-community@25.3.0/dist/ag-grid-community.min.noStyle.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<!-- jqGrid 플러그인 로드 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/salesIst.css"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">제품입고등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/dubu"><i
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
								<input type="date" id="edctsIstDtStart" name="edctsIstDtStart"
									class="form-control" style="width: 150px; margin-left: 5px;">
								- <input type="date" id="edctsIstDtEnd" name="edctsIstDtEnd"
									class="form-control" style="width: 150px;">
							</div>
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
								<td><input type="text" class="form-control" id="edctsIstNo"
									name="edctsIstNo" placeholder="등록시 자동생성" readonly
									style="width: 150px; margin-left: 6px;"></td>
								<th>완제품LOT번호</th>
								<td><div style="display: flex;">
										<input type="text" class="form-control" id="vendNm"
											name="vendNm" style="width: 150px;" class="input" readonly>
										<!-- Button trigger modal (4.6버젼) -->
										<button type="button" style="margin-left: 3px"
											class="btn btn-primary" data-toggle="modal"
											data-target="#exampleModal222" id="searchBtn"
											name="searchBtn">
											<i class="fas fa-search"></i>
										</button>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal222" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<!-- <div class="modal-dialog"> -->
											<div class="modal-dialog modal-dialog-centered modal-lg">
												<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">검사완료
															완제품 LOT번호</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body" style="text-align: center;">
														<div style="display: flex; margin-bottom: 10px;"></div>

														<div id="list-body" class="table">
															<table style="width: 100%;">
																<thead>
																	<tr>
																		<th><input type="checkbox"></th>
																		<th>주문번호</th>
																		<th>완제품LOT번호</th>
																		<th>제품코드</th>
																		<th>제품명</th>
																		<th>검사수량</th>
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
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary">삭제</button>
													</div>
												</div>
											</div>
										</div>

										<!-- ↑↑↑ 모달 -->
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
									name="inspCnt" style="width: 150px; margin-left: 3px;" readonly></td>
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
<script>
	$(function() {
		salesIstList();
	})

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		scrollX : false,
		bodyHeight : 300,
		rowHeight : 35,
		rowHeaders : [ 'rowNum' ],
		header : {
			height : 40
		},
		columns : [ {
			header : '제품 입고번호',
			name : 'edctsIstNo',
			align : 'center'
		}, {
			header : '제품 입고일자',
			name : 'edctsIstDt',
			align : 'center'
		}, {
			header : '제품 입고수량',
			name : 'edctsIstCnt',
			align : 'right'
		}, {
			header : '제품코드',
			name : 'edctsCd',
			align : 'center'
		}, {
			header : '완제품LOT번호',
			name : 'edctsLotNo',
			align : 'center'
		}, {
			header : '제품명',
			name : 'prdtNm',
			align : 'left'
		} ]
	});

	// 완제품LOT번호 모달 그리드(조회)    
	const lotNoGrid = new tui.Grid({
		el : document.getElementById('lotNoGrid'),
		scrollX : false,
		scrollY : false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
			header : '주문번호',
			name : 'orderNo',
			width : 120,
			align : 'center'
		}, {
			header : '완제품LOT번호',
			name : 'edctsLotNo',
			width : 120,
			align : 'center'
		}, {
			header : '제품코드',
			name : 'edctsCd',
			align : 'center'
		}, {
			header : '제품명',
			name : 'prdtNm',
			align : 'left'
		}, {
			header : '검사수량',
			name : 'inspCnt',
			align : 'right'
		} ]
	});

	//제품 입고 전체 목록 - 현재 날짜 기준으로
	function salesIstList() {
		var IstData = $("#IstSearchFrm").serialize();
		$.ajax({
			url : "salesIstList",
			dataType : "json",
			method : "get",
			data : IstData,
			success : function(list) {
				grid.resetData(list);
			}
		})
	}
</script>
</div>
</div>
<!-- End of Main Content -->

