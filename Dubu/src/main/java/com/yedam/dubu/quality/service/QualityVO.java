package com.yedam.dubu.quality.service;

import java.util.Date;

import lombok.Data;

@Data
public class QualityVO {
	private String edctsLotNo; //완제품 Lot번호
	private String orderNo; // 주문번호
	private String edctsCd; //완제품코드
	private String prdt_nm; //제품명
	private String inspJm; //최종판정
	private Date inspDt; //검사일자
	private String inspPsch; //검사담당자
	
}
