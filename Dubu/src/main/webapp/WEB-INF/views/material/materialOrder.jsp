<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Grid -->
<!-- <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script> -->

<!-- SweetAlert -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


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
			<div class="card-body">
				<div class="linelist" style="float: right;">
					<button type="button" class="btn btn-primary" id="searchBtn">
						<i class="fas fa-search"></i> 조회
					</button>
					<br> <br>
				</div>
				
				<table>
					<tr>
						<th>자재명</th>
						<td>
							<input class="form-control" type="text" id="rscNm" name="rscNm" style="width: 150px">
						</td>
						<th></th>
						<td>	
							<!--  자재명 모달창 버튼 -->
							<button type="button" style="margin-left: 3px; margin-right : 10px;"
								class="btn btn-primary" data-toggle="modal"
								data-target="#materialModal" id="rscSearchBtn" name="rscSearchBtn">
								<i class="fas fa-search"></i>
							</button>
						</td>
						
						<th style="margin-right : 10px;">업체명</th>
						<td>
							<input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px; display: inline-block;">
						</td>
						
						<td>
							<!-- 업체명 모달창 버튼 -->
							<button type="button" style="margin-left: 3px"
								class="btn btn-primary" data-toggle="modal"
								data-target="#vendModal" id="vendSearchBtn" name="vendSearchBtn">
								<i class="fas fa-search"></i>
							</button>
						</td>
							
					<tr>
				</table>
				
				<!-- Modal -->
				<div class="modal fade" id="materialModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- <div class="modal-dialog"> -->
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">자재 검색</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">X</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: center;">
								<!-- 조회 시 나타나는 테이블 -->
								<div id="materialModalTable" class="table">
									<table style="width:100%;">
										<thead>
											<tr>
												<td>No.</td>
												<th>자재코드</th>
												<th>자재명</th>
												<th>자재유형</th>
												<th>자재단위</th>
											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
										<tbody id="materialModallist">
										<c:forEach items="${materialModalList}" var="materialModal" varStatus="status">
											<tr class='eachRow' ondblclick="searchMaterial('${materialModal.rscNm}')">
												<td>${status.count}</td>
												<td>${materialModal.rscCd}</td>
												<td>${materialModal.rscNm}</td>
												<td>${materialModal.rscTyp}</td>
												<td>${materialModal.mngUnit}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- ↑↑↑ 모달 -->
				
				<!-- Modal -->
				<div class="modal fade" id="vendModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- <div class="modal-dialog"> -->
					<div class="modal-dialog modal-dialog-centered modal-lg">
						<!-- 모달창 화면 중앙에  modal-dialog-centered, 모달 사이즈 변경 직접 불가해서 modal-lg 추가 -->
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">업체 검색</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">X</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: center;">
								<!-- 조회 시 나타나는 테이블 -->
								<div id="vendModalTable" class="table">
									<table style="width:100%;">
										<thead>
											<tr>
												<td>No.</td>
												<th>업체코드</th>
												<th>업체명</th>
												<th>사업자번호</th>
												<th>전화번호</th>
											</tr>
										</thead>

										<!-- ↓↓↓여기에 조회된 결과 출력 (테스트용 더미 넣었음) -->
										<tbody id="vendModallist">
											<c:forEach items="${vendMoalList}" var="vendModal" varStatus="status">
												<tr class='eachRow' ondblclick="searchVend('${vendModal.vendNm}')">
													<td>${status.count}</td>
													<td>${vendModal.vendCd}</td>
													<td>${vendModal.vendNm}</td>
													<td>${vendModal.binzo}</td>
													<td>${vendModal.telno}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- ↑↑↑ 모달 -->
				
				
				<br> <span><b>자재목록</b></span>

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
							<c:forEach items="${materialList}" var="material"
								varStatus="status">
								<tr
									class='eachRow <c:if test="${material.avalStc < material.safStc}">warn</c:if>'
									ondblclick="materialOrder('${material.rscCd}','${material.rscNm}','${material.vendCd}','${material.vendNm}','${material.avalStc}','${material.safStc}')">
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

				<br> <br> <span><b>자재발주신청</b></span>
				<!-- 조회 시 나타나는 테이블 -->
				<div id="list-body" class="table">
					<table>
						<thead>
							<tr>
								<th><input id="allCheck" type="checkbox" onclick="allChk(this)"></th>
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
	
	let OrderCode = '${OrderCode}'; // 발주코드
	let material = []; // 자재발주목록
	let rscCds = ""; // 자재코드
	let orderCode = ""; // 발주번호
	let orderCount = ""; // 발주수량 
	let requestDates= ""; // 납기요청일
	let vendCd =""; // 거래처코드
	
	// 자재 검색 모달창에서 더블클릭시 작동하는 함수
	function searchMaterial(materialName){
		$('#rscNm').val(materialName); // 자재명 입력됨
		$('.close').click(); // 모달창 닫기
	}
	
	// 업체 검색 모달창에서 더블클릭시 작동하는 함수
	function searchVend(vendName){
		$('#vendNm').val(vendName); // 거래처명 입력됨
		$('.close').click(); // 모달창 닫기
	}
	
	// 발주할 자재 더블클릭시 작동하는 함수
	function materialOrder(rscCd, rscNm, vendCd, vendNm, avalStc, safStc){
	  for(let i = 0; i < material.length; i++){
		  if(material[i].rscCd == rscCd){
			 Swal.fire({
                  icon: 'warning',
                  title: '해당 자재가 발주목록에 이미 존재합니다.',
                  text:  rscNm + ' 자재가 발주 신청 목록에 이미 존재합니다.'
              });
			 return;
		  }else if(material[i].vendCd != vendCd){
			 Swal.fire({
                  icon: 'error',
                  title: '다른업체와 같이 신청 할수없습니다.',
                  text:  '동일한 거래처를 클릭하세요'
              });
			 return;
		  }
	  }
	  let datas = {rscCd : rscCd, rscNm : rscNm, vendCd : vendCd, vendNm:vendNm, avalStc : avalStc, safStc:safStc, OrderCode:OrderCode}
	  material.push(datas)
	  let tbody = $("#order"); // tbody 선택
	  let row = makeTr(datas);
	  tbody.append(row);
	}
	
	// 조회버튼 클릭시 작동하는 함수
	$('#searchBtn').on('click',function(){
		
		 $.ajax({
		   url: 'searchMaterialOrder',
		   type: 'GET', 
		   dateType : 'json',
		   data: {rscNm : $('#rscNm').val() , vendNm : $('#vendNm').val()}, // 쿼리스트링
		   success: function (result) {
			   
			   console.log(result.result);
			   
			   let tbody = $('#list');
			   tbody.empty();

			   $.each(result.result, function (index, item) {
				   
				   let row = "";
				   if(item.avalStc < item.safStc){
				   		row = $('<tr>', { class : 'eachRow warn'}).on('dblclick', () => materialOrder(item.rscCd, item.rscNm, item.vendCd, item.vendNm, item.avalStc, item.safStc));
				   }else{
						row = $('<tr>', { class : 'eachRow'}).on('dblclick', () => materialOrder(item.rscCd, item.rscNm, item.vendCd, item.vendNm, item.avalStc, item.safStc));
				   }
				   
                   // td 생성
                   row.append($("<td>").text(index + 1));
                   row.append($("<td>").text(item.rscCd));
                   row.append($("<td>").text(item.rscNm));
                   row.append($("<td>").text(item.vendCd));
                   row.append($("<td>").text(item.vendNm));
                   row.append($("<td>").text(item.avalStc));
                   row.append($("<td>").text(item.safStc));
                   tbody.append(row);
			   	})	
		   },
	       error: function (reject) {
		       console.log(reject);
		   }
		 });
		
	});
	
	// tr 태그 만들어서 반환하는 함수
	function makeTr(datas={}){
	
	  let row = $("<tr>").data('rscCd',datas.rscCd);
	
	  // td 생성
	  let checktd = $("<td>");
	  checktd.append($('<input>', {type: 'checkbox', name : 'RowCheck', onclick : "RowChk(this)" ,value : datas.rscCd}));
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
	
	// 삭제 버튼을 눌렀을때 실행하는 함수
	$('#minusBtn').on('click', function(){
		let chkObj = document.getElementsByName("RowCheck"); // name 속성이 RowCheck인것을 모두 가져옴
		  for (let i = 0; i < chkObj.length; i++) {
		    if (chkObj[i].checked == true) {
		    	for(let j = 0 ; j < material.length; j++){
		    		if(material[j].rscCd == chkObj[i].value){ // 자재코드가 같다면
		    			material.splice(j, 1); // 발주한 자재목록 제거
		    		}
		    	}
		    }
		}
	  let tbody = $("#order"); // tbody 선택
      tbody.empty();
      for(let i = 0 ; i < material.length; i++){
          tbody.append(makeTr(material[i]));
        }
	});
	
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
	          material.splice(j, 1); // 발주한 자재목록 제거
	        }
	      }
	    }
	  }
	
	  /* console.log(rscCds); // 자재코드
	  console.log(orderCode); // 발주번호
	  console.log(orderCount); // 발주수량
	  console.log(requestDates); // 납기요청일
	  console.log(vendCd); // 거래처코드 */
	
	  let data = {
	    rscCd : rscCds, // 자재코드
	    ordrCd : orderCode, // 발주번호
	    ordrCnt2 : orderCount, // 발주수량
	    paprdCmndDt2 : requestDates, // 납기요청일
	    vendCd : vendCd // 거래처코드
	  }
	
	  $.ajax({
	      url: 'materialOrderInsert',
	      type: 'POST', 
	      data: data, // 쿼리스트링
	      success: function (result) {
	        if(result > 0){ // 반환값이 1 이상이라면 실행
        	  Swal.fire({
                   icon: 'success',
                   title: '자재 발주 신청이 완료되었습니다.',
                   text: '발주 번호 : ' + OrderCode + ' 신청 완료되었습니다.',
               });
        	  
	          //console.log(typeof(result));
	          console.log("성공");
	          
	          let tbody = $("#order"); // tbody 선택
	          
	          tbody.empty();
	          
	          let ordr = OrderCode.substring(0,4); // ORDR
      		  let ordrNum = parseInt(OrderCode.substring(4)) + 1; // 숫자 4자리
      		  
	          for(let i = 0 ; i < material.length; i++){
        	  
	            /* console.log(OrderCode);
	            console.log(ordr);
	            console.log(ordrNum); */
	            
	            material[i].OrderCode = ordr + ordrNum;
	            tbody.append(makeTr(material[i]));
	          }
      		  
	          OrderCode = ordr + ordrNum; // 다음에 오는 발주번호
	          allCheck.checked = false;
	          
	        }else{
	          console.log("INSERT 실패");
	        }
	      },
	      error: function (reject) {
	        console.log(reject);
	      }
	    })
	});
	
	// 전체 선택박스
    function allChk(obj) {
      let chkObj = document.getElementsByName("RowCheck"); // name 속성이 RowCheck인것을 모두 가져옴
      let rowCnt = chkObj.length - 1; // 가져온 노드의 갯수를 -1해줌
      let check = obj.checked; // 전체선택박스가 체크상태(true)인지 체크가 안되었는지(false) 반환
      if (check) { // 체크가 되었다면
        for (let i = 0; i <= rowCnt; i++) {
          if (chkObj[i].type == "checkbox")
            chkObj[i].checked = true;
        }
      } else { // 체크가 안되었다면
        for (let i = 0; i <= rowCnt; i++) {
          if (chkObj[i].type == "checkbox") {
            chkObj[i].checked = false;
          }
        }
      }
    }
    // 체크박스 개별 선택후 => 모두 선택되면 => 전체선택 버튼 활성화
    function RowChk(result) {
      let chkObj = document.getElementsByName("RowCheck"); // name 속성이 RowCheck인것을 모두 가져옴
      let rowCnt = chkObj.length;
      let count = 0;
      for (let i = 0; i < rowCnt; i++) {
        if (chkObj[i].checked == true) {
          count = count + 1;
        }
      }
      if (rowCnt == count) {
        allCheck.checked = true;
      } else {
        allCheck.checked = false;
      }
    }
</script>
