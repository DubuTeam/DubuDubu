package com.yedam.dubu.sales.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class VendVO {
	//  거래처 테이블  
	String vendCd;
	String vendNm;
	String binzo;
	String telno;
	String vendTyp;
	String remk;
}