package com.yedam.dubu.quality.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.dubu.equipment.service.EquipmentVO;
import com.yedam.dubu.quality.mapper.QualityMapper;
import com.yedam.dubu.quality.service.QualityService;
import com.yedam.dubu.quality.service.QualityVO;
import com.yedam.dubu.quality.service.RscInfVO;
import com.yedam.dubu.quality.service.RscInspVO;

@Service
public class QualityServiceImpl implements QualityService {

	@Autowired
	QualityMapper qualityMapper;

	@Override
	public List<QualityVO> selectQualityList() {

		return qualityMapper.selectQualityList();
	}

	@Override
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO) {

		return qualityMapper.getPrdtInsp(qualityVO);
	}

	@Override
	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO) {

		return qualityMapper.getPrdtInspDtl(qualityVO);
	}

	// 입고검사등록
	@Override
	public List<QualityVO> getMatVendList(QualityVO qualityVO) {
		// TODO Auto-generated method stub
		return qualityMapper.getMatVendList(qualityVO);
	}

	@Override
	public List<QualityVO> getMatOrdrList(QualityVO qualityVO) {
		// TODO Auto-generated method stub
		return qualityMapper.getMatOrdrList(qualityVO);
	}

	@Override
	@Transactional
	public void setRscInspList(List<RscInspVO> rscInspVOS) {
		// rsc_insp insert
		String rscInspCd = qualityMapper.genRscInspCd(); // 검사코드부여
		RscInspVO vo = rscInspVOS.get(0); // 검사 테이블 헤더
		rscInspVOS.remove(0); // remove 
		vo.setRscInspCd(rscInspCd);
		qualityMapper.setRscInsp(vo);

		// rsc_insp_dtl insert
		for (RscInspVO rscInspVO : rscInspVOS) {

			// when ordrCd doesn't exist -> gen cd and set cd
			if (rscInspVO.getOrdrCd() == null) {
				String noOrdrCd = qualityMapper.genRscNoOrdrCd();
				rscInspVO.setOrdrCd(noOrdrCd);
			}

			// set rsc insp dtl each
			rscInspVO.setRscInspCd(rscInspCd);
			qualityMapper.setRscInspList(rscInspVO);
			qualityMapper.updRscOrdrRmnCnt(rscInspVO); 

			// set rsc inf list each
			if (rscInspVO.getRscInfList() != null) {
				for (RscInfVO rscInfVO : rscInspVO.getRscInfList()) {
					qualityMapper.setRscInfList(rscInspVO, rscInfVO);
				}
			}
		}
	}

	@Override // 검사상세
	public List<QualityVO> getInfCdList() {

		return qualityMapper.getInfCdList();
	}

	// 입고검사 수정
	@Override
	public List<RscInspVO> schRscInspHist(RscInspVO rscInspVO) {
		return qualityMapper.schRscInspHist(rscInspVO);
	}

	

	/*
	 * @Override public List<RscInspVO> upRscProg(RscInspVO rscInspVO) { return
	 * qualityMapper.upRscProg(rscInspVO.getOrdrCd()); }
	 */

	/*
	 * @Override public List<QualityVO> getResources(QualityVO qualityVO) { // TODO
	 * Auto-generated method stub return qualityMapper.getResources(qualityVO); }
	 */

	@Override
	@Transactional
	public void delRscInspHistAll(List<RscInspVO> rscInspVOS) {
		for (RscInspVO vo : rscInspVOS) {
			qualityMapper.delRscInspHistSingle(vo);
		}
		qualityMapper.delRscInspHist(rscInspVOS.get(0));
	}
	@Override
	@Transactional
	public int upRscProg(List<RscInspVO> rscInspVO) {
		int cnt = 0;
	    for(RscInspVO vo : rscInspVO) {
	    	if(vo.getOrdrCd() == null) continue;
	    	cnt += qualityMapper.upRscProg(vo);
	    }
		return cnt;
	}
	
	@Override
	public List<RscInfVO> selectAllEmpListInModal() {
        return qualityMapper.selectAllEmpListInModal();
    }
}






