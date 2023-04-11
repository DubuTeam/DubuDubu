$(document).ready(function () {
    // alert('연결테스트');

    // 1. 설비구분 옵션 선택 시, 설비코드 자동 입력
    $("select[name=eqmFg]").change(function(){
        // console.log($(this).val()); // value값 가져오기     (1 등)
        // console.log($("select[name=eqmFg] option:selected").text()); //text값 가져오기 (충전설비 등)

        if($(this).val() == 1) {
            $('#eqmCd').val("AAA001")
        } else if($(this).val() == 2) {
            $('#eqmCd').val("BBB002")
        } else if($(this).val() == 3) {
            $('#eqmCd').val("BBB003")
        }
    });


    // 2. 라인명 옵션 선택 시, 라인코드 자동 입력
    $("select[name=lineNm]").change(function() {
        // 라인명 탭의 n번째 option 태그를 선택할 때, 라인코드 인풋에다가 특정 값 넣기
        var idx = $("#lineNm option").index($("#lineNm option:selected"));

            // 만약 0번째 option 태그인  ==등록시 필수선택== 을 클릭 시, 빈 칸
            if (idx == 0) {
                $('#lineCd').val('');
            }
            // 그게 아니라면, n번째에 맞도록 라인코드도 똑같이
            else if ($(`#lineNm option:eq(${idx})`).prop("selected", true)) {
                $('#lineCd').val(`LINE000${idx}`);
            }
    });


    // 3. 공정명 옵션 클릭 시, 공정코드 자동 입력
    $('#prcsNm').on('change', function() {
        // 선택된 해당 option 의 value  =>  this.value
        // console.log(this.value);

        // 공정코드 input 태그에다가 선택된 해당 option의 value 를 넣음
        $('#prcsCd').val(this.value);
    })
})