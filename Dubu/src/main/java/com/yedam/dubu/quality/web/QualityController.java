package com.yedam.dubu.quality.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.dubu.quality.service.QualityService;

@Controller
public class QualityController {

	@Autowired
	QualityService qualityService;
}
