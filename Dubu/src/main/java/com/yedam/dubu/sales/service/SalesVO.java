package com.yedam.dubu.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SalesVO {
	private String orderNo;
	private String edctsCd;
	private String vendCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDt;
	private String vendNm;
	private String prdtNm;
	private int orderCnt;
	private String progAppe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdDt;

}
