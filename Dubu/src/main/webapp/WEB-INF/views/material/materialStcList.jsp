<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
	
<link href="${pageContext.request.contextPath}/resources/css/material/materialStcList.css" rel="stylesheet">

<style>
	.eachRow:hover {
		background-color: rgb(233, 233, 233);
	}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재재고조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재재고조회</li>
		</ol>
		<div class="card">
			<div class="card-body">
				<div style="display: inline-block; margin: auto 0; float: right">
					<button class="btn btn-primary" id="schBtn">
						<i class="fas fa-search"></i> 조회
					</button>
				</div>
				<form id="schParam">
					<table style="vertical-align: middle;">
						<colgroup>
							<col style="width: 100px;">
						</colgroup>
						<tbody>
							<tr>
								<th><b>조회일자</b></th>
								<td>
									<div style="height: 40px; border-radius: 5px;">
											<input type="date" id="istDt" class="form-control">
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
								</td>
							</tr>
							<tr>
								<th><label for="rscNm"><b>자재명</b></label></th>
								<td><input id="rscNm" style="width: 200px; float: left"
									type="text" placeholder="검색버튼을 이용하세요" class="form-control"
									required readonly> <input id="rscCd" type="hidden"
									name="rscCd">
									<!--  자재명 모달창 버튼 -->
							<button type="button" style="margin-left: 3px; margin-right : 10px;"
								class="btn btn-primary" data-toggle="modal"
								data-target="#materialModal" id="rscSearchBtn" name="rscSearchBtn">
								<i class="fas fa-search"></i>
							</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<br>
		<div class="card">
			<div class="card-body">
				<div id="grid"></div>
				<!-- 조회 시 나타나는 테이블 -->
				<%-- <div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th>자재코드</th>
								<th>자재명</th>
								<th>자재구분</th>
								<th>규격</th>
								<th>단위</th>
								<th>재고수량</th>
								<th>안전재고</th>
								<th>입고수량</th>
								<th>출고수량</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="list">
							<c:forEach items="${materialStocklList }" var="material">
								<tr class="eachRow">
									<td>${material.rscCd }</td>
									<td>${material.rscNm }</td>
									<td>${material.rscTyp }</td>
									<td>${material.rscSpec }</td>
									<td>${material.mngUnit }</td>
									<td>${material.rscStc }</td>					
									<td>${material.safStc }</td>
									<td>${material.istCnt }</td>					
									<td>${material.oustCnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div> --%>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div>
		<br><br>
	</div>

	<!-- 자재명 Modal -->
	<div class="modal fade" id="materialModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<!-- <div class="modal-dialog"> -->
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">자재 검색</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<!-- 조회 시 나타나는 테이블 -->
					<div id="materialModalTable" class="table">
						<table style="width:100%;">
							<thead>
								<tr>
									<td>No.</td>
									<th>자재코드</th>
									<th>자재명</th>
									<th>자재유형</th>
									<th>자재단위</th>
								</tr>
							</thead>

							<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
							<tbody id="materialModallist">
							<c:forEach items="${materialModalList}" var="materialModal" varStatus="status">
								<tr class='eachRow' ondblclick="searchMaterial('${materialModal.rscNm}')">
									<td>${status.count}</td>
									<td>${materialModal.rscCd}</td>
									<td>${materialModal.rscNm}</td>
									<td>${materialModal.rscTyp}</td>
									<td>${materialModal.mngUnit}</td>
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


//그리드
const grid = new tui.Grid({
	  el: document.getElementById('grid'), // Container element
	  scrollX: false,
      scrollY: true,
      bodyHeight: 400,
      rowHeight: 50,
      rowHeaders: ['rowNum'],
	  columns: [
	  	{
	      header: '자재코드',
	      name: 'rscCd',
	      align : 'center',
	      sortable : true
	  	},
	  	{
	      header: '자재명',
	      name: 'rscNm',
	      align : 'center',
	      sortable : true
		},
	    {
	      header: '자재유형',
	      name: 'rscTyp',
	      align : 'center',
	      sortable : true
		},
	    {
	      header: '규격',
	      name: 'rscSpec',
	      align : 'center',
	      sortable : true,
	      hidden : true
	    },
	    {
	      header: '단위',
	      name: 'mngUnit',
	      align : 'center',
	      hidden : true
	    },
	    {
	      header: '안전재고',
	      name: 'safStc',
	      align : 'center'
		},
	    {
	      header: '입고수량',
	      name: 'istCnt',
	      align : 'center'
	    },
	    {
	      header: '출고수량',
	      name: 'oustCnt',
	      align : 'center'
	    },
	    {
	      header: '현재재고',
	      name: 'rscStc',
	      align : 'center'
	    },
	    {
	      header: '업데이트날짜',
	      name: 'clsYymm',
	      align : 'center',
	      formatter : function(data){ // 날짜형식 바꿔주는것
              return dateFormat(data.value); 
         }
	    }
	]
});

//로드시 나타남
$(document).ready(function(){
	today();
	countPrint(); // 현재재고 조회
});


function countPrint(){
	
	let rscNm = $('#rscNm').val();
	
	$.ajax({
		   url: 'materialCountHist',
		   type: 'post',
		   data: {rscNm:rscNm},
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


//자재 검색 모달창에서 더블클릭시 작동하는 함수
function searchMaterial(materialName){	
	$('#rscNm').val(materialName); // 자재명 입력됨
	countPrint();
	$('#materialModal').modal('hide'); // 모달창 닫기
	$('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거
	//$('.close').click(); // 모달창 닫기
}

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
</script>