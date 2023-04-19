package com.yedam.dubu.production.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductionVO {
	private int prcsNo;
	public String prcsCd; // 공정코드
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
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	public String planDt;
	public String planCd;
	public int avalStc;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date paprdDt;
	public String vendNm;
	
	// 생상계획 등록
	public String planYn;
	
	// 생산계획 조회
	public String lineCd;
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	public String wkToDt;
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	public String wkFrDt; // 작업 시작일
	public int indicaCnt; // 생산지시 수량
	public int prefRank;
	public String rscNm;
	public String prcLotCd;
	public int oustCnt;
	public String useCnt;
	public String edctsCd; // 완제품코드
	public String rscCd;
	public String oustcnt;
	public int eqSq;
	public String bomCd;
	
	
	// 생산지시
	public int planCnt;     // 계획수량
	public int planNindica; // 미지시수량
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	public String indicaDt;
	public String prodOrderDetailCd;
	public String indicaCd;
	public String prcsProgCd;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
