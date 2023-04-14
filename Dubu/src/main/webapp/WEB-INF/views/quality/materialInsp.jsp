<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style>
tr {
	height: 50px;
}

.inspBtn {
	border-width: 0.01em;
	border-radius: 5px;
	border-color: #4f5050;
	color: black;
	height: 25px;
}

.layout {
	width: 1628px;
	height: 750px;
	display: grid;
	grid: "header header header" 85px "ordr ordr ordr" 85px
		"body body rightside" auto/auto auto 350px;
	gap: 8px;
}

.header {
	grid-area: header;
}

.ordr {
	grid-area: ordr;
}

.rightside {
	grid-area: rightside;
}

.body {
	grid-area: body;
}

.highlight {
	background-color: rgba(19, 78, 94, 0.2) !important;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>




</head>


<!-- Begin Page Content -->
<div class="container-fluid"></div>
<!-- Page Heading -->
<div class="container-fluid px-4">
	<h1 class="mt-4">자재입고검사</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i
				class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 자재관리</li>
		<li class="breadcrumb-item active">> 자재입고검사</li>
	</ol>

	<section class="layout">
		<div class="header">
			<div class="card" id="card-1">
				<div class="card-body">
					<div style="display: inline-block; margin: auto 0; float: right;">
						<button class="btn btn-primary" id="saveBtn">
							<i class="fas fa-save"></i> 저장
						</button>
						<button class="btn btn-primary" id="delDataBtn">
							<i class="fas fa-file"></i> 삭제
						</button>
						<button class="btn btn-primary" id="reloadBtn">
							<i class="fas fa-file"></i> 새자료
						</button>
					</div>
					<table style="vertical-align: middle; text-align: center">
						<colgroup>
							<col style="width: 120px">
							<col style="width: 30px">
							<col style="width: 80px">
							<col style="width: 180px">
							<col style="width: 20px">
							<col style="width: 80px">
							<col style="width: 180px">
						</colgroup>
						<tbody>
							<tr>
								<th><b>자재검사등록</b></th>
								<td></td>
								<th><b>검사일자</b></th>
								<td>
									<div>

										<input type="date" id="inspDt" name="inspDt"
											class="form-control" style="width: 150px;">
									</div>
									<div id="wrapper" style="margin-top: -1px;"></div>
								</td>
								<td></td>
								<th><b>검사자</b></th>
								<td><input type="text" id="inspTstr" class="form-control"
									style="width: 168px;"></td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
		</div>

		<div class="ordr">
			<div class="card">
				<div class="card-body">
					<form id="ordrListFrm">
						<table style="vertical-align: middle; text-align: center">
							<colgroup>
								<col style="width: 120px">
								<col style="width: 30px">
								<col style="width: 80px">
								<col style="width: 250px">
								<col style="width: 20px">
								<col style="width: 100px">
								<col style="width: 350px">
							</colgroup>
							<tr>
								<th><b>발주자료 조회</b></th>
								<td></td>
								<th><label for="vendNm"><b>업체명</b></label></th>
								<td style="display: flex;"><input id="vendNm" type="text"
									class="form-control" placeholder="검색버튼을 이용하세요"
									style="width: 200px;" required readonly> <input
									id="vendCd" type="hidden" name="vendCd">
									<button id="modalBtn" type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#vendModal"
										onclick="setTime()">
										<i class="fas fa-search"></i>
									</button></td>
								<td></td>
								<th><b>납기예정일</b></th>
								<td>
									<div style="display: flex;">
										<input type="date" id="startDt" name="startDt"
											class="form-control" style="width: 150px;"> <span
											style="padding: 5px;">-</span> <input type="date" id="endDt"
											name="endDt" class="form-control" style="width: 150px;">
									</div>
								</td>
								<th></th>
								<td><input id="getOrdrList" type="button"
									class="btn btn-primary" value="가져오기" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="body" style="margin-top: 40px;">
			<div class="card">
				<div class="card-body">
					<div class="linelist" style="float: right">
						<button class="btn btn-primary" id="delRow" style="height: 30px">
							<i class="fas fa-minus"></i> 삭제
						</button>
					</div>
					<br> <br>

				</div>
				<div id="grid"></div>
			</div>
		</div>

		<div class="rightside" style="margin-top: 40px;">
			<div class="card">
				<div class="card-body">
					<b>검사목록</b> <br> <br>
					<div id="mdfy-grid"></div>
				</div>
			</div>
		</div>
	</section>
</div>

<div class="modal fade" id="vendModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">업체검색</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="vendSchForm">
					<table>
						<colgroup>
							<col style="width: 400px;">
							<col style="width: 10px">
							<col style="width: 50px;">
						</colgroup>
						<tbody>
							<tr>
								<td><input type="text" name="vendNm" class="form-control"
									placeholder="업체명"></td>
								<td></td>
								<td rowspan="2">
									<button id="vendSch" class="btn btn-primary" type="button"
										style="height: 90px;">
										<i class="fas fa-search"></i>
									</button>
								</td>
							</tr>
							<tr>
								<td><input type="text" name="vendCd" class="form-control"
									placeholder="업체코드"></td>
							</tr>
						</tbody>
					</table>
				</form>
				<br>
				<div id="vendgrid"></div>
				<div style="float: right">
					<p>선택 : 더블클릭</p>
				</div>
			</div>
		</div>
	</div>
</div>


<!--inspection detail modal-->
<div class="modal fade" id="infModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<b class="modal-title">검사상세</b>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="inf-grid"></div>
				<br>
				<div style="float: right">
					<input type="button" id="calInfCnt" value="입력"
						class="btn btn-primary">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
		/* document.addEventListener('load', function () {
			getVendListInit();
			//getRscListInit();
			//getInfList();
			//schRscInspHist();
		}) */
		$(function () {
			getVendListInit();
			getRscListInit();
		})



		///////////////////////////// vendor ////////////////////////////////
		// declare vendor modal
		/*   let vModal ="";
		  modalBtn.addEventListener('click', function () {
			  vModal = new bootstrap.Modal(document.getElementById('vendModal'), {})
			  vModal.show('vendModal');
		  }) */

		// when vendor modal shown
		let vendModal = document.getElementById('vendModal');
		console.log(vendModal);
		vendModal.addEventListener('shown.bs.modal show.bs.modal', e => {
			console.log('modal open!');
			setTimeout(() => vendGrid.refreshLayout(), 300);
		});

		function setTime() {
			setTimeout(() => vendGrid.refreshLayout(), 300);
		}


		// vendor grid
		let vendGrid = new tui.Grid({
			el: document.getElementById('vendgrid'),
			bodyHeight: 300,
			scrollX: false,
			scrollY: true,
			columns: [
				{
					header: '업체코드',
					name: 'vendCd'
				},
				{
					header: '업체이름',
					name: 'vendNm'
				},
				{
					header: '사업자번호',
					name: 'binzo'
				},
				{
					header: '전화번호',
					name: 'telno'
				}
			]
			, editingEvent: 'click'
		});

		$(document).ready(function () {
			$('#vendSch').on('click', function () {
				ssss();
			})
		});

		function ssss() {
			var searchData = {
				vendNm: $('input[name=vendNm]').val(),
				vendCd: $('input[name=vendCd]').eq(1).val()
			}

			$.ajax({
				url: 'getVendors',
				type: 'POST',
				dataType: 'json',
				data: searchData,

				success: function (res) {
					console.log(searchData),
						console.log("성공");
					vendGrid.innerHTML = '';
					vendGrid.resetData(res);
				},
				error: function (xhr, status, error) {
					console.error(xhr.responseText);
				}
			});
		}

		// action in vendor modal
		vendGrid.on('dblclick', e => {
			let rowInfo = vendGrid.getRow(e.rowKey)
			let vendInfo = rowInfo.vendNm
			vendNm.value = vendInfo;
			vendCd.value = rowInfo.vendCd;
			console.log(vendNm.value)
			console.log(vendCd.value)
			$(vendModal).modal('hide');
			$('.modal-backdrop').remove(); // 
		})




		// get vendor grid data


		function getVendListInit() {
			$.ajax({
				url: 'getVendors',
				method: 'GET',
				dataType: 'json',
				success: function (res) {
					vendGrid.resetData(res);
				}
			});
		}

		//===========================main grid =========================================
			

		// main grid section

		let grid = new tui.Grid({
			el: document.getElementById('grid'),
			bodyHeight: 450,
			scrollX: false,
			scrollY: true,
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '자재코드',
					name: 'rscCd',
					align: 'center',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '품명',
					name: 'rscNm',
					align: 'center',
					width: 50,
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '규격',
					name: 'rscSpec',
					align: 'center',
					width: 80
				},
				{
					header: '단위',
					name: 'mngUnit',
					align: 'center',
					width: 50
				},
				{
					header: '공급업체',
					name: 'vendNm',
					align: 'center'
				},
				{
					header: '발주번호',
					name: 'ordrCd',
					align: 'center',
					sortingType: 'desc',
					sortable: true
				},
				{
					header: '발주량',
					name: 'ordrCnt',
					align: 'right',
					sortingType: 'desc',
					sortable: true
				},
				{
					header: '미입고량',
					name: 'rmnCnt',
					align: 'right',
					sortingType: 'desc',
					sortable: true
				},
				{
					header: '가입고량',
					name: 'preIstCnt',
					editor: 'text',
					validation: {
						dataType: 'number',
						required: true
					},
					relations: [
						{
							targetNames: ['inspCnt'],
							editable({ value }) {
								return value !== null;
							}
						}
					],
					align: 'right'
				},
				{
					header: '검사량',
					name: 'inspCnt',
					validation: {
						dataType: 'number',
						required: true,
						validatorFn: (value, row, ordrCnt) => Number(value) <= Number(row['preIstCnt'])
					},
					editor: {
						type: 'text',
						options: {
							maxLength: 10
						}
					},
					align: 'right'
				},
				{
					header: '검사',
					name: 'rscInfBtn',
					align: 'center',
					//renderer: { type: 'rscInfBtn' },
					width: 50
				},
				{
					header: '합격량',
					name: 'inspPassCnt',
					editor: 'text',
					validation: {
						dataType: 'number',
						required: true
					},
					align: 'right'
				},
				{
					header: '불량수량',
					name: 'inspFailCnt',
					align: 'right'
				}
			]
			, editingEvent: 'click'
		});

		// get rsc grid data
		/* function getRscListInit() {
			let url = 'getResources'
			fetch(url).then(res => res.json())
				.then(res => rscGrid.resetData(res))
		} */

		function getRscListInit() {
			$.ajax({
				url: 'getResources',
				dataType: 'json',
				success: function (res) {
					rscGrid.resetData(res);
				},
				error: function (xhr, status, error) {
					console.error('Error:', error);
				}
			});
		}

		///////////////////////////// get ordr list ////////////////////////////////
		// get order list
		


		/*   function getOrdrList() {
			  // initiate inf list
  
			  infData.clear();
			  getInfList();
  
			  // init conditions
			  saveFlag = 0;
			  grid.showColumn('rmnCnt');
  
			  if (startDt.value === '' || endDt.value === '') {
				  toastr.error('기간을 입력하세요.');
			  } else {
				  let data = new FormData(ordrListFrm)
				  let url = 'getRscOrdrList';
				  fetch(url, {
					  method: 'POST',
					  body: data
				  })
					  .then(res => res.json())
					  .then(res => grid.resetData(res))
			  }
		  } */
		$(document).ready(function () {
			$('#getOrdrList').on('click', function () {
				getOrdr();

			})
		});
		
		function getOrdr() {
			var searchDate = {
				startDt: $('#startDt').val(),
				endDt: $('#endDt').val(),
				vendCd: $('#vendCd').val()
			}
			console.log(searchDate)
			//infData.clear();
			//getInfList();

			// init conditions
			//saveFlag = 0;
			//grid.showColumn('rmnCnt');

			if (startDt.value === '' || endDt.value === '') {
				toastr.error('기간을 입력하세요.');
			} else {
				$.ajax({
					url: 'getRscOrdrList',
					type: 'POST',
					data: searchDate,
					success: function (res) {

						grid.resetData(res);
					},
					error: function (xhr, status, error) {
						console.error('Ajax Error:', error);
					}
				});
			}
		}

	

		//=====================infGrid=====================

		let infGrid = new tui.Grid({
			el: document.getElementById('inf-grid'),
			bodyHeight: 300,
			scrollX: false,
			scrollY: true,
			columns: [
				{
					header: '불량코드',
					name: 'ccdDtl',
					align: 'center'
				},
				{
					header: '불량명',
					name: 'ccdDtlNm',
					align: 'center'
				},
				{
					header: '불량수량',
					name: 'infCnt',
					editor: 'text',
					align: 'center'
					
				}
			]
			, editingEvent: 'click'
		})
		let infData = new Map();
        let infModal = document.getElementById('infModal');

		//제품코드 칸 클릭 -> 제품코드 모달창 띄우기
		var infRowKey = '';
		 grid.on("dblclick", (e) => {

			const { columnName } = e;
			infRowKey = e.rowKey;
			console.log('TEST');
			let data = grid.getRow(infRowKey);
			console.log(data);
			/*  let rowKey = $('#infModal').data('rowKey');
			  let data = infData.get(rowKey);
			  if (data === undefined) { // initiate
			    infGrid.setColumnValues('infCnt', '');
			  } else if (data.length !== 0) {
			    infGrid.resetData(data);
			  } else {
			    infGrid.setColumnValues('infCnt', '');
			  }
			  infGrid.refreshLayout(); */
			
			if(columnName == 'rscInfBtn'){
				$("#infModal").modal("show");
				$.ajax({
					url: 'getInfCdList',
					dataType: "json",
					method: "get",
					success: function (edctsCdList) {
						setTimeout(function () {
							infGrid.refreshLayout();
						}, 300);
						infGrid.resetData(edctsCdList);
					}
				}) 
			}
		}) 
 
 
//=================================mdfygrid==================================
	  let mdfyGrid = new tui.Grid({
            el: document.getElementById('mdfy-grid'),
            bodyHeight: 450,
            scrollX: false,
            scrollY: true,
            columns: [
                {
                    header: '검사코드',
                    name: 'rscInspCd',
                    align: 'center'
                },
                {
                    header: '검사일자',
                    name: 'inspDt',
                    align: 'center'
                },
                {
                    header: '건수',
                    name: 'inspCnt',
                    align: 'center',
                    width: 50
                }
            ]
            , editingEvent: 'click'
        })
		 
//=================================검사량 가입고량 등등 처리 ================================
	
	 let rModal;
        let rscModalState = 0;

        class customInput {
            constructor(props) {
                const el = document.createElement('input');
                let {rowKey} = props;
                this.rowKey = rowKey
                el.type = 'text';
                el.value = String(props.value);
                el.addEventListener('dblclick', function () {
                    rModal = new bootstrap.Modal(document.getElementById('rscModal'), {})
                    rModal.show('rscModal');
                    rscModal.dataset.rowKey = rowKey;
                    rscModalState = 1;
                })
                this.el = el;
            }

            getElement() {
                this.el.value = '';
                return this.el;
            }

            getValue() {0
            	
                if (rscModalState === 0) {
                    getRscSingle(this.el.value, this.rowKey)
                }
                return this.el.value;
            }

            mounted() {
                this.el.select();
            }
        }

        class inputPreIstCnt {
            constructor(props) {
                let el = document.createElement('input');
                let {rowKey} = props;
                this.rowKey = rowKey;
                el.type = 'text';
                el.value = String(props.value);
                this.el = el;
            }

            getValue() {
                let val = this.el.value.replace(/[^0-9]/g, '')
                grid.setValue(this.rowKey, 'inspCnt', val);
                grid.setValue(this.rowKey, 'inspPassCnt', val);
                grid.setValue(this.rowKey, 'inspFailCnt', '');
                return val;
            }

            mounted() {
                this.el.select();
            }
        }

        class inputInspCnt {
            constructor(props) {
                let el = document.createElement('input');
                let {rowKey} = props;
                this.rowKey = rowKey;
                el.type = 'text';
                el.value = String(props.value);
                this.el = el;
            }

            getElement() {
                let preIstCnt = grid.getValue(this.rowKey, 'preIstCnt')
                if (preIstCnt === '' || preIstCnt == null) {
                    toastr.error('가입고량을 먼저 입력하세요');
                } else {
                    this.el.value = ''
                    return this.el;
                }
            }

            getValue() {
                let val = this.el.value.replace(/[^0-9]/g, '')
                let preIstCnt = grid.getValue(this.rowKey, 'preIstCnt')
                if (parseInt(val) > parseInt(preIstCnt)) {
                    toastr.error('검사량이 입고량 보다 많습니다.');
                    grid.setValue(this.rowKey, 'inspPassCnt', '');
                    grid.setValue(this.rowKey, 'inspFailCnt', '');
                    return '';
                } else {
                    grid.setValue(this.rowKey, 'inspPassCnt', val);
                    if (val === '') {
                        return val;
                    } else {
                        return parseInt(val);
                    }
                }
            }

            mounted() {
                this.el.select();
            }
        }

	</script>
</div>
</div>
</div>