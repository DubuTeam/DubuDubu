<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/salesIstSearch.css"
	rel="stylesheet" type="text/css">
  
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">제품입고조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품입고조회</li>
		</ol>

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<div class="linelist" style="float: right; margin-bottom: 13px;">
							<button type="button" class="btn btn-primary"
								id="optionSearchBtn">
								<i class="fas fa-search"></i> 조회
							</button>
							</td>
							<button class="btn btn-primary" id="ReBtn">
								<i class="fas fa-file"></i> 초기화
							</button>
						</div>
						<form name="IstSearchFrm" id="IstSearchFrm">
							<table class="table" style="vertical-align: middle;">
								<colgroup>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>완제품LOT번호</th>
										<td><input type="text" class="form-control"
											id="edctsLotNo" name="edctsLotNo" style="width: 200px;"
											readonly> <!-- 모달버튼 -->
											<button type="button" class="btn btn-primary"
												id="lotSearchBtn" data-bs-toggle="modal"
												data-bs-target="#lotModal" style="margin-bottom: 3px;">
												<i class="fas fa-search"></i>
											</button></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>제품 입고일자</th>
										<td><input type="date" id="edctsIstDtStart"
											name="edctsIstDtStart" class="form-control"
											style="width: 150px;"> - <input type="date"
											id="edctsIstDtEnd" name="edctsIstDtEnd" class="form-control"
											style="width: 150px;">
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
		</div>
		<div id="grid" class="card mb-4"></div>

		<!-- 완제품LOT번호 모달 -->
		<div class="modal fade" id="lotModal" tabindex="-1"
			aria-labelledby="elLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				xampleModa
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="lotModalLabel">완제품LOT번호</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="lotNoGrid"></div>
					</div>
					<div class="modal-footer" style="margin-left: 100px;">
						<button type="button" id="confirmBtn" class="btn btn-primary"
							data-bs-dismiss="modal">확인</button>
						<button type="button" id="cancleLotBtn" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 div끝 -->
	</div>
</div>
</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->