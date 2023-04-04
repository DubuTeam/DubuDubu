<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="false" %>

      <link href="${pageContext.request.contextPath}/resources/css/sales/order.css" rel="stylesheet" type="text/css">
      <!-- fontawesome 사용! -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

      <!-- Begin Page Content -->
      <div class="container-fluid">
        <!-- 이 태그 내를 바꾸기 -->
        <!-- Page Heading -->

        <h1>주문서관리</h1>

        <!-- nav-bar -->
        <div>
          <i class="fa fa-home" aria-hidden="true"></i>
          영업 관리 > 주문서 관리
        </div>


        <form action="#">
          <div id="submitResetBtn">
            <input type="submit" value="조회">
            <input type="reset" value="초기화">
          </div><br>
          
          <ul>
            <li>
              <label for="customer_name">거래처명</label>
              <input type="text" id="customer_name" name="customer_name">
              <button class="search_customer"><i class="fa-solid fa-magnifying-glass"></i></button>
            </li>

            <li>
              <label for="product_name">제품명</label>
              <input type="text" id="product_name" name="product_name">
              <button class="search_product"><i class="fa-solid fa-magnifying-glass"></i></button>
            </li>

            <li>
              <label for="from_date">주문일자</label>
              <input type="date" id="from_date" name="from_date" size="3"> -
              <input type="date" id="to_date" name="to_date" size="3">
            </li>
          </ul>
        </form>


        <!-- 이제부터는 바디 아래 부분 -->
        <div id="btnSet">
          <button class="add_order"><i class="fa-solid fa-plus"></i> 추가</button>
          <button class="save_order"><i class="fa-solid fa-floppy-disk"></i> 저장</button>
          <button class="delete_order"><i class="fa-solid fa-minus"></i> 삭제</button>
        </div>

        <!-- 조회 시 나타나는 테이블 -->
        <div id="list-body" class="table">
          <table>
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>주문번호</th>
                <th>제품코드</th>
                <th>거래처코드</th>
                <th>거래처</th>
                <th>주문일자</th>
                <th>진행상황</th>
                <th>납기일자</th>
                <th>제품명</th>
                <th>주문수량</th>
              </tr>
            </thead>

            <!-- ↓↓↓여기에 조회된 결과 출력 -->
            <tbody id="list"></tbody>
          </table>
        </div>
      </div>
      <!-- End of Main Content -->