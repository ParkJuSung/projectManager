package org.leedh.organization.controller;


import lombok.extern.slf4j.Slf4j;
import org.leedh.organization.dao.OrgDAO;
import org.leedh.organization.service.OrgService;
import org.leedh.organization.vo.OrgVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/organization")
@Slf4j
public class OrgController {

	private final OrgService service;
    private final OrgDAO dao;
    
    @Autowired
    public OrgController(OrgService service, OrgDAO dao) {
        this.service = service;
        this.dao = dao;
    }
    
    //기관 전체 정보 불러오기
    
    @RequestMapping(value = "/orgShow", method = RequestMethod.GET)
    public String orgShow() throws Exception {

        return "/organization/orgShow";
    }
    
    
    @RequestMapping(value = "/orgShow", method = RequestMethod.POST)
    public ModelAndView  orgShowTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	System.out.println("run /orgShow : " + this.getClass().getName());


    ModelAndView mav = new ModelAndView("jsonView");
    List<OrgVO> orgList = null;
    OrgVO orgVo = new OrgVO();

    try {
    	orgList = (List<OrgVO>) service.orgShow();

        if (orgList == null) {
            mav.addObject("result", "1");
        } else {
            mav.addObject("result", "0");
            mav.addObject("records", orgList.size());
            mav.addObject("rows", orgList);
        }

    } catch (Exception e) {
    	System.out.println(this.getClass().getName() + " --> Select Error.");
    	System.out.println(this.getClass().getName() + " Select Error." + e.getMessage());
    }
    
	System.out.println(this.getClass().getName() + " Result --> " + mav);
	
	return mav;
    }
    
    @RequestMapping(value = "/orgEdit", method = RequestMethod.GET)
    public String registerUpdateView(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        return "/organization/orgEdit";
    }

    // 회원정보 수정  post
    @RequestMapping(value = "/orgEdit", method = RequestMethod.POST)
    public String registerUpdate(OrgVO vo, Model model, HttpServletRequest request, HttpSession session) throws
            Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        service.orgEdit(vo);
        model.addAttribute("empEdit", vo);
        
        
        return "/organization/orgEdit";
    }
    
    @RequestMapping(value = "/orgRegister", method = RequestMethod.GET)
    public String getRegister(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("get orgRegister");
        return "/organization/orgRegister";

    }

    // 회원가입 post
    @RequestMapping(value = "/orgRegister", method = RequestMethod.POST)
    public String postRegister(OrgVO vo, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("post orgRegister");

        service.orgRegister(vo);
            // 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
            // 존재하지 않는다면 -> register


        return "/project/main";
    }
}
