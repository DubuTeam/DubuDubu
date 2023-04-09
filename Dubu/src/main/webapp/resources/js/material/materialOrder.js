/**
 * 자재발주관리 자바스크립트 materialOrder.jsp
 */
 
let material = [];

// 발주할 자재 더블클릭시 작동하는 함수
 function materialOrder(rscCd, rscNm, vendCd, vendNm, avalStc, safStc, OrderCode){
  let tbody = $("#order"); // tbody 선택
  let row = makeTr(rscCd, rscNm, vendCd, vendNm, avalStc, safStc, OrderCode);
  tbody.append(row);
  material.push({rscCd : rscCd, rscNm : rscNm, vendCd : vendCd, vendNm:vendNm, avalStc : avalStc, safStc:safStc, OrderCode:OrderCode})
 }

/*
  $.ajax({
    url: '/materialOrder', // 요청이 전송될 URL 주소
    type: 'post', // http 요청 방식 (default: ‘GET’)
    data: { materialCode : materialCode, accountCode : accountCode }, // 요청 시 포함되어질 데이터
    success: function(data) {
      let tbody = $("#order"); // tbody 선택
      tbody.empty(); // tbody 비우기

      // 데이터 반복문 처리
      $.each(data.result, function (index, item) {
          let row = $("<tr>");

          // td 생성
          row.append($('<input>', {type: 'hidden', name: 'data1', value:'value1' }));
          row.append($('<input>', {type: 'hidden', name: 'data1', value:'value1' }));

          let checktd = $("<td>");
          checktd.append($('<input>', {type: 'checkbox'}));
          row.append(checktd);

          row.append($("<td>").text(item.rscCd));
          row.append($("<td>").text(item.rscNm));
          row.append($("<td>").text(item.vendCd));
          row.append($("<td>").text(item.vendNm));

          checktd = $("<td>");
          checktd.append($('<input>', {type: 'text'}));
          row.append(checktd);

          row.append($("<td>").text(item.avalStc));
          row.append($("<td>").text(item.safStc));
          row.append($("<td>").text(item.avalStc));

          checktd = $("<td>");
          checktd.append($('<input>', {type: 'date'}));
          row.append(checktd);

          row.append(td);
          tbody.append(row);
      })
    },
    error: function(err) {
      console.log(err)
    },
  
  })
*/

// tr 태그 만들어서 반환하는 함수
function makeTr(rscCd, rscNm, vendCd, vendNm, avalStc, safStc, OrderCode){

  let row = $("<tr>").data('rscCd',rscCd);

  // td 생성
  let checktd = $("<td>");
  checktd.append($('<input>', {type: 'checkbox', name : 'RowCheck', value : rscCd}));
  row.append(checktd); // 체크박스

  row.append($("<td>").text(rscCd)); // 자재코드
  row.append($("<td>").text(rscNm)); // 자재명
  row.append($("<td>").text(vendCd)); // 업체코드
  row.append($("<td>").text(vendNm)); // 업체명

  checktd = $("<td>");
  checktd.append($('<input>', {type: 'text', class : OrderCode ,value : OrderCode})); // 발주코드
  row.append(checktd);

  checktd = $("<td>");
  checktd.append($('<input>', {id : rscCd ,type: 'text', value : '0' , onchange : "expected(this)"})); // 발주수량
  row.append(checktd);

  row.append($("<td>").addClass( 'avalStc' ).text(avalStc)); // 현재재고
  row.append($("<td>").text(safStc)); // 안전재고
  row.append($("<td>").addClass( 'expect' ).text(avalStc)); // 예상재고량

  checktd = $("<td>");
  checktd.append($('<input>', {type: 'date', onchange : "requestDate(this)" })); // 납기요청일
  row.append(checktd);

  return row;

 }

 // 발주수량이 변화할경우 실행하는 함수
 function expected(obj){
    let orderCount = $(obj).val(); // 발주수량
    let parentTr = $(obj).parent().parent(); // tr
    let avalStc = parentTr.find('.avalStc').text(); // 현재 재고량
    let total = parseInt(avalStc) + parseInt(orderCount);

    parentTr.find('.expect').css('color','red').text(total); // 예상재고량 넣기

    for(let i = 0; i < material.length; i++){  
        if(parentTr.data('rscCd') == material[i].rscCd){
        material[i].orderCount =  orderCount;
      }
    }
 }

 // 날짜가 변화할경우 실행하는 함수
 function requestDate(obj){
  let reqDate = $(obj).val(); // 납기 요청일
  let parentTr = $(obj).parent().parent(); // tr
  
  for(let i = 0; i < material.length; i++){  
    if(parentTr.data('rscCd') == material[i].rscCd){
      material[i].requestDate = reqDate;
    }
  }
}

$(document).ready(function(){

  let rscCds = ""; // 자재코드
  let orderCode = ""; // 발주번호
  let orderCount = ""; // 발주수량 
  let requestDate= ""; // 납기요청일


  // 발주버튼을 눌렀을떄 실행하는 함수
  $('#saveBtn').on('click',function() {
    let chkObj = document.getElementsByName("RowCheck"); // name 속성이 RowCheck인것을 모두 가져옴
    for (let i = 0; i < chkObj.length; i++) {
      if (chkObj[i].checked == true) {
        rscCds = rscCds + chkObj[i].value + ","; // 자재코드
        
        for(let j = 0 ; j < material.length; j++){
          if(material[j].rscCd == chkObj[i].value){ // 자재코드가 같다면
            orderCode = orderCode + material[j].OrderCode + ",";  // 발주번호(코드) 받아오기
            orderCount = orderCount + material[j].orderCount + ","; // 발주수량 받아오기
            requestDate = requestDate + material[j].requestDate + ","; // 납기요청일
            material.splice(j, 1);
          }
        }

        console.log(rscCds); // 자재코드
        console.log(orderCode); // 발주번호
        console.log(orderCount); // 발주수량
        console.log(requestDate); // 납기요청일
  
        let data = {
          param : 'insert', // 삽입
          rscCd : rscCds, // 자재코드
          ordrCd : orderCode, // 발주번호
          ordrCnt : orderCount, // 발주수량
          paprdCmndDt : requestDate // 납기요청일
        }
  
        $.ajax({
            url: '/materialOrder',
            method: 'post', 
            data: data, // 쿼리스트링
            success: function (result) {
              if (result.retCode == 'Success') {
                //chkObj[i].parent().parent().remove();
                $('chkObj[i]').parent().parent().remove('tr');
              } else {
                alert("삭제 오류!!");
              }
            },
            error: function (reject) {
              console.log(reject);
            }
          })
      }
    }
  });
});