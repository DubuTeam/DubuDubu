<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">제품검사관리</h1>
	<p>품질관리</p>
	<p>
		제품검사 등록 <a href="#"> 제품검사 조회</a>
	<p>
	<div id="btn-bom">



		<div style="float: right;">
			<button>새자료</button>
			<button>저장</button>

		</div>

	</div>
	<br>

	<form class="p.Process1">
  <div id="list-body">
    <table id="datatablesSimple" class="table">
      <thead>
        <tr>
          <th style="display: flex; align-items: center;">
            <div style="display: flex; align-items: center;">
              <span style="margin-right: 10px;">주문번호*</span>
              <div style="display: flex; align-items: center;">
                <input type="text" placeholder="주문서를 조회해 주세요" disabled>
                <button class="btn btn-primary" type="button" style="padding: 4px 10px;">
                  <i class="fa fa-search"></i>
                </button>
              </div>
            </div>
          </th>
          <th>
            <div style="display: flex; align-items: center;">
              <span style="margin-right: 10px;">완제품코드*</span>
              <input type="text" disabled>
            </div>
          </th>
          <th>
            <div style="display: flex; align-items: center;">
              <span style="margin-right: 10px;">완제품명</span>
              <input type="text" disabled>
            </div>
          </th>
        </tr>
      </thead>
      <thead>
        <tr>
          <th>
            <div style="display: flex; align-items: center;">
              <span style="margin-right: 10px;">완제품LOT*</span>
              <input type="text" disabled>
            </div>
          </th>
          <th>
            <div style="display: flex; align-items: center;">
              <span style="margin-right: 10px;">검사수량</span>
              <input type="text" disabled>
            </div>
          </th>
        </tr>
      </thead>
    </table>
  </div>
</form>


	


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
	function exam() {
		document.getElementById("ex").style.display = "none";
	}
</script>

