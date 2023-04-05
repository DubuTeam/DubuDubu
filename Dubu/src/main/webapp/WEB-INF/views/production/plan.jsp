<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/prodcss/plan.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Begin Page Content -->
 <!-- 헤더부분 -->
 <!-- 생산계획 -->

        <div class="container-fluid px-4">
            <h1 class="mt-4">생산계획</h1>
            <ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 생산관리</li>
				<li class="breadcrumb-item active">> 생산계획</li>
	  		</ol>
        </div>
        <!-- 헤더부분 -->
        <div id="container">
         <div class="card mb-4">
			<div class="card-body">
            <div id="pDate">
                <!--<div class="tui-datepicker-input tui-datetime-input tui-has-focus">-->
	                <label>생산계획일자</label>
                    <input type="date" id="tui-date-picker-target" name="tui-date-picker-target" class="form-control" style="width: 150px">
                    <!--<span class="tui-ico-date"></span>-->
                	<!--<div id="tui-date-picker-container1" style="margin-top: -1px;"></div>-->
                <!--</div>-->
            </div>
            <div class="linelist">
            	<button id="clearBtn" class="btn btn-primary" form=""><i class="fas fa-file"></i> 초기화</button>
                <button data-bs-toggle="modal" class="btn btn-primary" id="modalBtn" data-bs-target="#exampleModal"
                  ><i class="fas fa-search"></i> 주문서</button>
                <button class="btn btn-primary" id="regiBtn"><i class="fas fa-file"></i> 새계획</button>
                <button class="btn btn-primary"id="osBtn"><i class="fas fa-save"></i> 저장</button>
            </div>
			</div>
			</div>
			<div class="card mb-4">
			<div class="card-body">
            <div id="grid"></div>
            </div>
            </div>
            <br>
            <div class="card mb-4">
			<div class="card-body">
            <div class="d-flex flex-row justify-content-between">
                <div id="grid2" style="width: 1000px;">제품</div>
                <div id="grid3" style="width: 500px;">제품공정확인</div>
            </div>
            </div>
            </div>
            <br>
            <div class="card mb-4">
			<div class="card-body">
            <div class="d-flex flex-row justify-content-between">
                <div id="grid4" style="width: 1000px;">사용가능자재</div>
                <div id="grid5" style="width: 500px;">자재확인</div>
            </div>
            </div>
            </div>


            <div id="tui-date-picker-container" style="margin-top: -1px;"></div>
            <br>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">주문서 조회</h5>
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
 <!-- End of Main Content -->
