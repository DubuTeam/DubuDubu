package com.yedam.dubu.production.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.dubu.production.service.ProductionService;

@Controller
public class ProductionController {

	@Autowired
	ProductionService ProductionService;
}
