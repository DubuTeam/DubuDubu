<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link href="${pageContext.request.contextPath}/resources/css/prdcss/prdt.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
  <div class="container-fluid">

     <!-- Page Heading -->
    <h1 class="mt-4">제품검사관리</h1>
     <ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 품질관리</li>
			<li class="breadcrumb-item active">> 제품검사관리</li>
		</ol>
	

        
 
       
       
	<form class="p_Process2" style="float: right;">

	<div class="main">
 	 <input type="radio" id="tab-1" name="show" checked/>
  	 <input type="radio" id="tab-2" name="show" />

  	<div class="tab">
    	<nav>
			<div class="nav-tabs" id="nav-tab" role="tablist">
				<label class="nav-link" id="nav-insp-tab"
					data-bs-toggle="tab" data-bs-target="#nav-insp" type="button"
					role="tab" aria-controls="nav-insp" aria-selected="true" for="tab-1">제품검사
					등록</label>
				<label class="nav-link" id="nav-info-tab" data-bs-toggle="tab"
					data-bs-target="#nav-info" type="button" role="tab"
					aria-controls="nav-info" aria-selected="false" for="tab-2">제품검사 조회</label>
			</div>
		</nav>
  </div>
  <div class="content">
    <div class="content-dis">
      <form id="dataForm" name="dataForm" action="#" method="post">  <!-- 첫번 째 전환 탭 -->
								<table class="table" style="vertical-align : middle;">
									<colgroup>
										<col style="width: 150px">
										<col>
										<col style="width: 150px">
										<col>
										<col style="width: 150px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>주문번호 <strong class="blue">*</strong></th>
											<td><input class="form-control" type="text" id="orderNo" name="orderNo" style="width: 250px" maxlength="20"
												placeholder="주문서를 조회해주세요" readonly />
												<!-- Button trigger modal -->
												<!-- Button trigger modal (4.6버젼) -->
													<button type="button"  style="margin-left: 3px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal222" id="searchBtn" name="searchBtn">
														<i class="fas fa-search"></i>
													</button>
													
													<!-- Modal -->
													<div class="modal fade" id="exampleModal222" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <!-- <div class="modal-dialog"> -->
													  <div class="modal-dialog modal-dialog-centered modal-lg">   <!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">주문서 목록</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body" style="text-align: center;">
													      	<div style="display: flex; margin-bottom: 10px;">
														      	<span style="display: flex; align-items: center;">거래처명</span> <input type="text" style="margin: 0px 5px;" id="modal-searchEqpName" name="eqpName" placeholder="설비명" style="width: 180px"></input>
	
																<button type="button" id="sTtn" class="btn btn-primary" style="margin-bottom: 3px">
																	<i class="fas fa-search"></i> 검색
																</button>
													      	</div>
													      	
													      	<!-- 조회 시 나타나는 테이블 -->
															<div id="list-body" class="table"  >
																<table style="width:100%;">
																	<thead>
																		<tr>
																			<th>주문번호</th>
																			<th>거래처명</th>
																			<th>제품코드</th>
																			<th>제품명</th>
																			<th>주문수량</th>
																		</tr>
																	</thead>
							
																	<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
																	<tbody id="list">
																		<tr>
																			<td>더미1</td>
																			<td>더미기</td>
																			<td>Dummy01</td>
																			<td>Dummy123</td>
																			<td>N</td>
																		</tr>
																	</tbody>
																</table>
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
												</td>
											<th>완제품코드 <strong class="blue">*</strong></th>
											<td><input class="form-control" type="text" id="edctsCd" name="edctsCd" style="width: 250px" maxlength="20" readonly /></td>
											<th>완제품명 </th>
											<td><input class="form-control" type="text" id="edctsNm" name="edctsNm" style="width: 250px" maxlength="50" readonly /></td>
										</tr>
										<tr>
											<th>완제품LOT <strong class="blue">*</strong></th>
											<td><input class="form-control" type="text" id="edctsLotNo" name="edctsLotNo" style="width: 250px" maxlength="50" readonly /></td>
											<th>검사수량</th>
											<td><input class="form-control" type="text" id="inspCnt" name="inspCnt" style="width: 250px" maxlength="50" readonly /></td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>검사일자</th>
											<td><input class="form-control" type="date" id="inspDt" name="inspDt" style="width: 250px" maxlength="50" /></td>
											<th>검사담당자</th>
											<td><input type="text" id="inspPsch" name="inspPsch" class="form-control" maxlength="50" style="width: 250px" /></td>
											<th>최종판정 <strong class="blue">*</strong></th>
											<td><select class="dataTable-selector" name="inspJm" id="inspJm" style="width: 250px">
													<option selected value="">==선택==</option>  
													<option value="적합">적합</option>
													<option value="적합">부적합</option></td>
										</tr>
									</tbody>
								</table>
							</form>
    </div>
    <div class="content-dis">
    <div class="linelist" style="float: right;">
					<button type="button" style="width: 85px; height: 38px; margin-bottom: 4px" class="btn btn-primary" onclick="eqmSelect()">
								<i class="fas fa-search"></i> 조회
							</button>

							<button type="submit" formaction="eqmOprExelView" style="width: 85px; height: 38px; margin-bottom: 4px" class="btn btn-primary" id="excelBtn">
								<i class="fas fa-download"></i> Excel
							</button>

							<button type="button" data-bs-toggle="modal" class="btn btn-primary" id="modalBtn" data-bs-target="#insertModal" style="width: 85px; height: 38px; margin-bottom: 4px">
								<i class="fas fa-save"></i> 리셋
							</button>
								<br> <br>
							</div>
							<br>
							<br>
							<br>
							
       <div id="list-body">
       
          <table id="datatablesSimple" class="table">
          <form id="dataForm2" name="dataForm2" action="#" method="post">
								<table class="table" style="vertical-align : middle;">
									<colgroup>
										<col style="width: 150px">
										<col>
										<col style="width: 150px">
										<col>
										<col style="width: 150px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>검사일자 <strong class="blue">*</strong></th>
											<td colspan="3">
												<input class="form-control" type="date" id="startDt" name="startDt" style="width: 250px" maxlength="20" /> &nbsp; ~ &nbsp;
												<input class="form-control" type="date" id="endDt" name="endDt" style="width: 250px" maxlength="20" /></td>
											<th><td></td></th>
										</tr>
										<tr>
											<th>완제품LOT <strong class="blue">*</strong></th>
											<td><input class="form-control" type="text" list="browserdata" id="edctsLotNo" name="edctsLotNo" style="width: 250px" maxlength="50" autocomplete="off" />
													<datalist id="browserdata" style="width: 250px">
													<option th:each="lot : ${lots}" th:value="${lot.edctsLotNo}" th:text="${lot.edctsLotNo}"></option>
													</datalist>
											</td>
											<th><td></td></th>
											<th><td></td></th>	
										</tr>
									</tbody>
								</table>
							</form>
					<!-- 내용 -->
					<div class="card mb-4">
					
					
            <div class="card-body" style="width:100%;"> <!-- 개인적 체크포인트    --------------------------------------------------------- -->
						<div id="list-body" class="table" style="width:100%;">
							<table style="width:100%;">
								<thead>
									<tr>
										<th>라인코드</th>
										<th>라인명</th>
										<th>담당자</th>
										<th>UPH생산량</th>
										<th>사용여부</th>
									</tr>
								</thead>

								<!-- ↓↓↓여기에 조회된 결과 출력 -->
								<tbody id="list"></tbody>
							</table>
						</div>
							
            </div>
        	</div>
        </div>
    </div>
    </div>
	</form>       
        	
    </div>
  </div>
 <!-- /.container-fluid -->
  
 </div>
 <!-- End of Main Content -->
 <script>
 const tabs = document.querySelectorAll('.nav-tabs .nav-link ');

 tabs.forEach(tab => {
   tab.addEventListener('click', () => {
     // 모든 탭 요소에서 .active 클래스 제거
     tabs.forEach(tab => {
       tab.classList.remove('active');
     });

     // 선택한 탭 요소에 .active 클래스 추가
     tab.classList.add('active');
   });
 });

</script>



