<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/prodcss/progMng.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
 <!-- 헤더부분 -->
   <div class="container-fluid px-4">
      <h1 class="mt-4">생산관리</h1>
       <ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 생산관리</li>
		<li class="breadcrumb-item active">> 생산관리</li>
	  </ol>
   </div>

<div id="container">   
	<div class="rbtn">
	   <button data-bs-toggle="modal"  class="btn btn-primary"  id="modalBtn" data-bs-target="#exampleModal"
	                    ><i class="fas fa-search"></i> 지시조회</button>
	   <a href="prcsReport"><button id="rbtn" name="rbtn"  class="btn btn-primary"  form=""><i class="fa-solid fa-file-pdf"></i> 공정이동표</button></a>
	</div>
   <br>
   <br>
   <br>
      <div class="card mb-4">
			<div class="card-body">
   <div id="grid">진행생산지시</div>
   </div>
   </div>
   <br>
      <div class="card mb-4">
			<div class="card-body">
   <div class="d-flex flex-row justify-content-between">

   	
   	   <div id="grid2"  style="width: 1200px;">공정목록</div>	
	   <div id="grid3" style="width: 400px;">
	   <br>
	   	<div class="linelist" >
	       <button id="startBtn"  class="btn btn-primary"  form=""><i class="fas fa-play"></i> 시작</button><br><br>
	       <button id="stopBtn" class="btn btn-primary"  form=""><i class="fas fa-exclamation-triangle"></i> 긴급중지</button><br><br>
	       <button id="restartBtn" class="btn btn-primary"  form=""><i class="fas fa-refresh"></i> 재시작</button>
	     </div>
	   </div>

	</div>	
	</div>
	</div>  
	<div id="dialog" title=""></div> 
	<!-- Modal -->

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">생산지시조회</h5>
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

</div>