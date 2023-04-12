package com.yedam.dubu.production.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

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
	public int orderCnt;
	public String prdtNm;
	
	// 주문서 디테일 조회
	public String planDt;
	public String planCd;
	public String avalStc;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date paprdDt;
	public String vnedNm;
	
	// 생상계획 등록
	public String planYn;
	
	// 생산계획 조회
	public String lineCd;
	@DateTimeFormat(pattern="yyyy-MM--dd")
	public Date wkToDt;
	@DateTimeFormat(pattern="yyyy-MM--dd")
	public Date wkFrDt;
	public int indicaCnt;
	public int prefRank;
	public String rscNm;
	public String prcLotCd;
	public int oustCnt;
	public String useYn;
}
