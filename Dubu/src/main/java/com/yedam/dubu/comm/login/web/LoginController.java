package com.yedam.dubu.comm.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model){

	    if(error != null){
	    	model.addAttribute("error", "로그인 에러: 계정을 확인하십쇼.");
	    }
	    if(logout != null){
	    	model.addAttribute("logout", "로그아웃됨");
	    }
	}
	
}
