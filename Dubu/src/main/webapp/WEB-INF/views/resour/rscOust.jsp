<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <style>
        tr {
            height: 50px;
        }

        .layout {
            width: 1628px;
            height: 700px;

            display: grid;
            grid:
                    "header header header" 85px
                    "body body rightside" auto
                    / auto auto 350px;
            gap: 8px;
        }

        .header {
            grid-area: header;
        }

        .rightside {
            grid-area: rightside;
        }

        .body {
            grid-area: body;
        }
    </style>
<div class="container-fluid px-4">
        <h1 class="mt-4">원자재출고관리</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item">> 자재관리</li>
            <li class="breadcrumb-item active">> 원자재출고관리</li>
        </ol>


        <section class="layout">
            <div class="header">
                <div class="card">
                    <div class="card-body">
                        <div style="display: inline-block; margin: auto 0; float: right">
                            <button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 저장</button>
                            <button class="btn btn-primary" id="reloadBtn"><i class="fas fa-file"></i> 새자료</button>
                        </div>
                        <form id="setOustFrm">
                            <table style="vertical-align : middle; text-align: center">
                                <colgroup>
                                    <col style="width: 120px">
                                    <col style="width: 30px">
                                    <col style="width: 80px">
                                    <col style="width: 180px">
                                    <col style="width: 20px">
                                    <col style="width: 80px">
                                    <col style="width: 180px">
                                    <col style="width: 20px">
                                    <col style="width: 80px">
                                    <col style="width: 180px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <b>출고등록</b>
                                    </th>
                                    <td></td>
                                    <th>
                                        <b>출고일자</b>
                                    </th>
                                    <td>
                                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus"
                                             style="height: 40px; border-radius: 5px;">
                                            <input type="text" id="oustDt" name="oustDt" aria-label="Date-Time"
                                                   class="form-control">
                                            <span class="tui-ico-date"></span>
                                        </div>
                                        <div id="wrapper" style="margin-top: -1px;"></div>
                                    </td>
                                    <td></td>
                                    <th>
                                        <label for="note"><b>상세정보</b></label>
                                    </th>
                                    <td>
                                        <input type="text" name='note' id="note" class="form-control"
                                               style="width: 168px;">
                                    </td>
                                    <td></td>
                                    <th>
                                        <b>출고유형</b>
                                    </th>
                                    <td>
                                        <div id="sortBtn">
                                            <label><input type="radio" class="form-check-input" name="oustTyp"
                                                          value="부서"
                                                          checked> 부서</label> &nbsp;
                                            <label><input type="radio" class="form-check-input" name="oustTyp"
                                                          value="협력사">
                                                협력업체</label>
                                        </div>
                                    </td>
                                    <th>
                                </tr>
                                </tbody>
                            </table>
                            <input type="hidden" name="from" value="rsc">
                        </form>
                    </div>
                </div>
            </div>

            <div class="body">
                <div class="card">
                    <div class="card-body">
                        <div class="linelist" style="float: right;">
                            <button class="btn btn-primary" id="addRow" style="height: 30px"><i class="fas fa-plus"></i>
                                추가
                            </button>
                            <button class="btn btn-primary" id="delRow" style="height: 30px"><i
                                    class="fas fa-minus"></i> 삭제
                            </button>
                        </div>
                        <br><br>
                        <div id="grid"></div>
                    </div>
                </div>
            </div>

            <div class="rightside">
                <div class="card">
                    <div class="card-body">
                        <b>출고목록</b>
                        <br><br>
                        <div id="mdfy-grid"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- Modal for resource search -->
    <div class="modal fade" id="rscModal" tabindex="-1" aria-labelledby="rscModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">자재검색</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="rscSchForm">
                        <table>
                            <colgroup>
                                <col style="width: 400px;">
                                <col style="width: 10px">
                                <col style="width: 50px;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="rscNmInMod" name="rscNm" class="form-control"
                                           placeholder="자재명">
                                </td>
                                <td></td>
                                <td rowspan="2">
                                    <button id="rscSch" class="btn btn-primary" type="button" style="height: 90px;"><i
                                            class="fas fa-search"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" id="rscCdInMod" name="rscCd" class="form-control"
                                           placeholder="자재코드">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <br>
                    <div id="rsc-grid"></div>
                    <div style="float: right"><p>선택 : 더블클릭</p></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for lot search -->
    <div class="modal fade" id="lotModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <b class="modal-title">LOT선택</b>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="lot-grid"></div>
                    <div style="float: right"><p>선택 : 더블클릭</p></div>
                </div>
            </div>
        </div>
    </div>