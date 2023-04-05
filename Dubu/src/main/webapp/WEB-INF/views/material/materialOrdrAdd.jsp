<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
a {
	text-decoration: none;
}

body {
	font-size: 14px;
	color: #333;
}

li {
	list-style: none;
}

.card-header .tab {
	display: flex;
	justify-content: space-between;
}

.card-header .tab li a {
	font-size: 15px;
	color: #333;
	font-weight: 500;
}

/* 탭버튼 눌렀을시 글자 색상변경 */
.card-header .tab li.on a {
	font-weight: bold;
	color: crimson;
}
/* 탭박스 영역 기본 옵션은 디스플레이 숨김 */
.card-body .tabBox {
	display: none;
}
/* 탭버튼이 눌러졌을시 관련된 탭박스 활성화 */
.card-body .tabBox.on {
	display: block;
}
</style>
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