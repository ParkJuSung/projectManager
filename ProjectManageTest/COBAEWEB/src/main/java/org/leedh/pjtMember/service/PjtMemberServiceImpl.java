package org.leedh.pjtMember.service;

import java.util.List;

import org.leedh.pjtMember.dao.PjtMemberDAO;
import org.leedh.pjtMember.vo.PjtMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PjtMemberServiceImpl implements PjtMemberService{

	private final PjtMemberDAO dao;
	
    @Autowired
    public PjtMemberServiceImpl(PjtMemberDAO dao) {
        this.dao = dao;
    }
    
    @Override
    public List<PjtMemberVO> pjtMemberShow() throws Exception{
    	return dao.pjtMemberShow();
    }
    
    @Override
    public void pjtMemberEdit(PjtMemberVO vo) throws Exception {
    	
        //받은 vo를 DAO로 보내줍니다.
        dao.pjtMemberEdit(vo);
    }
    
    @Override
    public void pjtMemberRegister(PjtMemberVO vo) throws Exception {
    	dao.pjtMemberRegister(vo);
    }
}
