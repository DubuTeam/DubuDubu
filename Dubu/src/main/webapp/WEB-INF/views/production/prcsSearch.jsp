<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container-fluid px-4">
      <h1 class="mt-4">공정실적조회</h1>
      <ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 공정실적조회</li>
	  </ol>
   </div>
   <style>

#container {
   width : 98%;
   margin : 0 auto;
}

.col {
   width: 100%
}

.linelist {
   float: right;
   margin-top: 0px;
}

</style>
   <!-- 헤더부분 -->
  <div id="container">
     <section>
           <div class="card mb-4">
            <div class="col">
                  <div class="card-body">
                  <div class="linelist">
                     <button id="clearBtn" class="btn btn-primary" form=""><i class="fas fa-file"></i> 초기화</button>
                     <button class="btn btn-primary" id="sBtn" form=""><i class="fas fa-search"></i> 검색</button>
                  </div>
                   <br>
                   <br>   
                     <form name="prcsSearchform" id="prcsSearchform">
                     	<table class="table" style="vertical-align : middle;">
					   	<colgroup>
					   		<col style="width: 150px;">
                     		<col>
	                     	<col style="width: 150px;">
	                     	<col>
	                     	<col style="width: 150px;">
	                     	<col>
					   	</colgroup>
					   	<tbody>
					   		<tr>
					   		<th>생산일자</th>
                           		<td>	
                           			<input type="date" class="form-control" id="wkFrDt" name="wkFrDt" style="width: 150px"> - <input type="date" id="wkFrDt2" name="wkFrDt2" class="form-control" style="width: 150px">
                       			</td>
                   			<th></th>
					   			<td></td>
					   			<th></th>
					   			<td></td>
					   		</tr>
					   		<tr>	
					   			<th>공정구분</th>
					   			<td>
		                           	<select id="prcsCd" class="dataTable-selector">
		               					<option selected value="">--선택--</option>
		               					<option th:each="code : ${ccds['PRC']}" th:value="${code.ccdDtlNm}" th:text="${code.ccdDtl}"></option>
		               				</select>
	               				</td>
	               				<th></th>
					   			<td></td>
					   			<th></th>
					   			<td></td>
                       		</tr>
                       		<tr>
                       			<th>불량코드</th>
                       				<td>
			                           <select id="inferCd" class="dataTable-selector">
			               					<option selected value="">--선택--</option>
			               					<option th:each="code : ${ccds['PNF']}" th:value="${code.ccdDtlNm}" th:text="${code.ccdDtl}"></option>
			               				</select>
		               				</td>
	     							<th></th>
						   			<td></td>
						   			<th></th>
						   			<td></td>
					   			</tr>
			   			</tbody>
			   			</table>
                     </form>
                  </div>
               </div>
            </div>
         </section>
          <div class="card mb-4">
			<div class="card-body">
  				<div id='grid'></div>
			</div>
		   </div>		
   </div> 