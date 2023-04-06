<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/prodcss/prcs.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />	
<!-- Begin Page Content -->
<!-- 헤더부분 -->
<!-- Begin Page Content -->
<div class="container-fluid">
<div class="container-fluid px-4">
	<h1 class="mt-4">공정관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i
				class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 공정관리</li>
	</ol>
</div>
<!-- 헤더부분 -->
<div id="container">
	<section>
		<div class="col">
			<div class="card mb-4">

				<div class="card-body">
					<form>
						<div class="mb-3">
							<label for="name">공정구분</label> <select id="prcs"
								class="dataTable-selector">
								<option selected value=''>--선택--</option>
								<option th:each="code : ${ccds['PRC']}"
									th:value="${code.ccdDtlNm}" th:text="${code.ccdDtlNm}"></option>
							</select>
							<button id="sBtn" class="btn btn-primary" form="">
								<i class="fas fa-search"></i> 검색
							</button>
						</div>
						<!-- <div class="linelist"> -->
						<!-- </div> -->

					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="card mb-4">
		<div class="card-body">
			<div class="linelist">
				<button id="addBtn" class="btn btn-primary" form="">
					<i class="fas fa-add"></i> 추가
				</button>
				<button id="deleteBtn" class="btn btn-primary" form="">
					<i class="fas fa-minus"></i> 삭제
				</button>
				<button id="saveBtn" class="btn btn-primary" form="">
					<i class="fas fa-save"></i> 저장
				</button>
			</div>
			<br> <br> <br>
						<div id="list-body" class="table">
							<table id="datatablesSimple" class="table">
								<thead>
									<tr>
										<th><input type="checkbox"/></th>
               							<th>공정구분코드</th>
                						<th>구분코드</th>
                						<th>공정명</th>
                						<th>공정설명</th>
									</tr>
								</thead>

								<!-- ↓↓↓여기에 조회된 결과 출력 -->
								<tbody id="list"></tbody>
							</table>
						</div>
			<div id='grid'></div>
		</div>
	</div>
</div>
<br>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->