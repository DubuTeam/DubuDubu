<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ page session="false" %>

			<link href="${pageContext.request.contextPath}/resources/css/sales/inbound.css" rel="stylesheet"
				type="text/css">
			<!-- fontawesome 사용! -->
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
				integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />

			<!-- Begin Page Content -->
			<div class="container-fluid">
				<!-- 이 태그 내를 바꾸기 -->
				<!-- Page Heading -->

				<h1>영업관리</h1>

				<!-- nav-bar -->
				<div>
					<i class="fa fa-home" aria-hidden="true"></i> 영업 관리 > 제품 입고 등록
				</div>


				<form action="#">
					<div id="top-nav">
						<!-- 입고 날짜 -->
						<div id="inbound_date">
							<label for="from_date">주문일자</label>
							<input type="date" id="from_date" name="from_date" size="3"> -
							<input type="date" id="to_date" name="to_date" size="3">
						</div>

						<!-- 조회/등록/초기화 버튼들 -->
						<div id="submitResetBtn">
							<input type="submit" value="등록">
							<input type="button" value="조회">
							<input type="reset" value="초기화">
						</div>
					</div><br>


					<div id="main-content">
						<div id="upper">
							<label for="customer_name">재품 입고번호</label>
							<input type="text" id="customer_name" name="customer_name">

							<label for="product_name">완제품LOT번호</label>
							<input type="text" id="product_name" name="product_name">
							<button class="search_product"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>

						<div id="lower">
							<label for="customer_name">검사수량</label>
							<input type="text" id="customer_name" name="customer_name">

							<label for="customer_name">제품 입고수량</label>
							<input type="text" id="customer_name" name="customer_name">
						</div>
					</div>
				</form>

				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>제품입고번호</th>
								<th>제품입고일자</th>
								<th>제품입고수량</th>
								<th>제품코드</th>
								<th>완제품LOT번호</th>
								<th>제품명</th>
							</tr>
						</thead>

						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="list"></tbody>
					</table>
				</div>
			</div>
			<!-- End of Main Content -->