package com.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.MemberService;
import com.spring.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;
	
	// 스프링 시큐리티
	@Inject 
	BCryptPasswordEncoder pwdEncoder;
	
	// 회원가입 get
	@RequestMapping(value= "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception{
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String postRegister(MemberVO memberVO) throws Exception{
		logger.info("post register");

		int result = service.idChk(memberVO);
		try {
			if(result == 1) {
				return "/member/register"; // 아이디 중복이라서 되돌아가기
			} else if(result == 0) {
				// 입력된 비밀번호를 암호화 -> DB 저장
				String inputPass = memberVO.getUserPass();
				String pwd = pwdEncoder.encode(inputPass);
				memberVO.setUserPass(pwd);
				
				service.register(memberVO);
			}
		} catch(Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() throws Exception{
		logger.info("get login");
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String login(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		MemberVO login = service.login(memberVO);
		
		// 스프링 시큐리티 적용해서 비밀번호 체크 // TRUE or FALSE
		boolean pwdMatch;
		if(login != null) {
			pwdMatch = pwdEncoder.matches(memberVO.getUserPass(), login.getUserPass());
		} else {
			pwdMatch = false; // 동일한 아이디 DB 없을 때
		}
		
		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberUpdateView", method=RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "member/memberUpdateView";
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String registerUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		
		service.memberUpdate(memberVO);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴 get
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		service.memberDelete(memberVO);
		session.invalidate();
		return "redirect:/";
	}
	
	// 패스워드 체크
	@ResponseBody // ajax 통신할 때 사용 // json 타입으로 전달
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO memberVO) throws Exception {
		
		MemberVO login = service.login(memberVO);
		boolean pwdChk = pwdEncoder.matches(memberVO.getUserPass(), login.getUserPass());
		return pwdChk;
	}
	
	// 아이디 중복 체크
	@ResponseBody // ajax 통신할 때 사용 // json 타입으로 전달
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO memberVO) throws Exception {
		return service.idChk(memberVO);
	}
	
}
