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

import java.util.List;

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
    public Model empShow(Model model1) throws Exception {
    //public String empShow(Model model) throws Exception {
    	
    	
    	
    	Model retModel = model1;
    	
    	System.out.println("/orgShow start");
    	
        List<OrgVO> orgVo = service.orgShow();
        
        
       model1.addAttribute("empList", orgVo);
        
   
    	System.out.println("/orgShow end" + model1);
        return retModel;
     //   return "/organization/orgShow";
    }
    
    
    @RequestMapping(value = "/orgShow", method = RequestMethod.POST)
    public ModelAndView  empShowTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
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
}
