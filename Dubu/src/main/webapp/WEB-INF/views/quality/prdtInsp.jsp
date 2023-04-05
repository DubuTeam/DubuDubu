<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link href="${pageContext.request.contextPath}/resources/css/prdcss/prdt.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
  <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-4 text-gray-800">제품검사관리</h1>
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
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<label class="nav-link active" id="nav-insp-tab"
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
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="modalBtn"><i class="fas fa-search"></i></button>
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
       <div id="list-body">
          <table id="datatablesSimple" class="table">
           <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
					<!-- 내용 -->
					<div class="card mb-4">
            <div class="card-body">
            	<div class="linelist" style="float: right;">
								<button class="btn btn-primary" id="searchBtn"><i class="fas fa-search"></i> 조회</button>
            		<button class="btn btn-primary" id="resetBtn"><i class="fas fa-file"></i> 초기화</button>
            		<button class="btn btn-primary" id="excelBtn"><i class="fas fa-download"></i> Excel</button>
								<br> <br>
							</div>
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
            </div>
        	</div>

				</div><!-- end nav-tabContent -->

            <!-- ↓↓↓여기에 조회된 결과 출력 -->
            <tbody id="list">
            </tbody>
          </table>
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

</script>



