<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/eqcss/eq.css" rel="stylesheet" type="text/css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- JS 연결 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/eqcss/eq.js"></script>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- 헤더부분 -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">설비관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 설비관리</li>
			<li class="breadcrumb-item active">> 설비관리</li>
		</ol>


		<div>
			<!-- 헤더부분 -->
			<div class="container-fluid px-4">
				<div class="row">
					<div class="col-12">
						<div class="card mr-4">
							<div class="card-body">
								<div id="searchBar">
									<select class="dataTable-selector" id="opN" name="opN"
										style="width: 150px">
										<option selected value="">==선택==</option>
										<option value=1>설비코드</option>
										<option value=2>설비명</option>
										<option value=3>공정명</option>
									</select>

									<input class="form-control" type="text" id="keyword" name="keyword"
										placeholder="설비명" style="width: 180px"></input>

									<button type="button" id="sTtn" class="btn btn-primary"
										style="margin-bottom: 3px">
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
												<th>최소온도</th>
												<th>최대온도</th>
												<th>점검주기(일)</th>
												<th>라인코드</th>
											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 -->
										<tbody id="list"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-12">
					<div class="card mb-4">
						<div class="card-body">
							<div class="linelist" style="float: right;">
								<button class="btn btn-primary" id="modBtn"><i
										class="fa-solid fa-paintbrush"></i> 수정</button>
								<button class="btn btn-primary" id="insertBtn"><i class="fas fa-save"></i>
									등록</button>

								<!-- Button trigger modal (4.6버젼) -->
								<button type="button" class="btn btn-primary" data-toggle="modal"
									data-target="#exampleModal">
									<i class="fas fa-trash"></i> 삭제
								</button>

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
												<button type="button" class="btn btn-primary">삭제</button>
											</div>
										</div>
									</div>
								</div>

								<!-- ↑↑↑ 모달 -->
							</div>

							<form id="dataForm" name="dataForm" action="#" method="post">
								<input type="file" style="display: none" id="eqmImg" name="file"
									onchange="readURL(this);">
								<img id="preview" style="width: 150px;" />
								<br> <br>
								<label class="btn btn-primary" for="eqmImg" style="width: 110px"><i
										class="fa-solid fa-file-arrow-up"></i> 첨부파일 </label><br><br>

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
											<th>설비구분 *</th>
											<td>
												<select class="dataTable-selector" name="eqmFg" id="eqmFg"
													style="width: 250px">
													<option selected>==등록시필수선택==</option>
													<option value=1>충전설비</option>
													<option value=2>파쇄설비</option>
													<option value=3>튀김설비</option>
												</select>
											</td>

											<th>설비코드</th>
											<td>
												<input class="form-control" name="eqmCd" id="eqmCd"
													style="width: 250px" readonly placeholder="등록시 자동 입력">
											</td>

											<th>설비명 *</th>
											<td>
												<input class="form-control" type="text" id="eqmNm"
													name="eqmNm" style="width: 250px">
											</td>
										</tr>


										<tr>
											<th>라인명 *</th>
											<td>
												<select class="dataTable-selector" name="lineNm" id="lineNm"
													style="width: 250px">
													<option selected value="">==등록시필수선택==</option>
													<!-- 라인명 탭에서 쓸 옵션들 -->
													<c:forEach var="list" items="${eqLineList}">
														<option value="${list.lineNm}">${list.lineNm}</option>
													</c:forEach>
												</select>
											</td>

											<th>라인코드</th>
											<td>
												<input class="form-control" name="lineCd" id="lineCd"
													style="width: 250px" readonly>
											</td>

											<th>점검주기(일) *</th>
											<td>
												<input type="number" class="form-control" name="chckPerd"
													id="chckPerd" style="width: 250px">
											</td>
										</tr>


										<tr>
											<th>공정명 *</th>
											<td>
												<select name="prcsNm" aria-label="Default select example"
													style="width: 250px" id='prcsNm' 
													class="dataTable-selector">
													<option selected value="">==등록시필수선택==</option>
													<!-- <option th:each="value : ${prcsList}"
														th:value="${value.prcsCd}"
														th:text="${value.prcsNm}"></option> -->
													<!-- 라인명 탭에서 쓸 옵션들 -->
													<c:forEach var="list" items="${processList}">
														<option value="${list.prcsCd}" data-code="${list.prcsCd}">${list.prcsNm}</option>
													</c:forEach>
												</select>
											</td>

											<th>공정코드</th>
											<td>
												<input class="form-control" name="prcsCd" id="prcsCd"
													style="width: 250px" readonly value="hello">
											</td>

											<th>온도</th>
											<td>
												<input type="number" class="form-control" name="minTemp"
													id="minTemp" style="width: 115px"> ~
												<input type="number" class="form-control" name="maxTemp"
													id="maxTemp" style="width: 115px">
											</td>
										</tr>


										<tr>
											<th>입고일자 *</th>
											<td>
												<input class="form-control" type="date" id="eqmIstDt"
													name="eqmIstDt" style="width: 250px" />
											</td>

											<th>가동여부 *</th>
											<td>
												<input type="radio" name="useYN" value="Y"> 가동
												<input type="radio" name="useYN" value="N"> 미가동
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->