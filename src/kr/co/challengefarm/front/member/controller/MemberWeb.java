/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.challengefarm
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: MemberWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240620143410][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package kr.co.challengefarm.front.member.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.challengefarm.common.component.EmailCmpn;
import kr.co.challengefarm.common.dto.EmailDto;
import kr.co.challengefarm.front.common.Common;
import kr.co.challengefarm.front.member.dto.MemberDto;
import kr.co.challengefarm.front.member.service.MemberSrvc;
import kr.co.challengefarm.util.security.HSwithSHA;
import kr.co.challengefarm.util.security.SKwithAES;
/**
 * @version 1.0.0
 * @author dhtjgml87@himedia.co.kr
 * 
 * @since 2024-06-20
 * <p>DESCRIPTION: 회원 컨트롤러</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.challengefarm.front.member.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;

	@Autowired
	private MessageSourceAccessor dynamicProperties;

	@Inject
	private EmailCmpn emailCmpn;
	
	@Inject
	MemberSrvc memberSrvc;
	

	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-06-21
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/checkDuplicate.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean isDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			
			logger.debug("email: " + memberDto.getEmail());
			
			int count = memberSrvc.selectDuplicate(memberDto);
			
			if (count == 0) isDuplicate = false;
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return isDuplicate;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION: 이메일 인증</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/confirmEmail.web")
	public ModelAndView confirmEmail(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			memberDto.setEmail(URLDecoder.decode(memberDto.getEmail()));
			
			if (memberSrvc.updateState(memberDto)) {
				request.setAttribute("script"	, "alert('이메일 인증이 완료되어 정상적으로 서비스를 이용할 있습니다.');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web");
			}
			else {
				// [2024-09-19][pluto@himedia.co.kr][TODO: 10분 이내에 인증되지 않은 이메일이므로 '#' + SEQ_MBR + '_' + EMAIL 패턴으로 업데이트]
				request.setAttribute("script"	, "alert('회원 가입 재시도 또는 고객센터에 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".confirmEmail()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param mebmerDto [회원 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION: 회원 가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/registerProc.web", method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response
			, MemberDto memberDto
			, String term_1
			, String term_2
			, String term_3) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if (term_1 == null || term_1.equals("")) term_1 = "N";
			if (term_2 == null || term_2.equals("")) term_2 = "N";
			if (term_3 == null || term_3.equals("")) term_3 = "N";
			
			String[] arrTermAgreement = {term_1, term_2, term_3};
			
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			// 해쉬 암호화(SHA-256)
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			boolean insert = memberSrvc.insert(memberDto, arrTermAgreement, aes.decode(memberDto.getPost()));
			
			if (insert) {
				
				logger.debug("가입 성공");
				
				// 인증 이메일 발송
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하 및 이메일 인증");
				emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
							+ "하기 인증하기를 10분 이내에 클릭하셔야 가입이 완료됩니다.</br></br>"
							+ "http://127.0.0.1:8080/front/member/confirmEmail.web?email=" + URLEncoder.encode(memberDto.getEmail()));
				
				emailCmpn.send(emailDto);
			}
			else logger.debug("가입 실패");
			
			
			request.setAttribute("redirect"	, "/front/login/loginForm.web");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 회원 가입 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response
			, String term_1
			, String term_2
			, String term_3) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String term = "";
			
			if (term_1 == null || term_1.equals("")) term += "N";
			else term += "Y";
			if (term_2 == null || term_2.equals("")) term += "N";
			else term += "Y";
			if (term_3 == null || term_3.equals("")) term += "N";
			else term += "Y";
			
			mav.addObject("term", term);
			
			mav.setViewName("front/member/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 회원 가입 약관 동의</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/agree.web")
	public ModelAndView agree(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/agree");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".agree()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
}