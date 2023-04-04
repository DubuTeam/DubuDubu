<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
  <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-4 text-gray-800">제품공정흐름관리</h1>
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
        
       <form class= p.Process1>
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
       
       
	<form class= p.Process2 style="float: right;">
	<button onclick="exam()">Try it</button>
		<div id="ex">
			This is my DIV element.
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

