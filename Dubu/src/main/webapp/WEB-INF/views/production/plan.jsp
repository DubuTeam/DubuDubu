<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<link href="${pageContext.request.contextPath}/resources/css/prodcss/plan.css" rel="stylesheet" type="text/css">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<!-- Begin Page Content -->
	<!-- 헤더부분 -->
	<!-- 생산계획 -->
	<div class="container-fluid">
		<div class="container-fluid px-4">
			<h1 class="mt-4">생산계획</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 생산관리</li>
				<li class="breadcrumb-item active">> 생산계획</li>
			</ol>
		</div>
		<!-- 헤더부분 -->
		<div id="container">
			<div class="card mb-4">
				<div class="card-body" id="upper-body">
					<div id="pDate">
						<!--<div class="tui-datepicker-input tui-datetime-input tui-has-focus">-->
						<label>생산계획일자</label> <input type="date" id="tui-date-picker-target"
							name="tui-date-picker-target" class="form-control" style="width: 150px; display: inline;">
						<!--<span class="tui-ico-date"></span>-->
						<!--<div id="tui-date-picker-container1" style="margin-top: -1px;"></div>-->
						<!--</div>-->
					</div>
					<div class="linelist">
						<button id="clearBtn" class="btn btn-primary" form="">
							<i class="fas fa-file"></i> 초기화
						</button>

						<!--  -->
						<!-- Button trigger modal (4.6버젼) -->
						<button type="button" style="margin-left: 3px" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal" id="searchBtn" name="searchBtn">
							<i class="fas fa-search" ></i>주문서
						</button>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<!-- <div class="modal-dialog"> -->
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">주문서 조회</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body" style="text-align: center;">

										<!-- 조회 시 나타나는 테이블 -->
										<div id="list-body" class="table">
											<div id="orderGrid"></div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary">삭제</button>
									</div>
								</div>
							</div>
						</div>

						<!-- ↑↑↑ 모달 -->
						<!--  -->
						<button class="btn btn-primary" id="regiBtn">
							<i class="fas fa-file"></i> 새계획
						</button>
						<button class="btn btn-primary" id="osBtn">
							<i class="fas fa-save"></i> 저장
						</button>
					</div>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-body">
					<div id="list-body" class="table">
						<table id="datatablesSimple" class="table">
							<thead>
								<tr>
									<th>계획코드</th>
									<th>주문번호</th>
									<th>원료수량</th>
									<th>납기일자</th>
								</tr>
							</thead>

							<!-- ↓↓↓여기에 조회된 결과 출력 -->
							<tbody id="list"></tbody>
						</table>
					</div>
					<div id="grid"></div>
				</div>
			</div>
			<br>
			<div class="card mb-4">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<div id="grid2" style="width: 65%;">제품
							<div id="list-body" class="table">
								<table id="datatablesSimple" class="table">
									<thead>
										<tr>
											<th>제품명</th>
											<th>라인번호</th>
											<th>시작일자</th>
											<th>종료일자</th>
											<th>생산수량</th>
											<th>작업우선순위</th>
											<th>계획코드</th>
										</tr>
									</thead>

									<!-- ↓↓↓여기에 조회된 결과 출력 -->
									<tbody id="list"></tbody>
								</table>
							</div>
						</div>
						<div id="grid3" style="width: 30%;">제품공정확인
							<div id="list-body" class="table">
								<table id="datatablesSimple" class="table">
									<thead>
										<tr>
											<th>제품코드</th>
											<th>라인번호</th>
											<th>공정코드</th>
											<th>계획코드</th>
										</tr>
									</thead>

									<!-- ↓↓↓여기에 조회된 결과 출력 -->
									<tbody id="list"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="card mb-4">
					<div class="card-body">
						<div class="d-flex flex-row justify-content-between">
							<div id="grid2" style="width: 65%;">사용가능자재
								<div id="list-body" class="table">
									<table id="datatablesSimple" class="table">
										<thead>
											<tr>
												<th><input type="checkbox" /></th>
												<th>자재명</th>
												<th>자재LOT</th>
												<th>사용가능수량</th>
												<th>출고수량</th>
												<th>사용량</th>

											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 -->
										<tbody id="list"></tbody>
									</table>
								</div>
							</div>
							<div id="grid3" style="width: 30%;">자재확인
								<div id="list-body" class="table">
									<table id="datatablesSimple" class="table">
										<thead>
											<tr>
												<th>자재코드</th>
												<th>공정코드</th>
												<th>출고수량</th>
												<th>계획코드</th>

											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 -->
										<tbody id="list"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div id="tui-date-picker-container" style="margin-top: -1px;"></div>
					<br>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">주문서 조회</h5>
									<br> <br>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<br>
								<div id="modGrid" class="modal-body"></div>
								<div class="modal-footer">
									<button type="button" id="confirmBtn" class="btn btn-primary"
										data-bs-dismiss="modal">확인</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
<script>
$(document).ready(function(){
	orderList();
});
function orderList() {
	 
	$.ajax({
        url: "orderList",
        method: "post",
        data: { orderNo : orderNo },
        success: function(data) {
           grid.resetData(data);  //그리드 적용
        },
        error: function (reject) {
          console.log(reject);
        },
    });
} 
		//그리드 선언
        var grid = new tui.Grid({
             el: document.getElementById('orderGrid')
             columns: [

                 {
                     header: '주문번호',
                     name: 'OrderNo'
                 },
                 {
                     header: '거래처명',
                     name: 'VendNm'
                 },
                 {
                     header: '제품명',
                     name: 'PrdtNm'
                 }
                 
             ]

         });
</script>