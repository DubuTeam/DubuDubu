<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/prodcss/progMng.css" rel="stylesheet" type="text/css">

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
				<div class="modal fade" id="insModal" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
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
								<button type="button" class="btn btn-primary">삭제</button>
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
						<button type="button" class="btn btn-primary" id="searchBtn">
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
								<button type="button" style="margin-left: 3px; margin-right:10px;"
									class="btn btn-primary" data-toggle="modal"
									data-target="#vendModal" id="vendSearchBtn" name="vendSearchBtn">
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
            <br>
            <div class="card mb-4">
                <div class="card-body">
                	<div>공정진행</div>
                    <div id="grid"></div> <!-- 그리드 -->
                </div>
            </div>
            <br>
            <br>
            <div class="card mb-4">
                <div class="card-body">
                	<div class="linelist" style="float: right;">
						<button type="button" class="btn btn-primary" id="minusBtn">
							<i class="fas fa-plus"></i> 추가
						</button>
						<button type="button" class="btn btn-primary" id="saveBtn">
							<i class="fas fa-save"></i> 저장
						</button>
						<br> <br>
					</div>
                	<div>작업등록</div>
                    <div id="workGrid"></div> <!-- 그리드 -->
                </div>
            </div>
            
            <div id="dialog" title=""></div>
            
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
			<div class="modal fade" id="workModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
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
								<table style="width: 100%;">
									<tbody>
										<tr>
											<th>작업일자</th>
											<td><input type="text" readOnly style="background-color: rgb(233, 233, 233);"></td>
											<th>작업자</th>
											<td><input type="text"></td>
										</tr>
										<tr>
											<th>설비</th>
											<td><input type="text" readOnly style="background-color: rgb(233, 233, 233);"></td>
											<th>작업량설정</th>
											<td><input type="text"></td>
										</tr>									
									</tbody>
								</table>
							</div>
							<hr>
							<div class="row">
								<div id="equiGrid" class="col-md-5"></div>
								<div id="prcsGrid" class="col-md-7"></div>
							</div>
							<hr>
							<div style="text-align: end;">
								<div class="work">
									<input type="text">
									<button type="button">작업시작</button> 
									<input type="text">
									<button type="button">작업종료</button> 
								</div>
								<div class="work">
									<span>불량등록</span>
									<input type="text" value="0">
									<button type="button">불량(+)</button> 
									<button type="button">불량(-)</button> 
								</div>
							</div>
							
							<div style="clear:both;"></div>
							<br>
							<hr>
							<div class="btnStyle" style="clear:both; float:right;">
								<button type="button">등록</button>
								<button type="button">취소</button>
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
 
 $('#searchBtn').on('click',function(){
	//$('#insModal').modal('show');
	
	$('#insModal').modal('show'); 
	setTimeout(() => insGrid.refreshLayout(), 30);
	//setTimeout(() => prcsGrid.refreshLayout(), 300);
	
	showModal();
 })
 
 
 // 그리드
const insGrid = new tui.Grid({
  el: document.getElementById('insGrid'), // Container element
  	scrollX: false,
     scrollY: true,
     bodyHeight: 400,
     rowHeight: 50,
     rowHeaders: ['checkbox','rowNum'],
  columns: [
    {
      header: '생산지시코드',
      name: 'indicaCd',
      align : 'center',
      sortable : true
    },
    {
      header: '제품명',
      name: 'edctsCd',
      align : 'center',
      sortable : true
    },
    {
      header: '지시일자',
      name: 'indicaDt',
      align : 'center',
      sortable : true
    }
  ]
});
 
 
 function showModal(){
	 
 }
 
 // 로드시 나타남
 $(document).ready(function(){
 	
 });
 
 
 // 설비 그리드
 const equiGrid = new tui.Grid({
   el: document.getElementById('equiGrid'), // Container element
   scrollX: false,
      scrollY: true,
      bodyHeight: 200,
      rowHeight: 50,
      rowHeaders: ['checkbox','rowNum'],
   columns: [
     {
       header: '생산지시코드',
       name: 'indicaCd',
       align : 'center',
       sortable : true,
       editor : 'text'
     },
     {
       header: '제품명',
       name: 'edctsCd',
       align : 'center',
       sortable : true,
       editor : 'text'
     },
     {
       header: '지시일자',
       name: 'indicaDt',
       align : 'center',
       sortable : true,
       editor : 'text'
     }
   ]
 });
 
 // 공정 , 자재 그리드
 // 그리드
 const prcsGrid = new tui.Grid({
   el: document.getElementById('prcsGrid'), // Container element
   scrollX: false,
      scrollY: true,
      bodyHeight: 200,
      rowHeight: 50,
      rowHeaders: ['checkbox','rowNum'],
   columns: [
     {
       header: '공정코드',
       name: 'indicaCd',
       align : 'center',
       sortable : true,
       editor : 'text'
     },
     {
       header: '공정명',
       name: 'edctsCd',
       align : 'center',
       sortable : true,
       editor : 'text'
     },
     {
       header: '자재명',
       name: 'indicaDt',
       align : 'center',
       sortable : true,
       editor : 'text'
     },
     {
        header: '자재소요량',
        name: 'indicaDt',
        align : 'center',
        sortable : true,
        editor : 'text'
     }
   ]
 });
 
 </script>