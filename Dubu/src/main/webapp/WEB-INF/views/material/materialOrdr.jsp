<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                  <link
	href="${pageContext.request.contextPath}/resources/css/material/materialOrdr.css"
	rel="stylesheet" type="text/css">
<div class="container-fluid px-4">
			<h1 class="mt-4">자재발주</h1>
			<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
						class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 자재관리</li>
				<li class="breadcrumb-item active">> 자재발주관리</li>
			</ol>

			<div class="card mb-4">
				<div class="card-body">

					<tr>
						<th>원자재명</th>
						<td><input class="form-control" type="text" id="rscNm" name="rscNm" style="width: 150px"></td>
						<th>업체명</th>
						<td><input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px"></td>
						<button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i
								class="fas fa-search"></i></button>
						&nbsp&nbsp


					<br><br>
					<div id="grid">자재목록</div>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-body">

					<div class="linelist" style="float: right;">
						<button class="btn btn-primary" id="minusBtn"><i class="fas fa-minus"></i> 삭제</button>
						<button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 발주</button>
						<br> <br>
					</div>

					<br><br>
					
					<div id="grid2">자재발주<br></div>
				</div>
			</div>