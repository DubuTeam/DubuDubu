package com.yedam.dubu.sales.service;

import lombok.Data;

@Data
public class SalesVO {
	private String orderNo;
	private String edctsCd;
	private String vendCd;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String orderDt;
	private String vendNm;
	private String prdtNm;
	private int orderCnt;
	private String progAppe;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String paprdDt;

}
