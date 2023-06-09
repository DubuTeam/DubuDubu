package com.yedam.dubu.performpro.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PerformproVO {
	private int prcsNo;
	private String prcsCd; 	// 공정코드
	private String eqmCd;	// 설비코드
	private String prcsNm; 	// 공정명
	private String prcsFg;
	private String prcsCtnt;
	private String prcsDiv;
	private List<PerformproVO> createdRows;
	private List<PerformproVO> updatedRows;
	private List<PerformproVO> deletedRows;
	
	// 주문서 조회
	private String orderNo;
	private int orderCnt;
	
	// 주문서 디테일 조회
	@DateTimeFormat(pattern="yyyy-MM--dd")
	private Date planDt;
	private String planCd;
	private String avalStc;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date paprdDt;
	private String vendNm;
	
	// 생상계획 등록
	private String planYn;
	
	// 생산계획 조회
	private String lineCd;
	@DateTimeFormat(pattern="yyyy-MM--dd")
	private Date wkToDt;
	private int prefRank;
	private String rscNm; 		// 자재명
	private String prcLotCd;
	private int oustCnt; 		// 자재소모수량
	private String useCnt;
	private String rscCd; 		// 자재코드
	private int eqSq;
	
	
	// 생산지시
	private int planCnt;     	// 계획수량
	private int planNindica; 	// 미지시수량
	
	
	// 생산지시 헤더
	private String indicaCd; // 생산지시 헤더 코드
	private String indicaDt; // 생산 지시 일자
	private int prodCount; // 만들 생산 제품 수
	
	// 생산지시 디테일
	private String prodOrderDetailCd; // 생산지시 디테일 코드
	private String bomCd; // BOM코드
	private String wkFrDt2; // 작업 시작일
	private String edctsCd; // 완제품코드
	private int indicaCnt; // 생산지시 수량
	@DateTimeFormat(pattern="yyyy-MM--dd")
	private Date wkFrDt; // 작업 시작일
	private String indicaDtlComplete; // 지시 제품 생산 완료여부
	
	// BOM 테이블
	private String prdtNm; // 완제품명
	
	// 진행 공정 관리 테이블
	private String prcsPr; // 공정 순서
	private String complete; // 생산완료여부
	private int prcsStock; // 입고량(전공정에서 넘어오는 생산끝난 놈)
	private int rpcsCnt; // 각공정마다 작업량(생산량)
	private int prcsErrorCnt; // 각 공정마다의 불량량
	
	
	// 설비 관리 테이블
	private String eqmNm; // 설비명
	private String eqmYn; // 설비 사용 여부
	
	// 공정실적
	private String fpWorker; // 담당자
	private String fpStart; // 작업 시작 시간
	private String fpEnd; // 작업 종료시간
	private int fpErrorCnt; // 불량률
	private int fpWorkCnt; // 작업량
	
	
	
}
