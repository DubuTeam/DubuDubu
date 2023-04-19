<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!-- Toast 사용(알람 꾸미기) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link href="${pageContext.request.contextPath}/resources/css/eqcss/equIp.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">

	<div class="container-fluid px-4">
		<h1 class="mt-4">실시간설비상태</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 설비관리</li>
			<li class="breadcrumb-item active">> 실시간설비상태</li>
		</ol>


		<div class="container-fluid px-4" style="margin-top: 1%">
			<div class="card mb-4">
				<div class="card-body">
					<figure class="highcharts-figure">
						<div id="container" style="height: 300px"></div>
					</figure>
				</div>

			</div>

			<div class="card mb-4">
				<div class="card-body">
					<figure class="highcharts-figure">
						<div id="container2" style="height: 300px"></div>
					</figure>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
