package com.naver.kokfitness;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		
		return "index";
	}
	@RequestMapping(value = "jusoPopup", method = RequestMethod.POST)
	public String jusoPopup() {
		
		return "jusoPopup";
	}
	@RequestMapping(value = "program", method = RequestMethod.GET)
	public String program() {
		
		return "program";
	}
	@RequestMapping(value = "staff", method = RequestMethod.GET)
	public String staff() {
		
		return "staff";
	}
	@RequestMapping(value = "services", method = RequestMethod.GET)
	public String services() {
		
		return "services";
	}
	@RequestMapping(value = "adminMainForm", method = RequestMethod.GET)
	public String adminMainForm() {
		
		return "admin_main";
	}
	@RequestMapping(value = "memberMainForm", method = RequestMethod.GET)
	public String memberMainForm() {
		
		return "member/member_main";
	}
}
