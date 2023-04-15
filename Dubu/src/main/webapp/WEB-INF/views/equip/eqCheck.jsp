<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/eqcss/eqCheck.css" rel="stylesheet"
	type="text/css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- JS 연결 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/eqcss/eqCheck.js"></script>


<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">설비점검내역</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 설비관리</li>
			<li class="breadcrumb-item active">> 설비점검내역</li>
		</ol>

		<div>
			<!-- 헤더부분 -->
			<div class="container-fluid px-4">
				<div class="row">
					<div class="col">
						<div class="card mb-4">
							<div class="card-body">
								<div class="linelist" style="float: right;">
									<button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 저장</button>
									<!-- Button trigger modal (4.6버젼) -->
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-trash"></i> 삭제</button>
									<button class="btn btn-primary" id="initBtn"><i class="fas fa-file"></i> 초기화</button>
								</div>

								<br> <br>

								<form id="dataForm" name="dataForm" action="#" method="post">
									<table class="table" style="vertical-align: middle;">
										<colgroup>
											<col style="width: 150px">
											<col>
											<col style="width: 150px">
											<col>
											<col style="width: 150px">
											<col>
										</colgroup>

										<tbody id="upperTbody">
											<tr>
												<th>설비코드</th>
												<td id="eqmCodeTd">
													<input class="form-control" name="eqmCd" id="eqmCd"
														style="width: 250px" readonly>

													<!-- Button trigger modal (4.6버젼) -->
													<button type="button" style="margin-left: 3px"
														class="btn btn-primary" data-toggle="modal"
														data-target="#exampleModal222" id="searchBtn"
														name="searchBtn">
														<i class="fas fa-search"></i>
													</button>

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
																		id="exampleModalLabel">설비명 검색</h5>
																	<button type="button" class="close"
																		data-dismiss="modal"
																		aria-label="Close">
																		<span
																			aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body"
																	style="text-align: center;">
																	<div
																		style="display: flex; margin-bottom: 10px;">
																		<span
																			style="display: flex; align-items: center;">설비명</span>
																		<input type="text"
																			style="margin: 0px 5px;"
																			id="modal-keyword"
																			name="eqpName" placeholder="검색어 입력"
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
																					<th>설비명</th>
																					<th>설비코드</th>
																					<th>공정코드</th>
																					<th>공정명</th>
																					<th>사용여부</th>
																				</tr>
																			</thead>

																			<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
																			<tbody id="listInModal">
																				<c:forEach items="${eqListInModal }" var="eqm">
																					<tr class="eachRowInModal">
																						<td>${eqm.idx }</td>
																						<td>${eqm.eqmNm }</td>
																						<td>${eqm.eqmCd }</td>
																						<td>${eqm.prcsCd }</td>					
																						<td>${eqm.prcsNm }</td>
																						<td>${eqm.eqmYn }</td>
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
												</td>

												<th>설비명</th>
												<td>
													<input class="form-control" type="text" id="eqmNm"
														name="eqmNm" style="width: 250px" readonly />
												</td>


												<!-- <th>점검코드</th> -->
												<td>
													<input class="form-control" type="hidden" id="chckCd"
														name="chckCd" style="width: 250px" readonly value="${getCheckCode }" />
												</td>
											</tr>


											<tr>
												<th>점검구분</th>
												<td id="chckFgSet">
													<input type="radio" name="chckFg" value="정기점검" id="chckFg1"> 정기점검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="chckFg" value="수시점검" id="chckFg2"> 수시점검
												</td>
												<th>조치사항</th>
												<td id="dispoMatterSet">
													<input type="radio" name="dispoMatter" value="수리" id="dispoMatter1">
													수리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="dispoMatter" value="점검" id="dispoMatter2"> 점검
												</td>
												<th>판정</th>
												<td id="jdgmntSet">
													<input type="radio" name="jdgmnt" value="적합" id="jdgmnt1">
													적합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="jdgmnt" value="부적합" id="jdgmnt2"> 부적합
												</td>
											</tr>

											<tr>
												<th>점검일자</th>
												<td>
													<input class="form-control" type="date" id="chckDt"
														name="chckDt" style="width: 250px" />
												</td>
												<th>조치내역</th>
												<td>
													<textarea name="dispoCtnt" id="dispoCtnt"
														class="form-control"
														style="width: 350px; height: 100px"></textarea>
												</td>

												<th>담당자</th>
												<td>
													<input class="form-control" name="chckPsch"
														id="chckPsch" style="width: 250px">
												</td>

												<!-- 얜 뭐임? -->
												<!-- <td>
													<input type="hidden" id="chckCd" name="chckCd">
												</td> -->
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="card mb-4">
					<div class="card-body">
						<form action="" method="get">
							<div id="searchEqmSet">
								설비명 <input class="form-control" type="text" id="keyword3" name="eqmNm"
									style="width: 150px">
								해당일자 <input type="date" class="form-control" id="frDt" name="frDt"
									style="width: 150px;">
								~ <input type="date" class="form-control" id="toDt" name="toDt"
								style="width: 150px;">

								<button type="button" style="margin-bottom: 3px" class="btn btn-primary"
									id="chckSearchBtn"><i class="fas fa-search"></i> 검색 </button>

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
												<button type="button" class="btn btn-primary" id="delBtn">삭제</button>
											</div>
										</div>
									</div>
								</div>

								<!-- ↑↑↑ 모달 -->
							</div>
						</form>


						<!-- 조회 시 나타나는 테이블 -->
						<div id="list-body" class="table">
							<table>
								<thead>
									<tr>
										<!-- <th><input type="checkbox"></th> -->
										<th>점검코드</th>
										<th>설비코드</th>
										<th>설비명</th>
										<th>점검구분</th>
										<th>조치사항</th>
										<th>판정</th>
										<th>점검일자</th>
										<th>점검담당자</th>
										<th></th>
									</tr>
								</thead>

								<!-- ↓↓↓여기에 조회된 결과 출력 -->
								<tbody id="list">
									<c:forEach items="${checkList }" var="chck">
										<tr class="eachRow">
											<!-- <td><input type="checkbox"></td> -->
											<td>${chck.chckCd }</td>
											<td>${chck.eqmCd }</td>
											<td>${chck.eqmNm }</td>
											<td>${chck.chckFg}</td>
											<td>${chck.dispoMatter }</td>
											<td>${chck.jdgmnt }</td>
											<td><fmt:formatDate value="${chck.chckDt }" pattern="yyyy-MM-dd" /></td>
											<td>${chck.chckPsch }</td>
											<td><input type="hidden" value="${chck.dispoCtnt}" id="dispoCtnt" name="dispoCtnt"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>


				<!-- 설비검색 Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">설비명 검색</h5>
								<br> <br>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<br>

							<div class="ms-3">
								<th>설비명</th>
								<td>
									<input type="text" id="keyword2" name="keyword2" placeholder="설비명"
										class="form-control" style="width: 250px">
									<button type="button" style="margin-bottom: 3px" class="btn btn-primary"
										onclick="eqmSelect2()"><i class="fas fa-search"></i> 검색 </button>
								</td>
							</div>

							<!-- 그리드!? 얘 대신 모달 만들어야 할 듯 -->
							<div id="modGrid" class="modal-body"></div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
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