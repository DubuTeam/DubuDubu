<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- DatePicker -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

<!--  Excell -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

<!-- Grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/prodcss/progMng.css" rel="stylesheet"
  type="text/css">

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>



<!-- 헤더부분 -->
<!-- Begin Page Content -->
<div class="container-fluid">
  <div class="container-fluid px-4">
    <h1 class="mt-4">생산(공정)실적관리</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
      <li class="breadcrumb-item">> 생산관리</li>
      <li class="breadcrumb-item active">> 생산(공정)실적관리</li>
    </ol>
  </div>

  <div id="container">
    <div class="rbtn">

      <!-- 생산지시 조회 Modal -->
      <div class="modal fade" id="insModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <!-- <div class="modal-dialog"> -->
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">생산 지시 조회</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="text-align: center;">
              <!-- 조회 시 나타나는 테이블 -->
              <div id="insGrid"></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
              <!-- <button type="button" class="btn btn-primary" id="selectBtn">선택</button> -->
            </div>
          </div>
        </div>
      </div>
      <!-- ↑↑↑ 모달 -->
      <!--  -->

    </div>

    <br>
    <div class="card mb-4">
      <div class="card-body">
        <div class="linelist" style="float: right;">
          <button type="button" class="btn btn-primary" id="insSearchBtn">
            <i class="fas fa-search"></i> 조회
          </button>
        </div>
        <table>
          <tr>
            <th>지시명</th>
            <td>
              <input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px">
            </td>
            <td>
              <!-- 업체명 모달창 버튼 -->
              <button type="button" style="margin-left: 3px; margin-right:10px;" class="btn btn-primary"
                data-toggle="modal" data-target="#vendModal" id="vendSearchBtn" name="vendSearchBtn">
                <i class="fas fa-search"></i>
              </button>
            </td>
            <th>지시일자</th>
            <td>
              <div style="display: flex;">
                <input type="date" id="start" name="start" class="form-control" style="width: 150px;">
                <span style="padding: 5px;">-</span>
                <input type="date" id="end" name="end" class="form-control" style="width: 150px;">
              </div>
            </td>
          </tr>
        </table>
      </div>
    </div>
    
    <br><br>
    <div class="card mb-4">
      <div class="card-body">
        <div><b>지시(제품)목록 리스트</b></div>
        <div id="prodListGrid"></div> <!-- 그리드 -->
      </div>
    </div>
    <br>
    <br>

    <div class="card mb-4">
      <div class="card-body">
        <!-- <div class="linelist" style="float: right;">
          <button type="button" class="btn btn-primary addBtn">
            <i class="fas fa-plus"></i> 추가
          </button>
          <button type="button" class="btn btn-primary saveBtn">
            <i class="fas fa-save"></i> 저장
          </button>
          <br> <br>
        </div> -->
        <div><b>진행공정흐름</b></div>
        <div id="prodFlowGrid"></div> <!-- 그리드 -->
      </div>
    </div>

    <br> <br>
    <!-- 공정실적부분 -->
    <div class="card mb-4">
      <div class="card-body">
        <div class="linelist" style="float: right;">
          <button type="button" class="btn btn-primary addBtn">
            <i class="fas fa-plus"></i> 추가
          </button>
          <button type="button" class="btn btn-primary saveBtn">
            <i class="fas fa-save"></i> 저장
          </button>
          <br> <br>
        </div>
        <div><b>생산완료된 제품</b></div>
        <div id="endGrid"></div> <!-- 그리드 -->
      </div>
    </div>

    <br> <br>
    <!-- 테스트 카테고리222 -->
    <!-- <div class="card mb-4">
      <div class="card-body">
        <div class="linelist">
          <div>테스트 카테고리222</div>
          <div class="buttonSet">
            <button type="button" class="btn btn-primary addBtn">
              <i class="fas fa-plus"></i> 버튼1
            </button>
            <button type="button" class="btn btn-primary saveBtn">
              <i class="fas fa-save"></i> 버튼2
            </button>
          </div>
        </div>

        <div id="main-contents">
          <div class="card" id="left-contents">
            <table>
              <thead>
                <tr>
                  <th>테스트컬럼1</th>
                  <th>테스트컬럼2</th>
                  <th>테스트컬럼3</th>
                  <th>테스트컬럼4</th>
                  <th>테스트컬럼5</th>
                </tr>
              </thead>

              ↓↓↓여기에 조회된 결과 출력
              <tbody>
                <tr>
                  <td>더미1-1</td>
                  <td>더미1-2</td>
                  <td>더미1-3</td>
                  <td>더미1-4</td>
                  <td>더미1-5</td>
                </tr>
                <tr>
                  <td>더미2-1</td>
                  <td>더미2-2</td>
                  <td>더미2-3</td>
                  <td>더미2-4</td>
                  <td>더미2-5</td>
                </tr>
                <tr>
                  <td>더미3-1</td>
                  <td>더미3-2</td>
                  <td>더미3-3</td>
                  <td>더미3-4</td>
                  <td>더미3-5</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="card" id="right-contents">
            <table>
              <thead>
                <tr>
                  <th>컬럼1</th>
                  <th>컬럼2</th>
                  <th>컬럼3</th>
                  <th>컬럼4</th>
                  <th>컬럼5</th>
                </tr>
              </thead>

              ↓↓↓여기에 조회된 결과 출력
              <tbody>
                <tr>
                  <td>두부1-1</td>
                  <td>두부1-2</td>
                  <td>두부1-3</td>
                  <td>두부1-4</td>
                  <td>두부1-5</td>
                </tr>
                <tr>
                  <td>두부2-1</td>
                  <td>두부2-2</td>
                  <td>두부2-3</td>
                  <td>두부2-4</td>
                  <td>두부2-5</td>
                </tr>
                <tr>
                  <td>두부3-1</td>
                  <td>두부3-2</td>
                  <td>두부3-3</td>
                  <td>두부3-4</td>
                  <td>두부3-5</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div id="workGrid"></div> 그리드
      </div>
    </div>
    <br><br>

    <div id="dialog" title=""></div> -->

    <!-- 생산지시 조회 Modal -->
    <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">생산지시조회</h5>
                      <br> <br>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div><br>
                  <div id="modGrid" class="modal-body"></div>
                  <div class="modal-footer">
                      <button type="button" id="confirmBtn" class="btn btn-primary"
                          data-bs-dismiss="modal">확인</button>
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  </div>
              </div>
          </div>
      </div> 모달창 끝 -->


    <!-- Modal -->
    <!-- 작업등록 Modal -->
    <div class="modal fade" id="workModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">작업 등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">X</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="inputMargin">
            <form id="workResultForm" name="workResultForm" action="workResult" method="post" onsubmit="return false;">
            	<input id="p_PROD_ORDER_DETAIL_CD" name="prodOrderDetailCd" type="hidden">
            	<input id="p_PRCS_CD" name="prcsCd" type="hidden">
            	<input id="p_FP_WORKER" name="fpWorker" type="hidden">
            	<input id="p_FP_START" name="fpStart" type="hidden">
            	<input id="p_FP_END" name="fpEnd" type="hidden">
            	<input id="p_FP_ERROR_CNT" name="fpErrorCnt" type="hidden">
            	<input id="p_FP_WORK_CNT" name="fpWorkCnt" type="hidden">
            	<input id="p_PRCS_PR" name="prcsPr" type="hidden">
            	<input id="p_RSC_CD" name="rscCd" type="hidden">
            	<input id="p_OUST_CNT" name="oustCnt" type="hidden">
            </form>
              <table style="width: 100%;">
                <tbody>
                  <tr>
                  	<th><b>제품명</b></th>
                  	<td><input id="prodName" type="text" readOnly style="background-color: rgb(233, 233, 233);"></td>
                  	<th><b>공정</b></th>
                  	<td><input id="process" type="text" readOnly style="background-color: rgb(233, 233, 233);"></td>
                  </tr>
                  <tr>
                    <th>작업일자</th>
                    <td><input id="today" type="text" readOnly style="background-color: rgb(233, 233, 233);"></td>
                    <th>작업자</th>
                    <td><select id="worker" style="width:200px; height:40px;">
                    		<option selected>작업자를선택하세요</option>
    						<option>박선아</option>
    						<option>병길동</option>
    						<option>권수민</option>
    						<option>박찬</option>
    						<option>박종민</option>
						</select>
					</td>
                  </tr>
                  <tr>
                    <th>설비명</th>
                    <td><input id="eqmName" type="text" readOnly style="background-color: rgb(233, 233, 233);"><input id="eqmCode" type="hidden" readOnly style="background-color: rgb(233, 233, 233);"></td>
                    <th>작업량설정</th>
                    <td><input type="text" id="workCnt" style="background-color: rgb(233, 233, 233);"></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <hr>
            <div class="row">
              <div id="equiGrid" class="col-md-6"></div>
              <div id="rscGrid" class="col-md-6"></div>
            </div>
            <hr>
            <div style="text-align: end;">
              <div class="work">
                <input type="text" id="startTime">
                <button type="button" id="workStart">작업시작</button>
                <input type="text" id="endTime">
                <button type="button" id="workEnd">작업종료</button>
              </div>
              <div class="work count-wrap _count">
                <span style="font-size: 20px;"><b>불량등록</b></span>
                 <input type="text" class="inp" value="0" />
                <button type="button" class="plus">불량(+)</button>
                <button type="button" class="minus">불량(-)</button>
              </div>
            </div>
            <div style="clear:both;"></div>
            <br>
            <hr>
            <div class="btnStyle" style="clear:both; float:right;">
              <button id="regBtn" type="button">등록</button>
              <button type="button" id="modalCancel">취소</button>
            </div>
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

// 오늘 날짜 함수
function today(){
    let date = new Date(); // 현재 날짜 및 시간
    let year = date.getFullYear();
    let month = new String(date.getMonth() + 1);
    let day = new String(date.getDate());
    if (month.length == 1) month = "0" + month;
    if (day.length == 1) day = "0" + day;
    let today = year +"-" + month + "-" + day; // 현재날짜
    $('#today').val(today);
    return today;
  }


// 생산 지시 조회 버튼 클릭시 실행하는 함수
$('#insSearchBtn').on('click', function () {
  $('#insModal').modal('show');
  showModal();
})


// 지시헤더 리스트
function showModal() {
	  $.ajax({
		url:"getIndicaHeader",
		method:"post",
		success:function(result) {
			//console.log(result);
			setTimeout(function() {
				insGrid.refreshLayout(); // new tui.Grid의 refreshLayout()으로 해줘야함
			},300);
			insGrid.resetData(result);
		},
		error: function (reject) {	   
		       console.log(reject);
		}
	}) 
 }
  
  
  // 생산 헤더 그리드
  const insGrid = new tui.Grid({
    el: document.getElementById('insGrid'), // Container element
    scrollX: false,
    scrollY: true,
    bodyHeight: 400,
    rowHeight: 50,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '생산지시코드',
        name: 'indicaCd',
        align: 'center',
        sortable: true
      },
      {
          header: '생산할 제품 건수',
          name: 'prodCount',
          align: 'center',
          sortable: true
      },
      {
        header: '생산지시일자',
        name: 'indicaDt',
        align: 'center',
        sortable: true,
        formatter : function(data){ // 날짜형식 바꿔주는것
            return dateFormat(data.value); 
       	}
      }
    ]
  });


  // 로드시 나타남
  $(document).ready(function () {
	  today(); // 오늘 날짜 실행 함수
  });
  
  
  // 지시(제품) 목록 리스트 그리드
  const prodListGrid = new tui.Grid({
    el: document.getElementById('prodListGrid'), // Container element
    scrollX: false,
    scrollY: true,
    bodyHeight: 200,
    rowHeight: 50,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '생산지시디테일코드',
        name: 'prodOrderDetailCd',
        align: 'center',
        sortable: true
      },
      {
        header: '제품명',
        name: 'prdtNm',
        align: 'center',
        sortable: true
      },
      {
        header: 'BOM코드',
        name: 'bomCd',
        align: 'center',
        sortable: true
      },
      {
        header: '지시코드',
        name: 'indicaCd',
        align: 'center',
        sortable: true
      },
      {
        header: '생산지시수량',
        name: 'indicaCnt',
        align: 'center',
        sortable: true
      },
      {
        header: '작업시작일',
        name: 'wkFrDt',
        align: 'center',
        sortable: true,
        formatter : function(data){ // 날짜형식 바꿔주는것
            return dateFormat(data.value); 
       	}
      }
    ]
  });
  

 /* $('#selectBtn').on('click', function(){
  let row = insGrid.getCheckedRows();
  let indicaCd = row[0].indicaCd; // 선택한 행의(하나만 선택) indicaCd 값을 가져옴
  prodList(indicaCd); // 생산 디테일 호출
  $('#insModal').modal('hide'); // 모달창 닫힘
  $('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거
 }); */
 
 let indicaCd = "";
 
 // 생산 지시 모달창에서 더블클릭했을때 실행하는 함수
 insGrid.on('dblclick', function(e){
	 let rowKey = e.rowKey;
	 indicaCd = insGrid.getValue(rowKey, 'indicaCd');
	 prodList(indicaCd); // 생산 디테일 호출
	 endList(indicaCd);
	 $('#insModal').modal('hide'); // 모달창 닫힘
	 $('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거
 })
  
  
//생산 디테일 (생산해야하는 제품목록들)
function prodList(indicaCd) {
	  $.ajax({
		url:"prodList",
		method:"post",
		data : {indicaCd : indicaCd},
		success: function(result) {
			prodListGrid.resetData(result);
		},
		error: function (reject) {	   
		    console.log(reject);
		}
	}) 
}
  
 
// 진행공정 흐름 그리드
const prodFlowGrid = new tui.Grid({
  el: document.getElementById('prodFlowGrid'), // Container element
  scrollX: false,
  scrollY: true,
  bodyHeight: 200,
  rowHeight: 50,
  rowHeaders: ['rowNum'],
  columns: [
    {
      header: '생산지시디테일코드',
      name: 'prodOrderDetailCd',
      align: 'center',
      sortable: true
    },
    {
      header: '공정코드',
      name: 'prcsCd',
      align: 'center',
      sortable: true
    },
    {
      header: '공정명',
      name: 'prcsNm',
      align: 'center',
      sortable: true
    },
    {
      header: '공정순서',
      name: 'prcsPr',
      align: 'center',
      sortable: true
    },
    {
      header: '자재코드',
      name: 'rscCd',
      align: 'center',
      sortable: true,
      hidden : true
    },
    {
       header: '자재소모수량',
       name: 'oustCnt',
       align: 'center',
       sortable: true,
       hidden : true
    },
    {
        header: '작업량',
        name: 'rpcsCnt',
        align: 'center',
        sortable: true
    },
    {
       header: '입고량',
       name: 'prcsStock',
       align: 'center',
       sortable: true
    },
    {
        header: '생산지시수량',
        name: 'indicaCnt',
        align: 'center',
        sortable: true,
        hidden : true
     },
    {
      header: '작업시작일',
      name: 'wkFrDt',
      align: 'center',
      sortable: true,
      formatter : function(data){ // 날짜형식 바꿔주는것
          return dateFormat(data.value); 
     	}
    },
    {
      header: '공정완료여부',
      name: 'complete',
      align: 'center',
      sortable: true
    },
    {
      header: '제품명',
      name: 'prdtNm',
      align: 'center',
      sortable: true,
      hidden: true
    },
    {
      header: 'BOM코드',
      name: 'bomCd',
      align: 'center',
      sortable: true,
      hidden: true
    }
    
  ]
});


//지시(제품)리스트를 더블클릭하였을때 실행하는 함수
prodListGrid.on('dblclick', function(e){
	let rowKey = e.rowKey;
	let prodOrderDetailCd = prodListGrid.getValue(rowKey, 'prodOrderDetailCd');
	processFlow(prodOrderDetailCd); // 지시 공정 흐름 그리드 그리기
})

// 한 제품의 공정흐름을 나타내는 함수
function processFlow(prodOrderDetailCd){
	$.ajax({
 		url:"processFlow",
 		method:"post",
 		data : {prodOrderDetailCd : prodOrderDetailCd},
 		success: function(result) {
 			prodFlowGrid.resetData(result);
 		},
 		error: function (reject) {	   
 		    console.log(reject);
 		}
 	}) 
 }

// 공정흐름에서 한 공정을 클릭할시 나타나는 작업등록 모달창
prodFlowGrid.on('dblclick', function(e){
	$('#workModal').modal('show');
	let rowKey = e.rowKey; 
	
	let prodName = prodFlowGrid.getValue(rowKey, 'prdtNm'); // 제품명
	$('#prodName').val(prodName); // 제품명 
	
	let prcsNm = prodFlowGrid.getValue(rowKey, 'prcsNm'); // 공정명
	$('#process').val(prcsNm); // 공정명
	
	let prcsCd = prodFlowGrid.getValue(rowKey, 'prcsCd'); // 공정코드
	
	let bom = prodFlowGrid.getValue(rowKey, 'bomCd'); // 공정코드
	
	let prcsStock = prodFlowGrid.getValue(rowKey, 'prcsStock'); // 입고량(전공정에서 넘어오는 생산끝난 놈)
	$('#workCnt').val(prcsStock); // 작업량 설정
	
	getEquiGrid(prcsCd); // 해당 공정의 설비 그리드
	getRscGrid(prcsCd,bom); // 해당 공정의 자재 그리드
	
	
	//////////////// 작업모달창의 form ///////////////////////
	
	$('#p_PROD_ORDER_DETAIL_CD').val(prodFlowGrid.getValue(rowKey, 'prodOrderDetailCd')); // 지시 디테일 테이블
	$('#p_PRCS_CD').val(prodFlowGrid.getValue(rowKey, 'prcsCd')); // 공정코드
	$('#p_FP_WORK_CNT').val(prodFlowGrid.getValue(rowKey, 'prcsStock')); // 입고량 = 투입량
	$('#p_PRCS_PR').val(prodFlowGrid.getValue(rowKey, 'prcsPr')); // 공정순서
	$('#p_RSC_CD').val(prodFlowGrid.getValue(rowKey, 'rscCd')); // 자재코드
	$('#p_OUST_CNT').val(prodFlowGrid.getValue(rowKey, 'oustCnt')); // 자재소모수량
	
	
	console.log('p_PROD_ORDER_DETAIL_CD : ' + $('#p_PROD_ORDER_DETAIL_CD').val());
	console.log('p_PRCS_CD : ' + $('#p_PRCS_CD').val());
	console.log('p_FP_WORK_CNT : ' + $('#p_FP_WORK_CNT').val());
	console.log('p_PRCS_PR : ' + $('#p_PRCS_PR').val());
	console.log('p_RSC_CD : ' + $('#p_RSC_CD').val());
	console.log('p_OUST_CNT : ' + $('#p_OUST_CNT').val());
	
	
	$('#eqmName').val(''); // 설비명 초기화
	$("#worker option:eq(0)").prop("selected", true); // select 첫번째값 초기화
	$('#startTime').val(''); // 작업 시작시간 초기화
	$('#endTime').val(''); // 작업 종료시간 초기화
	
	// form 초기화
	$('#p_FP_WORKER').val(''); // 담당자 초기화
	$('#p_FP_START').val(''); // 작업 시작시간 초기화
	$('#p_FP_END').val(''); // 작업 종료시간 초기화

})
  
  
  

// 작업등록 모달창에서의 설비 그리드
const equiGrid = new tui.Grid({
  el: document.getElementById('equiGrid'), // Container element
  scrollX: false,
  scrollY: true,
  bodyHeight: 200,
  rowHeight: 50,
  rowHeaders: ['rowNum'],
  columns: [
    {
      header: '공정코드',
      name: 'prcsCd',
      align: 'center',
      sortable: true,
      hidden : true
    },
    {
      header: '공정명',
      name: 'prcsNm',
      align: 'center',
      sortable: true,
      hidden : true
    },
    {
      header: '설비코드',
      name: 'eqmCd',
      align: 'center',
      sortable: true
    }, 
    {
      header: '설비명',
      name: 'eqmNm',
      align: 'center',
      sortable: true
    },
    {
      header: '사용여부',
      name: 'eqmYn',
      align: 'center',
      sortable: true
    }
  ]
});

function getEquiGrid(prcsCd){
	$.ajax({
 		url:"getEqm",
 		method:"post",
 		data : {prcsCd : prcsCd},
 		success: function(result) {
 			setTimeout(function() {
 				equiGrid.refreshLayout(); // new tui.Grid의 refreshLayout()으로 해줘야함
			},300);
 			equiGrid.resetData(result);
 		},
 		error: function (reject) {	   
 		    console.log(reject);
 		}
 	});
}

equiGrid.on('dblclick', function(e){
	let rowKey = e.rowKey;
	let eqmNm = equiGrid.getValue(rowKey, 'eqmNm'); // 설비명
	$('#eqmName').val(eqmNm);
});



// 작업등록 모달창에서의 자재 그리드
const rscGrid = new tui.Grid({
  el: document.getElementById('rscGrid'), // Container element
  scrollX: false,
  scrollY: true,
  bodyHeight: 200,
  rowHeight: 50,
  rowHeaders: ['rowNum'],
  columns: [
    {
      header: 'BOM코드',
      name: 'bomCd',
      align: 'center',
      sortable: true,
      hidden: true
    },
    {
      header: '공정코드',
      name: 'prcsCd',
      align: 'center',
      sortable: true,
      hidden: true
    },
    {
      header: '자재명',
      name: 'rscNm',
      align: 'center',
      sortable: true
    },
    {
      header: '자재코드',
      name: 'rscCd',
      align: 'center',
      sortable: true
    },
    {
      header: '자재소모수량',
      name: 'oustCnt',
      align: 'center',
      sortable: true
    }
  ]
});

// 자재그리드에서 뿌려주는 데이터
function getRscGrid(prcsCd,bom){
	$.ajax({
 		url:"getRsc",
 		method:"post",
 		data : {prcsCd : prcsCd, bomCd:bom},
 		success: function(result) {
 			setTimeout(function() {
 				rscGrid.refreshLayout(); // new tui.Grid의 refreshLayout()으로 해줘야함
			},300);
 			rscGrid.resetData(result);
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

// 작업 시작 버튼을 누르면 시작하는 함수
$('#workStart').on('click', function(){
	let time = PrintTime();
	$('#startTime').val(time);
	$('#p_FP_START').val(time);
});

//작업 종료 버튼을 누르면 시작하는 함수
$('#workEnd').on('click', function(){
	let time = PrintTime();
	$('#endTime').val(time);
	$('#p_FP_END').val(time);
});

// 담당자 변경시
$('#worker').on('change', function(){
	 let worker = $(this).val();
	 $('#p_FP_WORKER').val(worker);
})


// 현재 작업시간 출력
function PrintTime() {
    let today = new Date();
    let hh = today.getHours();
    let mi = today.getMinutes();
    let ss = today.getSeconds();
    let time = hh + ":" + mi + ":" + ss;
    return time;
}

$('#modalCancel').on('click', function(){
	$('#workModal').modal('hide'); // 모달창 닫힘
	$('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거
})


// 수량 증가 감소
$('._count :button').on({ 'click' : function(e){
        e.preventDefault();
        var $count = $(this).parent('._count').find('.inp');
        var now = parseInt($count.val());
        var min = 0;
        var max = 999;
        var num = now;
        if($(this).hasClass('minus')){
            var type = 'm';
        }else{
            var type = 'p';
        }
        if(type=='m'){
            if(now>min){
                num = now - 1;
            }
        }else{
            if(now<max){
                num = now + 1;
            }
        }
        if(num != now){
            $count.val(num);
        }
        
        $('#p_FP_ERROR_CNT').val($count.val());
        console.log('p_FP_ERROR_CNT : ' + $('#p_FP_ERROR_CNT').val());
    }
});

$('#regBtn').on('click', function(){
	
	let data = $('#workResultForm').serialize();
	
	$.ajax({
 		url:"workResult",
 		method:"post",
 		data : data,
 		success: function(result) {
 			/*setTimeout(function() {
 				rscGrid.refreshLayout(); // new tui.Grid의 refreshLayout()으로 해줘야함
			},300);
 			rscGrid.resetData(result);*/
 			
 			Swal.fire({
                icon: 'success',
                title: '작업등록이 완료되었습니다.'
            });
 			
 			$('#workModal').modal('hide'); // 모달창 닫힘
 			$('.modal-backdrop').remove(); // 모달창 닫을때 생기는 background배경 제거
 			
 			prodList(indicaCd); // 생산 디테일 호출
 			endList(indicaCd); // 공정 끝난 제품 호출
 			
 			let prodOrderDetailCd = $('#p_PROD_ORDER_DETAIL_CD').val();
 			processFlow(prodOrderDetailCd);
 		},
 		error: function (reject) {	   
 		    console.log(reject);
 		}
 	});
});


// 생산 완료된 제품들 그리드
const endGrid = new tui.Grid({
  el: document.getElementById('endGrid'), // Container element
  scrollX: false,
  scrollY: true,
  bodyHeight: 200,
  rowHeight: 50,
  rowHeaders: ['rowNum'],
  columns: [
    {
      header: '생산지시디테일코드',
      name: 'prodOrderDetailCd',
      align: 'center',
      sortable: true
    },
    {
      header: '제품명',
      name: 'prdtNm',
      align: 'center',
      sortable: true
    },
    {
      header: 'BOM코드',
      name: 'bomCd',
      align: 'center',
      sortable: true
    },
    {
      header: '지시코드',
      name: 'indicaCd',
      align: 'center',
      sortable: true
    },
    {
      header: '생산지시수량',
      name: 'indicaCnt',
      align: 'center',
      sortable: true
    },
    {
      header: '작업시작일',
      name: 'wkFrDt',
      align: 'center',
      sortable: true,
      formatter : function(data){ // 날짜형식 바꿔주는것
          return dateFormat(data.value); 
     	}
    }
  ]
});

// 생산 완료된 리스트
function endList(indicaCd) {
	  $.ajax({
		url:"endProdList",
		method:"post",
		data : {indicaCd : indicaCd},
		success: function(result) {
			endGrid.resetData(result);
		},
		error: function (reject) {	   
		    console.log(reject);
		}
	}) 
}



</script>