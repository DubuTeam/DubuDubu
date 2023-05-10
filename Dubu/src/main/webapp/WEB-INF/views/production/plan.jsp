<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="${pageContext.request.contextPath}/resources/css/prodcss/plan.css"
	rel="stylesheet" type="text/css">
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- DatePicker -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<!-- grid -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>


<!-- Begin Page Content -->
<!-- 헤더부분 -->
<!-- 생산계획 -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">생산지시</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 생산관리</li>
			<li class="breadcrumb-item active">> 생산지시</li>
		</ol>
	</div>
	<!-- 헤더부분 -->
	<div id="container">
		<div class="card mb-4">
			<div class="card-body" id="upper-body">
				<div id="pDate">
					<!--<div class="tui-datepicker-input tui-datetime-input tui-has-focus">-->
					<!-- <label>생산계획일자</label> <input type="date" id="tui-date-picker-target"
							name="tui-date-picker-target" style="display: inline;"> -->
					<!--<span class="tui-ico-date"></span>-->
					<!--<div id="tui-date-picker-container1" style="margin-top: -1px;"></div>-->
					<!--</div>-->
				</div>
				<div class="linelist">
					<button id="clearBtn" class="btn btn-primary" form=""
						onclick="reset()">
						<i class="fas fa-file"></i> 초기화
					</button>

					<!--  -->
					<!-- Button trigger modal (4.6버젼) -->
					<button type="button" style="margin-left: 3px"
						class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal" id="searchBtn" name="searchBtn">
						<i class="fas fa-search"></i>주문서
					</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<!-- <div class="modal-dialog"> -->
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body" style="text-align: center;">
									<!-- 모달창 뜨면 바로 조회 -->
									<!-- 조회 시 나타나는 테이블 -->
									<div id="recruitGrid"></div>
								</div>
								<div class="modal-footer">
									<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
									<!-- <button type="button" class="btn btn-primary" onclick="addOrder()">등록</button> -->
								</div>
							</div>
						</div>
					</div>

					<!-- ↑↑↑ 모달 -->
					<!--  -->
					<!-- <button class="btn btn-primary" id="regiBtn" onclick="newPlan()">
							<i class="fas fa-file"></i> 새계획
						</button> -->
					<button class="btn btn-primary" id="osBtn" onclick="savePlan()">
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
					<div id="grid2" style="width: 65%;">
						제품
						<div id="gridEquip"></div>
					</div>
					<div id="grid3" style="width: 30%;">
						제품공정확인
						<div id="gridEquipCheck"></div>
					</div>
				</div>
			</div>
			<br>
			<div class="card mb-4">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<div id="grid2" style="width: 100%;">
							사용가능자재
							<div id="gridMaterial"></div>
						</div>
					</div>
				</div>

				<div id="tui-date-picker-container" style="margin-top: -1px;"></div>
				<br>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
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
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->
		<script>
let equipKey = '';
let equipValue1 = ''; 
let equipValue = '';
let materialKey = '';
let materialValue = '';
let materialValue1 = '';
let str = '';
let str1 = '';
let planCd='';
let getData='';

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
             columns: [
            	 {
                     header: 'BOM코드',
                     name: 'bomCd',
                     hidden: true
                 },

                 {
                     header: '주문번호',
                     name: 'orderNo'
                 },
                 {
                     header: '납기일자',
                     name: 'paprdDt',
                     formatter: function (data) {
                         let dateVal = '';
                         if(data.value != null ){
                             dateVal = dateChange(data.value);
                         }else{
                             dateVal = getToday();
                         }
                         return dateVal;
                       }
                 },
                 {
                     header: '제품명',
                     name: 'prdtNm'
                 },
                 {
                	 header: '주문수량',
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
     /* grid.on('check', (ev) => {
   	      checkLen = grid.getCheckedRows().length;
  	  });
     grid.on('checkAll', (ev) => {
  	      checkLen = grid.getCheckedRows().length;
  	  });   
     grid.on('unCheck', (ev) => {
  	      checkLen = grid.getCheckedRows().length;
  	  });  */
     
  	  // 주문서를 더블 클릭하면 조회
  	 grid.on('dblclick', (ev) => {
  	   //console.log(ev);
  	   //console.log(equipKey);
  	   str = grid.getRow(ev.rowKey).orderNo;
  	   str1 = grid.getRow(ev.rowKey).bomCd;
  	   console.log(str);
  	   console.log(str1);
  	   //console.log(equipValue);
  	   orderDetail();
  	   planEquip(str);     
  	   planMaterial(str1);
	  $('#exampleModal').modal('hide');
     $('.modal-backdrop').remove();
    }); 
  	  
/*      function addOrder(){
    	// 체크한 행만 가져오기
    	 for (let i = 0; i < checkLen; i++) {
    	        str += grid.getCheckedRows()[i].orderNo + ",";
    	      }; 
    	 //console.log(str);
    	 orderDetail();
    	
     }; */
      
          // 주문서 디테일 조회       
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
   
     
       
       
      //그리드 선언
        var detailGrid = new tui.Grid({
             el: document.getElementById('orderDetailGrid'),
             columns: [

                 {
                	 header: '주문번호',
                     name: 'orderNo'
                 },
                 {
                     header: '거래처명',
                     name: 'vendNm'
                 },
                 {
                     header: '제품명',
                     name: 'prdtNm'
                 },
                 {
                     header: '주문수량',
                     name: 'orderCnt'
                 }
                 
             ]

         });
      
        function newPlan(){
     	   detailGrid.appendRow({
     		  orderNo: null,
     		  vendNm: null,
     		  prdtNm: null,
     		  orderCnt: null
     		})
         		}
       function savePlan(){
    	   /* console.log(grid.getModifiedRows().createdRows);
       	let data = { createdRows : grid.getModifiedRows({ignoredColumns: ['_attributes', 'rowKey']}).createdRows };
       	console.log(JSON.stringify(data));
       	$.ajax({
       	    url: 'insertPrcs',
       	    data: JSON.stringify(grid.getModifiedRows({ignoredColumns: ['_attributes', 'rowKey']})),
       	    contentType : 'application/json',
       	    type: 'POST',
       	    async: false,
       	    success: function(data) {
       	        	search();  
       	    },
       	    error: function(reject) {
       	        console.log(reject);
       	    }
       	}); */
       		getData=gridEquip.getData({ignoredColumns: ['_attributes', 'rowKey']})
    	   $.ajax({
       	    url: 'updatePlan',
       	    data: JSON.stringify(getData),
       	    contentType : 'application/json',
       	    type: 'POST',
       	    async: false,
       	    success: function(data) {
       	    	Swal.fire({
	        		      icon: 'success',
	        		      title: '생산지시가 등록되었습니다.'
	        		 });
       	        	search();
       	    },
       	    error: function(reject) {
       	        console.log(reject);
       	    }
       	});
       }
       
   
       // 제품, 사용가능자재 그리드
       function planEquip(str){
    	   
               $.ajax({
                   url: "selectPlanEquip",
                   method: "post",
                   data: { orderNo : str },
                   success: function(data) {
                	   //console.log(data)
                	  gridEquip.resetData(data);  //그리드 적용
                   },
                   error: function (reject) {
                     console.log(reject);
                   }
               });
       }
       function planMaterial(str1){
               $.ajax({
                   url: "selectPlanMaterial",
                   method: "post",
                   data: { bomCd : str1 },
                   success: function(data) {
                	   //console.log(data);
                	  gridMaterial.resetData(data);  //그리드 적용
                   },
                   error: function (reject) {
                     console.log(reject);
                   }
               });
               
               }
           		//그리드 선언
                   var gridEquip = new tui.Grid({
                        el: document.getElementById('gridEquip'),
                        columns: [
                        	{
                        		header: '진행공정관리코드',
                        		name: 'prcsProgCd',
                        		hidden: true
                        	},
                        	{
                        		header: '공정코드',
                        		name: 'prcsCd',
                        		hidden: true
                        	},
                        	{
                        		header: '생산지시디테일코드',
                        		name: 'prodOrderDetailCd',
                        		hidden: true
                        	},
                        	{
                        		header: '완제품코드',
                        		name: 'edctsCd',
                        		hidden: true
                        	},
                        	{
                        		header: 'BOM코드',
                        		name: 'bomCd',
                        		hidden: true
                        	},
                        	{
                        		header: '지시코드',
                        		name: 'indicaCd',
                        		hidden: true
                        		
                        	},
                            {
                            	header: '주문번호',
                            	name: 'orderNo',
                            	hidden: true
                            },
                            {
                                header: '제품명',
                                name: 'prdtNm'
                            },
                            {
                                header: '지시수량',
                                name: 'indicaCnt',
                                editor: 'text'
                            },
                            {
                                header: '생산지시일자',
                                name: 'indicaDt',
                                align : 'center',         
                                sortingType: 'asc',       
                                 sortable: true,       
                                 editor: {             
                                 type: 'datePicker',              
                                options: {                
                                format: 'yyyy-MM-dd',                
                                //selectableRanges: 
                                //[[todayForgrid,threeMonthsLater ]]                
                            	language: 'ko',     //한국기준               
                                date : getToday()              
                                }         
                                 },         
                                formatter: function (data) {            
                                let dateVal = '';            
                                if(data.value != null ){              
                                 dateVal = dateFormat(data.value);            
                                }else{               
                                dateVal = getToday();          
                                 }            
                                data.value = dateVal;             
                                return dateVal;           
                                }
                            },
                            {
                                header: '작업시작일자',
                                name: 'wkFrDt',
                                align : 'center',         
                                sortingType: 'asc',       
                                 sortable: true,       
                                 editor: {             
                                 type: 'datePicker',              
                                options: {                
                                format: 'yyyy-MM-dd',                
                                //selectableRanges: 
                                //[[todayForgrid,threeMonthsLater ]]                
                            	language: 'ko',     //한국기준               
                                date : getToday()              
                                }         
                                 },         
                                formatter: function (data) {            
                                let dateVal = '';            
                                if(data.value != null ){              
                                 dateVal = dateFormat(data.value);            
                                }else{               
                                dateVal = getToday();          
                                 }            
                                data.value = dateVal;             
                                return dateVal;           
                                }
                            }
                        ]

                    });
           		
                 //날짜 변환
                   function dateFormat(date) {
                      let date1 = new Date(date);
                      let date2 = date1.getFullYear() + '-' 
                            + ((date1.getMonth()<10)?'0'+(date1.getMonth()+1):(date1.getMonth()+1)) + '-'
                            + ((date1.getDate()<10)?'0'+date1.getDate():date1.getDate());       
                      return date2;
                   }
           		
                   // 날짜변형
                   function dateChange(date) {
                   	   let date1 = new Date(date);
                   	   let date2 =
                   	     date1.getFullYear() + "-" + 
                   	     (date1.getMonth() < 10 ? "0" + (date1.getMonth() + 1): date1.getMonth() + 1) +"-" +
                   	     (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
                   	   return date2;
                   	 };
                   
                   function getToday(){
                   	const date = new Date();
                   	const hours = String (date.getHours()).padStart(2,"0");
                   	const minutes = String(date.getMinutes()).padStart(2,"0");
                   	const seconds = String(date.getSeconds()).padStart(2,"0");
                   	const years = date.getFullYear();
                   	const month = String(date.getMonth()+1).padStart(2,"0");
                   	const day = String(date.getDate()).padStart(2,"0");
                   	return years + "-" + month + "-" + day;
                   }
           		
           		
                 //사용가능 자재 그리드 선언
                   var gridMaterial = new tui.Grid({
                        el: document.getElementById('gridMaterial'),
                        columns: [

                            {
                                header: '자재코드',
                                name: 'rscCd',
                                hide: true
                            },
                            {
                                header: '자재명',
                                name: 'rscNm'
                            },
                            {
                                header: '사용가능수량',
                                name: 'avalStc'
                            },
                            {
                                header: '사용량',
                                name: 'oustCnt'
                            }
                        ]

                    });
                 
                    // 제품 그리드의 행을 클릭하면 제품공정확인 그리드가 살행
                    gridEquip.on('click', (ev) => {
                	   //console.log(ev);
                	   equipKey = ev.rowKey;
                	   //console.log(equipKey);
                	   equipValue1 = gridEquip.getRow(equipKey);
                	   //console.log(equipValue1);
                	   equipValue = equipValue1.prdtNm;
                	   //console.log(equipValue);
                	   planEquipCheck();
                  });   
            
                 
                 // 제품공정확인
                   function planEquipCheck(){
                	   //console.log(equipValue);
                       $.ajax({
                           url: "selectPlanEquipCheck",
                           method: "post",
                           data: { prdtNm : equipValue },
                           success: function(data) {
                        	   //console.log(data)
                        	  gridEquipCheck.resetData(data);  //그리드 적용
                           },
                           error: function (reject) {
                             console.log(reject);
                           }
                       });                                       
                   }   
                 
                  //그리드 선언
                     var gridEquipCheck = new tui.Grid({
                         el: document.getElementById('gridEquipCheck'),
                         columns: [

                             {
                                 header: '공정순서',
                                 name: 'eqSq'
                             },
                             {
                                 header: '공정코드',
                                 name: 'prcsCd'
                             },
                             {
                                 header: '공정명',
                                 name: 'prcsNm'
                             }
                         ]
                     }); 
                     
</script>