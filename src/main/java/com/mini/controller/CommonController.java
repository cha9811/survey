package com.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class CommonController{

	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if(error !=null) {
			model.addAttribute("error", "Login rror Check Tour Account");
		}
		
		if(logout !=null) {
			model.addAttribute("logout", "logout!!!");
		}
	}
	
	@GetMapping("/accessError")
    public String accessError() {
        return "accessError"; // accessError.jsp와 같은 뷰를 반환
    }
	

}
