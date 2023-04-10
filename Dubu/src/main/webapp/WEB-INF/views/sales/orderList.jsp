<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.min.css" />
<script
	src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.min.js"></script>
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



</head>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/orderList.css"
	rel="stylesheet" type="text/css">


<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">주문서관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/dubu"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 주문서 관리</li>
		</ol>

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<div class="linelist" style="float: right; margin-bottom: 13px;">
							<button class="btn btn-primary" id="ordrBtn" onclick='search()'>
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
													name="vendNm" style="width: 150px;" readonly>
												<button type="button" class="btn btn-primary"
													id="openCompany" data-toggle="modal"
													data-target="#comModal">
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
													name="prdtNm" style="width: 150px;" readonly>
												<button type="button" class="btn btn-primary"
													id="openProduct" data-toggle="modal"
													data-target="#proModal">
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

		<div id="grid" class="card mb-4"></div>
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
<div class="modal fade" id="proModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title font-weight-bold" id="exampleModalLabel">제품
					목록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body overflow-auto">
				<div id="proGrid"></div>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-primary font-weight-bold"
					data-dismiss="modal">확인</button>
				<button type="button" class="btn btn-secondary font-weight-bold"
					data-dismiss="modal">닫기</button>
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
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="vendGrid"></div>
			</div>
			<div class="modal-footer">
				<button type="button" id="confirmBtn" class="btn btn-primary"
					data-dismiss="modal">확인</button>
				<button type="button" id="cancleAddVendBtn"
					class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 거래처 모달(조회)-->
<div class="modal fade" id="comModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title font-weight-bold" id="exampleModalLabel">거래처
					목록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body overflow-auto">
				<div id="comGrid"></div>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-primary font-weight-bold"
					data-dismiss="modal">확인</button>
				<button type="button" class="btn btn-secondary font-weight-bold"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<script>
//행추가 버튼
$('#addBtn').click(ev => {
    var row = grid.getRowCount();
    grid.appendRow();
    //주문서 추가시 주문번호 자동 생성 ex.ORS202207151
    let orderDt = $("input[name=start]").val();
    $.ajax({
        url:"getordrNo",
        dataType:"json",
        method:"get",
        data:{"orderDt":orderDt},
        error:console.log("error"),
        success:function(makeno) {
            var no = makeno.index;
            var rcode = orderDt.replaceAll("-","");
            var result = "ORD" + rcode + no;
            console.log(result);
            console.log(row);
            console.log(no);
            grid.setValue(row,'orderNo',result);
        }
    });
});
$(function() {
	searchAll();
	comList();
	proList();
})


	//현재날짜 기준 주문서 조회(첫페이지)
	function searchAll() {
		var searchData = $("#searchFrm").serialize();
		$.ajax({
			url : "orderSelect",
			method : "post",
			dataType : "json",
			data : searchData,
			success : function(result) {

				grid.resetData(result);
			}
		})
	}

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		scrollX : false,
		bodyHeight : 300,
		rowHeight : 35,
		rowHeaders : [ 'checkbox' ],
		header : {
			height : 40
		},
		columns : [ {
			header : '주문번호',
			name : 'orderNo',
			editor : 'text',
			align : 'center'
		}, {
			header : '제품코드',
			name : 'edctsCd',
			editor : 'text',
			align : 'center'
		}, {
			header : '거래처코드',
			name : 'vendCd',
			editor : 'text',
			align : 'center'
		}, {
			header : '거래처',
			name : 'vendNm',
			editor : 'text',
			align : 'left'
		}, {
			header : '주문일자',
			name : 'orderDt',
			editor : 'datePicker',
			align : 'center'
		}, {
			header : '진행상황',
			name : 'progAppe',
			align : 'left',
			defaultValue : 'InProgress'
		}, {
			header : '납기일자',
			name : 'paprdDt',
			editor : 'datePicker',
			align : 'center'
		}, {
			header : '제품명',
			name : 'prdtNm',
			editor : 'text',
			align : 'left'
		}, {
			header : '주문수량',
			name : 'orderCnt',
			editor : 'text',
			align : 'right'
		}, ]
	});

	// 제품명 모달 그리드(조회)    
	const proGrid = new tui.Grid({
		el : document.getElementById('proGrid'),
		scrollX : false,
		scrollY : false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
			header : '완제품코드',
			name : 'edctsCd',
			width : 200,
			align : 'center'
		}, {
			header : '제품명',
			name : 'prdtNm',
			align : 'left',
			width : 200
		} ]
	});

	// 제품코드 모달 그리드(등록)    
	const CdModal = new tui.Grid({
		el : document.getElementById('CdModal'),
		scrollX : false,
		scrollY : false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
			header : '완제품코드',
			name : 'edctsCd',
			width : 200,
			align : 'center'
		}, {
			header : '제품명',
			name : 'prdtNm',
			align : 'left',
			width : 200
		} ]
	});

	// 거래처 모달 그리드(조회)
	const comGrid = new tui.Grid({
		el : document.getElementById('comGrid'),
		scrollX : false,
		scrollY : false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
			header : '거래처코드',
			name : 'vendCd',
			width : 100,
			align : 'center'
		}, {
			header : '거래처명',
			name : 'vendNm',
			align : 'left',
			width : 100
		}, {
			header : '사업자등록번호',
			name : 'binzo',
			width : 110,
			align : 'center'
		}, {
			header : '전화번호',
			name : 'telno',
			width : 100,
			align : 'center'
		} ]
	});

	// 거래처 모달 그리드(등록)    
	const vendGrid = new tui.Grid({
		el : document.getElementById('vendGrid'),
		//scrollX: false,
		rowHeaders : [ 'checkbox' ],
		columns : [ {
			header : '거래처코드',
			name : 'vendCd',
			align : 'center'
		}, {
			header : '거래처명',
			name : 'vendNm',
			align : 'left'
		}, {
			header : '사업자등록번호',
			name : 'binzo',
			align : 'center'
		}, {
			header : '전화번호',
			name : 'telno',
			align : 'center'
		} ]
	});

	//주문서 삭제
	let delBtn = document.getElementById("delBtn");
	delBtn.addEventListener('click', function(e) {
		var data = grid.getCheckedRows();
		if (data == '') {
			showAlert();
		} else {
			var confirmResult = confirm('선택한 주문서를 삭제하시겠습니까?');
			if (confirmResult) {
				for (var i = 0, len = data.length; i < len; i++) {
					var rowKey = data[i].rowKey;
					grid.removeRow(rowKey);
				}
				$.ajax({
					url : "deleteOrdr",
					method : "post",
					data : JSON.stringify(data),
					contentType : "application/json",
					success : function(data) {
						console.log('삭제되었습니다');
						console.log(data);
					},
					error : function(er) {
						console.log(er);
						console.log('오류')
					}
				});
			}
		}
	});
	//조건별 주문서 조회
	let ordrBtn = document.getElementById("ordrBtn");
	ordrBtn.addEventListener('click', function(e) {
		search();
	})
	
	search();
	//조건별 주문서 조회 function
	function search() {
		setTimeout(function() {
			grid.refreshLayout()
		}, 300);
		var searchData = $("#searchFrm").serialize();
		var tf = true;
		$.ajax({
			url : "findOrdr",
			dataType : "json",
			method : "post",
			data : searchData,
			success : function(result) {
				if ($("#start").val() > $("#end").val()) {
					tf = false;
					toastr.warning('검색범위가 올바르지 않습니다');
				}
				grid.resetData(result);

			}
		})
	};
	function showAlert() {
		Swal.fire({
			icon : 'error',
			title : '알림',
			text : '삭제할 주문서를 선택해주세요',
		});
	}

	//거래처 목록 모달창으로 가져오기
	function comList() {
		$("#openCompany").on("click", function(comlist) {
			setTimeout(function() {
				comGrid.refreshLayout()
			}, 300);
			$.ajax({
				url : "comSearch",
				method : "get",
				datatype : "json",
				success : function(comlist) {
					comGrid.resetData(comlist);
				}
			})
		})
	}
	//제품명 목록 모달창으로 가져오기
	function proList() {
		$("#openProduct").on("click",function(prolist) {
		setTimeout(function () {
				proGrid.refreshLayout()
			}, 300);
			$.ajax({
				url:"proSearch",
				method:"get",
				datatype:"json",
				success:function(prolist) {
					proGrid.resetData(prolist);
				}
			})
		})
	}

	
	//거래처코드 칸 클릭 -> 거래처 목록 모달창 띄우기
		var vendCdRowKey = '';
		grid.on("click",(e) => {
	const {columnName} = e;
	vendCdRowKey = e.rowKey;
	if(columnName == 'vendCd') {
		$("#vendGridModal").modal("show");
		$.ajax({
			url:"comSearch",
			dataType:"json",
			method:"get",
			success:function(vendlist) {
				setTimeout(function() {
					vendGrid.refreshLayout();
				},300);
				vendGrid.resetData(vendlist);
			}
		})
	}
})
//거래처 목록 모달창으로 가져오기
function comList() {
	$("#openCompany").on("click",function(comlist) {
		 setTimeout(function () {
			comGrid.refreshLayout()
		}, 300);
		$.ajax({
			url:"comSearch",
			method:"get",
			datatype:"json",
			success:function(comlist) {
				comGrid.resetData(comlist);
			}
		})
	})
}
		
	
		//새자료 버튼 클릭 -> 폼 input 비우기
		$("#ReBtn").on("click",function() {
			$("#searchFrm").each(function() {
				this.reset();
				grid.clear();
			})
		})

				//체크박스 선택시 거래처명 가져오기
		comGrid.on('click', e => {
			let rowInfo = comGrid.getCheckedRows(e)
			console.log(rowInfo);
			vendNm.value =  rowInfo[0].vendNm;
		})
		//모달 그리드 더블클릭시 거래처명 가져오기 *조회 거래처모달*
			 comGrid.on('dblclick', (ev) => {

    					var rowKey = ev.rowKey;
    					comGrid.check(rowKey);
    					var rowKeyData = comGrid.getCheckedRows(ev);
    					console.log(rowKeyData);
    					vendNm.value = rowKeyData[0].vendNm;
    					$(comModal).modal('hide');
					});
		
		//체크박스 선택시 제품명 가져오기
		proGrid.on('click', e => {
			let rowInfo = proGrid.getCheckedRows(e)
			prdtNm.value = rowInfo[0].prdtNm;
		})
		//모달 그리드 더블클릭시 제품명 가져오기 *조회 제품모달*
		 proGrid.on('dblclick', (ev) => {
    					var rowKey = ev.rowKey;
    					console.log(rowKey);
    					proGrid.check(rowKey);
    					var rowKeyData = proGrid.getCheckedRows(ev);
    					console.log(rowKeyData);
    					prdtNm.value = rowKeyData[0].prdtNm;
    					$("#proModal").modal('hide');
					});
		//거래처 목록 모달창에서 거래처 선택 -> 추가된 행 거래처명,코드에 값 들어가기
		vendGrid.on("click", ev => {
			console.log(ev);
			let outVendCd = vendGrid.getValue(ev.rowKey,'vendCd');
			let outVendNm  = vendGrid.getValue(ev.rowKey,'vendNm');
			console.log(outVendNm);
			grid.setValue(vendCdRowKey, 'vendCd', outVendCd);
			grid.setValue(vendCdRowKey, 'vendNm', outVendNm);
		});
		
		vendGrid.on("dblclick",(ev) => {
			$("#vendGridModal").modal('hide');
		});
</script>