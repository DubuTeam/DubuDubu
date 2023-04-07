<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.min.css" />
<script
	src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.min.js"></script>
</head>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/orderList.css"
	rel="stylesheet" type="text/css">


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
												<button type="submit" class="btn btn-primary"
													id="openCompany" data-bs-toggle="modal"
													data-bs-target="#comModal">
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
												<button type="submit" class="btn btn-primary"
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
		<button class="btn btn-primary" id="delBtn" onclick="orderDelete()">
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

<script>
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
			defaultValue : '접수완료'
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
			name : 'bizNo',
			width : 110,
			align : 'center'
		}, {
			header : '전화번호',
			name : 'telNo',
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
			name : 'bizNo',
			align : 'center'
		}, {
			header : '전화번호',
			name : 'telNo',
			align : 'center'
		} ]
	});

	//삭제 ajax
	function orderDelete() {
		var delList = [];
		// 체크한 행만 가져오기
		var checkedRows = grid.getCheckedRows();
		for (let i = 0; i < checkedRows.length; i++) {
			delList.push({
				prcsCd : checkedRows[i].prcsCd
			});
		}
		console.log(delList);

		$.ajax({
			url : 'deleteOrdr',
			data : JSON.stringify(delList),
			type : 'DELETE',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				console.log('주문서 삭제 성공');
				grid.removeCheckedRows();
			},
			error : function(reject) {
				console.log('주문서 삭제 실패');
			}
		});
	}
	//조건별 주문서 조회
	let ordrBtn = document.getElementById("ordrBtn");
	ordrBtn.addEventListener('click', function(e) {
		search();
	})

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
</script>