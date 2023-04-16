$(document).ready(function () {
    // alert('Hello!')

    console.log("다음 비가동코드 => " + $('#noprCd').val())



    // . 초기화 버튼 눌렀을 때..
    $('#initBtn').on("click", function (e) {
        $("#dataForm")[0].reset();      // id 가 dataForm 인 form 태그 전체 초기화
        $('#eqmIstDt').val(null);       // 달력도 초기화
    })


    // 3. 공정명 옵션 클릭 시, 공정코드 자동 입력
    $('#eqmNm').on('change', function () {
        // 공정코드 input 태그에다가 선택된 해당 option의 value 를 넣음
        $('#eqmCd').val(this.value);
    })
})