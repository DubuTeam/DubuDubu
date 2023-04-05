package com.yedam.dubu.comm.bom.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.dubu.comm.bom.service.CommService;

@Controller
public class CommController {

	@Autowired
	CommService commService;
	
}
