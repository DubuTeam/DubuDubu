<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>

		uploadResult {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
		}

		.image {
			display: block;
			width: 100%;
		}

		.image-label {
			position: relative;
			bottom: 22px;
			left: 5px;
			color: white;
			text-shadow: 2px 2px 2px black;
		}

		.c_btn {
			color: #fff;
			font-size: 13px;
			background: #333;
			border: none;
			padding: 6px;
			border-radius: 4px
		}

		.c_btn:hover {
			background: #555;
		}

		.linelist {
			display: inline-block;
			margin-top: 0px;
		}

		#grid {
			width: 100%
		}

		label {
			width: 100px;
			float: left;
		}
		
		.tui-grid-cell.addClass{
			background-color:rgba(255,0,0,0.3);
		}
	</style>
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