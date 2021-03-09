package org.leedh.pjtMember.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.leedh.organization.controller.OrgController;
import org.leedh.pjtMember.dao.PjtMemberDAO;
import org.leedh.pjtMember.service.PjtMemberService;
import org.leedh.pjtMember.vo.PjtMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pjtMember")
@Slf4j
public class PjtMemberController {

	private final PjtMemberService service;
    private final PjtMemberDAO dao;
    
    @Autowired
    public PjtMemberController(PjtMemberService service, PjtMemberDAO dao) {
        this.service = service;
        this.dao = dao;
    }
    
    //기관 전체 정보 불러오기
    
    @RequestMapping(value = "/pjtMemberShow", method = RequestMethod.GET)
    public String orgShow() throws Exception {

        return "/pjtMember/pjtMemberShow";
    }
    
    
    @RequestMapping(value = "/pjtMemberShow", method = RequestMethod.POST)
    public ModelAndView  orgShowTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	System.out.println("run /orgShow : " + this.getClass().getName());


    ModelAndView mav = new ModelAndView("jsonView");
    List<PjtMemberVO> pjtMemberList = null;
    PjtMemberVO pjtMemberVo = new PjtMemberVO();

    try {
    	pjtMemberList = (List<PjtMemberVO>) service.pjtMemberShow();

        if (pjtMemberList == null) {
            mav.addObject("result", "1");
        } else {
            mav.addObject("result", "0");
            mav.addObject("records", pjtMemberList.size());
            mav.addObject("rows", pjtMemberList);
        }

    } catch (Exception e) {
    	System.out.println(this.getClass().getName() + " --> Select Error.");
    	System.out.println(this.getClass().getName() + " Select Error." + e.getMessage());
    }
    
	System.out.println(this.getClass().getName() + " Result --> " + mav);
	
	return mav;
    }
    
    @RequestMapping(value = "/pjtMemberEdit", method = RequestMethod.GET)
    public String registerUpdateView(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        return "/pjtMmeber/pjtMemberEdit";
    }

    // 회원정보 수정  post
    @RequestMapping(value = "/pjtMemberEdit", method = RequestMethod.POST)
    public String registerUpdate(PjtMemberVO vo, Model model, HttpServletRequest request, HttpSession session) throws
            Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        service.pjtMemberEdit(vo);
        model.addAttribute("empEdit", vo);
        
        
        return "/pjtMember/pjtMemberEdit";
    }
    
    @RequestMapping(value = "/pjtMemberRegister", method = RequestMethod.GET)
    public String getRegister(HttpServletRequest request, HttpSession session) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("get orgRegister");
        return "/pjtMember/pjMemberRegister";

    }

    // 회원가입 post
    @RequestMapping(value = "/pjtMemberRegister", method = RequestMethod.POST)
    public String postRegister(PjtMemberVO vo, HttpSession session, HttpServletRequest request) throws Exception {

        // url 직접 접근시 로그인 화면으로 리다이렉션 /  session.invalidate()로 세션 소거
        if (request.getHeader("REFERER") == null) {
            session.invalidate();
            return "redirect:/";
        }

        log.info("post orgRegister");

        service.pjtMemberRegister(vo);
            // 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
            // 존재하지 않는다면 -> register


        return "/project/main";
    }
}
