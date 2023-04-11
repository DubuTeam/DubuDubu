<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <head>
        <style>
            tr {
                height: 50px;
            }

            .inspBtn {
                border-width: 0.01em;
                border-radius: 5px;
                border-color: #4f5050;
                color: black;
                height: 25px;
            }

            .layout {
                width: 1628px;
                height: 750px;

                display: grid;
                grid:
                    "header header header" 85px "ordr ordr ordr" 85px "body body rightside" auto / auto auto 350px;
                gap: 8px;
            }

            .header {
                grid-area: header;
            }

            .ordr {
                grid-area: ordr;
            }

            .rightside {
                grid-area: rightside;
            }

            .body {
                grid-area: body;
            }

            .highlight {
                background-color: rgba(19, 78, 94, 0.2) !important;
            }
        </style>
        <link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
        <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
        <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
        <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/ag-grid-community@25.3.0/dist/styles/ag-grid.css">
        <link rel="stylesheet" href="https://unpkg.com/ag-grid-community@25.3.0/dist/styles/ag-theme-alpine.css">
        <script src="https://unpkg.com/ag-grid-community@25.3.0/dist/ag-grid-community.min.noStyle.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
            integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
            integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    </head>


    <!-- Begin Page Content -->
    <div class="container-fluid">

    </div>
    <!-- Page Heading -->
    <div class="container-fluid px-4">
        <h1 class="mt-4">자재입고검사</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item">> 자재관리</li>
            <li class="breadcrumb-item active">> 자재입고검사</li>
        </ol>

        <section class="layout">
            <div class="header">
                <div class="card" id="card-1">
                    <div class="card-body">
                        <div style="display: inline-block; margin: auto 0; float: right;">
                            <button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 저장
                            </button>
                            <button class="btn btn-primary" id="delDataBtn"><i class="fas fa-file"></i>
                                삭제
                            </button>
                            <button class="btn btn-primary" id="reloadBtn"><i class="fas fa-file"></i>
                                새자료
                            </button>
                        </div>
                        <table style="vertical-align : middle; text-align: center">
                            <colgroup>
                                <col style="width: 120px">
                                <col style="width: 30px">
                                <col style="width: 80px">
                                <col style="width: 180px">
                                <col style="width: 20px">
                                <col style="width: 80px">
                                <col style="width: 180px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <b>자재검사등록</b>
                                    </th>
                                    <td></td>
                                    <th>
                                        <b>검사일자</b>
                                    </th>
                                    <td>
                                        <div>
                                            
                                            <input type="date" id="inspDt" name="inspDt" class="form-control"
                                                style="width: 150px;">
                                        </div>
                                        <div id="wrapper" style="margin-top: -1px;"></div>
                                    </td>
                                    <td></td>
                                    <th>
                                        <b>검사자</b>
                                    </th>
                                    <td>
                                        <input type="text" id="inspTstr" class="form-control" style="width: 168px;">
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <div class="ordr">
                <div class="card">
                    <div class="card-body">
                        <form id="ordrListFrm">
                            <table style="vertical-align : middle; text-align: center">
                                <colgroup>
                                    <col style="width: 120px">
                                    <col style="width: 30px">
                                    <col style="width: 80px">
                                    <col style="width: 250px">
                                    <col style="width: 20px">
                                    <col style="width: 100px">
                                    <col style="width: 350px">
                                </colgroup>
                                <tr>
                                    <th>
                                        <b>발주자료 조회</b>
                                    </th>
                                    <td></td>
                                    <th>
                                        <label for="vendNm"><b>업체명</b></label>
                                    </th>
                                    <td style="display:flex;">
                                        <input id="vendNm" type="text" class="form-control" placeholder="검색버튼을 이용하세요"
                                            style="width: 200px;" required readonly>
                                        <input id="vendCd" type="hidden" name="vendCd">
                                        <button id="modalBtn" type="button" class="btn btn-primary"
                                        data-toggle="modal"
													data-target="#vendModal"><i
                                                class="fas fa-search"></i></button>
                                    </td>
                                    <td></td>
                                    <th>
                                        <b>납기예정일</b>
                                    </th>
                                    <td>
                                        <div style="display: flex;">
                                            <input type="date" id="startDt" name="startDt" class="form-control"
                                                style="width: 150px;"> <span style="padding: 5px;">-</span> <input
                                                type="date" id="endDt" name="endDt" class="form-control"
                                                style="width: 150px;">
                                        </div>
                                    </td>
                                    <th></th>
                                    <td>
                                        <input id="getOrdrList" type="button" class="btn btn-primary" value="가져오기" />
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <div class="body" style="margin-top: 40px;">
                <div class="card">
                    <div class="card-body">
                        <div class="linelist" style="float: right">
                            <button class="btn btn-primary" id="addRow" style="height: 30px"><i class="fas fa-plus"></i>
                                추가</button>
                            <button class="btn btn-primary" id="delRow" style="height: 30px"><i
                                    class="fas fa-minus"></i> 삭제</button>
                        </div>
                        <br>
                        <br>
                        <div id="grid"></div>
                    </div>
                </div>

            </div>

            <div class="rightside" style="margin-top: 40px;">
                <div class="card">
                    <div class="card-body">
                        <b>검사목록</b>
                        <br><br>
                        <div id="mdfy-grid"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="modal fade" id="vendModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">업체검색</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  					<span aria-hidden="true">&times;</span>
					</button>
                </div>
                <div class="modal-body">
                    <form id="vendSchForm">
                        <table>
                            <colgroup>
                                <col style="width: 400px;">
                                <col style="width: 10px">
                                <col style="width: 50px;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="text" name="vendNm" class="form-control" placeholder="업체명">
                                    </td>
                                    <td></td>
                                    <td rowspan="2">
                                        <button id="vendSch" class="btn btn-primary" type="button"
                                            style="height: 90px;"><i class="fas fa-search"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="vendCd" class="form-control" placeholder="업체코드">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <br>
                    <div id="vend-grid"></div>
                    <div style="float: right">
                        <p>선택 : 더블클릭</p>
                    </div>
                </div>
            </div>
        </div>
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
                                        <button id="rscSch" class="btn btn-primary" type="button"
                                            style="height: 90px;"><i class="fas fa-search"></i></button>
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
                    <div style="float: right">
                        <p>선택 : 더블클릭</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--inspection detail modal-->
    <div class="modal fade" id="infModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <b class="modal-title">검사상세</b>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="inf-grid"></div>
                    <br>
                    <div style="float: right">
                        <input type="button" id="calInfCnt" value="입력" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        ///////////////////////////// !init ////////////////////////////////
        window.addEventListener('load', function () {
            getVendListInit();
            getRscListInit();
            getInfList();
            schRscInspHist();
        })

        let startDt = document.getElementById('startpicker-input');
        let endDt = document.getElementById('endpicker-input');
        let vendCd = document.getElementById('vendCd');
        let inspDt = document.getElementById('inspDt');
        let inspTstr = document.getElementById('inspTstr');
        let delDataBtn = document.getElementById('delDataBtn');
        let rscInspCd = '';

        let saveFlag = 0 // 0 : 저장, 1 : 수정저장
        ///////////////////////////// date picker ////////////////////////////////
        let initDate = new Date();

        let today = new Date()
        today = today.toISOString().split('T')[0];

        let rangepicker = tui.DatePicker.createRangePicker({
            startpicker: {
                date: initDate,
                input: '#startpicker-input',
                container: '#startpicker-container'
            },
            endpicker: {
                date: initDate,
                input: '#endpicker-input',
                container: '#endpicker-container'
            }
        });

        let datepicker = new tui.DatePicker('#wrapper', {
            date: initDate,
            input: {
                element: '#inspDt',
                format: 'yyyy-MM-dd'
            }
        });

        ///////////////////////////// main grid ////////////////////////////////
        let rModal;
        let rscModalState = 0;

        class customInput {
            constructor(props) {
                const el = document.createElement('input');
                let { rowKey } = props;
                this.rowKey = rowKey
                el.type = 'text';
                el.value = String(props.value);
                el.addEventListener('dblclick', function () {
                    rModal = new bootstrap.Modal(document.getElementById('rscModal'), {})
                    rModal.show('rscModal');
                    rscModal.dataset.rowKey = rowKey;
                    rscModalState = 1;
                })
                this.el = el;
            }

            getElement() {
                this.el.value = '';
                return this.el;
            }

            getValue() {
                if (rscModalState === 0) {
                    getRscSingle(this.el.value, this.rowKey)
                }
                return this.el.value;
            }

            mounted() {
                this.el.select();
            }
        }

        class inputPreIstCnt {
            constructor(props) {
                let el = document.createElement('input');
                let { rowKey } = props;
                this.rowKey = rowKey;
                el.type = 'text';
                el.value = String(props.value);
                this.el = el;
            }

            getElement() {
                let rscNm = grid.getValue(this.rowKey, 'rscNm')
                if (rscNm == null || rscNm === '') {
                    toastr.error('자재를 먼저 선택하세요.');
                } else {
                    this.el.value = '';
                    return this.el;
                }
            }

            getValue() {
                let val = this.el.value.replace(/[^0-9]/g, '')
                grid.setValue(this.rowKey, 'inspCnt', val);
                grid.setValue(this.rowKey, 'inspPassCnt', val);
                grid.setValue(this.rowKey, 'inspFailCnt', '');
                return val;
            }

            mounted() {
                this.el.select();
            }
        }

        class inputInspCnt {
            constructor(props) {
                let el = document.createElement('input');
                let { rowKey } = props;
                this.rowKey = rowKey;
                el.type = 'text';
                el.value = String(props.value);
                this.el = el;
            }

            getElement() {
                let preIstCnt = grid.getValue(this.rowKey, 'preIstCnt')
                if (preIstCnt === '' || preIstCnt == null) {
                    toastr.error('가입고량을 먼저 입력하세요');
                } else {
                    this.el.value = ''
                    return this.el;
                }
            }

            getValue() {
                let val = this.el.value.replace(/[^0-9]/g, '')
                let preIstCnt = grid.getValue(this.rowKey, 'preIstCnt')
                if (parseInt(val) > parseInt(preIstCnt)) {
                    toastr.error('검사량이 입고량 보다 많습니다.');
                    grid.setValue(this.rowKey, 'inspPassCnt', '');
                    grid.setValue(this.rowKey, 'inspFailCnt', '');
                    return '';
                } else {
                    grid.setValue(this.rowKey, 'inspPassCnt', val);
                    if (val === '') {
                        return val;
                    } else {
                        return parseInt(val);
                    }
                }
            }

            mounted() {
                this.el.select();
            }
        }

        let iModal;

        class rscInfBtn {
            constructor(props) {
                let { rowKey, value } = props;
                let btn = document.createElement('button');
                let text = document.createTextNode(value);
                btn.appendChild(text);
                btn.innerHTML = '검사'
                btn.className = 'inspBtn';
                btn.addEventListener('click', function (e) {
                    let infDiv = document.getElementById('infModal');
                    infDiv.dataset.rowKey = rowKey;
                    iModal = new bootstrap.Modal(infDiv, {});
                    iModal.show('infModal');
                })
                this.el = btn;
            }

            getElement() {
                return this.el;
            }
        }

        // grid theme
        let gridOption = {
            row: {
                hover: { background: 'rgba(19,78,94,0.2)' }
            }
        }
        tui.Grid.applyTheme('default', gridOption);


        // main grid section
        let grid = new tui.Grid({
            el: document.getElementById('grid'),
            bodyHeight: 450,
            scrollX: false,
            scrollY: true,
            rowHeaders: ['checkbox'],
            columns: [
                {
                    header: '자재코드',
                    name: 'rscCd',
                    editor: customInput,
                    align: 'center',
                    sortingType: 'asc',
                    sortable: true
                },
                {
                    header: '품명',
                    name: 'rscNm',
                    align: 'center',
                    sortingType: 'asc',
                    sortable: true
                },
                {
                    header: '규격',
                    name: 'rscSpec',
                    align: 'center',
                    width: 50
                },
                {
                    header: '단위',
                    name: 'mngUnit',
                    align: 'center',
                    width: 50
                },
                {
                    header: '공급업체',
                    name: 'vendNm',
                    align: 'center'
                },
                {
                    header: '발주번호',
                    name: 'ordrCd',
                    align: 'center',
                    sortingType: 'desc',
                    sortable: true
                },
                {
                    header: '발주량',
                    name: 'ordrCnt',
                    align: 'right',
                    sortingType: 'desc',
                    sortable: true
                },
                {
                    header: '미입고량',
                    name: 'rmnCnt',
                    align: 'right',
                    sortingType: 'desc',
                    sortable: true
                },
                {
                    header: '가입고량',
                    name: 'preIstCnt',
                    validation: {
                        dataType: 'number',
                        required: true
                    },
                    relations: [
                        {
                            targetNames: ['inspCnt'],
                            editable({ value }) {
                                return value !== null;
                            }
                        }
                    ],
                    editor: {
                        type: inputPreIstCnt,
                        options: {
                            maxLength: 10
                        }
                    },
                    align: 'right'
                },
                {
                    header: '검사량',
                    name: 'inspCnt',
                    validation: {
                        dataType: 'number',
                        required: true,
                        validatorFn: (value, row, ordrCnt) => Number(value) <= Number(row['preIstCnt'])
                    },
                    editor: {
                        type: inputInspCnt,
                        options: {
                            maxLength: 10
                        }
                    },
                    align: 'right'
                },
                {
                    header: '검사',
                    name: 'rscInfBtn',
                    align: 'center',
                    renderer: { type: rscInfBtn },
                    width: 50
                },
                {
                    header: '합격량',
                    name: 'inspPassCnt',
                    validation: {
                        dataType: 'number',
                        required: true
                    },
                    align: 'right'
                },
                {
                    header: '불량수량',
                    name: 'inspFailCnt',
                    align: 'right'
                }
            ]
            , editingEvent: 'click'
        });

        grid.on('editingStart', (ev) => {
            if (grid.getValue(ev.rowKey, 'ordrCd') != null
                && grid.getValue(ev.rowKey, 'ordrCd') !== '') {
                if (ev.columnName === 'rscCd') {
                    ev.stop();
                }
            }
        })

        ///////////////////////////// vendor ////////////////////////////////
        // declare vendor modal
        let vModal
        modalBtn.addEventListener('click', function () {
            vModal = new bootstrap.Modal(document.getElementById('vendModal'), {})
            vModal.show('vendModal');
        })

        // when vendor modal shown
        let vendModal = document.getElementById('vendModal');
        vendModal.addEventListener('shown.bs.modal', e => {
            vendGrid.refreshLayout();
        })

        // vendor grid
        let vendGrid = new tui.Grid({
            el: document.getElementById('vend-grid'),
            bodyHeight: 300,
            scrollX: false,
            scrollY: true,
            columns: [
                {
                    header: '업체코드',
                    name: 'vendCd'
                },
                {
                    header: '업체이름',
                    name: 'vendNm'
                },
                {
                    header: '사업자번호',
                    name: 'bizno'
                },
                {
                    header: '전화번호',
                    name: 'telno'
                }
            ]
            , editingEvent: 'click'
        })

        // search vendors by keyword
        let vendSch = document.getElementById('vendSch');
        vendSch.addEventListener('click', function () {
            let data = new FormData(vendSchForm);
            let url = 'getVendors'

            fetch(url, {
                method: 'POST',
                body: data
            }).then(res => res.json()).then(res => {
                vendGrid.innerHTML = '';
                vendGrid.resetData(res);
            })
        });

        // action in vendor modal
        vendGrid.on('dblclick', e => {
            let rowInfo = vendGrid.getRow(e.rowKey)
            let vendInfo = `${rowInfo.vendNm} - ${rowInfo.vendCd}`
            vendNm.value = vendInfo;
            vendCd.value = rowInfo.vendCd;
            vModal.hide(vendModal);
        })

        // get vendor grid data
        function getVendListInit() {
            let url = 'getVendors'
            fetch(url).then(res => res.json())
                .then(res => vendGrid.resetData(res))
        }

        ///////////////////////////// resource ////////////////////////////////
        // rsc grid
        let rscGrid = new tui.Grid({
            el: document.getElementById('rsc-grid'),
            bodyHeight: 300,
            scrollX: false,
            scrollY: true,
            columns: [
                {
                    header: '자재코드',
                    name: 'rscCd'
                },
                {
                    header: '자재명',
                    name: 'rscNm'
                },
                {
                    header: '자재단위',
                    name: 'mngUnit'
                }
            ]
            , editingEvent: 'click'
        })

        // when rsc modal shown => refresh
        let rscModal = document.getElementById('rscModal');
        rscModal.addEventListener('shown.bs.modal', e => {
            rscGrid.refreshLayout();
        })

        rscModal.addEventListener('hidden.bs.modal', e => {
            rscModalState = 0;
        })

        // search rsc
        let rscSch = document.getElementById('rscSch');
        rscSch.addEventListener('click', function () {
            let data = new FormData(rscSchForm);
            let url = 'getResources'

            fetch(url, {
                method: 'POST',
                body: data
            }).then(res => res.json()).then(res => {
                rscGrid.innerHTML = '';
                rscGrid.resetData(res);
            })
        });

        // action in rsc modal
        rscGrid.on('dblclick', e => {
            grid.finishEditing();
            let info = rscGrid.getRow(e.rowKey);
            getRscSingle(info.rscCd, rscModal.dataset.rowKey);
            rModal.hide(rscModal);
        })

        // get rsc grid data
        function getRscListInit() {
            let url = 'getResources'
            fetch(url).then(res => res.json())
                .then(res => rscGrid.resetData(res))
        }

        function getRscSingle(val, rowKey) {
            let url = 'getRscSingle'
            if (val === '' || val == null) {
            } else {
                let data = { rscCd: val }
                fetch(url, {
                    headers: { 'Content-Type': 'application/json' },
                    method: 'POST',
                    body: JSON.stringify(data)
                }).then(res => res.json()).then(res => {
                    grid.setRow(rowKey, res)
                }).catch(err => {
                    toastr.error('해당하는 자재가 없습니다.');
                })
            }
        }

        //////////////////////////////// inspection detail /////////////////////////
        ///////////////////////////// inferior rsc ////////////////////////////////
        class inputInferCnt {
            constructor(props) {
                const el = document.createElement('input');
                el.type = 'text';
                el.value = String(props.value);
                this.el = el;
            }

            getElement() {
                this.el.value = '';
                return this.el;
            }

            getValue() {
                let val = this.el.value.replace(/[^0-9]/g, '')
                if (val === '') {
                    return val;
                } else {
                    return parseInt(val);
                }
            }

            mounted() {
                this.el.select();
            }
        }

        let infGrid = new tui.Grid({
            el: document.getElementById('inf-grid'),
            bodyHeight: 300,
            scrollX: false,
            scrollY: true,
            columns: [
                {
                    header: '불량코드',
                    name: 'ccdDtl',
                    align: 'center'
                },
                {
                    header: '불량명',
                    name: 'ccdDtlNm',
                    align: 'center'
                },
                {
                    header: '불량수량',
                    name: 'infCnt',
                    editor: {
                        type: inputInferCnt,
                        options: {
                            maxLength: 10
                        }
                    },
                    align: 'center'
                }
            ]
            , editingEvent: 'click'
        })

        let infData = new Map();
        let infModal = document.getElementById('infModal');

        infModal.addEventListener('shown.bs.modal', e => {
            let rowKey = infModal.dataset.rowKey;
            let data = infData.get(rowKey)
            if (data === undefined) { // initiate
                infGrid.setColumnValues('infCnt', '')
            } else if (data.length !== 0) {
                infGrid.resetData(data)
            } else {
                infGrid.setColumnValues('infCnt', '')
            }
            infGrid.refreshLayout();
        })

        infModal.addEventListener('hidden.bs.modal', e => {
            infGrid.refreshLayout();
        })

        let calInfCnt = document.getElementById('calInfCnt');
        calInfCnt.addEventListener('click', function () {
            let rowKey = infModal.dataset.rowKey;
            let inspCnt = grid.getValue(rowKey, 'inspCnt')
            if (inspCnt === '' || inspCnt == null) {
                toastr.error('검사량을 먼저 입력하세요.');
                iModal.hide(infModal);
            } else {
                let colVal = infGrid.getColumnValues('infCnt')
                let infSum = colVal.reduce((a, b) => ((+a) + (+b)));
                let inspCnt = grid.getValue(rowKey, 'inspCnt')

                if (infSum > parseInt(inspCnt)) {
                    toastr.error('불량수량이 검사량 보다 많습니다.');
                } else {
                    grid.setValue(rowKey, 'inspPassCnt', (inspCnt - infSum))
                    grid.setValue(rowKey, 'inspFailCnt', infSum)
                    let data = infGrid.getData();
                    infData.set(rowKey, data);
                    infGrid.refreshLayout();

                }
                iModal.hide(infModal);
            }
        })

        function getInfList() {
            let url = 'getInfCdList'
            fetch(url).then(res => res.json())
                .then(res => {
                    infGrid.resetData(res)
                });
        }

        ///////////////////////////// get ordr list ////////////////////////////////
        // get order list
        let getOrdrListBtn = document.getElementById('getOrdrList');
        getOrdrListBtn.addEventListener('click', getOrdrList);

        function getOrdrList() {
            // initiate inf list

            infData.clear();
            getInfList();

            // init conditions
            saveFlag = 0;
            grid.showColumn('rmnCnt');

            if (startDt.value === '' || endDt.value === '') {
                toastr.error('기간을 입력하세요.');
            } else {
                let data = new FormData(ordrListFrm)
                let url = 'getRscOrdrList';
                fetch(url, {
                    method: 'POST',
                    body: data
                })
                    .then(res => res.json())
                    .then(res => grid.resetData(res))
            }
        }

        ///////////////////////////// insert or update inspection result /////////////////
        let saveBtn = document.getElementById('saveBtn')
        saveBtn.addEventListener('click', function () {
            let gridVal = grid.getCheckedRows();
            let test = validVal(gridVal);
            if (test === 0) {
                gridVal.forEach(el => {
                    if (el.inspFailCnt === '') {
                        el.inspFailCnt = 0;
                    }
                    let rowKey = el.rowKey.toString();
                    el.rscInfList = infData.get(rowKey)
                })
                let obj = {
                    inspDt: inspDt.value,
                    inspTstr: inspTstr.value,
                    rscInspCd: rscInspCd
                }
                gridVal.unshift(obj);
                if (saveFlag === 0) {
                    setRscInspList(gridVal);
                } else {
                    updRscInspHist(gridVal);
                    grid.clear();
                }
            } else {
                toastr.error('비어있는 항목이 있습니다.');
            }
            inspDt.value = today;
            inspTstr.value = '';
        })

        function validVal(val) {
            let errCnt = 0;
            val.forEach(el => {
                if (el.rscNm == null) {
                    errCnt++;
                } else if (el.inspPassCnt == null) {
                    errCnt++;
                }
            })
            return errCnt;
        }


        function setRscInspList(data) {
            let url = 'setRscInspList';
            fetch(url, {
                headers: { 'Content-Type': 'application/json' },
                method: 'POST',
                body: JSON.stringify(data)
            }).then(res => {
                if (res.ok) {
                    toastr.success('저장이 완료되었습니다.');
                    getOrdrList();
                } else {
                    toastr.error('요청이 잘 못되었습니다.')
                }
            }).then(res => {
                schRscInspHist();
            })
        }

        function updRscInspHist(data) {
            let url = 'updRscInspHist';
            fetch(url, {
                headers: { 'Content-Type': 'application/json' },
                method: 'POST',
                body: JSON.stringify(data)
            }).then(res => {
                if (res.ok) {
                    toastr.success('수정이 완료되었습니다.')
                } else {
                    toastr.error('요청이 잘 못되었습니다.')
                }
            }).then(res => {
                saveFlag === 0;
                schRscInspHist();
            })
        }


        /////////////////////////// inspection history  ////////////////////////////////////
        ///////////////////////////// modify and delete ////////////////////////////////
        // search grid
        let mdfyGrid = new tui.Grid({
            el: document.getElementById('mdfy-grid'),
            bodyHeight: 450,
            scrollX: false,
            scrollY: true,
            columns: [
                {
                    header: '검사코드',
                    name: 'rscInspCd',
                    align: 'center'
                },
                {
                    header: '검사일자',
                    name: 'inspDt',
                    align: 'center'
                },
                {
                    header: '건수',
                    name: 'inspCnt',
                    align: 'center',
                    width: 50
                }
            ]
            , editingEvent: 'click'
        })

        // declare modal
        function schRscInspHist() {
            let url = 'schRscInspHist'
            fetch(url).then(res => res.json()).then(res => {
                mdfyGrid.resetData(res);
            }).then(res => {
                mdfyGrid.refreshLayout();
            })
        }

        // select
        mdfyGrid.on('dblclick', e => {
            let rowInfo = mdfyGrid.getRow(e.rowKey)
            rscInspCd = rowInfo.rscInspCd;
            let url = 'getRscInspHistByCd'
            fetch(url, {
                headers: { 'Content-Type': 'application/json' },
                method: 'POST',
                body: JSON.stringify(rowInfo)
            }).then(res => res.json()).then(res => {
                grid.hideColumn('rmnCnt')

                inspDt.value = res[0].inspDt;
                inspTstr.value = res[0].inspTstr;

                res.shift();

                // initiate inf grid
                infData.clear();
                getInfList();

                // set main grid
                grid.resetData(res);

                // set inf grid
                res.forEach(function (el, idx) {
                    infData.set(idx.toString(), el.rscInfList);
                })
            })
            saveFlag = 1;
        })

        ///////////////////////////// action on grid ////////////////////////////////
        let gridEle = document.getElementById('grid')
        gridEle.addEventListener('mouseleave', function () {
            grid.finishEditing();
        })

        let venGridEl = document.getElementById('vend-grid')
        venGridEl.addEventListener('mouseleave', function () {
            vendGrid.finishEditing();
        })

        let mdfyGridEl = document.getElementById('mdfy-grid')
        mdfyGridEl.addEventListener('mouseleave', function () {
            mdfyGrid.finishEditing();
        })

        let rscGridEl = document.getElementById('rsc-grid')
        rscGridEl.addEventListener('mouseleave', function () {
            rscGrid.finishEditing();
        })

        let infGridEl = document.getElementById('inf-grid')
        infGridEl.addEventListener('mouseleave', function () {
            infGrid.finishEditing();
        })

        grid.on('afterChange', function (ev) {
            let changes = ev.changes
            changes.forEach(el => {
                grid.check(el.rowKey)
            })
        })

        ////////////////////////////// add & delelte row ////////////////////////////
        addRow.addEventListener('click', function () {
            if (saveFlag === 1) {
                toastr.warning('수정모드에서는 추가 할 수 없습니다.')
            } else {
                grid.appendRow()
            }
        })

        delRow.addEventListener('click', function () {
            let rowKeys = grid.getCheckedRowKeys()
            if (saveFlag === 0) {
                grid.removeRows(rowKeys)
            } else {
                $('body').alertBox({
                    title: '정말로 삭제하시겠습니까?',
                    lTxt: 'Back',
                    rTxt: 'Okey',
                    rCallback: function () {
                        let data = grid.getCheckedRows();
                        let url = 'delRscInspHistSingle'
                        fetch(url, {
                            headers: { 'Content-Type': 'application/json' },
                            method: 'POST',
                            body: JSON.stringify(data)
                        }).then(res => {
                            toastr.success('삭제되었습니다.');
                            schRscInspHist();
                            grid.removeRows(rowKeys);
                            grid.refreshLayout();
                        })
                    }
                })
            }
        })

        //////////////////////////// referesh btn //////////////////////////////////
        reloadBtn.addEventListener('click', e => {
            location.reload();
        })

        ////////////////////////// delete /////////////////////////////////////
        delDataBtn.addEventListener('click', function () {
            if (saveFlag === 0) {
                toastr.warning('등록모드에서는 삭제할 수 없습니다.');
            } else {
                $('body').alertBox({
                    title: '정말로 삭제하시겠습니까?',
                    lTxt: 'Back',
                    rTxt: 'Okey',
                    rCallback: function () {
                        let data = grid.getData();
                        let url = 'delRscInspHist'
                        fetch(url, {
                            headers: { 'Content-Type': 'application/json' },
                            method: 'POST',
                            body: JSON.stringify(data)
                        }).then(res => {
                            toastr.success('삭제되었습니다.');
                        }).then(res => {
                            schRscInspHist();
                            grid.clear();
                        })
                    }
                })

            }
        });

        ///////////////////////////////////// misc ///////////////////////////
        //셀 클릭시 로우 하이라이팅
        let gridKey = null;
        grid.on('click', ev => {
            if (gridKey !== ev.rowKey) {
                grid.removeRowClassName(gridKey, 'highlight');
            }
            gridKey = ev.rowKey
            grid.addRowClassName(gridKey, 'highlight')
        });

        let mdfyKey = null;
        mdfyGrid.on('click', ev => {
            if (mdfyKey !== ev.rowKey) {
                mdfyGrid.removeRowClassName(mdfyKey, 'highlight');
            }
            mdfyKey = ev.rowKey
            mdfyGrid.addRowClassName(mdfyKey, 'highlight')
        });
    </script>
    </div>
    </div>
    </div>