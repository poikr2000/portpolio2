package com.naver.kokfitness;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Staff;
import com.naver.kokfitness.service.StaffDAO;

@Controller
public class StaffController {
	@Autowired
	Staff staff;
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "staffInsertForm", method = RequestMethod.GET)
	public String staffInsert() {
		
		return "staff/staff_insert";
	}
	
	@RequestMapping(value = "staffCodeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int staffCodeConfirm(@RequestParam String code) {
		StaffDAO dao=sqlSession.getMapper(StaffDAO.class);
		System.out.println("---------"+code);
		int result=0;
		try {
			result=dao.codeConfirm(code);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "staffInsert", method = RequestMethod.POST)
	public String staffInsert(@ModelAttribute("staff") Staff staff,
			@RequestParam CommonsMultipartFile imgfile) {
		String path="D:/STSSOURCE/kokfitness/src/main/webapp/resources/uploadfiles/";
		String realpath="resources/uploadfiles/";
		String originalname =imgfile.getOriginalFilename();
		String staffname = staff.getName();
		try {
			byte bytes[] = imgfile.getBytes();
			BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+staffname+originalname));
			output.write(bytes);
			output.flush();
			output.close();
		} catch (Exception e) {
		}
		StaffDAO dao=sqlSession.getMapper(StaffDAO.class);
		try {
			staff.setPhoto(realpath+staffname+originalname);
			dao.staffInsert(staff);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:staffList";
	}
	
	@RequestMapping(value = "staffList", method = RequestMethod.GET)
	public ModelAndView memberList(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("staff/staff_insert");
		StaffDAO dao=null;
		dao=sqlSession.getMapper(StaffDAO.class);
		ArrayList<Staff> staffs = dao.staffListAll();
		mav.addObject("staffs",staffs);
		return mav;
	}
	@RequestMapping(value = "staffDelete", method = RequestMethod.POST)
	public String staffDelete(@RequestParam ("staffunitchk") List<String> staffunitchk) {
		StaffDAO dao=null;
		dao=sqlSession.getMapper(StaffDAO.class);
		for(String unit : staffunitchk) {
			dao.staffDelete(unit);
	    }
		return "redirect:staffList";
	}
	
	@RequestMapping(value = "staffDetail", method = RequestMethod.POST)
	@ResponseBody
	 public Staff buyDetail(@RequestParam String code) {
		StaffDAO staffdao=sqlSession.getMapper(StaffDAO.class);
		Staff staff = staffdao.staffGetOne(code);
		return staff;
	}
	
	@RequestMapping(value = "staffUpdate", method = RequestMethod.POST)
	public String staffUpdate(@ModelAttribute("staff") Staff staff,
			@RequestParam CommonsMultipartFile imgfile) {
		String path="D:/STSSOURCE/kokfitness/src/main/webapp/resources/uploadfiles/";
		String realpath="resources/uploadfiles/";
		String originalname =imgfile.getOriginalFilename();
		String staffname = staff.getName();
		try {
			byte bytes[] = imgfile.getBytes();
			BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+staffname+originalname));
			output.write(bytes);
			output.flush();
			output.close();
		} catch (Exception e) {
		}
		StaffDAO dao=sqlSession.getMapper(StaffDAO.class);
		try {
			if(originalname.equals("")) {
				staff.setPhoto(staff.getBeforephoto());
			}else {
				staff.setPhoto(realpath+staffname+originalname);
			}
			dao.staffUpdate(staff);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:staffList";
	}
}
