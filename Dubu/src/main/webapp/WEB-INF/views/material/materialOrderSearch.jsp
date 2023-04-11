<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<!-- DatePicker -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/material/materialOrdrSearch.css"
	rel="stylesheet">

<style>
.tui-grid-cell.cell-red {background-color : #FFF0F5;
						 color : red;
						 font-weight: bold;
}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주조회</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body">
			<div class="linelist" style="float: right;">
					<button type="button" class="btn btn-primary" id="searchBtn">
						<i class="fas fa-search"></i> 조회
					</button>
					<br> <br>
			</div>
			<table>
				<tr>
					<th>업체명</th>
					<td>
						<input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px">
					</td>
					<td>
						<!-- 업체명 모달창 버튼 -->
						<button type="button" style="margin-left: 3px; margin-right:10px;"
							class="btn btn-primary" data-toggle="modal"
							data-target="#vendModal" id="vendSearchBtn" name="vendSearchBtn">
							<i class="fas fa-search"></i>
						</button>
					</td>
					<th>발주신청일</th>
					<td>
						<div style="display: flex;">
							<input type="date" id="start" name="start" class="form-control" style="width: 150px;"> 
							<span style="padding: 5px;">-</span> 
							<input type="date" id="end" name="end" class="form-control" style="width: 150px;">
						</div>
					</td>
				</tr>
			</table>
			<!-- 업체명 Modal -->
				<div class="modal fade" id="vendModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- <div class="modal-dialog"> -->
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">업체 검색</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">X</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: center;">
								<!-- 조회 시 나타나는 테이블 -->
								<div id="vendModalTable" class="table">
									<table style="width:100%;">
										<thead>
											<tr>
												<td>No.</td>
												<th>업체코드</th>
												<th>업체명</th>
												<th>사업자번호</th>
												<th>전화번호</th>
											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
										<tbody id="vendModallist">
											<c:forEach items="${vendMoalList}" var="vendModal" varStatus="status">
												<tr class='eachRow' ondblclick="searchVend('${vendModal.vendNm}')">
													<td>${status.count}</td>
													<td>${vendModal.vendCd}</td>
													<td>${vendModal.vendNm}</td>
													<td>${vendModal.binzo}</td>
													<td>${vendModal.telno}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- ↑↑↑ 모달 -->
				<br><br>
				<div id="grid"></div> <!-- 그리드 -->
			</div>
		</div>

		<!-- 자재발주 내역 조회 Modal -->
		<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">자재발주내역조회</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<label style="margin-top: 5px; display:inline;">발주코드</label> 
								<input class="form-control" type="text" id="ordrCd" name="ordrCd" style="width: 180px; margin-bottom: 10px; display:inline;" readonly />
							</div>
							<div class="col-md-4"></div>
							<div class="linelist col-md-2" style="margin-bottom:10px; float:right;">
								<button type="button" class="btn btn-primary" id="saveBtn">
									<i class="fas fa-save"></i> 수정
								</button>
								<button id="pdfBtn" name="pdfBtn" type="button"
									class="btn btn-primary">
									<i class="fas fa-download"></i> PDF
								</button>
							</div>
						</div>
						<div id="materialOrderDetailGrid"></div>
					</div>
				</div>
			</div>
		</div><!-- 모달창 끝 -->
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<script>

//업체 검색 모달창에서 더블클릭시 작동하는 함수
function searchVend(vendName){
	$('#vendNm').val(vendName); // 거래처명 입력됨
	$('#vendModal').modal('hide'); // 모달창 닫기
	$('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거
}

// 그리드
const grid = new tui.Grid({
	  el: document.getElementById('grid'), // Container element
	  scrollX: true,
      scrollY: true,
      rowHeaders: ['rowNum'],
	  columns: [
	    {
	      header: '발주코드',
	      name: 'ordrCd',
	      align : 'center'
	    },
	    {
	      header: '업체코드',
	      name: 'vendCd',
	      align : 'center'
	    },
	    {
	      header: '업체명',
	      name: 'vendNm',
	      align : 'center'
	    },
	    {
	      header: '발주신청일',
	      name: 'ordrReqDt',
	      align : 'center',
	      formatter : function(data){ // 날짜형식 바꿔주는것
              return dateFormat(data.value);
         }

	    }
	  ]
	  /* data: [
	    {
	      ordrCd: 'ordrCd',
	      vendCd: 'Birdy',
	      vendNm: '2016.03.26',
	      ordrReqDt: 'Pop'
	    }
	  ] */
	});

// 로드시 나타남
$(document).ready(function(){
	searchAll();
});

//조회버튼 클릭시 작동하는 함수
$('#searchBtn').on('click',function(){
	 searchAll();
});

// 바로 화면에 나타나는 발주전체 목록
function searchAll(){
	let vendNm = $('#vendNm').val();
	let startOrdrReqDt = $('#start').val();
	let endOrdrReqDt = $('#end').val();
	
	//console.log(vendNm + " " + startOrdrReqDt + " " + endOrdrReqDt);
	
	$.ajax({
		   url: 'materialOrderSearch',
		   type: 'post',
		   data: {vendNm : vendNm, startOrdrReqDt : startOrdrReqDt, endOrdrReqDt : endOrdrReqDt}, // 쿼리스트링 */
		   success: function (data) {
			   grid.resetData(data);
		   },
	 error: function (reject) {	   
		       console.log(reject);
		   }
	});
}

//날짜 변환
function dateFormat(date) {
   let date1 = new Date(date);
   let date2 = date1.getFullYear() + '-' 
         + ((date1.getMonth()<10)?'0'+(date1.getMonth()+1):(date1.getMonth()+1)) + '-'
         + ((date1.getDate()<10)?'0'+date1.getDate():date1.getDate());       
   return date2;
}


// 그리드 셀 더블클릭시 나타나는 상세 자재 발주 모달창
grid.on('dblclick', (e) => {
	
	let rscCdRowKey = '';
	rscCdRowKey = e.rowKey; // 내가 더블클릭한 곳의 index 값
	
	// getRow(e.rowKey) : rowKey값의 행 정보(object)를 가져옴
	// Return the object that contains all values in the specified row.
	let ordrCd = grid.getRow(e.rowKey).ordrCd; 
 
	$('#detailModal').modal('show'); // 모달창 show
	
	$.ajax({
		url:"materialDetail",
		data : {ordrCd:ordrCd},
		method:"post",
		success:function(result) {
			//console.log(result);
			setTimeout(function() {
				detailGrid.refreshLayout(); // new tui.Grid의 refreshLayout()으로 해줘야함
			},300);
			$('#ordrCd').val(ordrCd);
			detailGrid.resetData(result);
		}
	}) 
});

// 자재발주 내역 모달창 그리드  
const detailGrid = new tui.Grid({
	el : document.getElementById('materialOrderDetailGrid'),
	scrollX : false,
	scrollY : false,
	rowHeaders : [ 'checkbox' ],
	columns : [ 
		{
			header : '자재코드',
			name : 'rscCd'
		}, 
		{
			header : '자재명',
			name : 'rscNm'
		},
		{
			header : '업체코드',
			name : 'rscNm'
		},
		{
			header : '업체명',
			name : 'vendNm'
		},
		{
			header : '발주코드',
			name : 'ordrCd'
		},
		{
			header : '발주수량',
			name : 'ordrCnt',
			editor : 'text',
			onAfterChange : function(data){ // 값이 변경되면 실행되는 함수
				console.log(typeof(data.value));
				if(typeof(data.value)=='number'){
					let rowKey = data.rowKey; // 변견한 행의 index
					let ordrCnt = parseInt(data.value); // 변경한 발주 수량
					let avalStc = parseInt(detailGrid.getRow(rowKey).avalStc); // 현재 재고
					let expect = ordrCnt + avalStc; // 현재 재고 + 발주 수량 = 예상 재고량
					
					detailGrid.setValue(rowKey, 'expect', expect, false) // 예상재고량 변경
					detailGrid.addCellClassName(rowKey, 'expect', 'cell-red'); // CSS
				}else{
					 Swal.fire({
		                  icon: 'error',
		                  title: '문자를 입력하실수없습니다.',
		                  text:  '숫자를 입력해주세요'
		              });
				}
				
				
			}
		},
		{
			header : '현재재고',
			name : 'avalStc'
		},
		{
			header : '안전재고',
			name : 'safStc'
		},
		{
			header : '예상재고량',
			name : 'expect'
		},
		{
			header : '납기요청일',
			name : 'paprdCmndDt',
			formatter : function(data){    
	              return dateFormat(data.value);
	       	}
		},
	]
});

// 수정 버튼 클릭시 실행하는 함수
$('#saveBtn').on('click', function(){
	
	
	
	
});


</script>