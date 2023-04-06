package com.yedam.dubu.material.service;

import lombok.Data;

@Data
public class MaterialVO {

	private String rscCd; // 자재코드
	private String vendCd; // 거래처코드 fk
	private String rscNm; // 자재명 
	private String rscSpec; // 자재규격 
	private String mngUnit; // 자재단위 
	private String rscTyp; // 자재유형
	private int safStc; // 안전재고 		
	private String userYn; // 사용여부 
	
}
