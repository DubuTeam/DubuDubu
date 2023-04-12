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
			<li>> 영업관리</li>
			<li>> 제품입고등록</li>
		</ol>

		<form id="submitFrm">
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

							<form name="IstSearchFrm" id="IstSearchFrm" action="#">
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
									<td><input type="text" class="form-control"
										id="edctsIstNo" name="edctsIstNo"
										style="width: 150px; margin-left: 6px;" readonly
										value="${getlstNo}" readonly></td>
									<th>완제품LOT번호</th>
									<td style="width: 175px;">
										<div class="input-group">
											<input type="text" class="form-control" id="edctsLotNo"
												name="edctsLotNo" readonly>
											<div class="input-group-append">
												<button type="button" class="btn btn-primary"
													id="lotSearchBtn" data-toggle="modal"
													data-target="#lotModal">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</td>

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
	aria-labelledby="lotModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="lotModalLabel">검사완료 완제품LOT번호</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="lotNoGrid"></div>
			</div>
			<div class="modal-footer">
				<button type="button" id="confirmBtn" class="btn btn-primary"
					data-dismiss="modal">확인</button>
				<button type="button" id="cancleLotBtn" class="btn btn-secondary"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 div끝 -->
</div>
<!-- /.container-fluid -->
</div>
<script>
	$(function() {
		istOptionList();
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

	

	//제품 입고 목록 조건별 조회
	function istOptionList() {
		var optionIstData = $("#IstSearchFrm").serialize();
		$.ajax({
			url : "istOptionList",
			method : "post",
			dataType : "json",
			data : optionIstData,
			success : function(optionList) {
				grid.resetData(optionList);
			}
		})
	}

	$("#dtSearchBtn").on("click", function() {
		istOptionList();
	})
	 //제품 입고번호 칸 클릭 -> 폼에 상세값 출력
		grid.on("click",(e) => {
			const {columnName} = e;			
			IstNoRowKey = e.rowKey;
			let edctsIstNoResult = grid.getValue(IstNoRowKey ,'edctsIstNo');
			let edctsLotNoResult = grid.getValue(IstNoRowKey, 'edctsLotNo');
			let edctsIstCntResult = grid.getValue(IstNoRowKey, 'edctsIstCnt');
			console.log(edctsIstNoResult);
			if(columnName == 'edctsIstNo') {
				let nextIstNo = (parseInt(edctsIstNoResult.substring(3)) + 1).toString().padStart(4, '0');
			    edctsIstNo.value = 'IST' + nextIstNo;
				edctsLotNo.value = edctsLotNoResult;
				edctsIstCnt.value = edctsIstCntResult;
			}
		})
		
		//완제품LOT번호 검색 버튼 클릭 -> 완제품LOT번호 목록 모달창
		$("#lotSearchBtn").on("click",function(lotList) {
			setTimeout(function () {
							lotNoGrid.refreshLayout()
							}, 300);
				$.ajax({
					url:"getLotList",
					method:"get",
					dataType:"json",
					success:function(lotList) {
						lotNoGrid.resetData(lotList);
					}
				})
			})

			//체크박스 선택시 완제품LOT번호 가져오기
		lotNoGrid.on("click", e => {
			let rowInfo = lotNoGrid.getCheckedRows(e);
			edctsLotNo.value = rowInfo[0].edctsLotNo;
			inspCnt.value = rowInfo[0].inspCnt;
		})
		//모달 그리드 더블클릭시 완제품LOT번호 가져오기
		  lotNoGrid.on('dblclick', (ev) => {
    					var rowKey = ev.rowKey;
    					console.log(rowKey);
    					lotNoGrid.check(rowKey);
    					var rowKeyData = lotNoGrid.getCheckedRows(ev);
    					console.log(rowKeyData);
    					edctsLotNo.value = rowKeyData[0].edctsLotNo;
    					inspCnt.value = rowKeyData[0].inspCnt;
    					$("#lotModal").modal('hide');
					});
		//새자료 버튼 클릭 -> 폼 input 비우기
		$("#ReBtn").on("click",function() {
			$("#IstSearchFrm").each(function() {
				this.reset();
			})
		})
		
	
		
		  	    //제품 입고 등록&수정
	    $("#saveBtn").click(ev => {
	    	//제품 입고 등록버튼 클릭 -> 제품 입고번호 자동생성 & 등록 시 출력
	    	//var submitData = $("#submitFrm").serialize();
	    	var inspData = lotNoGrid.getCheckedRows();
	    	var edctsLotNo = $("#edctsLotNo").val();
	    	console.log(edctsLotNo);
	    	console.log(inspData);
	    	var edctsCd = lotNoGrid.getValue(inspData[0].rowKey,'edctsCd');
	    	console.log(edctsCd);
	    	
	    	var edctsIstDt = $("#edctsIstDtStart").val();
	    	var edctsIstCnt = $("#edctsIstCnt").val();
	    	console.log(edctsIstCnt);
	    	var edctsIstNo = $("#edctsIstNo").val();
	    	var orderNo = lotNoGrid.getValue(inspData[0].rowKey,'orderNo');
	    	//var orderNo = inspData[0].orderNo;
			console.log(orderNo);
			if($("#edctsIstCnt").val() == '') {
				toastr.warning('입고수량을 입력해주세요');
			}else{
				$.ajax({
	    		url:"saveIst",
	    		dataType:"json",
	    		method:"post",
	    		async:false,
	    		data:{"edctsCd":edctsCd,"edctsLotNo":edctsLotNo,"edctsIstDt":edctsIstDt,"edctsIstCnt":edctsIstCnt,"edctsIstNo":edctsIstNo},
	    		success:function(result) {	
	    			toastr.success('저장되었습니다');
	    			salesIstList();
	    			//입고등록 후 진행상황 입고완료로 수정
	    			$.ajax({
	    				url:"modifyProg",
	    				method:"put",
	    				dataType:"json",
	    				data:{"orderNo":orderNo},
	    				error:function(er) {
	    					console.log('에러!');
	    				},
	    				success:function(ordrList) {
	    					istOptionList();
	    				}
	    			})
	    		}
	    	})
			}	
	   })
			
	

</script>
</div>
</div>
<!-- End of Main Content -->

