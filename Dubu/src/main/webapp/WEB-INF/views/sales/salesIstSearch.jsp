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

<link
	href="${pageContext.request.contextPath}/resources/css/sales/salesIstSearch.css"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">제품입고조회</h1>
		<ol class="breadcrumb mb-4">
			<li ><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li >> 영업관리</li>
			<li >> 제품입고조회</li>
		</ol>

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<div class="linelist" style="float: right; margin-bottom: 13px;">
							<button type="button" class="btn btn-primary"
								id="optionSearchBtn">
								<i class="fas fa-search"></i> 조회
							</button>
							</td>
							<button class="btn btn-primary" id="ReBtn">
								<i class="fas fa-file"></i> 초기화
							</button>
						</div>
						<form name="IstSearchFrm" id="IstSearchFrm">
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
									</tr>
									<tr>
										<th>제품 입고일자</th>
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
		<div id="grid" class="card mb-4"></div>

		<!-- 완제품LOT번호 모달 -->
		<div class="modal fade" id="lotModal" tabindex="-1"
			aria-labelledby="elLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				xampleModa
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="lotModalLabel">완제품LOT번호</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="lotNoGrid"></div>
					</div>
					<div class="modal-footer" style="margin-left: 100px;">
						<button type="button" id="confirmBtn" class="btn btn-primary"
							data-bs-dismiss="modal">확인</button>
						<button type="button" id="cancleLotBtn" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>

					<!-- 모달 div끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</div>
<script>
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
			align : 'center'
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
			header : '입고완료수량',
			name : 'inspCnt',
			align : 'right'
		} ]
	});
</script>
</div>
<!-- End of Main Content -->