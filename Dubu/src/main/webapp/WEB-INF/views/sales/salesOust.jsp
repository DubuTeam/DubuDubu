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
	href="${pageContext.request.contextPath}/resources/css/sales/salesOust.css"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4" style="margin-left: 20px;">제품출고등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item" style="margin-left: 25px;"><a
				href="/dubu"><i class="fas fa-home"></i></a></li>
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

						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="StcGrid"></div>
					</div>
					<div class="modal-footer">
						주문수량<input type="text" id="orderCntOut" name="orderCntOut"
							class="form-control" style="width: 150px" disabled> <input
							type="text" id="edctsOustCntOut" class="form-control"
							placeholder="출고수량 입력" style="width: 150px">
						<button class="btn btn-primary" id="addBtn" data-dismiss="modal">
							<i class="fas fa-save"></i> 등록
						</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!--검사완료 완제품 재고 모달 끝-->
	</div>
	<!-- /.container-fluid -->
</div>
</div>
<script>
	$(function() {
		findOrder();
		findOustList();
	})
	//생산완료 주문서 현황 그리드
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
			header : '주문번호',
			name : 'orderNo',
			align : 'center'
		}, {
			header : '거래처',
			name : 'vendNm',
			align : 'left'
		}, {
			header : '제품코드',
			name : 'edctsCd',
			align : 'center'
		}, {
			header : '제품명',
			name : 'prdtNm',
			align : 'left'
		}, {
			header : '주문수량',
			name : 'orderCnt',
			align : 'right'
		} ]
	});

	//출고 등록 현황 그리드
	const grid2 = new tui.Grid({
		el : document.getElementById('grid2'),
		scrollX : false,
		bodyHeight : 300,
		rowHeight : 35,
		rowHeaders : [ 'rowNum' ],
		columns : [ {
			header : '제품코드',
			name : 'edctsCd',
			align : 'center'
		}, {
			header : '완제품LOT번호',
			name : 'edctsLotNo',
			align : 'center'
		}, {
			header : '출고일자',
			name : 'edctsOustDt',
			align : 'center'
		}, {
			header : '출고수량',
			name : 'edctsOustCnt',
			align : 'right'
		} ]
	});

	//완제품 재고 현황 모달
	const StcGrid = new tui.Grid({
		el : document.getElementById('StcGrid'),
		scrollX : false,
		scrollY : false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
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
		}, {
			header : '완제품 재고량',
			name : 'lotCnt',
			align : 'right'
		} ]
	});
	//진행중 주문서 현황 목록 불러오기
	function findOrder() {
		$.ajax({
			url : "findOrder",
			method : "get",
			dataType : "json",
			success : function(list) {
				grid.resetData(list);
			}
		})
	}
	// 출고등록 현황조회
	function findOustList() {
		$.ajax({
			url : "getOustList",
			method : "get",
			dataType : "json",
			success : function(list) {
				grid2.resetData(list);
			}
		})
	}
	  //진행중 주문서 주문번호 칸 클릭 -> 완제품 재고 목록 모달 띄우기
	  
	  	  //진행중 주문서 주문번호 칸 클릭 -> 완제품 재고 목록 모달 띄우기
	  let orderNo = '';
	  grid.on("click", (e) => {
	  	const{ columnName } = e;
	  	OustRowKey = e.rowKey;
	  	if(columnName == 'orderNo') {
		  	orderNo = grid.getValue(OustRowKey, 'orderNo');	
	  		let edctsCd = grid.getValue(OustRowKey,'edctsCd');
	  		let orderCnt = grid.getValue(OustRowKey, 'orderCnt');


	  		$("#StcGridModal").modal('show');
	  			$.ajax({
	  			url:"getmodalList",
	  			dataType:"json",
	  			method:"post",
	  			data:{"edctsCd":edctsCd},
	  			success:function(result) {
	  				setTimeout(function () {
						StcGrid.refreshLayout()
						}, 300);
	  				StcGrid.resetData(result);
	  				$("#orderCntOut").val(orderCnt);
	  			}
	  		})
	  	}
	  });
	  
	  console.log(".           |");
	  console.log("　╲　　　　　　　　　　　╱");
	  console.log("　　　　　　　　　/");
	  console.log("　　　╲　　　　　　　　╱");
	  console.log("　　╲　　    설마...　　　╱");
	  console.log("-　-　　　제 목소리가　　-　-　-");
	  console.log("　　╱　   들리시나요?　　╲");
	  console.log("　╱　　/               .");
	  console.log("　　╱　　　　　　　　╲");
	  console.log("　　　　　/　|　　　");
	  console.log("　　　　　　　.");
</script>
<!-- End of Main Content -->