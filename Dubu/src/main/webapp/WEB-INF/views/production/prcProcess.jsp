<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- fontawesome 사용! -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
  <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-4 text-gray-800">제품공정흐름관리</h1>
      <div>
      	<i class="fa fa-home" aria-hidden="true"></i> 기준정보관리 > 제품공정흐름관리
      </div>
      <div id="btn-bom">
      
      		<label for="search">제품명</label>
            <input type="text">
            <button>검색</button>
	
	  <div style="float: right;">	
            <button>새자료</button>
            <button>저장</button>
            <button>삭제</button>
       </div>
        </div><br>
        
       <form class="p_Process1">
        <div id="list-body">
          <table id="datatablesSimple" class="table">
            <thead >
              <tr>
                <th>No.</th>
                <th>완제품코드</th>
                <th>제품명</th>
              </tr>
            </thead>

            <!-- ↓↓↓여기에 조회된 결과 출력 -->
            <tbody id="list"></tbody>
          </table>
        </div>
       </form>
       
       
	<form class="p_Process2" style="float: right;">

	<div class="main">
 	 <input type="radio" id="tab-1" name="show" checked/>
  	 <input type="radio" id="tab-2" name="show" />

  	<div class="tab">
    	<label for="tab-1">제품정보</label>
    	<label for="tab-2">공정흐름</label>

  </div>
  <div class="content">
    <div class="content-dis">
       <label for="search">완제품 코드</label>
            <input type="text">


            <label for="search">제품명</label>
            <input type="text">
            <label for="search">보관 창고</label>
            <input type="text"> <br>

            <label for="search">규격</label>
            <input type="text">


            <label for="search">단위</label>
            <input type="text">

            <label for="search">안전재고</label>
            <input type="text">
    </div>
    <div class="content-dis">
       <div id="list-body">
          <table id="datatablesSimple" class="table">
            <thead >
              <tr>
                <th>공정순서</th>
                <th>공정코드</th>
                <th>공정명</th>
                <th>공정내용</th>
              </tr>
            </thead>

            <!-- ↓↓↓여기에 조회된 결과 출력 -->
            <tbody id="list">
            </tbody>
          </table>
        </div>
    </div>
    </div>
	</form>       
        	
    </div>
  </div>
 <!-- /.container-fluid -->
  
 </div>
 <!-- End of Main Content -->
 <script>

</script>

