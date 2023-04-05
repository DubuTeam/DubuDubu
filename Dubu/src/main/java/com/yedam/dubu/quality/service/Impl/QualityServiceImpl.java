package com.yedam.dubu.quality.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.quality.mapper.QualityMapper;
import com.yedam.dubu.quality.service.QualityService;

@Service
public class QualityServiceImpl implements QualityService {

	@Autowired
	QualityMapper qualityMapper;
}
