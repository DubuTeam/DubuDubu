	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link
	href="${pageContext.request.contextPath}/resources/css/prdcss/prdt.css"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
  <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="mt-4">제품흐름공정관리</h1>
     <ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 생산관리</li>
			<li class="breadcrumb-item active">> 제품공정흐름관리</li>
		</ol>
		
      <div id="btn-bom">     
      		<label>제품명</label>
            <input type="text">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="modalBtn"><i class="fas fa-search"></i></button>
	
	  <div style="float: right;">	
      		<button id="addBtn" class="btn btn-primary" form="">
				<i class="fas fa-add"></i> 새자료
			</button>
			<button id="saveBtn" class="btn btn-primary" form="">
				<i class="fas fa-save"></i> 저장
			</button>
			<button id="deleteBtn" class="btn btn-primary" form="">
				<i class="fas fa-minus"></i> 삭제
			</button>

		</div>
	</div>
	<br>
	<div style="display: flex;">
		<div class="col-lg-8" style="width: 73%">
			<div class="card mb-4">
				<div class="card-body">
					<!-- 조회 시 나타나는 테이블 -->
					<div id="list-body" class="table">
						<table id="datatablesSimple" class="table">
							<thead>
								<tr>
									<th>No.</th>
									<th>완제품코드</th>
									<th>제품명</th>
								</tr>
							</thead>

							<!-- ↓↓↓여기에 조회된 결과 출력 -->
							<tbody id="list"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>



		<form class="p_Process2" style="float: right;">

			<div class="main">
				<input type="radio" id="tab-1" name="show" checked /> <input
					type="radio" id="tab-2" name="show" />

				<div class="tab">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<label class="nav-link active" id="nav-insp-tab"
								data-bs-toggle="tab" data-bs-target="#nav-insp" type="button"
								role="tab" aria-controls="nav-insp" aria-selected="true"
								for="tab-1">제품정보</label> <label class="nav-link"
								id="nav-info-tab" data-bs-toggle="tab"
								data-bs-target="#nav-info" type="button" role="tab"
								aria-controls="nav-info" aria-selected="false" for="tab-2">공정흐름</label>
						</div>
					</nav>
				</div>
				<div class="content">
					<div class="content-dis">
						<label for="search">완제품 코드</label> <input type="text"> <label
							for="search">제품명</label> <input type="text"> <label
							for="search">보관 창고</label> <input type="text"> <br>

						<label for="search">규격</label> <input type="text"> <label
							for="search">단위</label> <input type="text"> <label
							for="search">안전재고</label> <input type="text">
					</div>
					<div class="content-dis">
						<div id="list-body">
							<table id="datatablesSimple" class="table">
								<thead>
									<tr>
										<th>공정순서</th>
										<th>공정코드</th>
										<th>공정명</th>
										<th>공정내용</th>
									</tr>
								</thead>

								<!-- ↓↓↓여기에 조회된 결과 출력 -->
								<tbody id="list">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		
       
       
	<form class="p_Process2" style="float: right;">

	<div class="main">
 	 <input type="radio" id="tab-1" name="show" checked/>
  	 <input type="radio" id="tab-2" name="show" />

  	<div class="tab">
    	<nav>
			<div class="nav-tabs" id="nav-tab" role="tablist">
				<label class="nav-link" id="nav-insp-tab"
					data-bs-toggle="tab" data-bs-target="#nav-insp" type="button"
					role="tab" aria-controls="nav-insp" aria-selected="true" for="tab-1">제품정도
				</label>
				<label class="nav-link" id="nav-info-tab" data-bs-toggle="tab"
					data-bs-target="#nav-info" type="button" role="tab"
					aria-controls="nav-info" aria-selected="false" for="tab-2">공정흐름</label>
			</div>
		</nav>
  </div>
  <div class="content">
      <div class="content-dis">
	    <form id="dataForm" name="dataForm" action="#" method="post">
								<table class="table" style="vertical-align : middle;">
									<colgroup>
										<col style="width: 120px">
										<col>
										<col style="width: 120px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>완제품코드</th>
											<td><input class="form-control" type="text"style="width: 250px" maxlength="20" /></td>
											<th>제품명</th>
											<td><input class="form-control" type="text" style="width: 250px" maxlength="50" /></td>
										</tr>
										<tr>
											<th>규격</th>
											<td><input class="form-control" type="text" id="spec" name="spec" style="width: 250px" maxlength="50" /></td>
											<th>단위</th>
											<td><input class="form-control" type="text" id="unit" name="unit" style="width: 250px" maxlength="50" /></td>
										</tr>
										<tr>
											<th>안전재고</th>
											<td><input type="text" id="safStc" name="safStc" class="form-control" maxlength="50" style="width: 250px" /></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
    <div class="content-dis">
       <div id="list-body">
          <table id="datatablesSimple" class="table">
            <thead >
              <tr>
                <th>공정순서</th>
                <th>공정코드</th>
                <th>공정명</th>
                <th>공정내용</th>
              </tr>
            </thead>

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
  </div>
 
 <!-- /.container-fluid -->
  
 </div>
 <!-- End of Main Content -->
 <script>


<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
	
</script>

