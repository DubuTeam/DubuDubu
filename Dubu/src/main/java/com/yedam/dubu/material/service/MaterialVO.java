package com.yedam.dubu.material.service;

import lombok.Data;

@Data
public class MaterialVO {
	
	// 자재정보 테이블
	private String rscCd; // 자재코드
	private String vendCd; // 거래처코드 fk
	private String rscNm; // 자재명 
	private String rscSpec; // 자재규격 
	private String mngUnit; // 자재단위 
	private String rscTyp; // 자재유형
	private int safStc; // 안전재고 		
	private String userYn; // 사용여부 
	
	// 자재재고테이블
	private int avalStc; // 현재재고
	
	// 거래처 테이블
	private String vendNm; // 거래처명
	
}
