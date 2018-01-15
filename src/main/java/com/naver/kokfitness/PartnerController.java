package com.naver.kokfitness;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PartnerController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "partnerInsertForm", method = RequestMethod.GET)
	public String partnerInsertForm() {
		
		return "partner/partner_insert";
	}
}
