package com.yedam.dubu.comm.bom.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.dubu.comm.bom.service.CommService;

@Controller
public class CommController {

	@Autowired
	CommService commService;
	
	// BOM관리
	@GetMapping("/bom")
	public String getBom(Model model) {
		return "display/bom";
	}
}
