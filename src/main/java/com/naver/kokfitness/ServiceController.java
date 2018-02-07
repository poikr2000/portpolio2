package com.naver.kokfitness;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "serviceListForm", method = RequestMethod.GET)
	public ModelAndView serviceListForm() {
		ModelAndView mav = new ModelAndView("service/service_list");
		return mav;
	}
}
