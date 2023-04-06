package com.yedam.dubu.equipment.service;

import lombok.Data;

@Data
public class EquipmentVO {
	// 설비라인 테이블 (EQM_LINE 테이블)
	private String lineCd;			// 라인코드
	private String lineNm;			// 라인명
	private String eqmPsch;			// 라인 담당자
	private int uphCnt;				// UPH 생산량
	private String useYn;			// 사용 여부
}