<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Begin Page Content -->
<!-- 헤더부분 -->
<style>
#container {
	width: 98%;
	margin: 0 auto;
}

.col {
	width: 100%
}

.linelist {
	float: right;
	margin-top: 0px;
}
</style>
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

			<div id='grid'></div>
		</div>
	</div>
</div>
<br>