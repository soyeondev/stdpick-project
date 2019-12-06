package com.bit.std_1st.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.std_1st.vo.LoginVo;

@SessionAttributes("loginVo")
@Controller
public class IndexController {

	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}
	
	
	@RequestMapping("/index.do")
	public Model index(@ModelAttribute("loginVo")LoginVo lv, Model model) {
		model.addAttribute("loginVo", lv);
		return model;
	}

	@RequestMapping("/intro")
	public Model intro(@ModelAttribute("loginVo")LoginVo lv, Model model) {
		model.addAttribute("loginVo", lv);
		return model;
	}
	

	

	/*
	 * @RequestMapping("/intro") public void intro() { }
	 */

	

	@RequestMapping("/login")
	public void login() {
		
	}
	
	@RequestMapping("/blank")
	public void blank() {
	}
	
	
	@RequestMapping("/memberpersonal") 
	public void memberpersonal() { 
	}
	 
	
	/*
	 * @RequestMapping("/memberpersonalmodify") public void memberpersonalmodify() {
	 * }
	 */
	
	@RequestMapping("/memberprovider")
	public void memberprovider() {
	}
	
	/*
	 * @RequestMapping("/memberprovidermodify") public void memberprovidermodify() {
	 * }
	 */
	

}
