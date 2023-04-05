<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/eqcss/eqCheck.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Begin Page Content -->
  <div class="container-fluid">



		<div class="container-fluid px-4">
			<h1 class="mt-4">설비점검관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/"><i
						class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 설비관리</li>
				<li class="breadcrumb-item active">> 설비점검관리</li>
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
								<button class="btn btn-primary" id="newBtn"><i class="fas fa-file"></i> 새자료</button>
							</div>
							<br><br>
							<form id="dataForm" name="dataForm" action="#" method="post">
								<table class="table" style="vertical-align : middle;">
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
											<td>
												<input class="form-control" name="eqmCd" id="eqmCd" style="width: 250px" readonly>
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
												data-bs-target="#exampleModal" id="searchBtn" name="searchBtn">
													<i class="fas fa-search"></i>
												</button>
											</td>
											<th>설비명</th>
											<td><input class="form-control" type="text" id="eqmNm" name="eqmNm" style="width: 250px"
													readonly />
											<th>점검일자</th>
											<td><input class="form-control" type="date" id="chckDt" name="chckDt" style="width: 250px" /></td>
										</tr>
										<tr>
										
											<th>판정</th>
											<td>
												<input type="radio" name="jdgmnt" value="적합"> 적합
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="jdgmnt" value="부적합"> 부적합
											</td>
											<th>조치사항</th>
											<td>
												<input type="radio" name="dispoMatter" value="수리"> 수리
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="dispoMatter" value="점검"> 점검
											</td>
											<th>점검구분</th>
											<td>
												<input type="radio" name="chckFg" value="정기점검"> 정기점검
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="chckFg" value="수시점검"> 수시점검
												
										</tr>
										
										<tr>

											<th>조치내역</th>
											<td>
												<textarea name="dispoCtnt" id="dispoCtnt" class="form-control"
													style="width: 350px; height:100px"></textarea>
											</td>
											<th>담당자</th>
											<td>
												<input class="form-control" name="chckPsch" id="chckPsch" style="width: 250px">
											</td>
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
					<tr>
						<th>설비명</th>
						<td><input class="form-control" type="text" id="keyword3" name="eqmNm" style="width: 150px"></td>&nbsp&nbsp
						<th>해당일자</th>
						<td>
							<input type="date" class="form-control" id="stDt" name="stDt" style="width: 150px;"> ~
							<input type="date" class="form-control" id="toDt" name="toDt" style="width: 150px;">
						</td>&nbsp
						<td>
							<button type="button" style="margin-bottom:3px" class="btn btn-primary" id="bSearchBtn"><i class="fas fa-search"></i> 검색</button>
							<button type="submit" formaction="eqmChckExelView" style="margin-bottom:3px" class="btn btn-primary" id="excelBtn"><i class="fas fa-download" ></i> Excel</button></a>
							<button type="button"  style="margin-bottom:3px" class="btn btn-primary" id="delBtn"><i class="fas fa-trash"></i> 삭제</button>
						</td>
					</tr>
					</form>
					
					<br>
					<div id="grid"></div>
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

						</div><br>
						<div class="ms-3">
							<th>설비명</th>
						<td>
							<input type="text" id="keyword2" name="keyword2" placeholder="설비명" class="form-control" style="width: 250px">
							<button type="button" style="margin-bottom:3px" class="btn btn-primary" onclick="eqmSelect2()"><i class="fas fa-search"></i> 검색</button>
						</td>
						</div>
						<div id="modGrid" class="modal-body"></div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

  </div>
 <!-- /.container-fluid -->
  
 </div>
 <!-- End of Main Content -->
