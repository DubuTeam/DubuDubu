package com.yedam.dubu.production.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ProductionVO {
	private String prcsCd;
	private String eqmCd;
	private String prcsNm;
	private String prcsFg;
	private String prcsCtnt;
	private String prcsDiv;
	private List<ProductionVO> createdRows;
	private List<ProductionVO> updatedRows;
	private List<ProductionVO> deletedRows;
	
	// 주문서조회
	private String opderNo;	// 주문번호
	private String vendNM;	// 거래처 
	private String prdtNm;	// 제품명
}
