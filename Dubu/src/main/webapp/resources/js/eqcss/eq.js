$(document).ready(function () {
    // alert('연결테스트');
    console.log("다음 설비코드 => " + $('#eqmCd').val())


    // . 초기화 버튼 눌렀을 때..
    $('#initBtn').on("click", function (e) {
        $("#dataForm")[0].reset();      // id 가 dataForm 인 form 태그 전체 초기화
        $('#eqmIstDt').val(null);       // 달력도 초기화

        $('#eqmCd').val($('#eqmCd').data('original-value'));
    })


    // 1. 설비구분 옵션 선택 시, 설비코드 자동 입력
    // $("select[name=eqmFg]").change(function () {
    //     $('#eqmCd').val(this.value);
    // });


    // 2. 라인명 옵션 선택 시, 라인코드 자동 입력
    $("select[name=lineNm]").change(function () {
        $('#lineCd').val(this.value);
    });


    // 3. 공정명 옵션 클릭 시, 공정코드 자동 입력
    $('#prcsNm').on('change', function () {
        // 공정코드 input 태그에다가 선택된 해당 option의 value 를 넣음
        $('#prcsCd').val(this.value);
    })


    //////////////////////////////////////////////////////////////////////////


    // 4. 등록 버튼 눌렀을 때
    $('#insertBtn').on("click", function () {

        /////////////////////////////////

        var rows = document.getElementById("list").getElementsByTagName("tr");

        var currentCd = $('#eqmCd').val();

        // 기존에 존재하는 점검코드를 담을 가변 배열
        var cdArr = [];

        // tr 개수만큼 반복돌면서 컬럼값 접근
        for (var r = 0; r < rows.length; r++) {
            var cd = rows[r].getElementsByTagName("td");    // 각 행의 td 태그들

            cdArr.push(cd[3].firstChild.data);		        // 각 행의 td 태그 중 첫번째 태그의 값을 배열에 담자.
                                                            // 근데 .val() 이랑 .data 차이가 뭐지?
            console.log(cdArr);             // 테스트용 출력
        }


        if (cdArr.indexOf(currentCd) > -1) {

            // 설비명, 점검주기,입고일자, 가동여부 중 하나라도 입력 안하면 에러!
            let eqmFgSelectBox = document.getElementById("eqmFg");
            let lineNmSelectBox = document.getElementById("lineNm");
            let prcsNmSelectBox = document.getElementById("prcsNm");


            if (eqmFgSelectBox.selectedIndex === 0 || lineNmSelectBox.selectedIndex === 0 || prcsNmSelectBox.selectedIndex === 0 || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {
            // if (eqmFgSelectBox.selectedIndex === 0 || lineNmSelectBox.selectedIndex === 0 || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {
                console.log('필수항목들을 전부 입력해라!')
                toastr.error('필수 항목들을 모두 입력하세요');

                $('#eqmFg').css('border', 'solid 2px red')
                $('#lineNm').css('border', 'solid 2px red')
                $('#prcsNm').css('border', 'solid 2px red')
                $('#eqmNm').css('border', 'solid 2px red')
                $('#chckPerd').css('border', 'solid 2px red')
                $('#eqmIstDt').css('border', 'solid 2px red')
                $('#useYNSet').css('border', 'solid 2px red')
                $('#eqmPsch').css('border', 'solid 2px red')

            }
            else {  // 모두 다 작성이 잘 됐다면, 이제 등록
                let eqmCd = $('#eqmCd').val()
                let lineCd = $('#lineCd').val()
                let prcsCd = $('#prcsCd').val()

                // select 태그 내에서 선택된 option 태그의 value 가 아닌 text 추출
                let eqmFg = $("#eqmFg option:checked").text()
                let prcsNm = $("#prcsNm option:checked").text()
                let eqmNm = $('#eqmNm').val()
                let chckPerd = $('#chckPerd').val()
                let minTemp = $('#minTemp').val()
                let maxTemp = $('#maxTemp').val()
                let eqmYn = $('input[name=useYN]:checked').val()
                let eqmIstDt = $('#eqmIstDt').val()
                let eqmPsch = $('#eqmPsch').val()


                // 출력 테스트
                console.log(eqmCd)
                console.log(eqmNm)
                console.log(prcsCd)
                console.log(prcsNm)


                $.ajax({
                    url: 'updateEq',
                    method: 'post',
                    data: {
                        // VO 클래스에 있는 eqmCd 에다가,   여기서 값을 받아온 eqmCd 를 넘긴다~
                        eqmCd: eqmCd,
                        lineCd: lineCd,
                        prcsCd: prcsCd,
                        prcsNm: prcsNm,
                        eqmNm: eqmNm,
                        eqmFg: eqmFg,
                        chckPerd: chckPerd,
                        minTemp: minTemp,
                        maxTemp: maxTemp,
                        eqmYn: eqmYn,
                        eqmIstDt: eqmIstDt,
                        eqmPsch: eqmPsch
                    },
                    success: function (result) {
                        console.log('데이터 잘 보냄! -> ' + result);
                        location.replace('eq');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
                        toastr.success('작업이 완료되었습니다.');
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        }
        else {
            // 설비명, 점검주기,입고일자, 가동여부 중 하나라도 입력 안하면 에러!
            let eqmFgSelectBox = document.getElementById("eqmFg");
            let lineNmSelectBox = document.getElementById("lineNm");
            let prcsNmSelectBox = document.getElementById("prcsNm");

            if (eqmFgSelectBox.selectedIndex === 0 || lineNmSelectBox.selectedIndex === 0 || prcsNmSelectBox.selectedIndex === 0 || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {
            // if (eqmFgSelectBox.selectedIndex === 0 || lineNmSelectBox.selectedIndex === 0 || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {

                toastr.error('필수 항목들을 모두 입력하세요');

                console.log('필수항목들을 전부 입력해라!');

                $('#eqmFg').css('border', 'solid 2px red')
                $('#lineNm').css('border', 'solid 2px red')
                $('#prcsNm').css('border', 'solid 2px red')
                $('#eqmNm').css('border', 'solid 2px red')
                $('#chckPerd').css('border', 'solid 2px red')
                $('#eqmIstDt').css('border', 'solid 2px red')
                $('#useYNSet').css('border', 'solid 2px red')
                $('#eqmPsch').css('border', 'solid 2px red')
            }
            else {  // 모두 다 작성이 잘 됐다면, 이제 등록
                let eqmCd = $('#eqmCd').val()
                let lineCd = $('#lineCd').val()
                let prcsCd = $('#prcsCd').val()

                // select 태그 내에서 선택된 option 태그의 value 가 아닌 text 추출
                let eqmFg = $("#eqmFg option:checked").text()
                let prcsNm = $('#prcsNm option:checked').text()     // val 이 아닌 .text (선택된 옵션의 텍스트값)
                let eqmNm = $('#eqmNm').val()
                let chckPerd = $('#chckPerd').val()
                let minTemp = $('#minTemp').val()
                let maxTemp = $('#maxTemp').val()
                let eqmYn = $('input[name=useYN]:checked').val()
                let eqmIstDt = $('#eqmIstDt').val()
                let eqmPsch = $('#eqmPsch').val()


                // 출력 테스트
                console.log("공정명 " + prcsNm)
                console.log("설비구분 " + eqmFg)


                $.ajax({
                    url: 'insertEq',
                    method: 'post',
                    data: {
                        // VO 클래스에 있는 eqmCd 에다가,   여기서 값을 받아온 eqmCd 를 넘긴다~
                        eqmCd: eqmCd,
                        lineCd: lineCd,
                        prcsCd: prcsCd,
                        prcsNm: prcsNm,
                        eqmNm: eqmNm,
                        eqmFg: eqmFg,
                        chckPerd: chckPerd,
                        minTemp: minTemp,
                        maxTemp: maxTemp,
                        eqmYn: eqmYn,
                        eqmIstDt: eqmIstDt,
                        eqmPsch: eqmPsch
                    },
                    success: function (result) {
                        console.log('데이터 잘 보냄! -> ' + result);
                        location.replace('eq');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
                        toastr.success('작업이 완료되었습니다.');
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        }
    })


    //////////////////////////////////////////////////////////////////////////


    // 5. row 하나 클릭 시,
    $('.eachRow').on("click", function (ev) {
        // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let eqmFg = $(this).closest("tr").children().eq(1).text();
        let eqmNm = $(this).closest("tr").children().eq(2).text();
        let eqmCd = $(this).closest("tr").children().eq(3).text();
        let prcsNm = $(this).closest("tr").children().eq(4).text();
        let prcsCd = $(this).closest("tr").children().eq(5).text();

        let useYnSet = $(this).closest("tr").children().eq(6).text();
        let minTemp = $(this).closest("tr").children().eq(7).text();
        let maxTemp = $(this).closest("tr").children().eq(8).text();
        let chckPerd = $(this).closest("tr").children().eq(9).text();
        let lineCd = $(this).closest("tr").children().eq(10).text();
        let eqmIstDt = $(this).closest("tr").children().eq(11).text();
        let eqmPsch = $(this).closest("tr").children().eq(12).text();

        console.log(eqmFg);
        console.log(prcsNm);


        // 5-2. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
        // $("#eqmFg").val(ccdNm).change();
        $('#eqmCd').val(eqmCd);
        $('#eqmNm').val(eqmNm);
        $('#lineCd').val(lineCd);
        $('#chckPerd').val(chckPerd);
        $('#prcsCd').val(prcsCd);

        // 하나의 row(행) 클릭 시
        // select 태그에서 prcsCd/eqmCd/lineCd 인 value 에 대응하는 option 태그를 선택하고 변경 이벤트 발생시킴
        $("#prcsNm").val(prcsCd).change();
        $("#eqmFg").val(eqmFg).change();
        $("#lineNm").val(lineCd).change();


        $('#minTemp').val(minTemp);
        $('#maxTemp').val(maxTemp);

        // 5-3. Yes or No 의 경우, radio 버튼 바꿔가면서 선택되도록!
        if (useYnSet == "Y") {
            $("#ynY").prop("checked", true);
        } else if (useYnSet == "N") {
            $("#ynN").prop("checked", true);
        }

        // 입고일자
        // $('#eqmIstDt').val(eqmIstDt);
        $('input[name=eqmIstDt]').attr('value', eqmIstDt);

        // 담당자
        $('#eqmPsch').val(eqmPsch);
    })


    //////////////////////////////////////////////////////////////////////////


    // 7. row 하나 클릭 후, 삭제 버튼 눌렀을 때
    $('#delBtn').on("click", function () {

        let eqmCd = $('#eqmCd').val()
        // 출력 테스트
        console.log(eqmCd)


        $('#exampleModal').click();

        $.ajax({
            url: 'deleteEq',
            method: 'post',
            data: {
                // VO 클래스에 있는 eqmCd 에다가,   여기서 값을 받아온 eqmCd 를 넘긴다~
                eqmCd: eqmCd,
            },
            success: function (result) {
                console.log('데이터 잘 보냄! -> ' + result);
                toastr.success('작업이 완료되었습니다.');

                $('#exampleModal').click();         // 모달창 닫기,  .click() 혹은 .hide() ..?

                location.replace('eq');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
            },
            error: function (err) {
                console.log(err);
            }
        })
    })


    //////////////////////////////////////////////////////////////////////////


    // 8. 검색 기능
    $('#searchBtn').on("click", function () {
        let searchType = $('#searchType').val()
        let keyword = $('#keyword').val()

        console.log(searchType)
        console.log(keyword)

        if (searchType == 'all' || keyword == '') {
            location.replace('eq');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
        }
        else {
            $.ajax({
                url: "searchEq",
                data: {
                    searchType: searchType,
                    keyword: keyword
                },
                success: function (result) {
                    console.log(result)

                    $('#keyword').val("");
                    $("#list").find("tr").remove();

                    console.log("성공!")


                    // ms 를 년-월-일 로 바꿈
                    function convertToyyyyMMdd(ms) {
                        let date = new Date(ms); // 현재 날짜 및 시간
                        let year = date.getFullYear();
                        // .padStart(2,'0');   -> 월, 일   앞에 빈 공간 생기면 0으로 채워줌 (2자리수)
                        let month = new String(date.getMonth() + 1).padStart(2, '0');;
                        let day = new String(date.getDate()).padStart(2, '0');;

                        let today = year + "-" + month + "-" + day; // 현재 날짜
                        return today;
                    }

                    // idx 번째 행(item..?)
                    $(result).each(function (idx, item) {
                        console.log(idx)
                        console.log(item)



                        let tr = $("<tr />");

                        tr.append($('<td />').text(item.idx))
                        tr.append($('<td />').text(item.eqmFg))
                        tr.append($('<td />').text(item.eqmNm))
                        tr.append($('<td />').text(item.eqmCd))
                        tr.append($('<td />').text(item.prcsNm))
                        tr.append($('<td />').text(item.prcsCd))
                        tr.append($('<td />').text(item.eqmYn))
                        tr.append($('<td />').text(item.minTemp))
                        tr.append($('<td />').text(item.maxTemp))
                        tr.append($('<td />').text(item.chckPerd))
                        tr.append($('<td />').text(item.lineCd))
                        tr.append($('<td />').text(convertToyyyyMMdd(item.eqmIstDt)))    // item.eqmIstDt => 밀리세컨드
                        tr.append($('<td />').text(item.eqmPsch))

                        $('#list').append(tr)
                        $('tr').attr("class", "selectedRows");



                        /// ↓↓↓ 검색한 리스트 중 하나 클릭했을 때, 상세 정보 나옴 (이거 리팩토링 필요할듯 - 함수로 따로 만들어서)
                        $('.selectedRows').on("click", function (ev) {
                            console.log('잘 찍힘')

                            // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
                            let eqmFg = $(this).closest("tr").children().eq(1).text();
                            let eqmNm = $(this).closest("tr").children().eq(2).text();
                            let eqmCd = $(this).closest("tr").children().eq(3).text();
                            let prcsNm = $(this).closest("tr").children().eq(4).text();
                            let prcsCd = $(this).closest("tr").children().eq(5).text();

                            let useYnSet = $(this).closest("tr").children().eq(6).text();
                            let minTemp = $(this).closest("tr").children().eq(7).text();
                            let maxTemp = $(this).closest("tr").children().eq(8).text();
                            let chckPerd = $(this).closest("tr").children().eq(9).text();
                            let lineCd = $(this).closest("tr").children().eq(10).text();
                            let eqmIstDt = $(this).closest("tr").children().eq(11).text();
                            let eqmPsch = $(this).closest("tr").children().eq(12).text();

                            console.log(eqmFg);
                            console.log(prcsNm);


                            // 5-2. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
                            // $("#eqmFg").val(ccdNm).change();
                            $('#eqmCd').val(eqmCd);
                            $('#eqmNm').val(eqmNm);
                            $('#lineCd').val(lineCd);
                            $('#chckPerd').val(chckPerd);
                            $('#prcsCd').val(prcsCd);

                            // 하나의 row(행) 클릭 시
                            // select 태그에서 prcsCd/eqmCd/lineCd 인 value 에 대응하는 option 태그를 선택하고 변경 이벤트 발생시킴
                            $("#prcsNm").val(prcsCd).change();
                            $("#eqmFg").val(eqmFg).change();
                            $("#lineNm").val(lineCd).change();


                            $('#minTemp').val(minTemp);
                            $('#maxTemp').val(maxTemp);

                            // 5-3. Yes or No 의 경우, radio 버튼 바꿔가면서 선택되도록!
                            if (useYnSet == "Y") {
                                $("#ynY").prop("checked", true);
                            } else if (useYnSet == "N") {
                                $("#ynN").prop("checked", true);
                            }

                            // 입고일자
                            // $('#eqmIstDt').val(eqmIstDt);
                            $('input[name=eqmIstDt]').attr('value', eqmIstDt);

                            // 담당자
                            $('#eqmPsch').val(eqmPsch);
                        })
                        // ↑↑↑ 검색한 리스트 중 하나 클릭했을 때, 상세 정보 나옴 (이거 리팩토링 필요할듯 - 함수로 따로 만들어서)

                    });
                },
                error: function (reject) {
                    console.log(reject);
                }
            })
        }
    })


    //////////////////////////////////////////////////////////////////////////////


    /*
        // let eqmNm = $(this).closest("tr").children().eq(1).text();
        // $('#eqmNm').val(eqmNm);
        ↑↑↑ '모달 창 내' 의 특정 행 정보 추출해서, input 에 넣는 기능.  위의 코드 안 됨.
        모달이 열린 후에 동적으로 DOM이 변경되어 데이터를 불러오는 로직이 작동하지 않을 수 있습니다.
        이 경우에는 이벤트 위임(event delegation)을 사용하여 동적으로 생성된 요소에도 이벤트 핸들러가 적용될 수 있도록 코드를 수정해야 합니다.
        아래는 $(document)에서 이벤트 위임을 사용하는 예시 코드입니다.
        이 코드는 #myTable 내부의 모든 행(tr) 요소에서 클릭 이벤트를 감지하고,
        클릭된 행의 첫 번째와 두 번째 셀의 값을 추출합니다.
    */

    // 즉, 모달창 내에서 특정 행(tr) 을 클릭했을 때, 그 행의 n번째 td 태그(cell) 을 추출해서, 외부 input 에 넣는 코드
        // 모달창 안에 있는 tr 태그의 class명은 eachRowInModal  이다!
        // 모달창 밖에 있는 목록의 tr 태그 클래스명인,  eachRow 랑 똑같이 하면, 점검코드에서 출력 이상하게 됨.
        $(document).on("click", "#modal-eqList tr", function() {
            let empNm = $(this).find("td").eq(1).text();
            console.log(empNm)

            $('#eqmPsch').val(empNm);
            
            $('#exampleModal222').click();          // 모달 창 닫기
        });
    
    
    //////////////////////////////////////////////////////////////////////////////
})