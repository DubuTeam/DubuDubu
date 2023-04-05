<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link
	href="${pageContext.request.contextPath}/resources/css/eqcss/eqIpopr"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">비가동관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 설비관리</li>
			<li class="breadcrumb-item active">> 비가동관리</li>
		</ol>

		<!-- 헤더부분 -->
		<div class="card mr-12 ">

			<div class="card-body">
				<form action="" id="eqmForm" name="eqmForm" method="get">
					<div class="row">
						<div class="col-12" style="margin-bottom: 3px"></div>
					</div>
					<div class="row me-3">
						<div class="col-12">
							<th>설비명</th> &nbsp&nbsp
							<td><input class="form-control" type="text" id="SEqmNm"
								name="eqmNm" style="width: 150px" placeholder="설비명"></td>
							&nbsp&nbsp
							<th>비가동일자</th>
							<td><input class="form-control" type="date" id="STrDt"
								name="frDt" style="width: 150px"> ~</td>
							<td><input class="form-control" type="date" id="SToDt"
								name="toDt" style="width: 150px"></td>&nbsp&nbsp
							<button type="button"
								style="width: 85px; height: 38px; margin-bottom: 4px"
								class="btn btn-primary" onclick="eqmSelect()">
								<i class="fas fa-search"></i> 조회
							</button>
							<button type="submit" formaction="eqmOprExelView"
								style="width: 85px; height: 38px; margin-bottom: 4px"
								class="btn btn-primary" id="excelBtn">
								<i class="fas fa-download"></i> Excel
							</button>
							</a>
							<button type="button" data-bs-toggle="modal"
								class="btn btn-primary" id="modalBtn"
								data-bs-target="#insertModal"
								style="width: 85px; height: 38px; margin-bottom: 4px">
								<i class="fas fa-save"></i> 등록
							</button>
							<button type="button" class="btn btn-primary" id="del"
								style="width: 85px; height: 38px; margin-bottom: 4px">
								<i class="fas fa-trash"></i> 삭제
							</button>
						</div>
				</form>
			</div>
			<br>
			<div id="grid2"></div>
			<!-- <br><p style="font-size:14px">세부내역 확인 시 더블 클릭</p> -->
		</div>
		<br>


		<!-- 설비 비가동 등록 Modal -->
		<div class="modal fade" id="insertModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">설비 비가동 등록</h5>
						<br> <br>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>

					</div>
					<br>

					<div class="modal-body">
						<div class="linelist" style="float: right;">
							<button class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 저장
							</button>
							<br> <br>
						</div>

						<div>
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
											<th>설비명 *</th>
											<td><select class="form-control" id="frmEqmCd"
												name="frmEqmCd" style="width: 180px">
													<option selected value="">==선택==</option>
													<option th:each="value : ${eqmList}"
														th:value="${value.eqmCd}" th:text="${value.eqmNm}">
											</select>
										</tr>
										<tr>
											<th>담당자 *</th>
											<td><input class="form-control" type="text" id="frmPsch"
												name="frmPsch" style="width: 180px"></input>
										</tr>
										<tr>
											<th>가동여부<strong class="blue">*</strong>
											</th>
											<td><input type="radio" name="frmUseYN" value="Y">
												가동
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="frmUseYN" value="N"> 미가동</td>
										</tr>
										<tr>
											<th>시작일 *</th>
											<td><input class="form-control" type="date" id="frDt"
												name="frDt" style="width: 150px" /></td>
										</tr>
										<tr>
											<th>종료일 *</th>
											<td><input class="form-control" type="date" id="toDt"
												name="toDt" style="width: 150px" /></td>

										</tr>

										<tr>
											<th>작업내용 *</th>
											<td><input type="text" id="opertCtnt" name="opertCtnt"
												class="form-control" style="width: 500px; height: 100px" /></td>
										</tr>
									</tbody>
								</table>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 설비 비가동 eqmSelect Modal -->
		<div class="modal fade" id="GridModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비가동 내역 세부조회</h5>
						<br> <br>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>

					</div>
					<br>

					<div class="modal-body">
						<div class="linelist" style="float: right;">
							<button class="btn btn-primary" id="MsaveBtn">
								<i class="fas fa-save"></i> 저장
							</button>
							<br> <br>
						</div>

						<div>
							<form id="gridDataForm" name="gridDataForm" action="#"
								method="post">
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
										<input type="hidden" id="GFrmNoprCd" name="noprCd" />
										<tr>
											<th>설비코드</th>
											<td><input class="form-control" type="text"
												id="GFrmEqmNm" name="frmEqmNm" style="width: 180px" readonly></input>
										</tr>
										<tr>
											<th>설비명</th>
											<td><input class="form-control" type="text"
												id="GFrmEqmCd" name="frmEqmCd" style="width: 180px" readonly></input>
										</tr>
										<tr>
											<th>담당자 *</th>
											<td><input class="form-control" type="text"
												id="GFrmPsch" name="frmPsch" style="width: 180px"></input>
										</tr>
										<tr>
											<th>시작일 *</th>
											<td><input class="form-control" type="date" id="GFrDt"
												name="frDt" style="width: 150px" /></td>
										</tr>
										<tr>
											<th>종료일 *</th>
											<td><input class="form-control" type="date" id="GToDt"
												name="toDt" style="width: 150px" /></td>

										</tr>

										<tr>
											<th>작업내용 *</th>
											<td><input type="text" id="GOpertCtnt" name="opertCtnt"
												class="form-control" style="width: 500px; height: 100px" /></td>
										</tr>
									</tbody>
								</table>
							</form>
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
