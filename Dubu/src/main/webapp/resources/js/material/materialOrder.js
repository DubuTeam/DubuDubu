/**
 * 자재발주관리 자바스크립트 materialOrder.jsp
 */
 
 function materialOrder(rscCd, rscNm, vendCd, vendNm, avalStc, safStc){
    
  let tbody = $("#order"); // tbody 선택
  let row = $("<tr>");

  // td 생성
  row.append($('<input>', {type: 'hidden', name: 'data1', value:'value1' }));
  row.append($('<input>', {type: 'hidden', name: 'data1', value:'value1' }));

  let checktd = $("<td>");
  checktd.append($('<input>', {type: 'checkbox'}));
  row.append(checktd);

  row.append($("<td>").text(rscCd));
  row.append($("<td>").text(rscNm));
  row.append($("<td>").text(vendCd));
  row.append($("<td>").text(vendNm));

  checktd = $("<td>");
  checktd.append($('<input>', {id : rscCd, type: 'text', value : avalStc , onchange : "expected(rscCd)"}));
  row.append(checktd);

  row.append($("<td>").text(avalStc));
  row.append($("<td>").text(safStc));
  row.append($("<td>").text(expected(rscCd)));

  checktd = $("<td>");
  checktd.append($('<input>', {type: 'date'}));
  row.append(checktd);

  tbody.append(row);


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
 }

 function expected(rscCd){
    console.log(rscCd);
    let order = $('#'+rscCd).text();
    console.log(order);
    
 }