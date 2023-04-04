<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page session="false" %>

            <link href="${pageContext.request.contextPath}/resources/css/sales/outbound.css" rel="stylesheet"
                type="text/css">
            <!-- fontawesome 사용! -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- 이 태그 내를 바꾸기 -->
                <!-- Page Heading -->

                <h1>영업관리</h1>

                <!-- nav-bar -->
                <div>
                    <i class="fa fa-home" aria-hidden="true"></i> 영업 관리 > 제품 출고 등록
                </div>


                <!-- main contents -->
                <div id="main-contents">
                    <!-- 진행중 주문서 현황 (왼쪽) -->
                    <div id="order">
                        <contents-header>
                            <i class="fas fa-chart-bar"></i>
                            진행중 주문서 현황
                        </contents-header>

                        <contents-body>
                            <!-- 조회 시 나타나는 테이블 -->
                            <div id="list-body" class="table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>주문번호</th>
                                            <th>거래처</th>
                                            <th>제품코드</th>
                                            <th>제품명</th>
                                            <th>주문수량</th>
                                        </tr>
                                    </thead>

                                    <!-- ↓↓↓여기에 조회된 결과 출력 -->
                                    <tbody id="list"></tbody>
                                </table>
                            </div>
                        </contents-body>
                    </div>

                    <!-- 출고 등록 현황 (오른쪽) -->
                    <div id="outbound">
                        <contents-header>
                            <i class="fa-solid fa-chart-pie"></i>
                            출고 등록 현황
                        </contents-header>

                        <contents-body>
                            <!-- 조회 시 나타나는 테이블 -->
                            <div id="list-body" class="table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>제품코드</th>
                                            <th>완제품LOT번호</th>
                                            <th>출고일자</th>
                                            <th>출고수량</th>
                                        </tr>
                                    </thead>

                                    <!-- ↓↓↓여기에 조회된 결과 출력 -->
                                    <tbody id="list"></tbody>
                                </table>
                            </div>
                        </contents-body>
                    </div>
                </div>
            </div>