$(document).ready(function () {

    console.log("다음 설비 라인 코드 => " + $('#lineCd').val())


    // 라인 관리 페이지
    // 1. row 하나 클릭 시,
    $('.eachRow').on("click", function (e) {
        // 2. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let lineCode = $(this).closest("tr").children().eq(0).text();
        let lineName = $(this).closest("tr").children().eq(1).text();
        let emp = $(this).closest("tr").children().eq(2).text();
        let uph = $(this).closest("tr").children().eq(3).text();
        let yn = $(this).closest("tr").children().eq(4).text();


        // 3-1. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
        $('#lineCd').val(lineCode);
        $('#lineNm').val(lineName);
        $('#emp').val(emp);
        $('#uph').val(uph);

        // 3-2. Yes or No 의 경우, radio 버튼 바꿔가면서 선택되도록!
        if (yn.toUpperCase() === "Y") {
            $("#ynY").prop("checked", true);
        } else if (yn.toUpperCase() === "N") {
            $("#ynN").prop("checked", true);
        }
    })


    // 2. 초기화 버튼 눌렀을 때..
    $('#initBtn').on("click", function (e) {
        $("#dataForm")[0].reset();      // id 가 dataForm 인 form 태그 전체 초기화
        $('#lineCd').val($('#lineCd').data('original-value'));
    })


    // 3. 저장 버튼 눌렀을 때(라인코드가 기존에 존재하면 수정, 존재하지 않으면 insert)
    $('#saveBtn').on("click", function (e) {

        // rows = 전체 데이터행 (tr)    -> 이것들의 길이만큼 반복문 돌 예정
        var rows = document.getElementById("list").getElementsByTagName("tr");


        // 지금 현재 라인코드 입력창에 입력된 라인코드 값
        var currentCd = $('#lineCd').val();
        var lineNm = $('#lineNm').val();
        var uph = $('#uph').val();
        var emp = $('#emp').val();
        var use = $('input[name=yn]:checked').val();        // 선택된 라디오 값 밸류?

        if(lineNm.value == '' || uph.value == '' || $('input[name=yn]:checked').val() == undefined) {
            toastr.error('필수 항목들을 모두 입력하세요');

            $('input[name=lineNm]').css('border', 'solid 2px red')
            $('input[name=uph]').css('border', 'solid 2px red')
            $('input[name=emp]').css('border', 'solid 2px red')
            $('#ynSet').css('border', 'solid 2px red')
        }


        // 기존에 존재하는 라인코드를 담을 가변 배열
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
                url: 'updateEqLine',
                method: 'post',
                data: {
                    lineCd: currentCd,
                    lineNm: lineNm,
                    linePsch: emp,
                    uphCnt: uph,
                    useYn: use
                },
                success: function (result) {
                    console.log('yaayyy');
                    location.replace('eqLine');     // 등록 후, 다시 eqLine 페이지 (메인 페이지로)
                }
            })
            // 존재하지 않는다면! (즉, 새로운 라인코드라면.. 데이터 insert)
        } else {
            console.log('인서트')
            // ajax 사용
            $.ajax({
                url: 'insertEqLine',
                method: 'post',
                data: {
                    lineCd: currentCd,
                    lineNm: lineNm,
                    linePsch: emp,
                    uphCnt: uph,
                    useYn: use
                },
                success: function (result) {
                    console.log('yaayyy');
                    location.replace('eqLine');     // 등록 후, 다시 eqLine 페이지 (메인 페이지로)
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
    })



    ///////////////////// 데이터 수정 및 insert 를 위한 테스트 /////////////////////////


    // var rows = document.getElementById("list").getElementsByTagName("tr");
    // console.log(rows.length);	// tbody tr 개수 = 2

    // // tr만큼 루프돌면서 컬럼값 접근
    // for(var r = 0; r < rows.length; r++) {
    //     var cd = rows[r].getElementsByTagName("td");

    //     var cell_1 = cd[0].firstChild.data;		// 라인코드
    //     var cell_2 = cd[1].firstChild.data;		// 라인명
    //     var cell_3 = cd[2].firstChild.data;		// 담당자
    //     var cell_4 = cd[3].firstChild.data;		// UPH생산량
    //     var cell_5 = cd[4].firstChild.data;		// 사용여부

    //     console.log(cell_1);	//  LINE0001, LINE0002 ...
    //     console.log(cell_2);	//  A.일반두부, B.순-연두부
    //     console.log(cell_3);	//  박종민2, 김팔춘2,
    //     console.log(cell_4);    //  100, 300, 350
    //     console.log(cell_5);    //  Y, N, Y
    // }


    // 4. 삭제
    // 삭제 버튼 누른 후, 다시 한 번 삭제 확인 버튼 누르면...
    $('#confirmBtn').on("click", function (e) {
        let currentCd = $('#lineCd').val();     // input 창에 있는 라인코드 값을 가져옴.
        console.log(currentCd);

        $.ajax({
            url: 'deleteEqLine',
            method: 'post',
            data: {
                lineCd: currentCd
            },
            success: function (result) {
                console.log('삭제성공입니다~~~');
                $('#exampleModal').click();         // 모달창 닫기,  .click() 혹은 .hide() ..?
                location.replace('eqLine');     // 등록 후, 다시 eqLine 페이지 (메인 페이지로)
            }
        })
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

            $('#emp').val(empNm);
            
            $('#exampleModal222').click();          // 모달 창 닫기
        });
    
    
    //////////////////////////////////////////////////////////////////////////////
});