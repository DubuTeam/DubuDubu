<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/prodcss/prcs.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>	
<!-- Begin Page Content -->
<!-- 헤더부분 -->
<!-- Begin Page Content -->
<div class="container-fluid">
<div class="container-fluid px-4">
	<h1 class="mt-4">공정관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i
				class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 공정관리</li>
	</ol>
</div>
<!-- 헤더부분 -->
<div id="container">
	<section>
		<div class="col">
			<div class="card mb-4">

				<div class="card-body">
					<form>
						<div class="mb-3">
							<label for="name">공정구분</label> <select id="prcs"
								class="dataTable-selector">
								<option selected value=''>선택</option>
								<c:forEach items="${selectPrcList }" var="prc">
								<option value="${prc.prcsDiv }">${prc.prcsDiv }</option>
								</c:forEach>
							</select>
							<button id="sBtn" class="btn btn-primary" form="">
								<i class="fas fa-search"></i> 검색
							</button>
						</div>
						<!-- <div class="linelist"> -->
						<!-- </div> -->

					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="card mb-4">
		<div class="card-body">
			<div class="linelist">
				<button id="addBtn" class="btn btn-primary" form="" onclick="appendl()">
					<i class="fas fa-add"></i> 추가
				</button>
				<button id="deleteBtn" class="btn btn-primary" form="" onclick="minusl()">
					<i class="fas fa-minus"></i> 삭제
				</button>
				<button id="saveBtn" class="btn btn-primary" form="" >
					<i class="fas fa-save"></i> 저장
				</button>
			</div>
			<br> <br> <br>
							<div id='prcss'></div>
			<div id='grid'></div>
		</div>
	</div>
</div>
<br>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
var grid1 = tui.Grid;
var sBtn = document.getElementById("sBtn");
var prcsDiv1 = document.getElementById("prcs");
var str = '';
var checkLen = '';

function search() {
	prcsDiv = prcsDiv1.options[prcsDiv1.selectedIndex].value;
	 
	$.ajax({
        url: "prcs",
        method: "post",
        data: { prcsDiv : prcsDiv },
        success: function(data) {
           grid.resetData(data);  //그리드 적용
        },
        error: function (reject) {
          console.log(reject);
        },
    });
} 
		//그리드 선언
        var grid = new tui.Grid({
             el: document.getElementById('prcss'),
             rowHeaders: ['checkbox'],
             columns: [

                 {
                     header: '공정구분코드',
                     name: 'prcsDiv'
                     
                 },
                 {
                     header: '공정코드',
                     name: 'prcsCd',
                     editor: 'text'
                 },
                 {
                     header: '공정명',
                     name: 'prcsNm',
                     editor: 'text'
                 },
                 {
                     header: '공정설명',
                     name: 'prcsCtnt',
                     editor: 'text'
                 }
                 
             ]

         });
		
  // 체크되것만 찾기
    grid.on('check', (ev) => {
 	      checkLen = grid.getCheckedRows().length;
	  });
   grid.on('allCheck', (ev) => {
	      checkLen = grid.getCheckedRows().length;
	  });   
   grid.on('unCheck', (ev) => {
	      checkLen = grid.getCheckedRows().length;
	  }); 
	
    
    sBtn.addEventListener("click", search);
    // 행추가
    function appendl(){
    	grid.appendRow(prcss,{
    		at : grid.getRowCount(),
    		focus : true
    		});
    		grid.enable()
    }
    // 삭제
      function minusl(){
    	var datas = '';
    	
 		// 체크한 행만 가져오기
    	 for (let i = 0; i < checkLen; i++) {
    	        str += grid.getCheckedRows()[i].prcsCd + ",";
    	      }
    	 console.log(str);
      
      	 $.ajax({
    		url:'deletePrcs',
    		data:{prcsCd : str},
    		type:'POST',
    		success:function(data){
    			console.log('성공')
    			grid.removeRow(str);
    		},error: function (reject) {
    	        console.log(reject);
    	}
      	 })
      }   
    	
    
</script>