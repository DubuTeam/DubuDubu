<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/resources/css/prodcss/plan.css" rel="stylesheet" type="text/css">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<!-- SweetAlert -->
<link rel="stylesheet"   href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script   src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- 부트스트랩 --><script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

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
							name="tui-date-picker-target" style="display: inline;">
						<!--<span class="tui-ico-date"></span>-->
						<!--<div id="tui-date-picker-container1" style="margin-top: -1px;"></div>-->
						<!--</div>-->
					</div>
					<div class="linelist">
						<button id="clearBtn" class="btn btn-primary" form="" onclick="reset()">
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
											<div id="orderGrid"></div>									
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary" onclick="addOrder()">등록</button>
									</div>
								</div>
							</div>
						</div>

						<!-- ↑↑↑ 모달 -->
						<!--  -->
						<button class="btn btn-primary" id="regiBtn" onclick="newPlan()">
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
						<div id="orderDetailGrid"></div>
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
/* let orderKey = '';
let orderValue = ''; */
let str = '';
// 주문서 조회
/*  const orderList = [
	<c:forEach items="${selectOrderList}" var="order">
	{
	orderNo : '${order.orderNo}',
	vendNm : '${order.vendNm}',
	prdtNm : '${order.prdtNm}'	
	},
	</c:forEach>
];  */

 function reset(){
	location.reload();
 };


 function search() {
	 
	$.ajax({
        url: "planOrderList",
        method: "post",
        success: function(data) {
           setTimeout(()=>grid.refreshLayout(),300);
           grid.resetData(data);  //그리드 적용
        },
        error: function (reject) {
          console.log(reject);
        },
    });
}  
		//그리드 선언
        var grid = new tui.Grid({
             el: document.getElementById('orderGrid'),
             rowHeaders: ['checkbox'],
             columns: [

                 {
                     header: '주문번호',
                     name: 'orderNo'
                 },
                 {
                     header: '납기일자',
                     name: 'paprdDt'
                 },
                 {
                     header: '제품명',
                     name: 'prdtNm'
                 },
                 {
                	 header: '제품수량',
                	 name: 'orderCnt'
                 }
                 
             ]

         });
        searchBtn.addEventListener("click", search);

        /* //로드시 나타남
        $(document).ready(function(){
            grid.resetData(orderList);   // 그리드에 값 입력	
        }); */

     /*    $('#searchBtn').on('click','button',function(){
        	$(document).getElementById('orderGrid');
        	//${'#exampleModal'}.modal('show');
        	
        });  */ 
     
     // 모달창의 체크한 건만 가져오기
     grid.on('check', (ev) => {
   	      checkLen = grid.getCheckedRows().length;
  	  });
     grid.on('checkAll', (ev) => {
  	      checkLen = grid.getCheckedRows().length;
  	  });   
     grid.on('unCheck', (ev) => {
  	      checkLen = grid.getCheckedRows().length;
  	  }); 
     
     function addOrder(){
    	// 체크한 행만 가져오기
    	 for (let i = 0; i < checkLen; i++) {
    	        str += grid.getCheckedRows()[i].orderNo + ",";
    	      };
    	 console.log(str);
    	 orderDetail();
     
    	  $('#exampleModal').modal('hide');
          $('.modal-backdrop').remove();
      // 주문서 디테일 조회  
      // 더블 클릭시 모달창의 정보가 본페이지에 보임
/*        grid.on('dblclick', (ev) => {
        //console.log(ev);
        //console.log(ev.rowKey);
        orderKey = ev.rowKey
        orderValue = grid.getValue(orderKey,'orderNo');
       	//orderValue = ev.rowKey
        console.log(orderValue);
        
        
       }); */
        //console.log(orderValue);
       
    
       
       function orderDetail(){
    	$.ajax({
            url: "planOrderDetail",
            method: "post",
            data: { orderNo : str},
            success: function(data) {
            	console.log(data);
            	detailGrid.resetData(data);  //그리드 적용
            },
            error: function (reject) {
              console.log(reject);
            },
        });
       };
   
     };
       
       
      //그리드 선언
        var detailGrid = new tui.Grid({
             el: document.getElementById('orderDetailGrid'),
             columns: [

                 {
                     header: '계획코드',
                     name: 'planCd',
                     editor: 'text'
                 },
                 {
                     header: '주문번호',
                     name: 'orderNo'
                 },
                 {
                     header: '원료수량',
                     name: 'avalStc'
                 }
                 
             ]

         });
      
        function newPlan(){
     	   detailGrid.appendRow({
     			 planCd: null,
     			 orderNo: null,
     			 avalStc: null
     		})
         		}
     	 
</script>