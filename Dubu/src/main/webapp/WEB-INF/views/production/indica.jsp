<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/resources/css/prodcss/indica.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<!-- 헤더부분 -->
<!-- 생산지시 -->
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
			<div class="card-body">
				<div class="linelist">
					<button id="clearBtn" class="btn btn-primary" form="">
						<i class="fas fa-file"></i> 초기화
					</button>
					<!--  -->
					<!-- Button trigger modal (4.6버젼) -->
					<button type="button" style="margin-left: 3px" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal" id="searchBtn" name="searchBtn">
					<i class="fas fa-search"></i>계획 조회
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<!-- <div class="modal-dialog"> -->
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">생산 계획 조회</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: center;">

								<!-- 조회 시 나타나는 테이블 -->
								<div id="list-body" class="table">
									<table>
										<thead>
											<tr>
												<th><input type="checkbox"></th>
												<th>생산계획코드</th>
												<th>제품명</th>
												<th>주문수량</th>
											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
										<tbody id="list">
											<tr>
												<td><input type="checkbox"></td>
												<td>더미기</td>
												<td>Dummy01</td>
												<td>Dummy123</td>
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
					<!--  -->
					<button class="btn btn-primary" id="regiBtn">
						<i class="fas fa-save"></i> 저장
					</button>
				</div>

				<div id="grid"></div>
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<div id="grid2" style="width: 1000px;">공정자재</div>
					<div id="grid3" style="width: 500px;">자재지시</div>
				</div>
			</div>
		</div>
		<div id="#tui-date-picker-container1"></div>
		<div id="dialog" title="생산계획조회"></div>
		<br>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">생산계획조회</h5>
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

