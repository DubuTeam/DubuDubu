<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
  <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-4 text-gray-800">BOM관리</h1>
      <div id="btn-bom" style="float: right;">
            <button>초기화</button>
            <button>저장</button>
            <button>삭제</button>
        </div><br>
        	
     <br><form>

        <div >
        	<ul>
        	

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

            </ul>
        </div>
 


    </form>
    
 <!-- 조회 시 나타나는 테이블 -->
 <div id="btn-bom" style="float: right;">

            <button> + 추가</button>
            <button> - 삭제</button>
        </div><br>
        <div id="list-body">
          <table id="datatablesSimple" class="table">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>자재코드</th>
                <th>자재명</th>
                <th>사용량</th>
                <th>단위</th>
                <th>사용공정설명</th>
                <th>비고</th>
              </tr>
            </thead>

            <!-- ↓↓↓여기에 조회된 결과 출력 -->
            <tbody id="list"></tbody>
          </table>
        </div>


  </div>
 <!-- /.container-fluid -->
  
 </div>
 <!-- End of Main Content -->
 

