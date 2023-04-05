<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link
	href="${pageContext.request.contextPath}/resources/css/sales/salesOustSearch.css"
	rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="container-fluid px-4">
		<h1 class="mt-4">제품출고조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item" style="margin-left: 5px;"><a
				href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품출고조회</li>
		</ol>

		<div class="card mb-4">
			<div id="cont" style="padding-bottom: 0px">
				<div class="col">
					<div class="card-body">
						<form name="searchFrm" id="searchFrm">
							<table class="table" style="vertical-align: middle">
								<colgroup>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
									<col style="width: 150px;">
									<col>
								</colgroup>
								<tbody>
									<button type="button" class="btn btn-primary" id="dtSearchBtn"
										style="float: right; margin-bottom: 15px; margin-left: 5px;">
										<i class="fas fa-search"></i>조회
									</button>
									<button class="btn btn-primary" id="ReBtn"
										style="float: right; margin-bottom: 15px;">
										<i class="fas fa-file"></i> 초기화
									</button>
									</td>
									<tr>
										<th>제품명</th>
										<td><input type="text" class="form-control" id="prdtNm"
											name="prdtNm" style="width: 150px"></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>거래처</th>
										<td><input type="text" class="form-control" id="vendNm"
											name="vendNm" style="width: 150px;"></td>
										<th></th>
										<td></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>제품 출고일자</th>
										<td><input type="date" id="oustStart" name="oustStart"
											class="form-control" style="width: 150px"> - <input
											type="date" id="oustEnd" name="oustEnd" class="form-control"
											style="width: 150px">
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
	</div>
	<!-- /.container-fluid -->
</div>
</div>
<!-- End of Main Content -->