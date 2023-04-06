<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link href="${pageContext.request.contextPath}/resources/css/material/materialInsp2.css" rel="stylesheet"
		type="text/css">
	<!-- Begin Page Content -->
	<div class="container-fluid">

	</div>
	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재입고검사</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재입고검사</li>
		</ol>

		<section class="layout">
			<div class="header">
				<div class="card" id="card-1">
					<div class="card-body">
						<div style="display: inline-block; margin: auto 0; float: right;">
							<button class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 저장
							</button>
							<button class="btn btn-primary" id="delDataBtn">
								<i class="fas fa-file"></i> 삭제
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
									<th><b>자재검사등록</b></th>
									<td></td>
									<th><b>검사일자</b></th>
									<td>
										<div class="tui-datepicker-input tui-datetime-input tui-has-focus"
											style="height: 40px; border-radius: 5px;">
											<input type="text" id="inspDt" aria-label="Date-Time" class="form-control">
											<span class="tui-ico-date"></span>
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
									</td>
									<td></td>
									<th><b>검사자</b></th>
									<td><input type="text" id="inspTstr" class="form-control" style="width: 168px;">
									</td>
								</tr>

							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="ordr">
				<div class="card">
					<div class="card-body">
						<form id="ordrListFrm">
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
									<th><b>발주자료 조회</b></th>
									<td></td>
									<th><label for="vendNm"><b>업체명</b></label></th>
									<td><input id="vendNm" type="text" class="form-control" placeholder="검색버튼을 이용하세요"
											style="width: 200px;" required readonly> <input id="vendCd" type="hidden"
											name="vendCd">
										<button type="button" class="btn btn-primary" data-toggle="modal"
											data-target="#myModal"><i class="fas fa-search"></i></button>
										<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-body" style="height:500px;">
														<div class="modal-dialog modal-dialog-scrollable">
															<div class="modal-content">
																<div class="modal-header">
																	<h4 class="modal-title">업체검색</h4>
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																</div>
																<!-- Modal body -->
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
																					<td><input type="text" name="vendNm"
																							class="form-control"
																							placeholder="업체명"></td>
																					<td></td>
																					<td rowspan="2">
																						<button id="vendSch"
																							class="btn btn-primary"
																							type="button"
																							style="height: 90px;">
																							<i
																								class="fas fa-search"></i>
																						</button>
																					</td>
																				</tr>
																				<tr>
																					<td><input type="text" name="vendCd"
																							class="form-control"
																							placeholder="업체코드"></td>
																				</tr>
																			</tbody>
																		</table>
																	</form>
																	<br>
																	<!-- 조회 시 나타나는 테이블 -->
																	<div id="list-body" class="table">
																		<table>
																			<thead>
																				<tr>
																					<th>업체코드</th>
																					<th>업체이름</th>
																					<th>사업자번호</th>
																					<th>전화번호</th>
																				</tr>
																			</thead>
																			<!-- ↓↓↓여기에 조회된 결과 출력 -->
																			<tbody id="list">
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				<tr>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																					<td>test</td>
																				</tr>
																				
																			</tbody>
																		</table>
																	</div>
																	<!-- 조회시 나타나는 테이블 닫는 태그 -->

																	<div id="vend-grid"></div>
																	<div style="float: right">
																		<p>선택 : 더블클릭</p>
																	</div>


																</div>
															</div>
														</div>

													</div>
												</div>

												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save changes</button>
												</div>

											</div>
										</div>
					</div>
					</td>
					<td></td>
					<th><b>납기예정일</b></th>
					<td>
						<div style="display: flex;">
							<input type="date" id="start" name="start" class="form-control" style="width: 150px;"> <span
								style="padding: 5px;">-</span> <input type="date" id="end" name="end"
								class="form-control" style="width: 150px;">
						</div>
					</td>
					<th></th>
					<td><input id="getOrdrList" type="button" class="btn btn-primary" value="가져오기" /></td>
					</tr>
					</table>
					</form>
				</div>
			</div>
	</div>

	<div class="body">
		<div class="card">
			<div class="card-body">
				<div class="linelist" style="float: right">
					<button class="btn btn-primary" id="addRow" style="height: 30px">
						<i class="fas fa-plus"></i> 추가
					</button>
					<button class="btn btn-primary" id="delRow" style="height: 30px">
						<i class="fas fa-minus"></i> 삭제
					</button>
				</div>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>No.</th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>발주코드</th>
								<th>발주수량</th>
								<th>현재재고</th>
								<th>안전재고</th>
								<th>예상재고량</th>
								<th>납기요청일</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="list">
							<tr>
								<th><input type="checkbox"></th>
								<td>test</td>
								<td>test</td>
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
				<br> <br>
				<div id="grid"></div>
			</div>

		</div>

	</div>

	<div class="rightside">
		<div class="card">
			<div class="card-body">
				<b>검사목록</b> <br> <br>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th>업체코드</th>
								<th>업체이름</th>
								<th>사업자번호</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="list">
							<tr>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
				<div id="mdfy-grid"></div>
			</div>
		</div>
	</div>
	</section>
	</div>

	<div class="modal fade" id="vendModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">업체검색</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
									<td><input type="text" name="vendNm" class="form-control" placeholder="업체명"></td>
									<td></td>
									<td rowspan="2">
										<button id="vendSch" class="btn btn-primary" type="button"
											style="height: 90px;">
											<i class="fas fa-search"></i>
										</button>
									</td>
								</tr>
								<tr>
									<td><input type="text" name="vendCd" class="form-control" placeholder="업체코드"></td>
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
	<div class="modal fade" id="rscModal" tabindex="-1" aria-labelledby="rscModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">자재검색</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
									<td><input type="text" id="rscNmInMod" name="rscNm" class="form-control"
											placeholder="자재명"></td>
									<td></td>
									<td rowspan="2">
										<button id="rscSch" class="btn btn-primary" type="button" style="height: 90px;">
											<i class="fas fa-search"></i>
										</button>
									</td>
								</tr>
								<tr>
									<td><input type="text" id="rscCdInMod" name="rscCd" class="form-control"
											placeholder="자재코드"></td>
								</tr>
							</tbody>
						</table>
					</form>
					<br>

					<div class="modal fade" id="rscModal" tabindex="-1" aria-labelledby="rscModal" aria-hidden="true">
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
			</div>
		</div>
	</div>

	<!--inspection detail modal-->
	<div class="modal fade" id="infModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<b class="modal-title">검사상세</b>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="inf-grid"></div>
					<br>
					<div style="float: right">
						<input type="button" id="calInfCnt" value="입력" class="btn btn-primary">
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->