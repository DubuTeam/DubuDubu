<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주조회</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body">
			<table>
				<tr>
					<th>업체명</th>
					<td>
						<input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px">
					</td>
					<th>발주신청일</th>
					<td>
						<div style="display: flex;">
							<input type="date" id="start" name="start"
								class="form-control" style="width: 150px;"> <span
								style="padding: 5px;">-</span> <input type="date" id="end"
								name="end" class="form-control" style="width: 150px;">
						</div>
					<td>
						<button style="margin-bottom: 3px" class="btn btn-primary" id="rscSearchBtn">
							<i class="fas fa-search"></i>
						</button>
					</td>
				</tr>
			</table>
				<br><br>
				<div id="grid"></div> <!-- 그리드 -->
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">자재발주내역조회</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<label style="margin-top: 5px">발주코드</label> <input
							class="form-control" type="text" id="ordrCd" name="ordrCd"
							style="width: 180px; margin-bottom: 10px" readonly />
						<div class="linelist" style="float: right;">

							<button type="button" class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 수정
							</button>
							<button id="pdfBtn" name="pdfBtn" type="button"
								class="btn btn-primary">
								<i class="fas fa-download"></i> PDF
							</button>
						</div>
						<div id="grid2"></div>
					</div>
				</div>
			</div>
		</div><!-- 모달창 끝 -->
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<script>
	let Grid = tui.Grid;
	

</script>