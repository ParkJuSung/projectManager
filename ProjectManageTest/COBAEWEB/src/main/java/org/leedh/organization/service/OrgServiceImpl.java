package org.leedh.organization.service;

import org.leedh.organization.dao.OrgDAO;
import org.leedh.organization.vo.OrgVO;
import org.leedh.user.dao.MemberDAO;
import org.leedh.user.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Service
public class OrgServiceImpl implements OrgService{

	private final OrgDAO dao;
	
    @Autowired
    public OrgServiceImpl(OrgDAO dao) {
        this.dao = dao;
    }
    
    @Override
    public List<OrgVO> orgShow() throws Exception{
    	return dao.orgShow();
    }
}
