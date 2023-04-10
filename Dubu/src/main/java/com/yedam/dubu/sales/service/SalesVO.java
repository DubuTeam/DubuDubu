package com.yedam.dubu.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SalesVO {
	//order sheet 주문서 테이블
	String orderNo;
	String edctsCd;
	String vendCd;
	
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date orderDt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date start;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date end;
	String progAppe;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date paprdDt;
	
	String vendNm; // 제품코드
	String prdtNm; // 제품명 
	int orderCnt;
	String checked;
	String bizNo;
	String telNo;
	String index;
	String defaultValue;
	String edctsLotNo;

}
