package org.leedh.pjtMember.service;

import java.util.List;

import org.leedh.pjtMember.vo.PjtMemberVO;

public interface PjtMemberService {
	List<PjtMemberVO> pjtMemberShow() throws Exception;
	
    void pjtMemberEdit(PjtMemberVO vo) throws Exception;

    void pjtMemberRegister(PjtMemberVO vo) throws Exception;

}
