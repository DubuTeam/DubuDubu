<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/equip.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Begin Page Content -->
  <div class="container-fluid">

<div class="container-fluid px-4">
			<h1 class="mt-4">실시간설비상태</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/"><i
						class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 설비관리</li>
				<li class="breadcrumb-item active">> 실시간설비상태</li>
			</ol>


			<div class="container-fluid px-4" style="margin-top:1%">
				<div class="card mb-4">
					<div class="card-body">
					<figure class="highcharts-figure">
					    <div id="container" style="height:300px"></div>
					</figure>	
					</div>
					
				</div>

				<div class="card mb-4">
					<div class="card-body">
					<figure class="highcharts-figure">
					    <div id="container2" style="height:300px"></div>
					</figure>	
					</div>

				</div>
			</div>
		</div>

	

  </div>
 <!-- /.container-fluid -->
  
 </div>
 <!-- End of Main Content -->
