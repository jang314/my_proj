package com.javalec.ex.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.ex.model.MemberVO;
import com.javalec.ex.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
		private static final Logger logger = Logger.getLogger(MemberController.class);
		@Autowired
		private MemberService memberService;
		@Autowired
		private JavaMailSender mailSender;

		/*로그인 폼*/
		@RequestMapping(value="/login", method=RequestMethod.GET)
		public String login(Model model, @CookieValue(value="saveid", required=false)Cookie rCookie){
			return "member/login";
		}
		
		/* 로그인 처리 */
		@RequestMapping(value="/login", method=RequestMethod.POST)
		public ModelAndView loginProcess(HttpSession session, @RequestParam String id, 
																						@RequestParam String password) {
			
			MemberVO loginUser =  memberService.loginCheck(id, password);
			if(loginUser != null) {
				ModelAndView mav = new ModelAndView("redirect:/board/list");
				session.setAttribute("loginUser", loginUser);
				return mav;
			}else {
				Map<String, String> result = new HashMap<String, String>();
				result.put("msg", "아이디 혹은 비밀번호가 맞지 않습니다. ");
				result.put("url", "javascript:history.back()");
				return new ModelAndView("/result", "result", result);
			}
		}
		
		/*로그아웃*/
		@RequestMapping(value="/logout", method=RequestMethod.GET)
		public String logoutProcess(Model model, HttpSession session) {
			session.invalidate();
			return "redirect:/member/login";
		}
		
		/*회원가입 폼*/
		@RequestMapping(value="/register", method=RequestMethod.GET)
		public ModelAndView register() {
			ModelAndView mav = new ModelAndView("member/register");
			MemberVO memberVO = new MemberVO();
			mav.addObject("memberForm", memberVO);
			return mav;
		}
		
		/*회원가입*/
		@RequestMapping(value="/register", method=RequestMethod.POST)
		public ModelAndView registerProcess(@ModelAttribute("memberForm") MemberVO memberVO) {
				int count = memberService.insertMember(memberVO);
				Map<String, String> result = new HashMap<String, String>();
				
				if(count ==1) {
					result.put("msg", "회원가입이 완료되었습니다. ");
					result.put("url", "login");
				}else {
					result.put("msg", "회원가입에 실패하였습니다. ");
					result.put("url", "javascript:history.back();");
				}
				return new ModelAndView("/result", "result", result);
		}
		
		/*아이디 중복체크*/
		@RequestMapping(value="/idDuplication")
		public void idDuplication(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			PrintWriter out = response.getWriter();
			try {
				String id = (request.getParameter("id") == null) ? "" : String.valueOf(request.getParameter("id"));
				int count = memberService.idDuplication(id);
				out.println(count);
				out.flush();
				out.close();
			}catch(Exception e) { out.println("2");}
		}
		
		/*이메일 중복체크*/
		@RequestMapping(value="/emailDuplication")
		public void emailDuplication(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			PrintWriter out = response.getWriter();
			try {
				String email = (request.getParameter("email") == null) ? "" : String.valueOf(request.getParameter("email"));
				int count = memberService.emailDuplication(email);
				out.println(count);
				out.flush();
				out.close();
			}catch(Exception e) { out.println("2");}
		}
		
		/*비밀번호 일치여부*/
		@RequestMapping(value="/passwordCheck")
		public void passwordCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			PrintWriter out = response.getWriter();
			try {
				String id = (request.getParameter("id") == null) ? "" : String.valueOf(request.getParameter("id"));
				String password = (request.getParameter("password") == null) ? "" : String.valueOf(request.getParameter("password"));
				MemberVO passwordCheck = memberService.loginCheck(id, password);
				int count = 0;
				if(passwordCheck!=null)	count = 1;
				else count = 0;
				out.println(count);
				out.flush();
				out.close();
			}catch(Exception e) { out.println("2");}
		}
		
		/*아이디/비밀번호 찾기 폼*/
		@RequestMapping(value="/mfind", method=RequestMethod.GET)
		public String memberFind(Model model) {
			MemberVO membervo = new MemberVO();
			model.addAttribute("member", membervo);
			return "member/mfind";
		}
		
		/*아이디/비밀번호 찾기*/
		@RequestMapping(value="/mfind", method=RequestMethod.POST)
		public ModelAndView memberFindProcess(@ModelAttribute("member") MemberVO membervo, @RequestParam String find) throws Exception {
			ModelAndView mav = new ModelAndView();
			
			/*아이디 찾기*/
			if(find.equals("findid")) {																	
						List<MemberVO> list = memberService.findId(membervo);
						//	등록된 정보가 있을 경우
						if(list.size()>0) {
										for(MemberVO vo : list)	
											{		mav.addObject("massage", vo.getName()+"님의 아이디는 <br/>" + vo.getId() +  "<br/>입니다.");
													mav.setViewName("/member/mfindrslt");			}
						//	등록된 정보가 없을 경우				
						}else {
							Map<String, String> map = new HashMap<String, String>();
							map.put("msg", "입력하신 정보로 아이디를 찾을 수 없습니다. ");
							map.put("url", "mfind");
							return new ModelAndView("/result", "result", map);
						}
				return mav;
				
				/*비밀번호 찾기*/
				}else {
					List<MemberVO> list = memberService.findPw(membervo);
					//	등록된 정보가 있을 경우
					if(list.size() > 0) {
						for(MemberVO vo : list) {
							//	이메일 발신정보 
							String setfrom="jang940314@google.com";
							String tomail  = "jang314@naver.com";     // 받는 사람 이메일
							String title   = vo.getName() + "( "+vo.getId()+" ) 님의 비밀번호 찾기 메일입니다. ";      // 제목
							String content = vo.getName()+" ( " + vo.getId() + " ) 님의 비밀번호는"+vo.getPassword()+" 입니다. ";    // 내용
							
							//	이메일 보내기
					        try {
					        	MimeMessage message = mailSender.createMimeMessage();
					            MimeMessageHelper messageHelper 
					                              = new MimeMessageHelper(message, true, "UTF-8");
					       
					            messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
					            messageHelper.setTo(tomail);     		 // 받는사람 이메일
					            messageHelper.setSubject(title); 	// 메일제목은 생략이 가능하다
					            messageHelper.setText(content);  // 메일 내용
					            mailSender.send(message);
					        }catch(Exception e) {
					        	System.out.println(e);
					        }
					        mav.addObject("massage", vo.getName() + "님의 비밀번호는 <br/>" +  vo.getEmail() +  "<br/>(으)로 발송 되었습니다. ");
							mav.setViewName("/member/mfindrslt");	
						}
						return mav;
					//	등록된 정보가 없을 경우
					}else {
						Map<String, String> map = new HashMap<String, String>();
						map.put("msg", "입력하신 정보로 비밀번호를 찾을 수 없습니다. ");
						map.put("url", "mfind");
						return new ModelAndView("/result", "result", map);
					}
				}
		}
		
		/*아이디/비밀번호 찾기 성공시 결과창*/
		@RequestMapping(value="/mfindrslt")
		public ModelAndView memberFindResult() {
			ModelAndView mav = new ModelAndView("redirect:/");
			return mav;
		}
		
		/*회원수정 폼*/
		@RequestMapping(value="/update")
		public ModelAndView memberUpdate(HttpSession session, MemberVO vo) {
			ModelAndView mav = new ModelAndView();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if(session.getAttribute("loginUser")==null) {
				Map<String, String> result = new HashMap<String, String>();
				result.put("msg", "잘못된 접근입니다. 로그인해주세요.");
				result.put("url", "login");
				mav.setViewName("/result");
				mav.addObject("result", result);
				return mav;
			}else {
				String id = loginUser.getId();
				vo = memberService.selectById(id);
				mav.setViewName("member/update");
				mav.addObject("memberForm", vo);
				return mav;
			}
		}
		
		/*회원수정*/
		@RequestMapping(value="/update", method=RequestMethod.POST)
		public ModelAndView UpdateProcess(HttpSession session, @ModelAttribute("memberForm") MemberVO memberVO) {
			ModelAndView mav = new ModelAndView();
			Map<String, String> result = new HashMap<String, String>();
			if(session.getAttribute("loginUser")==null) {
				result.put("msg", "잘못된 접근입니다. 로그인해주세요.");
				result.put("url", "login");
				mav.setViewName("/result");
				mav.addObject("result", result);
				return mav;
			}else{
				int count = memberService.updateMember(memberVO);
				if(count==1) {
					MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
					String id = loginUser.getId();
					MemberVO vo = memberService.selectById(id);
					mav.addObject("memberForm", vo);
					mav.setViewName("member/update");
					return mav;
				}else {
					result.put("msg", "회원수정에 실패하였습니다..");
					result.put("url", "javascript:history.back();");
					mav.setViewName("/result");
					mav.addObject("result", result);
					return mav;
				}
			}
		}
		
		/*회원탈퇴 폼*/
		@RequestMapping(value="/delete", method=RequestMethod.GET)
		public ModelAndView deleteMember(HttpSession session, MemberVO vo) {
			ModelAndView mav = new ModelAndView();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if(session.getAttribute("loginUser")==null) {
				Map<String, String> result = new HashMap<String, String>();
				result.put("msg", "잘못된 접근입니다. 로그인해주세요.");
				result.put("url", "login");
				mav.setViewName("/result");
				mav.addObject("result", result);
				return mav;
			}else {
				String id = loginUser.getId();
				vo = memberService.selectById(id);
				mav.setViewName("member/delete");
				mav.addObject("memberForm", vo);
				return mav;
			}
		}
		
		/*회원탈퇴*/
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		public ModelAndView deleteProcess(HttpSession session, @ModelAttribute("memberForm") MemberVO memberVO) {
			ModelAndView mav = new ModelAndView();
			Map<String, String> result = new HashMap<String, String>();
			if(session.getAttribute("loginUser")==null) {
				result.put("msg", "잘못된 접근입니다. 로그인해주세요.");
				result.put("url", "login");
				mav.setViewName("/result");
				mav.addObject("result", result);
				return mav;
			}else{
				int count = memberService.deleteMember(memberVO);
				if(count==1) {
					MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
					String id = loginUser.getId();
					MemberVO vo = memberService.selectById(id);
					mav.addObject("memberForm", vo);
					mav.setViewName("redirect:/member/logout");
					return mav;
				}else {
					result.put("msg", "회원탈퇴에 실패하였습니다..");
					result.put("url", "javascript:history.back();");
					mav.setViewName("/result");
					mav.addObject("result", result);
					return mav;
				}
			}
		}
}
