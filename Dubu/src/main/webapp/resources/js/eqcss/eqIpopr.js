$(document).ready(function () {
    // alert('Hello!')

    console.log("다음 비가동코드 => " + $('#noprCd').val())

    ///////////////// 비가동 검색 버튼 /////////////////////
    $('#chckSearchBtn').on("click", function() {
        let keyword3 = $('#keyword3').val()
        let searchFrDt = $('#searchFrDt').val()
        let searchToDt = $('#searchToDt').val()

        console.log(keyword3)
        console.log(searchFrDt)
        console.log(searchToDt)

        // 날짜가 둘 중 하나만 입력되었을 때 (키워드 입력 유무는 상관 X)
        if((searchFrDt == "" && searchToDt != "") || (searchToDt == "" && searchFrDt != "")) {
            alert('두 날짜 모두 입력해라. 조패기전에')
        }
        // 날짜가 둘 다 입력되었을 때! (키워드 입력 유무는 상관 X)
        else {
            var searchData = $("#searchFrm").serialize();
            $.ajax({
                url: 'searchEqIpopr',
                dataType: "json",
                method: "post",
                data: searchData,
                success: function(result) {
                    console.log(result)

                    $('#keyword3').val("");
                    $("#list").find("tr").remove();

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

                    $(result).each(function (idx, item) {
                        console.log("인덱스 -> " + idx)
                        console.log(item)

                        let tr = $("<tr />");

                        tr.append($('<td />').text(item.noprCd))
                        tr.append($('<td />').text(item.eqmCd))
                        tr.append($('<td />').text(item.eqmNm))
                        // 날짜를 yyyy-MM-dd 형식으로 변환하여 새로운 td 엘리먼트에 추가합니다.
                        tr.append($('<td />').text(convertToyyyyMMdd(item.frDt)))
                        tr.append($('<td />').text(convertToyyyyMMdd(item.toDt)))
                        tr.append($('<td />').text(item.eqmYn))
                        tr.append($('<td />').text(item.eqmPsch))
                        tr.append($('<td />').text(item.opertCtnt))

                        // dispoCtnt 값을 가지는 hidden input 엘리먼트를 생성하여 새로운 td 엘리먼트에 추가합니다.
                        const dispoInput = $('<input />', {
                            type: 'hidden',
                            value: item.dispoCtnt,
                            id: 'dispoCtnt',
                            name: 'dispoCtnt'
                        });

                        const dispoTd = $('<td />').append(dispoInput);
                        tr.append(dispoTd);


                        $('#list').append(tr)
                        $('tr').attr("class", "eachRow");
                    });
                }
            })
        }
    })
    ///////////////// 비가동 검색 버튼 /////////////////////
    

    ///////////////// 비가동 검색 버튼 누른 후, 특정 행 클릭 시 /////////////////////
    $('#list').on("click", "tr", function() {
        // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let chckCdEachRow = $(this).closest("tr").children().eq(0).text();
        let eqmCd = $(this).closest("tr").children().eq(1).text();
        let eqmNm = $(this).closest("tr").children().eq(2).text();
        let chckFgSet = $(this).closest("tr").children().eq(3).text();
        let dispoMatterSet = $(this).closest("tr").children().eq(4).text();
        let jdgmntSet = $(this).closest("tr").children().eq(5).text();
        let chckDt = $(this).closest("tr").children().eq(6).text();
        let chckPsch = $(this).closest("tr").children().eq(7).text();
        // let dispoCtnt = $(this).closest("tr").children().eq(7).text();
        let dispoCtnt = $(this).closest("tr").find("input[name='dispoCtnt']").val();
        
        console.log("점검구분?" + chckFgSet)
        console.log("점검코드는 => " + chckCdEachRow);

        // 5-2. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
        $('#chckCd').val(chckCdEachRow);
        $('#eqmCd').val(eqmCd);
        $('#eqmNm').val(eqmNm);

        $('#chckPsch').val(chckPsch);

        // 5-3. Yes or No 의 경우, radio 버튼 바꿔가면서 선택되도록!
        if (dispoMatterSet == "수리") {
            $("#dispoMatter1").prop("checked", true);
        } else if (dispoMatterSet == "점검") {
            $("#dispoMatter2").prop("checked", true);
        }

        if (jdgmntSet == "적합") {
            $("#jdgmnt1").prop("checked", true);
        } else if (jdgmntSet == "부적합") {
            $("#jdgmnt2").prop("checked", true);
        }
        
        // 점검구분
        if (chckFgSet == "정기점검") {
            $("#chckFg1").prop("checked", true);
        } else if (chckFgSet == "수시점검") {
            $("#chckFg2").prop("checked", true);
        }


        // let selectedValue = $("input[name='your_radio_button_name']:checked").val();
        // $("#your_hidden_input_id").val(selectedValue);

        let selectedValue = $("input[name='chckFg']:checked").val();
        $("#chckFg").val(selectedValue);

        // 점검일자
        $('input[name=chckDt]').attr('value', chckDt);

        // 조치내역
        $('#dispoCtnt').val(dispoCtnt);
    })
    ///////////////// 비가동 검색 버튼 누른 후, 특정 행 클릭 시 /////////////////////


    // 1. 초기화 버튼 눌렀을 때..
    $('#initBtn').on("click", function (e) {
        $("#dataForm")[0].reset();      // id 가 dataForm 인 form 태그 전체 초기화
        $('#frDt').val(null);       // 달력도 초기화
        $('#toDt').val(null);       // 달력도 초기화
    })


    // 2. 공정명 옵션 클릭 시, 공정코드 자동 입력
    $('#eqmNm').on('change', function () {
        // 공정코드 input 태그에다가 선택된 해당 option의 value 를 넣음
        $('#eqmCd').val(this.value);
    })


    //////////////////////////////////////////////////////////////////////////

    // 3. 등록 버튼 눌렀을 때
    $('#insertBtn').on("click", function () {

        /////////////////////////////////

        var rows = document.getElementById("list").getElementsByTagName("tr");

        var currentCd = $('#noprCd').val();

        // 기존에 존재하는 점검코드를 담을 가변 배열
        var cdArr = [];

        // tr 개수만큼 반복돌면서 컬럼값 접근
        for (var r = 0; r < rows.length; r++) {
            var cd = rows[r].getElementsByTagName("td");    // 각 행의 td 태그들

            cdArr.push(cd[0].firstChild.data);		        // 각 행의 td 태그 중 첫번째 태그의 값을 배열에 담자.
                                                            // 근데 .val() 이랑 .data 차이가 뭐지?
            console.log(cdArr);             // 테스트용 출력
        }


        if (cdArr.indexOf(currentCd) > -1) {

            // 설비명 입력 안하면 에러!
            let eqmNmSelectBox = document.getElementById("eqmNm");


            if (eqmNmSelectBox.selectedIndex === 0 || frDt.value == '' || toDt.value == '' || $('input[name=eqmYN]:checked').val() == undefined || opertCtnt.value == '' || eqmPsch.value == '') {

                alert('모든 항목들을 입력해 주세요')
            }
            else {  // 모두 다 작성이 잘 됐다면, 이제 등록
                let eqmNm = $("#eqmNm option:checked").text()
                let eqmCd = $('#eqmCd').val()
                let noprCd = $('#noprCd').val()
                let frDt = $('#frDt').val()
                let toDt = $('#toDt').val()
                let eqmYn = $('input[name=eqmYN]:checked').val()
                let opertCtnt = $('#opertCtnt').val()
                let eqmPsch = $('#eqmPsch').val()


                $.ajax({
                    url: 'updateEqIpopr',
                    method: 'post',
                    data: {
                        // VO 클래스에 있는 eqmCd 에다가,   여기서 값을 받아온 eqmCd 를 넘긴다~
                        eqmNm: eqmNm,
                        eqmCd: eqmCd,
                        noprCd: noprCd,
                        frDt: frDt,
                        toDt: toDt,
                        eqmYn: eqmYn,
                        opertCtnt: opertCtnt,
                        eqmPsch: eqmPsch
                    },
                    success: function (result) {
                        console.log('데이터 잘 보냄! -> ' + result);
                        location.replace('eqIpopr');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        }
        else {  // 모두 다 작성이 잘 됐다면, 이제 등록
            let eqmNm = $("#eqmNm option:checked").text()
            let eqmCd = $('#eqmCd').val()
            let noprCd = $('#noprCd').val()
            let frDt = $('#frDt').val()
            let toDt = $('#toDt').val()
            let eqmYn = $('input[name=eqmYN]:checked').val()
            let opertCtnt = $('#opertCtnt').val()
            let eqmPsch = $('#eqmPsch').val()


            $.ajax({
                url: 'insertEqIpopr',
                method: 'post',
                data: {
                    // VO 클래스에 있는 eqmCd 에다가,   여기서 값을 받아온 eqmCd 를 넘긴다~
                    eqmNm: eqmNm,
                    eqmCd: eqmCd,
                    noprCd: noprCd,
                    frDt: frDt,
                    toDt: toDt,
                    eqmYn: eqmYn,
                    opertCtnt: opertCtnt,
                    eqmPsch: eqmPsch
                },
                success: function (result) {
                    console.log('데이터 잘 보냄! -> ' + result);
                    location.replace('eqIpopr');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
    })


    /////////////////////////////////////////////////////////////////////////////////////////////


    // 5. row 하나 클릭 시,
    $('.eachRow').on("click", function (ev) {
        // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let noprCdEachRow = $(this).closest("tr").children().eq(0).text();
        let eqmCd = $(this).closest("tr").children().eq(1).text();
        let eqmNm = $(this).closest("tr").children().eq(2).text();
        let frDt = $(this).closest("tr").children().eq(3).text();
        let toDt = $(this).closest("tr").children().eq(4).text();
        let eqmYnSet = $(this).closest("tr").children().eq(5).text();
        let eqmPsch = $(this).closest("tr").children().eq(6).text();
        let opertCtnt = $(this).closest("tr").find("input[name='opertCtnt']").val();

        // 5-2. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
        $('#noprCd').val(noprCdEachRow);
        $('#eqmCd').val(eqmCd);
        $('#eqmNm').val(eqmNm);
        
        // select 태그에서 eqmCd 인 value 에 대응하는 option 태그를 선택하고 변경 이벤트 발생시킴
        $("#eqmNm").val(eqmCd).change();

        // 시작일자
        $('input[name=frDt]').attr('value', frDt);
        // 종료일자
        $('input[name=toDt]').attr('value', toDt);
        
        if (eqmYnSet == "Y") {
            $("#ynY").prop("checked", true);
        } else if (eqmYnSet == "N") {
            $("#ynN").prop("checked", true);
        }

        $('#eqmPsch').val(eqmPsch);

        // 작업내역
        $('#opertCtnt').val(opertCtnt);
    })


    //////////////////////////////////////////////////////////////////////////


    // 7. row 하나 클릭 후, 삭제 버튼 눌렀을 때
    $('#delBtn').on("click", function () {

        let noprCd = $('#noprCd').val()
        // 출력 테스트
        console.log("출력 " + noprCd)


        $('#exampleModal').click();

        $.ajax({
            url: 'deleteEqIpopr',
            method: 'post',
            data: {
                // VO 클래스에 있는 eqmCd 에다가,   여기서 값을 받아온 eqmCd 를 넘긴다~
                noprCd: noprCd,
            },
            success: function (result) {
                console.log('데이터 잘 보냄! -> ' + result);
                $('#exampleModal').click();         // 모달창 닫기,  .click() 혹은 .hide() ..?
                location.replace('eqIpopr');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
            },
            error: function (err) {
                console.log(err);
            }
        })
    })
})