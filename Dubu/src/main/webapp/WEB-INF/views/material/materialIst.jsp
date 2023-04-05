<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/resources/css/material/materialIst.css" rel="stylesheet">


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재입고관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재입고관리</li>
		</ol>

		<section class="layout">
			<div class="header">
				<div class="card">
					<div class="card-body">
						<div style="display: inline-block; margin: auto 0; float: right">
							<button class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 저장
							</button>
							<button class="btn btn-primary" id="reloadBtn">
								<i class="fas fa-file"></i> 새자료
							</button>
						</div>

						<table style="vertical-align: middle; text-align: center">
							<colgroup>
								<col style="width: 120px">
								<col style="width: 30px">
								<col style="width: 80px">
								<col style="width: 180px">
								<col style="width: 20px">
								<col style="width: 80px">
								<col style="width: 180px">
							</colgroup>
							<tbody>
								<tr>
									<th><b>입고등록</b></th>
									<td></td>
									<th><b>입고일자</b></th>
									<td>
										<div
											class="tui-datepicker-input tui-datetime-input tui-has-focus"
											style="height: 40px; border-radius: 5px;">

											<input type="date" id="istDt" aria-label="Date-Time"
												class="form-control"> <span class="tui-ico-date"></span>
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
									</td>
									<td></td>
									<th><b>입고유형</b></th>
									<td><input type="text" id="istTyp" class="form-control"
										style="width: 168px;"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
				
			<div class="sub">
				<div class="card">
					<div class="card-body">
						<form id="getIstListFrm">
							<input type="hidden" name="from" value="ist">
							<table style="vertical-align: middle; text-align: center">
								<colgroup>
									<col style="width: 120px">
									<col style="width: 30px">
									<col style="width: 80px">
									<col style="width: 250px">
									<col style="width: 20px">
									<col style="width: 100px">
									<col style="width: 350px">
								</colgroup>
								<tr>
									<th><b>검사자료 조회</b></th>
									<td></td>
									<th><label for="vendNm"><b>업체명</b></label></th>
									<td>
										<div style="display: flex;">
											<input id="vendNm" type="text" class="form-control"
												placeholder="검색버튼을 이용하세요" style="width: 200px;" required
												readonly> <input id="vendCd" type="hidden"
												name="vendCd">
											<button id="modalBtn" type="button" class="btn btn-primary"
												style="margin-left: 10px;">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</td>
									<td></td>
									<th><b>검사자료</b></th>
									<td>
										<div style="display: flex;">
											<input type="date" id="start" name="start"
												class="form-control" style="width: 150px;"> <span
												style="padding: 5px;">-</span> <input type="date" id="end"
												name="end" class="form-control" style="width: 150px;">
											<input id="getInspList" type="button" class="btn btn-primary"
												value="가져오기" />
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>

			<div class="styleFlex"><!-- 플렉스쓰려고 넣은것 -->
				<div class="body">
					<div class="card">
						<div class="card-body">
							<div class="linelist" style="float: right;">
								<button class="btn btn-primary" id="delRow" style="height: 30px">
									<i class="fas fa-minus"></i> 삭제
								</button>
							</div>
							<br> <br>
							<!-- 조회 시 나타나는 테이블 -->
							<div id="list-body" class="table">
								<table>
									<thead>
										<tr>
											<th><input type="checkbox"></th>
											<th>자재코드</th>
											<th>품명</th>
											<th>규격</th>
											<th>단위</th>
											<th>자재유형</th>
											<th>발주번호</th>
											<th>입고가능수량</th>
											<th>입고수량</th>
											<th>유통기한</th>
										</tr>
									</thead>
									<!-- ↓↓↓여기에 조회된 결과 출력 -->
									<tbody id="list">
										<tr>
											<td><input type="checkbox"></td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
											<td>test</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 조회시 나타나는 테이블 닫는 태그 -->
						</div>
					</div>
				</div>

				<div class="rightside">
					<div class="card">
						<div class="card-body">
							<b>입고목록</b> <br> <br>
							<!-- 조회 시 나타나는 테이블 -->
							<div id="list-body" class="table">
								<table>
									<thead>
										<tr>
											<th>입고코드</th>
											<th>입고일자</th>
											<th>건수</th>
										</tr>
									</thead>
									<!-- ↓↓↓여기에 조회된 결과 출력 -->
									<tbody id="list">
										<tr>
											<td>test</td>
											<td>test</td>
											<td>test</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 조회시 나타나는 테이블 닫는 태그 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 플렉스넣은태그 닫는태그 -->
	</div>

	<!-- Modal for vend search -->
	<div class="modal fade" id="vendModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">업체검색</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="vendSchForm">
						<table>
							<colgroup>
								<col style="width: 400px;">
								<col style="width: 10px">
								<col style="width: 50px;">
							</colgroup>
							<tbody>
								<tr>
									<td><input type="text" name="vendNm" class="form-control"
										placeholder="업체명"></td>
									<td></td>
									<td rowspan="2">
										<button id="vendSch" class="btn btn-primary" type="button"
											style="height: 90px;">
											<i class="fas fa-search"></i>
										</button>
									</td>
								</tr>
								<tr>
									<td><input type="text" name="vendCd" class="form-control"
										placeholder="업체코드"></td>
								</tr>
							</tbody>
						</table>
					</form>
					<br>
					<div id="vend-grid"></div>
					<div style="float: right">
						<p>선택 : 더블클릭</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for resource search -->
	<div class="modal fade" id="rscModal" tabindex="-1"
		aria-labelledby="rscModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">자재검색</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="rscSchForm">
						<table>
							<colgroup>
								<col style="width: 400px;">
								<col style="width: 10px">
								<col style="width: 50px;">
							</colgroup>
							<tbody>
								<tr>
									<td><input type="text" id="rscNmInMod" name="rscNm"
										class="form-control" placeholder="자재명"></td>
									<td></td>
									<td rowspan="2">
										<button id="rscSch" class="btn btn-primary" type="button"
											style="height: 90px;">
											<i class="fas fa-search"></i>
										</button>
									</td>
								</tr>
								<tr>
									<td><input type="text" id="rscCdInMod" name="rscCd"
										class="form-control" placeholder="자재코드"></td>
								</tr>
							</tbody>
						</table>
					</form>
					<br>
					<div id="rsc-grid"></div>
					<div style="float: right">
						<p>선택 : 더블클릭</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->