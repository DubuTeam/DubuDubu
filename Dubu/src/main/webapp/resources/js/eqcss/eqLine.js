$(document).ready(function () {
    // 라인 관리 페이지
    // 1. row 하나 클릭 시,
    $('.eachRow').on("click", function (e) {
        // 2. 해당 행에 입력된 데이터를 받아옴.     (가장 가까운 tr태그의 각 셀들)
        let lineCode = $(this).closest("tr").children().eq(0).text();
        let lineName = $(this).closest("tr").children().eq(1).text();
        let staff = $(this).closest("tr").children().eq(2).text();
        let uph = $(this).closest("tr").children().eq(3).text();
        let yn = $(this).closest("tr").children().eq(4).text();


        // 3-1. 그리고 jsp 파일의 input 태그에다가 위 데이터를 집어넣는다.
        $('#lineCd').val(lineCode);
        $('#lineNm').val(lineName);
        $('#staff').val(staff);
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
    })


    // 3. 저장 버튼 눌렀을 때(라인코드가 기존에 존재하면 수정, 존재하지 않으면 insert)
    $('#saveBtn').on("click", function (e) {

        // rows = 전체 데이터행 (tr)    -> 이것들의 길이만큼 반복문 돌 예정
        var rows = document.getElementById("list").getElementsByTagName("tr");


        // 지금 현재 라인코드 입력창에 입력된 라인코드 값
        var currentCd = $('#lineCd').val();
        var lineNm = $('#lineNm').val();
        var uph = $('#uph').val();
        var staff = $('#staff').val();
        var use = $('input[name=yn]:checked').val();        // 선택된 라디오 값 밸류?

        // 출력 테스트
        console.log(currentCd);
        console.log(lineNm);
        console.log(uph);
        console.log(staff);
        console.log(use);


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
                    eqmPsch: staff,
                    uphCnt: uph,
                    useYn: use
                },
                success: function (result) {
                    console.log('yaayyy');
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
                    eqmPsch: staff,
                    uphCnt: uph,
                    useYn: use
                },
                success: function (result) {
                    console.log('yaayyy');
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
            }
        })
    })
});