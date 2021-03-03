package org.leedh.process.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.leedh.process.dao.ProcDAO;
import org.leedh.process.service.ProcService;
import org.leedh.process.vo.ProcVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/process")
@Slf4j
public class ProcController {

	private final ProcService service;
    private final ProcDAO dao;
    
    @Autowired
    public ProcController(ProcService service, ProcDAO dao) {
        this.service = service;
        this.dao = dao;
    }
    
    //기관 전체 정보 불러오기
    
    @RequestMapping(value = "/procShow", method = RequestMethod.GET)
    public String procShow() throws Exception {
    	
        return "/process/procShow";
    }
    
    
    @RequestMapping(value = "/procShow", method = RequestMethod.POST)
    public ModelAndView  procShowTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	System.out.println("run /procShow : " + this.getClass().getName());


    ModelAndView mav = new ModelAndView("jsonView");
    List<ProcVO> procList = null;
    ProcVO procVo = new ProcVO();

    try {
    	procList = (List<ProcVO>) service.procShow();

        if (procList == null) {
            mav.addObject("result", "1");
        } else {
            mav.addObject("result", "0");
            mav.addObject("records", procList.size());
            mav.addObject("rows", procList);
        }

    } catch (Exception e) {
    	System.out.println(this.getClass().getName() + " --> Select Error.");
    	System.out.println(this.getClass().getName() + " Select Error." + e.getMessage());
    }
    
	System.out.println(this.getClass().getName() + " Result --> " + mav);
	
	return mav;
    }
    
    @RequestMapping(value = "/procEdit", method = RequestMethod.GET)
    public String registerUpdateView(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        return "/proc/procEdit";
    }

    // 회원정보 수정  post
    @RequestMapping(value = "/procEdit", method = RequestMethod.POST)
    public String registerUpdate(ProcVO vo, Model model, HttpServletRequest request, HttpSession session) throws
            Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        service.procEdit(vo);
        model.addAttribute("procEdit", vo);
        
        
        return "/proc/procEdit";
    }
    
    @RequestMapping(value = "/procRegister", method = RequestMethod.GET)
    public String getRegister(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("get procRegister");
        return "/proc/procRegister";

    }

    // 회원가입 post
    @RequestMapping(value = "/procRegister", method = RequestMethod.POST)
    public String postRegister(ProcVO vo, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("post procRegister");

        service.procRegister(vo);
            // 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
            // 존재하지 않는다면 -> register


        return "/project/main";
    }
}
