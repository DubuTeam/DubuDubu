package com.yedam.dubu.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PrdtInspVO {

	String edctsLotNo;
	String edctsCd;
	String orderNo;
	String inspPsch;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date inspDt;
	Integer inspCnt;
	String inspJm;

	String inspCd;
	String inspNm;
	String inspSd;
	String inspRsltDtl;
	String inspJmDtl;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date startDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date endDt;

	String edctsNm;

	String prdtNm;
	
	private String prcsProgCd;
	private String prcsCd;
	private String prodOrderDetailCd;
	private int prcsPr;
	private int prcsStock;
	private int prcsCnt;
	private String complete;

	
	private String indicaCd;
	private String bomCd;
	private Date wkFrDt;
	
	private int indicaCnt;

}
