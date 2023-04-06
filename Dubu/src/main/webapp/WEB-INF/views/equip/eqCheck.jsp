<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/eqcss/eqCheck.css" rel="stylesheet"
	type="text/css">

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

										<tbody>
											<tr>
												<th>설비코드</th>
												<td id="eqmCodeTd">
													<input class="form-control" name="eqmCd" id="eqmCd" style="width: 250px" readonly>
													
													<!-- Button trigger modal (4.6버젼) -->
													<button type="button"  style="margin-left: 3px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal222" id="searchBtn" name="searchBtn">
														<i class="fas fa-search"></i>
													</button>
													
													<!-- Modal -->
													<div class="modal fade" id="exampleModal222" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <!-- <div class="modal-dialog"> -->
													  <div class="modal-dialog modal-dialog-centered modal-lg">   <!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">설비명 검색</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body" style="text-align: center;">
													      	<div style="display: flex; margin-bottom: 10px;">
														      	<span style="display: flex; align-items: center;">설비명</span> <input type="text" style="margin: 0px 5px;" id="modal-searchEqpName" name="eqpName" placeholder="설비명" style="width: 180px"></input>
	
																<button type="button" id="sTtn" class="btn btn-primary" style="margin-bottom: 3px">
																	<i class="fas fa-search"></i> 검색
																</button>
													      	</div>
													      	
													      	<!-- 조회 시 나타나는 테이블 -->
															<div id="list-body" class="table">
																<table>
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
																	<tbody id="list">
																		<tr>
																			<td>더미1</td>
																			<td>더미기</td>
																			<td>Dummy01</td>
																			<td>Dummy123</td>
																			<td>더미</td>
																			<td>N</td>
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
												</td>

												<th>설비명</th>
												<td>
													<input class="form-control" type="text" id="eqmNm" name="eqmNm" style="width: 250px" readonly />
												</td>

												<th>점검일자</th>
												<td>
													<input class="form-control" type="date" id="chckDt"name="chckDt" style="width: 250px" />
												</td>
											</tr>


											<tr>
												<th>판정</th>
												<td>
													<input type="radio" name="jdgmnt" value="적합"> 적합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="jdgmnt" value="부적합"> 부적합
												</td>

												<th>조치사항</th>
												<td>
													<input type="radio" name="dispoMatter" value="수리"> 수리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="dispoMatter" value="점검"> 점검
												</td>

												<th>점검구분</th>
												<td>
													<input type="radio" name="chckFg" value="정기점검"> 정기점검&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="chckFg" value="수시점검"> 수시점검
												</td>
											</tr>


											<tr>
												<th>조치내역</th>
												<td>
													<textarea name="dispoCtnt" id="dispoCtnt" class="form-control" style="width: 350px; height: 100px"></textarea>
												</td>

												<th>담당자</th>
												<td>
													<input class="form-control" name="chckPsch" id="chckPsch" style="width: 250px">
												</td>

												<!-- 얜 뭐임? -->
												<td>
													<input type="hidden" id="chckCd" name="chckCd">
												</td>
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
								설비명 <input class="form-control" type="text" id="keyword3" name="eqmNm" style="width: 150px">
								 해당일자 <input type="date" class="form-control" id="stDt" name="stDt" style="width: 150px;">
								  ~ <input type="date" class="form-control" id="toDt" name="toDt" style="width: 150px;">

								<button type="button" style="margin-bottom: 3px" class="btn btn-primary" id="bSearchBtn"><i class="fas fa-search"></i> 검색 </button>

								<button type="submit" formaction="eqmChckExelView" style="margin-bottom: 3px" class="btn btn-primary" id="excelBtn"><i class="fas fa-download"></i> Excel </button>

							<!-- Button trigger modal (4.6버젼) -->
							<button type="button" style="width: 85px; height: 38px; margin-bottom: 4px" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="delBtn">
							<i class="fas fa-trash"></i> 삭제
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <!-- <div class="modal-dialog"> -->
							  <div class="modal-dialog modal-sm">   <!-- 모달창 크기 작게 modal-sm -->
							    <div class="modal-content">
							      <div class="modal-header" style="border-bottom: none;">
							        <!-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body" style="text-align: center;">
							        정말 삭제하시겠습니까?
							      </div>
							      <div class="modal-footer" style="border-top: none;">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary">삭제</button>
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
										<th>점검코드</th>
										<th>설비코드</th>
										<th>설비명</th>
										<th>점검일자</th>
										<th>차기점검일</th>
										<th>판정</th>
										<th>조치사항</th>
									</tr>
								</thead>

								<!-- ↓↓↓여기에 조회된 결과 출력 -->
								<tbody id="list"></tbody>
							</table>
						</div>
					</div>
				</div>


				<!-- 설비검색 Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">설비명 검색</h5>
								<br> <br>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<br>

							<div class="ms-3">
								<th>설비명</th>
								<td>
									<input type="text" id="keyword2" name="keyword2" placeholder="설비명" class="form-control" style="width: 250px">
									<button type="button" style="margin-bottom: 3px" class="btn btn-primary" onclick="eqmSelect2()"><i class="fas fa-search"></i> 검색 </button>
								</td>
							</div>

							<!-- 그리드!? 얘 대신 모달 만들어야 할 듯 -->
							<div id="modGrid" class="modal-body"></div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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