package com.yedam.dubu.quality.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;


	@Data
	@NoArgsConstructor
	public class RscInspVO {

	    // condtions
	    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date startDt;
	    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date endDt;

	    private String rscCd; //자재코드
	    private String rscNm; // 자재품명
	    private String rscSpec; // 자재규격
	    private String mngUnit; // 관리단위
	    private String rscTyp; // 자재 유형

	    private String ordrCd; // 발주코드
	    private String vendCd; // 공급업체 코드
	    private String vendNm; // 공급업체 이름
	    private int ordrCnt; // 발주수량
	    private int preIstCnt; // 가입고수량

	    private String rscInspCd; // 검사코드
	    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date inspDt; // 검사일자
	    private String inspTstr; // 검사자
	    private int inspCnt; //검사수량
	    private int inspPassCnt; // 합격수량
	    private int inspFailCnt; // 불량수량

	    private int passRmnCnt; // 합격잔여수량

	    private String from; // from where?

	    private List<RscInfVO> rscInfList; //불량목록
	
}
