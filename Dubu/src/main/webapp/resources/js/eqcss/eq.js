$(document).ready(function () {
    // alert('연결테스트');

    // 1. 설비구분 옵션 선택 시, 설비코드 자동 입력
    $("select[name=eqmFg]").change(function() {
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
    $("select[name=lineNm]").change(function() {
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
    $('#prcsNm').on('change', function() {
        // 선택된 해당 option 의 value  =>  this.value
        // console.log(this.value);

        // 공정코드 input 태그에다가 선택된 해당 option의 value 를 넣음
        $('#prcsCd').val(this.value);
    })


    //////////////////////////////////////////////////////////////////////////


    // 등록 버튼 눌렀을 때
    $('#insertBtn').on("click", function() {
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
        if ($('#eqmCd').val() == '' || $('#lineCd').val() == '' ||  $('#prcsCd').val() == '' || eqmNm.value == '' || chckPerd.value == '' || eqmIstDt.value == '' || $('input[name=useYN]:checked').val() == undefined) {
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
            let prcsNm = $('#prcsNm').val()
            let eqmNm = $('#eqmNm').val()
            let chckPerd = $('#chckPerd').val()
            let minTemp = $('#minTemp').val()
            let maxTemp = $('#maxTemp').val()
            let eqmYn = $('input[name=useYN]:checked').val()

            // 출력 테스트
            console.log(eqmCd)
            console.log(eqmNm)
            console.log(eqmYn)


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
                    eqmYn: eqmYn
                },
                success: function (result) {
                    console.log('데이터 잘 보냄! -> ' + result);
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
    })



    

})