package com.yedam.dubu.production.service;

import java.util.List;
import lombok.Data;

@Data
public class ProductionVO {
	private int prcsNo;
	public String prcsCd;
	private String eqmCd;
	private String prcsNm;
	private String prcsFg;
	private String prcsCtnt;
	private String prcsDiv;
	private List<ProductionVO> createdRows;
	private List<ProductionVO> updatedRows;
	private List<ProductionVO> deletedRows;
	
	// 주문서 조회
	public String orderNo;
	public String vendNm;
	public String prdtNm;

}
