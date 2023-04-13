$(document).ready(function () {

    $('#modal-searchBtn').on("click", function() {
        let keyword = $('#modal-keyword').val();
        console.log(keyword)

        if (keyword == '') {
            // location.replace('eqCheck');        // 빈 칸으로 검색 버튼 누르면, 전체 출력
        } else {
            $.ajax({
                url: 'searchEqInModal',
                data: {
                    keyword: keyword
                },
                success: function(result) {
                    console.log(result)

                    $('#modal-keyword').val("");
                    $("#list").find("tr").remove();

                    console.log("성공!")

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

                        $('#list').append(tr)
                        $('tr').attr("class", "selectedRows");
                    });
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
        let eqmNm = $(this).find("td").eq(1).text();
        let eqmCd = $(this).find("td").eq(2).text();
        
        $('#eqmNm').val(eqmNm);
        $('#eqmCd').val(eqmCd);
        
        $('#exampleModal222').click();          // 모달 창 닫기
    });


    //////////////////////////////////////////////////////////////////////////////


    // 2. 초기화 버튼 눌렀을 때..
    $('#initBtn').on("click", function (e) {
        $("#dataForm")[0].reset();      // id 가 dataForm 인 form 태그 전체 초기화
    })


    // 3. 저장 버튼 눌렀을 때(라인코드가 기존에 존재하면 수정, 존재하지 않으면 insert)
    $('#saveBtn').on("click", function (e) {

        // rows = 전체 데이터행 (tr)    -> 이것들의 길이만큼 반복문 돌 예정
        var rows = document.getElementById("list").getElementsByTagName("tr");


        // 지금 현재 라인코드 입력창에 입력된 라인코드 값
        var currentCd = $('#chckCd').val();
        var eqmCd = $('#eqmCd').val();
        var eqmNm = $('#eqmNm').val();
        var jdgmnt = $('input[name=jdgmnt]:checked').val();        // 선택된 라디오 값 밸류?
        var dispoMatter = $('input[name=dispoMatter]:checked').val();        // 선택된 라디오 값 밸류?
        var chckFg = $('input[name=chckFg]:checked').val();        // 선택된 라디오 값 밸류?
        var dispoCtnt = $('#dispoCtnt').val();
        var chckPsch = $('#chckPsch').val();
        var chckDt = $('#chckDt').val()

        // 출력 테스트
        console.log(currentCd);
        console.log(eqmCd);
        console.log(eqmNm);
        console.log(jdgmnt);
        console.log(dispoMatter);
        console.log(chckPsch);
        console.log(chckDt);
        console.log("-------------")
        console.log(chckFg);
        console.log(dispoCtnt);


        // 기존에 존재하는 점검코드를 담을 가변 배열
        var cdArr = [];

        // tr 개수만큼 반복돌면서 컬럼값 접근
        for (var r = 0; r < rows.length; r++) {
            var cd = rows[r].getElementsByTagName("td");    // 각 행의 td 태그들

            cdArr.push(cd[0].firstChild.data);		        // 각 행의 td 태그 중 첫번째 태그의 값을 배열에 담자.
                                                            // 근데 .val() 이랑 .data 차이가 뭐지?
            console.log(cdArr);             // 테스트용 출력
        }


        // 만약 현재 라인코드에 입력돼있는 라인코드가 기존의 리스트에 존재한다면! (데이터 수정)
        // indexOf() 는 배열 안에 해당 값이 있으면 1을 반환(?)
        console.log('출력!!!' + cdArr.indexOf(currentCd));

        if (cdArr.indexOf(currentCd) > -1) {    // 배열 안에 해당하는 데이터가 존재하면 1 이 아닌 0을 반환함.
            console.log('업데이트')              // 해당하는 데이터가 존재하지 않으면 -1 반환
            // ajax 사용
            $.ajax({
                url: 'updateCheckList',
                method: 'post',
                data: {
                    chckCd: currentCd,
                    eqmCd: eqmCd,
                    eqmNm: eqmNm,
                    jdgmnt: jdgmnt,
                    dispoMatter: dispoMatter,
                    chckFg: chckFg,
                    dispoCtnt: dispoCtnt,
                    chckPsch: chckPsch,
                    chckDt: chckDt
                },
                success: function (result) {
                    console.log('yaayyy');
                    location.replace('eqCheck');     // 등록 후, 다시 eqLine 페이지 (메인 페이지로)
                }
            })
            // 존재하지 않는다면! (즉, 새로운 라인코드라면.. 데이터 insert)
        } else {
            console.log('인서트')
            // ajax 사용
            $.ajax({
                url: 'insertCheckList',
                method: 'post',
                data: {
                    chckCd: currentCd,
                    eqmCd: eqmCd,
                    eqmNm: eqmNm,
                    jdgmnt: jdgmnt,
                    dispoMatter: dispoMatter,
                    chckFg: chckFg,
                    dispoCtnt: dispoCtnt,
                    chckPsch: chckPsch,
                    chckDt: chckDt
                },
                success: function (result) {
                    console.log('yaayyy');
                    location.replace('eqCheck');     // 등록 후, 다시 eqLine 페이지 (메인 페이지로)
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
    })


    ///////////////////////////////////////////////////////////////////////////////


    // 5. row 하나 클릭 시,
    $('.eachRow').on("click", function (ev) {
        // 5-1. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let chckCdEachRow = $(this).closest("tr").children().eq(1).text();
        let eqmCd = $(this).closest("tr").children().eq(2).text();
        let eqmNm = $(this).closest("tr").children().eq(3).text();
        let dispoMatterSet = $(this).closest("tr").children().eq(4).text();
        let jdgmntSet = $(this).closest("tr").children().eq(5).text();
        let chckPsch = $(this).closest("tr").children().eq(6).text();
        let chckDt = $(this).closest("tr").children().eq(7).text();


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

        // 점검일자
        $('input[name=chckDt]').attr('value', chckDt);
    })
})