<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- DatePicker -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

<!--  Excell -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

<!-- Grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	
<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/material/materialIst.css" rel="stylesheet">

<style>
.tui-grid-cell.cell-red {
	background-color : #FFF0F5;
	color : red;
	font-weight: bold;
}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재입고관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재입고관리</li>
		</ol>

		<section class="layout">
			<div class="header">
				<div class="card">
					<div class="card-body">
						<div style="display: inline-block; margin: auto 0; float: right">
							<button class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 저장
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
									<th><b>입고등록</b></th>
									<td></td>
									<th><b>입고일자</b></th>
									<td>
										<div style="height: 40px; border-radius: 5px;">
											<input type="date" id="istDt" class="form-control">
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
									</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br>
			<div class="sub">
				<div class="card">
					<div class="card-body">
						<form id="getIstListFrm">
							<input type="hidden" name="from" value="ist">
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
									<th><b>검사자료 조회</b></th>
									<td></td>
									<th><label for="vendNm"><b>업체명</b></label></th>
									<td>
										<div style="display: flex;">
											<input id="vendNm" type="text" class="form-control" placeholder="검색버튼을 이용하세요" style="width: 200px;" required readonly> 
											<input id="vendCd" type="hidden" name="vendCd">
											<button id="modalBtn" type="button" class="btn btn-primary" style="margin-left: 10px;">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</td>
									<td></td>
									<!-- <th><b>검사자료</b></th>
									<td>
										<div style="display: flex;">
											<input type="date" id="start" name="start"
												class="form-control" style="width: 150px;"> <span
												style="padding: 5px;">-</span> <input type="date" id="end"
												name="end" class="form-control" style="width: 150px;">
											<input id="getInspList" type="button" class="btn btn-primary" value="가져오기" />
										</div>
									</td> -->
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			
			<br>
			
			<div class="styleFlex"><!-- 플렉스쓰려고 넣은것 -->
				<div class="body">
					<div class="card">
						<div class="card-body">
							<div class="linelist" style="float: right;">
								<button class="btn btn-primary" id="delRow" style="height: 30px">
									<i class="fas fa-minus"></i> 삭제
								</button>
							</div>
							<br> <br>
							<div id="grid"></div> <!-- 그리드 -->
							<!-- 조회 시 나타나는 테이블 -->
							<!-- <div id="list-body" class="table">
								<table>
									<thead>
										<tr>
											<th><input type="checkbox"></th>
											<th>자재코드</th>
											<th>품명</th>
											<th>규격</th>
											<th>단위</th>
											<th>자재유형</th>
											<th>발주번호</th>
											<th>입고가능수량</th>
											<th>입고수량</th>
											<th>유통기한</th>
										</tr>
									</thead>
									↓↓↓여기에 조회된 결과 출력
									<tbody id="list">
										<tr>
											<td><input type="checkbox"></td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
										</tr>
									</tbody>
								</table>
							</div> -->
							<!-- 조회시 나타나는 테이블 닫는 태그 -->
						</div>
					</div>
				</div>

				<div class="rightside">
					<div class="card">
						<div class="card-body">
							<b>입고목록</b> <br> <br>
							<!-- 조회 시 나타나는 테이블 -->
							<div id="list-body" class="table">
								<table>
									<thead>
										<tr>
											<th>입고코드</th>
											<th>입고일자</th>
											<th>건수</th>
										</tr>
									</thead>
									<!-- ↓↓↓여기에 조회된 결과 출력 -->
									<tbody id="list">
										<tr>
											<td>test</td>
											<td>test</td>
											<td>test</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 조회시 나타나는 테이블 닫는 태그 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 플렉스넣은태그 닫는태그 -->
	</div>
	<br><br>

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

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<script>

function today(){
	  let date = new Date(); // 현재 날짜 및 시간
	  let year = date.getFullYear();
	  let month = new String(date.getMonth() + 1);
	  let day = new String(date.getDate());
	  if (month.length == 1) month = "0" + month;
	  if (day.length == 1) day = "0" + day;
	  let today = year +"-" + month + "-" + day; // 현재날짜
	  $('#istDt').val(today);
}

//그리드
const grid = new tui.Grid({
	  el: document.getElementById('grid'), // Container element
	  scrollX: false,
      scrollY: true,
      bodyHeight: 400,
      rowHeight: 50,
      rowHeaders: ['checkbox'],
	  columns: [
	  {
	      header: '검사번호',
	      name: 'rscInspCd',
	      align : 'center'
	    },
	    {
	      header: '자재코드',
	      name: 'rscCd',
	      align : 'center'
	    },
	    {
	      header: '자재명',
	      name: 'rscNm',
	      align : 'center'
	    },
	    {
	      header: '규격',
	      name: 'rscSpec',
	      align : 'center'
	    },
	    {
	      header: '단위',
	      name: 'mngUnit',
	      align : 'center'
		},
		{
	      header: '자재유형',
	      name: 'rscTyp',
	      align : 'center'
	    },
	    {
	      header: '발주번호',
	      name: 'ordrCd',
	      align : 'center'
	    },
	    {
	      header: '입고가능수량',
	      name: 'psQuantity',
	      align : 'center'
	    },
	    {
	      header: '입고수량',
	      name: 'istCnt',
	      editor : 'text',
	      align : 'center',
	      onAfterChange : function(data){ // 값이 변경되면 실행되는 함수		
			let rowKey = data.rowKey; // 변경한 행의 index
			grid.addCellClassName(rowKey, 'istCnt', 'cell-red'); // CSS
			grid.check(rowKey); // 체크박스가 체크됨
	      }
	    },
	    {
	      header: '유통기한',
	      name: 'expDt',
	      align : 'center',
	      formatter: function (data) {
            let dateVal = '';
            if(data.value != null ){
               dateVal = dateFormat(data.value);
            }else{
               dateVal = getToday();
            }
             return dateVal;
           },
           editor: {
               type: 'datePicker',
               options: {
                 format: 'yyyy-MM-dd',
                 //selectableRanges: [[todayForgrid,threeMonthsLater ]]
                date : getToday()
               }
           },
           onAfterChange : function(data){ // 값이 변경되면 실행되는 함수		
   			let rowKey = data.rowKey; // 변경한 행의 index
   			grid.addCellClassName(rowKey, 'expDt', 'cell-red'); // CSS
   			grid.check(rowKey); // 체크박스가 체크됨
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


//로드시 나타남
$(document).ready(function(){
	today();
	searchAll();
});

//바로 화면에 나타나는 발주전체 목록
function searchAll(){
	/* let vendNm = $('#listVendNm').val();
	let startOrdrReqDt = $('#start').val();
	let endOrdrReqDt = $('#end').val(); */
	
	let vendNm = $('#vendNm').val();
	console.log(vendNm);
	//console.log(vendNm + " " + startOrdrReqDt + " " + endOrdrReqDt);
	
	$.ajax({
		   url: 'materialIstList',
		   type: 'post',
		   data: {vendNm : vendNm}, // 쿼리스트링 */
		   success: function (data) {
			   grid.resetData(data);
			   //console.log(data);
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

function getToday() {
    let date = new Date();
    let hours = String(date.getHours()).padStart(2, "0");
    let minutes = String(date.getMinutes()).padStart(2, "0");
    let seconds = String(date.getSeconds()).padStart(2, "0");
    let years = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, "0");
    let day = String(date.getDate()).padStart(2, "0");
    
    return years + "-" + month + "-" + day;
 }

 
 $('#modalBtn').on('click', function(){
	 $('#vendModal').modal('show');
	 
 });
 
 // 업체 검색 모달창에서 더블클릭시 작동하는 함수
function searchVend(vendName){
	$('#vendNm').val(vendName); // 거래처명 입력됨
	$('#vendModal').modal('hide'); // 모달창 닫기
	$('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거		
	//$('.close').click(); // 모달창 닫기
	searchAll();
}
 

 

</script>

