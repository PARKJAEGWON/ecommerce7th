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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: SellerWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002101309][dhtjgml87#gmail.com][CREATE: Initial Release]
 */
package kr.co.challengefarm.seller.sellers.controller;

import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.challengefarm.seller.common.Common;
import kr.co.challengefarm.seller.sellers.dto.SellerDto;
import kr.co.challengefarm.seller.sellers.service.SellerSrvc;
import kr.co.challengefarm.util.security.HSwithSHA;

/**
 * @version 1.0.0
 * @author dhtjgml87#gmail.com
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.challengefarm.seller.sellers.controller")
public class SellerWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SellerWeb.class);

	@Autowired
	Properties staticProperties;
	
	@Inject
	SellerSrvc sellerSrvc;
	
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
	@RequestMapping(value = "/seller/sellers/checkDuplicate.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkDuplicate(@RequestBody SellerDto sellerDto) {
		
		boolean isDuplicate = true;
		
		try {
			
			sellerDto.setId(sellerDto.getId());
			
			int count = sellerSrvc.selectDuplicate(sellerDto);
			
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
	 * @param managerDto [회원 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-31
	 * <p>DESCRIPTION: 판매자 회원 가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/seller/sellers/registerProc.web", method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response, SellerDto sellerDto) {
		

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			// 해쉬 암호화(SHA-256)
			sellerDto.setPasswd(HSwithSHA.encode(sellerDto.getPasswd()));
			//logger.debug("암호화 후(Passwd): " + sellerDto.getPasswd());
			
			boolean result = sellerSrvc.insert(sellerDto);
			
			if (result) logger.debug("가입 성공");
			else logger.debug("가입 실패");

			request.setAttribute("script"	, "alert('회원가입 완료!');");
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
	 * @since 2024-10-02
	 * <p>DESCRIPTION: 판매자 회원 가입 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/seller/sellers/registerForm.web")
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
			
			mav.setViewName("seller/sellers/registerForm");
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
	 * @since 2024-10-02
	 * <p>DESCRIPTION: 판매자 회원 가입 약관 동의</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/seller/sellers/agree.web")
	public ModelAndView agree(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("seller/sellers/agree");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".agree()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
