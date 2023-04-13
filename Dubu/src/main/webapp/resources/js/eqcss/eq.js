$(document).ready(function () {
    // alert('연결테스트');

    // 1. 설비구분 옵션 선택 시, 설비코드 자동 입력
    $("select[name=eqmFg]").change(function () {
        // console.log($(this).val()); // value값 가져오기     (1 등)
        // console.log($("select[name=eqmFg] option:selected").text()); //text값 가져오기 (충전설비 등)

        // if($(this).val() == 1) {
        //     $('#eqmCd').val("AAA001")
        // } else if($(this).val() == 2) {
        //     $('#eqmCd').val("BBB002")
        // } else if($(this).val() == 3) {
        //     $('#eqmCd').val("BBB003")
        // }

        $('#eqmCd').val(this.value);
    });


    // 2. 라인명 옵션 선택 시, 라인코드 자동 입력
    $("select[name=lineNm]").change(function () {
        // // 라인명 탭의 n번째 option 태그를 선택할 때, 라인코드 인풋에다가 특정 값 넣기
        // var idx = $("#lineNm option").index($("#lineNm option:selected"));

        //     // 만약 0번째 option 태그인  ==등록시 필수선택== 을 클릭 시, 빈 칸
        //     if (idx == 0) {
        //         $('#lineCd').val('');
        //     }
        //     // 그게 아니라면, n번째에 맞도록 라인코드도 똑같이
        //     else if ($(`#lineNm option:eq(${idx})`).prop("selected", true)) {
        //         $('#lineCd').val(`LINE000${idx}`);
        //     }

        $('#lineCd').val(this.value);

    });


    // 3. 공정명 옵션 클릭 시, 공정코드 자동 입력
    $('#prcsNm').on('change', function () {
        // 선택된 해당 option 의 value  =>  this.value
        // console.log(this.value);

        // 공정코드 input 태그에다가 선택된 해당 option의 value 를 넣음
        $('#prcsCd').val(this.value);
    })


    //////////////////////////////////////////////////////////////////////////


    // 4. 등록 버튼 눌렀을 때
    $('#insertBtn').on("click", function () {
        // console.log(eqmNm.value);

        // if(eqmNm.value == '') {
        //     console.log('빈칸인데요')
        // } else {
        //     console.log(eqmNm.value)
        // }

        // console.log(eqmIstDt.value);

        // if ($('input[name=useYN]:checked').val() == undefined) {
        //     console.log("메롱");
        // } else {
        //     console.log($('input[name=useYN]:checked').val());
        // }


        // 설비명, 점검주기,입고일자, 가동여부 중 하나라도 입력 안하면 에러!
        if ($('#eqmCd').val() == '' || $('#lineCd').val() == '' || $('#prcsCd').val() == '' || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {
            console.log('필수항목들을 전부 입력해라!')

            $('#eqmFg').css('border', 'solid 2px red')
            $('#lineNm').css('border', 'solid 2px red')
            $('#prcsNm').css('border', 'solid 2px red')
            $('#eqmNm').css('border', 'solid 2px red')
            $('#chckPerd').css('border', 'solid 2px red')
            $('#eqmIstDt').css('border', 'solid 2px red')
            $('#useYNSet').css('border', 'solid 2px red')
        }

        // if ($('#eqmCd').val() == '') {
        //     $('#eqmFg').css('border', 'solid 2px red')
        // } else if ($('#lineCd').val() == '') {
        //     $('#lineNm').css('border', 'solid 2px red')
        // } else if ($('#prcsCd').val() == '') {
        //     $('#prcsNm').css('border', 'solid 2px red')
        // } else if (eqmNm.value == '') {
        //     $('#eqmNm').css('border', 'solid 2px red')
        // } else if (chckPerd.value == '') {
        //     $('#chckPerd').css('border', 'solid 2px red')
        // } else if (eqmIstDt.value == '') {
        //     $('#eqmIstDt').css('border', 'solid 2px red')
        // } else if ($('input[name=useYN]:checked').val() == undefined) {
        //     $('#useYNSet').css('border', 'solid 2px red')
        // }



        else {  // 모두 다 작성이 잘 됐다면, 이제 등록
            let eqmCd = $('#eqmCd').val()
            let lineCd = $('#lineCd').val()
            let prcsCd = $('#prcsCd').val()
            let prcsNm = $('#prcsNm option:checked').text()     // val 이 아닌 .text (선택된 옵션의 텍스트값)
            let eqmNm = $('#eqmNm').val()
            let chckPerd = $('#chckPerd').val()
            let minTemp = $('#minTemp').val()
            let maxTemp = $('#maxTemp').val()
            let eqmYn = $('input[name=useYN]:checked').val()
            let eqmIstDt = $('#eqmIstDt').val()

            // 출력 테스트
            console.log(eqmCd)
            console.log("공정명 " + prcsNm)
            console.log(eqmIstDt)


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
                    chckPerd: chckPerd,
                    minTemp: minTemp,
                    maxTemp: maxTemp,
                    eqmYn: eqmYn,
                    eqmIstDt: eqmIstDt
                },
                success: function (result) {
                    console.log('데이터 잘 보냄! -> ' + result);
                    location.replace('eq');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
    })


    //////////////////////////////////////////////////////////////////////////


    // 5. row 하나 클릭 시,
    $('.eachRow').on("click", function (ev) {
        // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let eqmNm = $(this).closest("tr").children().eq(1).text();
        let eqmCd = $(this).closest("tr").children().eq(2).text();
        let prcsCd = $(this).closest("tr").children().eq(3).text();
        let prcsNm = $(this).closest("tr").children().eq(4).text();

        let useYnSet = $(this).closest("tr").children().eq(5).text();
        let minTemp = $(this).closest("tr").children().eq(6).text();
        let maxTemp = $(this).closest("tr").children().eq(7).text();
        let chckPerd = $(this).closest("tr").children().eq(8).text();
        let lineCd = $(this).closest("tr").children().eq(9).text();
        let eqmIstDt = $(this).closest("tr").children().eq(10).text();
        console.log(prcsNm);


        // 5-2. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
        $('#eqmCd').val(eqmCd);
        $('#eqmNm').val(eqmNm);
        $('#lineCd').val(lineCd);
        $('#chckPerd').val(chckPerd);
        $('#prcsCd').val(prcsCd);

        // select 태그에서 prcsNm 값? prcsCd 값? 과 일치하는 option 태그를 선택하고 변경 이벤트 발생시킴
        $("#prcsNm").val(prcsCd).change();

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
    })


    //////////////////////////////////////////////////////////////////////////


    // 6. row 하나 클릭 후, 데이터 수정 후 수정 버튼 눌렀을 때
    $('#modBtn').on("click", function () {
        // 설비명, 점검주기,입고일자, 가동여부 중 하나라도 입력 안하면 에러!
        if ($('#eqmCd').val() == '' || $('#lineCd').val() == '' || $('#prcsCd').val() == '' || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {
            console.log('필수항목들을 전부 입력해라!')

            $('#eqmFg').css('border', 'solid 2px red')
            $('#lineNm').css('border', 'solid 2px red')
            $('#prcsNm').css('border', 'solid 2px red')
            $('#eqmNm').css('border', 'solid 2px red')
            $('#chckPerd').css('border', 'solid 2px red')
            $('#eqmIstDt').css('border', 'solid 2px red')
            $('#useYNSet').css('border', 'solid 2px red')
        }
        else {  // 모두 다 작성이 잘 됐다면, 이제 등록
            let eqmCd = $('#eqmCd').val()
            let lineCd = $('#lineCd').val()
            let prcsCd = $('#prcsCd').val()

            // select 태그 내에서 선택된 option 태그의 value 가 아닌 text 추출
            let prcsNm = $("#prcsNm option:checked").text()
            let eqmNm = $('#eqmNm').val()
            let chckPerd = $('#chckPerd').val()
            let minTemp = $('#minTemp').val()
            let maxTemp = $('#maxTemp').val()
            let eqmYn = $('input[name=useYN]:checked').val()
            let eqmIstDt = $('#eqmIstDt').val()

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
                    chckPerd: chckPerd,
                    minTemp: minTemp,
                    maxTemp: maxTemp,
                    eqmYn: eqmYn,
                    eqmIstDt: eqmIstDt
                },
                success: function (result) {
                    console.log('데이터 잘 보냄! -> ' + result);
                    location.replace('eq');     // 등록 후, 다시 eq 페이지 (메인 페이지로)
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
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
                        tr.append($('<td />').text(item.eqmNm))
                        tr.append($('<td />').text(item.eqmCd))
                        tr.append($('<td />').text(item.prcsCd))
                        tr.append($('<td />').text(item.prcsNm))
                        tr.append($('<td />').text(item.eqmYn))
                        tr.append($('<td />').text(item.minTemp))
                        tr.append($('<td />').text(item.maxTemp))
                        tr.append($('<td />').text(item.chckPerd))
                        tr.append($('<td />').text(item.lineCd))
                        tr.append($('<td />').text(convertToyyyyMMdd(item.eqmIstDt)))    // item.eqmIstDt => 밀리세컨드

                        $('#list').append(tr)
                        $('tr').attr("class", "selectedRows");



                        /// ↓↓↓ 검색한 리스트 중 하나 클릭했을 때, 상세 정보 나옴 (이거 리팩토링 필요할듯 - 함수로 따로 만들어서)
                        $('.selectedRows').on("click", function (ev) {
                            console.log('잘 찍힘')

                            // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
                            let eqmNm = $(this).closest("tr").children().eq(1).text();
                            let eqmCd = $(this).closest("tr").children().eq(2).text();
                            let prcsCd = $(this).closest("tr").children().eq(3).text();
                            let prcsNm = $(this).closest("tr").children().eq(4).text();

                            let useYnSet = $(this).closest("tr").children().eq(5).text();
                            let minTemp = $(this).closest("tr").children().eq(6).text();
                            let maxTemp = $(this).closest("tr").children().eq(7).text();
                            let chckPerd = $(this).closest("tr").children().eq(8).text();
                            let lineCd = $(this).closest("tr").children().eq(9).text();
                            let eqmIstDt = $(this).closest("tr").children().eq(10).text();
                            console.log(prcsNm);


                            // 5-2. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
                            $('#eqmCd').val(eqmCd);
                            $('#eqmNm').val(eqmNm);
                            $('#lineCd').val(lineCd);
                            $('#chckPerd').val(chckPerd);
                            $('#prcsCd').val(prcsCd);

                            // select 태그에서 prcsNm 값? prcsCd 값? 과 일치하는 option 태그를 선택하고 변경 이벤트 발생시킴
                            $("#prcsNm").val(prcsCd).change();

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
})