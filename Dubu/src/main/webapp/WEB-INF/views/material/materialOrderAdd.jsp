<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container-fluid px-4">
	<h1 class="mt-4">자재발주</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do">홈</a></li>
		<li class="breadcrumb-item">> 주문서관리</li>
		<li class="breadcrumb-item active">> 주문서 조회/등록</li>
	</ol>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-chart-area me-1"></i> 자재 재고 목록
			<form>
				<div class="mb-3">
					<label for="frDate">자재명</label> <input type="text" id="nmae"
						name="name"> <input type="button"
						class="btn btn-secondary" value="검색"></input>
				</div>
			</form>
		</div>
		<div class="card-body">
			<div id="grid"></div>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-chart-area me-1"></i> 자재 발주 등록
			<button class="btn btn-secondary" id="addBtn" form="">추가</button>
			<button class="btn btn-secondary" form="">삭제</button>
			<button class="btn btn-secondary" form="">발주등록</button>
		</div>
		<div class="card-body">
			<div id="grid2"></div>
		</div>
	</div>