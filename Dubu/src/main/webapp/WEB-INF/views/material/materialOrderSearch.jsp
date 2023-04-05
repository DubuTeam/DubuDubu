<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                      <link
	href="${pageContext.request.contextPath}/resources/css/material/materialOrdrSearch.css"
	rel="stylesheet" type="text/css">
<div class="container-fluid px-4">
			<h1 class="mt-4">자재발주</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 자재관리</li>
				<li class="breadcrumb-item active">> 자재발주조회</li>
			</ol>

			<div class="card mb-4">
				<div class="card-body">

					<tr>
						<th>업체명</th>
						<td><input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px"></td>&nbsp&nbsp
						<th>발주신청일</th>
						<td><input class="form-control" type="date" id="frDt" name="frDt" style="width: 150px"> ~</td>
						<td><input class="form-control" type="date" id="toDt" name="toDt" style="width: 150px"></td>
						<button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i class="fas fa-search"></i></button>
														
						&nbsp&nbsp
					</tr>


					<br><br>
					<div id="grid"></div>
				</div>
			</div>



</button>
			
<!-- Modal -->
<div  class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">자재발주내역조회</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <label style="margin-top:5px">발주코드</label>
					<input class="form-control" type="text" id="ordrCd" name="ordrCd" style="width:180px; margin-bottom:10px" readonly/>
        	<div class="linelist" style="float: right;">
					
					<button type="button" class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 수정</button>
					<button id="pdfBtn" name="pdfBtn" type="button" class="btn btn-primary"><i class="fas fa-download"></i> PDF</button>
								</div>
					<div id="grid2"></div>
				</div>
			</div>
      </div>
    </div>
  </div>