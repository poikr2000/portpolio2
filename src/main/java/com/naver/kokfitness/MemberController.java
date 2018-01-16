package com.naver.kokfitness;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Member;
import com.naver.kokfitness.entities.Program;
import com.naver.kokfitness.service.MemberDAO;

@Controller
public class MemberController {
	@Autowired
	Member member;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "memberTerms", method = RequestMethod.GET)
	public String memberTerms() {
		
		return "member/member_terms";
	}
	@RequestMapping(value = "memberInsertForm", method = RequestMethod.GET)
	public String memberInsertForm() {
		
		return "member/member_insert";
	}
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	public ModelAndView memberList() {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		ModelAndView mav = new ModelAndView("member/member_list");
		ArrayList<Member> members = dao.memberListAll();
		mav.addObject("members",members);
		
		return mav;
	}
	@RequestMapping(value = "memberDetail", method = RequestMethod.GET)
	public ModelAndView memberDetail(@RequestParam String email) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		Member member=dao.memberGetOne(email);
		ArrayList<Program> programs=dao.programListAll();
		ModelAndView mav = new ModelAndView("member/member_update");
		mav.addObject("member",member);
		mav.addObject("programs",programs);
		return mav;
	}
	@RequestMapping(value = "emailConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int emailConfirm(@RequestParam String email) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		int result=0;
		try {
			result=dao.emailConfirm(email);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "idConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int idConfirm(@RequestParam String id) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		int result=0;
		try {
			result=dao.idConfirm(id);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		try {
			String encodepassword=passwordEncoder.encode(member.getPassword());
			member.setPassword(encodepassword);
			dao.memberInsert(member);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("result_page");
		mav.addObject("member",member);
		return mav;
	}
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member") Member member,HttpSession session) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		try {
			String encodepassword=passwordEncoder.encode(member.getPassword());
			member.setPassword(encodepassword);
			dao.memberUpdate(member);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("result_page");
		mav.addObject("member",member);
		session.invalidate();
		return mav;
	}
	@RequestMapping(value = "adminMemberUpdate", method = RequestMethod.POST)
	public ModelAndView adminMemberUpdate(@ModelAttribute("member") Member member,HttpSession session) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		try {
			String encodepassword=passwordEncoder.encode(member.getPassword());
			member.setPassword(encodepassword);
			dao.adminMemberUpdate(member);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("result_page");
		mav.addObject("member",member);
		return mav;
	}
	@RequestMapping(value = "memberSelectedDelete", method = RequestMethod.POST)
	public String memberSelectedDelete(@RequestParam ("memberunitchk") List<String> memberunitchk) {
		MemberDAO dao=null;
		dao=sqlSession.getMapper(MemberDAO.class);
		for(String unit : memberunitchk) {
			dao.memberDelete(unit);
	    }
		return "redirect:memberList";
	}
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam String email) {
		MemberDAO dao=null;
		dao=sqlSession.getMapper(MemberDAO.class);
		dao.memberDelete(email);
		return "redirect:memberList";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login(@ModelAttribute("member") Member member,HttpSession session,HttpServletResponse response) throws IOException {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		Member data=dao.memberGetOne(member.getEmail());
		if(data==null) {
			response.setCharacterEncoding("EUC-KR");
		    PrintWriter writer = response.getWriter();
		    writer.println("<script type='text/javascript'>");
		    writer.println("alert('이메일 주소와 일치하는 회원이 없습니다.');");
		    writer.println("history.back();");
		    writer.println("</script>");
		    writer.flush();
		}else {
			if(BCrypt.checkpw(member.getPassword(), data.getPassword())) {
                session.setAttribute("sessionemail", data.getEmail());
                session.setAttribute("sessionid", data.getId());
    			session.setAttribute("sessionname", data.getName());
    			session.setAttribute("sessionpassword", data.getPassword());
    			session.setAttribute("sessionzipcode", data.getZipcode());
    			session.setAttribute("sessionnewaddr", data.getNewaddr());
    			session.setAttribute("sessiondetailaddr", data.getDetailaddr());
    			session.setAttribute("sessionphone1", data.getPhone1());
    			session.setAttribute("sessionphone2", data.getPhone2());
    			session.setAttribute("sessionphone3", data.getPhone3());
    			session.setAttribute("sessionprogram", data.getProgram_code());
    			session.setAttribute("sessionlevel", data.getMemlevel());
    			response.setCharacterEncoding("EUC-KR");
    		    PrintWriter writer = response.getWriter();
    		    writer.println("<script type='text/javascript'>");
    		    writer.println("document.location.href='index';");
    		    writer.println("</script>");
    		    writer.flush();
	        }else {
	        	response.setCharacterEncoding("EUC-KR");
			    PrintWriter writer = response.getWriter();
			    writer.println("<script type='text/javascript'>");
			    writer.println("alert('비밀번호가 일치하지 않습니다.');");
			    writer.println("history.back();");
			    writer.println("</script>");
			    writer.flush();
	        }
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
	@RequestMapping(value = "passwordFind", method = RequestMethod.POST)
	@ResponseBody
	public int passwordFind(@RequestParam String email,@RequestParam String name) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		Member member=null;
		HashMap emailname = new HashMap();
		emailname.put("email", email);
		emailname.put("name", name);
		try {
			member=dao.passwordFind(emailname);
		}catch(Exception e) {
		}
		if(member==null) {
			return 0;
		}else {
			String temppass = randomNum();
			String encodepassword=passwordEncoder.encode(temppass);
			sendEmail(email, temppass);
			member.setPassword(encodepassword);
			dao.passwordChange(member);
			return 1;
		}
	}
	String randomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=5;i++){
			int num = (int) (Math.random()*10);
			buffer.append(num);
		}
		return buffer.toString();
	}
	private void sendEmail( String email, String authNum ) {
		  String host = "smtp.gmail.com";
		  String subject = "K.O.K FITNESS 비밀번호 재발급";
		  String fromName = "K.O.K FITNESS 관리자";
		  String from = "poikr2017@gmail.com";
		  String to1 = email;
		  String content = "임시 비밀번호["+authNum+"]";
		  try {
			  Properties props = new Properties();
			  props.put("mail.smtp.starttls.enable", "true");
			  props.put("mail.transport.protocol", "smtp");
			  props.put("mail.smtp.host", host);
			  props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			  props.put("mail.smtp.port","587"); // or 465
			  props.put("mail.smtp.user",from);
			  props.put("mail.smtp.auth","true");
		   
			  Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
				  		protected PasswordAuthentication getPasswordAuthentication() {
				  			
				  			return new PasswordAuthentication("poikr2017", "njeqqtavfwngbzwc");    // 위 gmail에서 생성된 비밀번호 넣는다
				  		}
			  });
			  Message msg = new MimeMessage( mailSession);
			  msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));
			  
			  InternetAddress[] address1 = { new InternetAddress(to1)};
			  msg.setRecipients(Message.RecipientType.TO, address1);
			  msg.setSubject(subject);
			  msg.setSentDate(new java.util.Date());
			  msg.setContent(content,"text/html;charset=euc-kr");
			  Transport.send(msg);
		  }catch (Exception e) {
		  }
	}
}
