<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="false" %>

<link href="${pageContext.request.contextPath}/resources/css/eqcss/eqIpopr.css" rel="stylesheet"
    type="text/css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- JS 연결 -->
<script type="text/javascript"
    src="${pageContext.request.contextPath}/resources/js/eqcss/eqIpopr.js"></script>


<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="container-fluid px-4">
        <h1 class="mt-4">비가동관리</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item">> 설비관리</li>
            <li class="breadcrumb-item active">> 비가동관리</li>
        </ol>

        <!-- 헤더부분 -->
        <div class="card mr-12 ">


            <!-- ---------------------------------------------------- -->
            <div class="card-body">
                <div class="linelist" style="float: right;">
                    <button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 저장</button>
                    <!-- Button trigger modal (4.6버젼) -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-trash"></i> 삭제</button>
                    <button class="btn btn-primary" id="initBtn"><i class="fas fa-file"></i> 초기화</button>
                </div>

                <br> <br>

                <form id="dataForm" name="dataForm" action="#" method="post">
                    <table class="table" style="vertical-align: middle;">
                        <colgroup>
                            <col style="width: 150px">
                            <col>
                            <col style="width: 150px">
                            <col>
                            <col style="width: 150px">
                            <col>
                        </colgroup>

                        <tbody id="upperTbody">
                            <tr>
                                <th>설비명 *</th>
                                <td>
                                    <select name="eqmNm" aria-label="Default select example"
                                        style="width: 250px" id="eqmNm" 
                                        class="dataTable-selector">
                                        <option selected value="">==등록시필수선택==</option>
                                        <!-- 이 부분 수정하기               <┐>    -->
                                        <c:forEach var="list" items="${eqLineList}">
                                            <option value="${list.eqmCd}">${list.eqmNm}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </td>

                                <th>설비코드 *</th>
                                <td>
                                    <input class="form-control" type="text" id="eqmCd"
                                        name="eqmCd" style="width: 250px" readonly />
                                </td>


                                <!-- 여기도 나한테 맞게 고치기 (완성하고 이거 hidden으로 바꾸기) -->
                                <th>비가동코드</th>
                                <td>
                                    <input class="form-control" type="text" id="noprCd"
                                        name="noprCd" style="width: 250px" readonly value="${getNoprCode }" />
                                </td>
                            </tr>


                            <tr>
                                <th>시작날짜 *</th>
                                <td>
                                    <input class="form-control" type="date" id="frDt"
                                        name="frDt" style="width: 250px" />
                                </td>

                                <th>종료날짜 *</th>
                                <td>
                                    <input class="form-control" type="date" id="toDt"
                                        name="toDt" style="width: 250px" />
                                </td>

                                <th>가동여부 *</th>
                                <td id="eqmYNSet">
                                    <input type="radio" name="eqmYN" id="ynY" value="Y"> 가동&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="eqmYN" id="ynN" value="N"> 미가동
                                </td>
                            </tr>

                            <tr>
                                <th>작업내역</th>
                                <td>
                                    <textarea name="opertCtnt" id="opertCtnt"
                                        class="form-control"
                                        style="width: 350px; height: 100px"></textarea>
                                </td>

                                <th>담당자</th>
                                <td>
                                    <input class="form-control" name="eqmPsch"
                                        id="eqmPsch" style="width: 250px">
                                </td>

                                <!-- 얜 뭐임? -->
                                <!-- <td>
                                    <input type="hidden" id="chckCd" name="chckCd">
                                </td> -->
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <!-- -------------------------------------------------------------- -->

            <!-- 조회 시 나타나는 테이블 -->
            <div id="list-body" class="table">
                <table>
                    <thead>
                        <tr>
                            <th>비가동코드</th>
                            <th>설비코드</th>
                            <th>설비명</th>
                            <th>시작날짜</th>
                            <th>종료날짜</th>
                            <th>가동여부</th>
                        </tr>
                    </thead>

                    <!-- ↓↓↓여기에 조회된 결과 출력 -->
                    <tbody id="list">
                        <c:forEach items="${eqIpoprList }" var="eqIpopr">
                            <tr class="eachRow">
                                <td>${eqIpopr.noprCd }</td>
                                <td>${eqIpopr.eqmCd }</td>
                                <td>${eqIpopr.eqmNm }</td>
                                <td><fmt:formatDate value="${eqIpopr.frDt }" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${eqIpopr.toDt }" pattern="yyyy-MM-dd" /></td>
                                <td>${eqIpopr.eqmYn }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <br>


        <!-- 설비 비가동 등록 Modal -->
        <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">설비 비가동 등록</h5>
                        <br> <br>

                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <br>

                    <div class="modal-body">
                        <div class="linelist" style="float: right;">
                            <button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 저장
                            </button>
                            <br> <br>
                        </div>

                        <div>
                            <form id="dataForm" name="dataForm" action="#" method="post">
                                <table class="table" style="vertical-align: middle;">
                                    <colgroup>
                                        <col style="width: 150px">
                                        <col>
                                        <col style="width: 150px">
                                        <col>
                                        <col style="width: 150px">
                                        <col>
                                    </colgroup>

                                    <tbody>
                                        <tr>
                                            <th>설비명 *</th>
                                            <td>
                                                <select class="form-control" id="frmEqmCd"
                                                    name="frmEqmCd" style="width: 180px">
                                                    <option selected value="">==선택==</option>
                                                    <option th:each="value : ${eqmList}"
                                                        th:value="${value.eqmCd}"
                                                        th:text="${value.eqmNm}">
                                                </select>
                                        </tr>


                                        <tr>
                                            <th>담당자 *</th>
                                            <td>
                                                <input class="form-control" type="text" id="frmPsch"
                                                    name="frmPsch" style="width: 180px"></input>
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>가동여부<strong class="blue">*</strong></th>
                                            <td><input type="radio" name="frmUseYN"
                                                    value="Y">가동&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="frmUseYN" value="N"> 미가동
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>시작일 *</th>
                                            <td>
                                                <input class="form-control" type="date" id="frDt"
                                                    name="frDt" style="width: 150px" />
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>종료일 *</th>
                                            <td>
                                                <input class="form-control" type="date" id="toDt"
                                                    name="toDt" style="width: 150px" />
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>작업내용 *</th>
                                            <td>
                                                <input type="text" id="opertCtnt" name="opertCtnt"
                                                    class="form-control"
                                                    style="width: 500px; height: 100px" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 설비 비가동 eqmSelect Modal -->
        <div class="modal fade" id="GridModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">비가동 내역 세부조회</h5>
                        <br><br>

                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <br>

                    <div class="modal-body">
                        <div class="linelist" style="float: right;">
                            <button class="btn btn-primary" id="MsaveBtn">
                                <i class="fas fa-save"></i> 저장
                            </button>
                            <br><br>
                        </div>

                        <div>
                            <form id="gridDataForm" name="gridDataForm" action="#" method="post">
                                <table class="table" style="vertical-align: middle;">
                                    <colgroup>
                                        <col style="width: 150px">
                                        <col>
                                        <col style="width: 150px">
                                        <col>
                                        <col style="width: 150px">
                                        <col>
                                    </colgroup>

                                    <tbody>
                                        <input type="hidden" id="GFrmNoprCd" name="noprCd" />
                                        <tr>
                                            <th>설비코드</th>
                                            <td>
                                                <input class="form-control" type="text" id="GFrmEqmNm"
                                                    name="frmEqmNm" style="width: 180px"
                                                    readonly></input>
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>설비명</th>
                                            <td>
                                                <input class="form-control" type="text" id="GFrmEqmCd"
                                                    name="frmEqmCd" style="width: 180px"
                                                    readonly></input>
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>담당자 *</th>
                                            <td>
                                                <input class="form-control" type="text" id="GFrmPsch"
                                                    name="frmPsch" style="width: 180px"></input>
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>시작일 *</th>
                                            <td>
                                                <input class="form-control" type="date" id="GFrDt"
                                                    name="frDt" style="width: 150px" />
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>종료일 *</th>
                                            <td>
                                                <input class="form-control" type="date" id="GToDt"
                                                    name="toDt" style="width: 150px" />
                                            </td>
                                        </tr>


                                        <tr>
                                            <th>작업내용 *</th>
                                            <td>
                                                <input type="text" id="GOpertCtnt" name="opertCtnt"
                                                    class="form-control"
                                                    style="width: 500px; height: 100px" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->