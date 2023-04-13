package com.yedam.dubu.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OustVO {

	String edctsOustNo;// 출고번호
	String edctsCd; // 제품코드
	String edctsLotNo; // 완제품Lot번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date edctsOustDt; // 출고일자
	Integer edctsOustCnt; // 출고수량
	String orderNo; // 주문번호
	
	String prdtNm; // 상품명
	Integer lotCnt; // 완제품 재고량  
	Integer orderCnt; // 주문수량
}
