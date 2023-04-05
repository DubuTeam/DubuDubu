<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/prodcss/indicaSearch.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Begin Page Content -->

 <div class="container-fluid px-4">
      <h1 class="mt-4">생산지시조회</h1>
      <ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 생산지시조회</li>
	  </ol>
   </div>
   <!-- 헤더부분 -->
   <div id="container">
     <section>
         <div class="card mb-4">
            <div class="col">
                  <div class="card-body">
	                <div class="linelist">
                        <button id="clearBtn" class="btn btn-primary" form=""><i class="fas fa-file"></i> 초기화</button>
                        <button type="button" class="btn btn-primary" id="sBtn"><i class="fas fa-search"></i> 조회</button>
                     </div>
	           		 <br>
                   	 <br>
                   	 <br>
                     <form name="indicaform" id="indicaform">
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
	                           <th>계획일자</th> 
	                           		<td> 
                           				<input type="date"  class="form-control" id="start-input" name="start-input" style="width: 150px"> - <input type="date" class="form-control" id="end-input" name="end-input" style="width: 150px">
                           			</td>
	                           <th></th>
					   			<td></td>
					   			<th></th>
					   			<td></td>
					   		</tr>
					   		<tr>	
                           		<th>지시상태</th>
                           		<td style="height : 55px">
		                            <input class="form-check-input" type="radio" name="status" value="전체"> 전체
		                            <input class="form-check-input" type="radio" name="status" value="지시"> 지시
		                            <input class="form-check-input" type="radio" name="status" value="미지시"> 미지시
                        		</td>
                        		<th></th>
					   			<td></td>
					   			<th></th>
					   			<td></td>
                       		</tr>
                       		<tr>
                       			<th>제품이름</th>
                       			<td>
                           			<input type="text" style="width: 150px" class="form-control" id="name" name="name">
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
           <div class="linelist">
	             	 	<button type="button" class="btn btn-primary" id="dBtn"><i class="fas fa-minus"></i> 취소</button>
	           		 </div>   
           <br><br><br>
   <div id='grid'></div>
   </div> 
   </div>
   </div>
 <!-- End of Main Content -->
