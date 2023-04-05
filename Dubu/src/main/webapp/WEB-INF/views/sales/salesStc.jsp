<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">완제품LOT 재고조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 완제품LOT 재고조회</li>
		</ol>
		<!-- 본문내용 끝 -->

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<form name="searchFrm" id="searchFrm" method="post">
							<table class="table" style="vertical-align: middle">
								<colgroup>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
								</colgroup>
								<tbody>
									<!-- 조회버튼 -->
									<button type="button" class="btn btn-primary" id="searchBtn"
										style="float: right; margin-bottom: 15px; margin-left: 10px;">
										<i class="fas fa-search"></i>조회
									</button>
									<button class="btn btn-primary" id="ReBtn"
										style="float: right;">
										<i class="fas fa-file"></i> 초기화
									</button>
									<tr>
										<th>제품명</th>
										<td><input type="text" class="form-control" id="prdtNm"
											name="prdtNm" style="width: 150px;"> <!-- 모달버튼 -->
											<button type="button" class="btn btn-primary"
												id="prdtSearchBtn" data-bs-toggle="modal"
												data-bs-target="#proModal">
												<i class="fas fa-search"></i>
											</button></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>완제품LOT번호</th>
										<td><input type="text" class="form-control"
											id="edctsLotNo" name="edctsLotNo" list="lotdata"
											style="width: 150px" autocomplete="off" /> <datalist
												id="lotdata">
												<option th:each="lotNos : ${lotNo}"
													th:value="${lotNos.edctsLotNo}"
													th:text="${lotNos.edctsLotNo}"></option>
											</datalist></td>
										<th></th>
										<td></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>

			</div>
		</div>
		<div id="grid" class="card mb-4"></div>

		<!-- 제품명 모달 -->
		<div class="modal fade" id="proModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">제품 목록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="proGrid"></div>
					</div>
					<div class="modal-footer">
						<button type="button" id="confirmBtn" class="btn btn-primary"
							data-bs-dismiss="modal">확인</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 제품명 모달 끝 -->
	</div>
	<!-- /.container-fluid -->
</div>
</div>
<!-- End of Main Content -->
