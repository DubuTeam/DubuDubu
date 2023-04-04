<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>


#container {
   width : 98%;
   margin : 0 auto;
}

.col {
   width: 700px
}

.linelist {
   float: right;
   margin: 0 20px 20px 0;
   
}



</style>
<!-- Begin Page Content -->
 <!-- 헤더부분 -->
 <!-- 생산지시 -->
   <div class="container-fluid px-4">
      <h1 class="mt-4">생산지시</h1>
      <ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 생산지시</li>
	  </ol>
   </div>
   <!-- 헤더부분 -->
   <div id="container">
 	   <div class="card mb-4">
			<div class="card-body">
     <div class="linelist">
       <button id="clearBtn" class="btn btn-primary" form=""><i class="fas fa-file"></i> 초기화</button> 
       <button data-bs-toggle="modal" class="btn btn-primary" id="modalBtn" data-bs-target="#exampleModal"
                    ><i class="fas fa-search"></i> 계획조회</button>
       <button class="btn btn-primary" id="regiBtn"><i class="fas fa-save"></i> 저장</button>
     </div>
     
	 <div id="grid"></div>
	 </div>
	 </div>
	 <br>
	    <div class="card mb-4">
			<div class="card-body">
	  <div class="d-flex flex-row justify-content-between">
	     <div id="grid2" style="width: 1000px;">공정자재</div>
	     <div id="grid3" style="width: 500px;">자재지시</div>
	  </div>
	  </div>
	  </div>
	  <div id="#tui-date-picker-container1"></div>
	  <div id="dialog" title="생산계획조회"></div>
   <br>
 </div>	
    <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">생산계획조회</h5>
                        <br> <br>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div><br>
                    <div id="modGrid" class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" id="confirmBtn" class="btn btn-primary"
                            data-bs-dismiss="modal">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
 <!-- /.container-fluid -->
  

 <!-- End of Main Content -->
