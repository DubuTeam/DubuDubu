<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!-- 생산계획조회 -->
<!-- 헤더부분 -->
<div class="container-fluid px-4">
	<h1 class="mt-4">생산계획조회</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i
				class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 생산계획조회</li>
	</ol>
</div>
<!-- 헤더부분 -->
<div id="container">
	<section>
		<div class="card mb-4">
			<div class="col">
				<div class="card-body">
					<div class="linelist">
						<button id="clearBtn" class="btn btn-primary" form="">
							<i class="fas fa-file"></i> 초기화
						</button>
						<button type="button" class="btn btn-primary" id="sBtn">
							<i class="fas fa-search"></i> 조회
						</button>
					</div>
					<br> <br> <br>
					<form name="planform" id="planform">
						<table class="table" style="vertical-align: middle;">
							<colgroup>
								<col style="width: 150px;">
								<col>
								<col style="width: 150px;">
								<col>
								<col style="width: 150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>계획일자</th>
									<td><input class="form-control" type="date"
										id="start-input" name="start-input" style="width: 150px">
										- <input class="form-control" type="date" id="end-input"
										name="end-input" style="width: 150px"></td>
									<th></th>
									<td></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>지시상태</th>
									<td style="height: 55px"><input class="form-check-input"
										type="radio" name="status" value="전체"> 전체 <input
										class="form-check-input" type="radio" name="status" value="진행">
										진행 <input class="form-check-input" type="radio" name="status"
										value="미진행"> 미진행</td>
									<th></th>
									<td></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>제품이름</th>
									<td><input class="form-control" type="text" id="name"
										name="name" style="width: 150px"></td>
									<th></th>
									<td></td>
									<th></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="card mb-4">
		<div class="card-body">
			<div class="linelist">
				<button type="button" class="btn btn-primary" id="dBtn">
					<i class="fas fa-minus"></i> 취소
				</button>
			</div>
			<br>
			<br>
			<br>
			<div id='grid'></div>
		</div>
	</div>
</div>
<!-- End of Main Content -->