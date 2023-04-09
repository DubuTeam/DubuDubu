<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Grid -->
<!-- <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script> -->

<!-- SweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


<!-- CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/material/materialOrdr.css"
	rel="stylesheet">

<!-- JS -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/material/materialOrder.js"></script> --%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주관리</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body" >
				<table>
					<tr>
						<th>원자재명</th>
						<td>
							<input class="form-control" type="text" id="rscNm"
							name="rscNm" style="width: 150px">
						</td>
						<th>업체명</th>
						<td>
							<input class="form-control" type="text" id="vendNm"
							name="vendNm" style="width: 150px ; display: inline-block;">
							<button type="button" style="margin-bottom: 3px" class="btn btn-primary" id="rscSearchBtn">
								<i class="fas fa-search"></i>
							</button>
						</td>
					<tr>
				</table>
				<br>
				<span><b>자재목록</b></span>
				
				<div id="grid"></div>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="listTable" class="table">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>현재재고</th>
								<th>안전재고</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="list">
						<c:forEach items="${materialList}" var="material" varStatus="status">
								<tr class='eachRow <c:if test="${material.avalStc < material.safStc}">warn</c:if>' 
								ondblclick="materialOrder('${material.rscCd}','${material.rscNm}','${material.vendCd}','${material.vendNm}','${material.avalStc}','${material.safStc}', '${OrderCode}')">		
									<td>${status.count}</td>
									<td>${material.rscCd}</td>
									<td>${material.rscNm}</td>
									<td>${material.vendCd}</td>
									<td>${material.vendNm}</td>
									<td>${material.avalStc}</td>
									<td>${material.safStc}</td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">

				<div class="linelist" style="float: right;">
					<button type="button" class="btn btn-primary" id="minusBtn">
						<i class="fas fa-minus"></i> 삭제
					</button>
					<button type="button" class="btn btn-primary" id="saveBtn">
						<i class="fas fa-save"></i> 발주
					</button>
					<br> <br>
				</div>

				<br><br>
				
				<span><b>자재발주신청</b></span>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>발주코드</th>
								<th>발주수량</th>
								<th>현재재고</th>
								<th>안전재고</th>
								<th>예상재고량</th>
								<th>납기요청일</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="order">
						
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div>
		<br>
		<%-- <div class="card mb-4">
			<div class="card-body">
				<div class="linelist" style="float: right;">
					<button type="button" class="btn btn-primary" id="minusBtn">
						<i class="fas fa-minus"></i> 삭제
					</button>
					<button type="button" class="btn btn-primary" id="saveBtn">
						<i class="fas fa-save"></i> 수정
					</button>
					<br> <br>
				</div>
				<br><br>
				<span><b>자재발주목록</b></span>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list" class="table">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>자재코드</th>
								<th>자재명</th>
								<th>업체코드</th>
								<th>업체명</th>
								<th>발주코드</th>
								<th>발주수량</th>
								<th>현재재고</th>
								<th>안전재고</th>
								<th>예상재고량</th>
								<th>납기요청일</th>
							</tr>
						</thead>
						<!-- ↓↓↓여기에 조회된 결과 출력 -->
						<tbody id="orderPrint">
						<c:forEach items="${materialOrderList}" var="materialOrder">
							<tr>
								<td><input type="checkbox"></td>
								<td>${materialOrder.rscCd}</td>
								<td>${materialOrder.rscNm}</td>
								<td>${materialOrder.vendCd}</td>
								<td>${materialOrder.vendNm}</td>
								<td>${materialOrder.ordrCd}</td>
								<td>${materialOrder.ordrCnt}</td>
								<td>${materialOrder.avalStc}</td>
								<td>${materialOrder.safStc}</td>
								<td>${materialOrder.expect}</td>
								<td><fmt:formatDate value="${materialOrder.paprdCmndDt}" pattern = "yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 조회시 나타나는 테이블 닫는 태그 -->
			</div>
		</div> --%>
	</div>
</div>
<!-- /.container-fluid -->
<br>
</div>
<!-- End of Main Content -->

<script>
	let code = '${OrderCode}'; // 발주코드
	let material = []; // 자재발주목록
	let successMaterial = [] // 자재발주 신청한 목록
	let rscCds = ""; // 자재코드
	let orderCode = ""; // 발주번호
	let orderCount = ""; // 발주수량 
	let requestDates= ""; // 납기요청일
	let vendCd =""; // 거래처코드
	
	// 발주할 자재 더블클릭시 작동하는 함수
	function materialOrder(rscCd, rscNm, vendCd, vendNm, avalStc, safStc, OrderCode){
	  let datas = {rscCd : rscCd, rscNm : rscNm, vendCd : vendCd, vendNm:vendNm, avalStc : avalStc, safStc:safStc, OrderCode:OrderCode}
	  material.push(datas)
	  let tbody = $("#order"); // tbody 선택
	  let row = makeTr(datas);
	  tbody.append(row);
	}
	
	// tr 태그 만들어서 반환하는 함수
	function makeTr(datas={}){
	
	  let row = $("<tr>").data('rscCd',datas.rscCd);
	
	  // td 생성
	  let checktd = $("<td>");
	  checktd.append($('<input>', {type: 'checkbox', name : 'RowCheck', value : datas.rscCd}));
	  row.append(checktd); // 체크박스
	
	  row.append($("<td>").text(datas.rscCd)); // 자재코드
	  row.append($("<td>").text(datas.rscNm)); // 자재명
	  row.append($("<td>").text(datas.vendCd)); // 업체코드
	  row.append($("<td>").text(datas.vendNm)); // 업체명
	
	  checktd = $("<td>").css('color','blue').text(datas.OrderCode); // 발주코드
	  //checktd.append($('<input>', {type: 'text', class : datas.OrderCode , value : datas.OrderCode})); // 발주코드
	  row.append(checktd);
	
	  checktd = $("<td>");
	  checktd.append($('<input>', {id :datas.rscCd ,type: 'text', value : datas.orderCount , onchange : "expected(this)"})); // 발주수량
	  row.append(checktd);
	
	  row.append($("<td>").addClass( 'avalStc' ).text(datas.avalStc)); // 현재재고
	  row.append($("<td>").text(datas.safStc)); // 안전재고
	  row.append($("<td>").addClass( 'expect' ).css('color','red').text(datas.expectedCount)); // 예상재고량
	
	  checktd = $("<td>");
	  checktd.append($('<input>', {type: 'date', onchange : "requestDate(this)", value : datas.requestDate})); // 납기요청일
	  row.append(checktd);
	
	  return row;
	
	}
	
	// 발주수량이 변화할경우 실행하는 함수
	function expected(obj){
	let orderCount = $(obj).val(); // 발주수량
	let parentTr = $(obj).parent().parent(); // tr
	let avalStc = parentTr.find('.avalStc').text(); // 현재 재고량
	let total = parseInt(avalStc) + parseInt(orderCount);
	
	parentTr.find('.expect').css('color','red').text(total); // 예상재고량 넣기
	
	for(let i = 0; i < material.length; i++){  
	    if(parentTr.data('rscCd') == material[i].rscCd){
	    material[i].expectedCount = total; // 예상재고량
	    material[i].orderCount =  orderCount; // 발주수량
	  }
	}
	}
	
	// 날짜가 변화할경우 실행하는 함수
	function requestDate(obj){
	let reqDate = $(obj).val(); // 납기 요청일
	let parentTr = $(obj).parent().parent(); // tr
	
	for(let i = 0; i < material.length; i++){  
	  if(parentTr.data('rscCd') == material[i].rscCd){
	    material[i].requestDate = reqDate; // 납기요청일
	  }
	}
	}
	
	// 발주버튼을 눌렀을떄 실행하는 함수
	$('#saveBtn').on('click',function() {
	  let chkObj = document.getElementsByName("RowCheck"); // name 속성이 RowCheck인것을 모두 가져옴
	  for (let i = 0; i < chkObj.length; i++) {
	    if (chkObj[i].checked == true) {
	      rscCds = rscCds + chkObj[i].value + ","; // 자재코드
	      
	      for(let j = 0 ; j < material.length; j++){
	        if(material[j].rscCd == chkObj[i].value){ // 자재코드가 같다면
	          orderCode = orderCode + material[j].OrderCode + ",";  // 발주번호(코드) 받아오기
	          orderCount = orderCount + material[j].orderCount + ","; // 발주수량 받아오기
	          requestDates = requestDates + material[j].requestDate + ","; // 납기요청일
	          vendCd = vendCd + material[j].vendCd + ","; // 거래처코드
	          successMaterial[i] = material[j]; // 자재 발주 신청한 애들 복사
	          material.splice(j, 1); // 발주한 자재목록 제거
	        }
	      }
	    }
	  }
	
	  console.log(rscCds); // 자재코드
	  console.log(orderCode); // 발주번호
	  console.log(orderCount); // 발주수량
	  console.log(requestDates); // 납기요청일
	  console.log(vendCd); // 거래처코드
	
	  let data = {
	    param : 'insert', // 삽입
	    rscCd : rscCds, // 자재코드
	    ordrCd : orderCode, // 발주번호
	    ordrCnt2 : orderCount, // 발주수량
	    paprdCmndDt2 : requestDates, // 납기요청일
	    vendCd : vendCd // 거래처코드
	  }
	
	  $.ajax({
	      url: 'materialOrder',
	      type: 'POST', 
	      data: data, // 쿼리스트링
	      success: function (result) {
	        if(result == 1){
        	  Swal.fire({
                   icon: 'success',
                   title: '자재 발주 신청이 완료되었습니다.',
                   text: '발주 번호 : ' + code + ' 신청 완료되었습니다.',
               });
	          console.log("성공");
	          let tbody = $("#order"); // tbody 선택
	          
	          tbody.empty();
	          
	          let ordr = code.substring(0,4); // ORDR
      		  let ordrNum = parseInt(code.substring(4)) + 1; // 숫자 4자리
	          for(let i = 0 ; i < material.length; i++){
        	  
	            console.log(code);
	            console.log(ordr);
	            console.log(ordrNum);
	            material[i].OrderCode = ordr + ordrNum;
	            tbody.append(makeTr(material[i]));
	          }
	          code = ordr + ordrNum; // 다음에 오는 발주번호
	        }else{
	          console.log("실패");
	        }
	      },
	      error: function (reject) {
	        console.log(reject);
	      }
	    })
	});
	
	
/* $(document).ready(function(){ }); */
 
 /*
	$.ajax({
	  url: '/materialOrder', // 요청이 전송될 URL 주소
	  type: 'post', // http 요청 방식 (default: ‘GET’)
	  data: { materialCode : materialCode, accountCode : accountCode }, // 요청 시 포함되어질 데이터
	  success: function(data) {
	    let tbody = $("#order"); // tbody 선택
	    tbody.empty(); // tbody 비우기
	
	    // 데이터 반복문 처리
	    $.each(data.result, function (index, item) {
	        let row = $("<tr>");
	
	        // td 생성
	        row.append($('<input>', {type: 'hidden', name: 'data1', value:'value1' }));
	        row.append($('<input>', {type: 'hidden', name: 'data1', value:'value1' }));
	
	        let checktd = $("<td>");
	        checktd.append($('<input>', {type: 'checkbox'}));
	        row.append(checktd);
	
	        row.append($("<td>").text(item.rscCd));
	        row.append($("<td>").text(item.rscNm));
	        row.append($("<td>").text(item.vendCd));
	        row.append($("<td>").text(item.vendNm));
	
	        checktd = $("<td>");
	        checktd.append($('<input>', {type: 'text'}));
	        row.append(checktd);
	
	        row.append($("<td>").text(item.avalStc));
	        row.append($("<td>").text(item.safStc));
	        row.append($("<td>").text(item.avalStc));
	
	        checktd = $("<td>");
	        checktd.append($('<input>', {type: 'date'}));
	        row.append(checktd);
	
	        row.append(td);
	        tbody.append(row);
	    })
	  },
	  error: function(err) {
	    console.log(err)
	  },
	
	})
	*/
</script>
