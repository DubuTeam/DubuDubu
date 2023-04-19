<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/eqcss/eqLine.css" rel="stylesheet"
	type="text/css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- JS 연결 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/eqcss/eqLine.js"></script>

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">라인관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 설비관리</li>
			<li class="breadcrumb-item active">> 라인관리</li>
		</ol>

		<div class="row">
			<div class="col-lg-8" style="width: 73%">
				<div class="card mb-4">
					<div class="card-body">
						<!-- 조회 시 나타나는 테이블 -->
						<div id="list-body" class="table">
							<table>
								<thead>
									<tr>
										<th>라인코드</th>
										<th>라인명</th>
										<th>담당자</th>
										<th>UPH생산량</th>
										<th>사용여부</th>
									</tr>
								</thead>

								<!-- ↓↓↓여기에 조회된 결과 출력 -->
								<tbody id="list">
									<c:forEach items="${eqLineList }" var="eqLine">
										<tr class="eachRow">
											<td>${eqLine.lineCd }</td>
											<td>${eqLine.lineNm }</td>
											<td>${eqLine.linePsch }</td>
											<td>${eqLine.uphCnt }</td>					
											<td>${eqLine.useYn }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div style="width: 2%"></div>

			<div class="col-lg-3">
				<div class="card mb-4">
					<div class="card-body">
						<div class="linelist" style="float: right;">
							<button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 저장
							</button>
							<!-- <button class="btn btn-primary" id="delBtn"><i class="fas fa-trash"></i> 삭제 </button> -->


							<!-- Button trigger modal (4.6버젼) -->
							<button type="button" class="btn btn-primary" id="delBtn" data-toggle="modal" data-target="#exampleModal">
								<i class="fas fa-trash"></i> 삭제
							</button>
							<button class="btn btn-primary" id="initBtn"><i class="fas fa-file"></i> 초기화</button>
							
							
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<!-- <div class="modal-dialog"> -->
								<div class="modal-dialog modal-sm"> <!-- 모달창 크기 작게 modal-sm -->
									<div class="modal-content">
										<div class="modal-header" style="border-bottom: none;">
											<!-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body" style="text-align: center;">
											정말 삭제하시겠습니까?
										</div>
										<div class="modal-footer" style="border-top: none;">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											<button type="button" class="btn btn-primary" id="confirmBtn">삭제</button>
										</div>
									</div>
								</div>
							</div>

							<!-- ↑↑↑ 모달 -->

						</div>
						<br><br>
						<hr>

						<form id="dataForm" action="#">
							<div class="mb-3">
								<!-- <label for="lineCd" class="form-label">라인코드</label> -->
								<input type="hidden" class="form-control" id="lineCd" name="lineCd" value="${getLineCode }" readonly>
							</div>

							<div class="mb-3"></div>

							<div class="mb-3">
								<label for="lineNm" class="form-label">라인명</label> <input type="text" class="form-control" id="lineNm" name="lineNm">
							</div>

							<div class="mb-3">
								<label for="uph" class="form-label">UPH생산량</label> <input type="text" class="form-control" id="uph" name="uph">
							</div>

							<div class="mb-3">
								<div id="empSearch">
									<label for="emp" class="form-label">담당자</label>
	
	
									<!---------------------테스트--------------------->
									<!-- Button trigger modal (4.6버젼) -->
									<button type="button" style="margin-left: 3px"
										class="btn btn-primary" data-toggle="modal"
										data-target="#exampleModal222" id="searchBtn"
										name="searchBtn">
											<i class="fas fa-search"> 검색</i>
									</button>
								</div>

								<input type="text" class="form-control" id="emp" name="emp" readonly> 


								<!-- Modal -->
								<div class="modal fade" id="exampleModal222"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<!-- <div class="modal-dialog"> -->
									<div
										class="modal-dialog modal-dialog-centered modal-lg">
										<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title"
													id="exampleModalLabel">담당자 검색</h5>
												<button type="button" class="close"
													data-dismiss="modal"
													aria-label="Close">
													<span
														aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body"
												style="text-align: center;" id="modal-test">
												<div
													style="display: flex; margin-bottom: 10px;">
													<span
														style="display: flex; align-items: center;">담당자</span>
													<input type="text"
														style="margin: 0px 5px;"
														id="modal-keyword"
														name="eqpName" placeholder="이름 입력"
														style="width: 180px"></input>

													<button type="button" id="modal-searchBtn"
														class="btn btn-primary"
														style="margin-bottom: 3px">
														<i class="fas fa-search"></i> 검색
													</button>
												</div>

												<!-- 조회 시 나타나는 테이블 -->
												<div id="list-body" class="table">
													<table id="modal-eqList">
														<thead>
															<tr>
																<th>No.</th>
																<th>직원명</th>
																<th>직원코드</th>
															</tr>
														</thead>

														<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
														<tbody id="listInModal">
															<c:forEach items="${empListInModal }" var="emp">
																<tr class="eachRowInModal">
																	<td>${emp.idx }</td>
																	<td>${emp.empNm }</td>
																	<td>${emp.empCd }</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button"
													class="btn btn-secondary"
													data-dismiss="modal">취소</button>
											</div>
										</div>
									</div>
								</div>

								<!-- ↑↑↑ 모달 -->
							<!---------------------테스트--------------------->
						</div>

							<div class="mb-4">
								<label for="yn" class="form-label">사용여부</label><br>
								<input type="radio" id="ynY" name="yn" value="Y">
								사용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="ynN" name="yn" value="N"> 미사용
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->