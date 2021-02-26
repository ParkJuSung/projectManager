package org.leedh.organization.service;

import java.util.List;

import org.leedh.organization.vo.OrgVO;

public interface OrgService {
	List<OrgVO> orgShow() throws Exception;
	
    void orgEdit(OrgVO vo) throws Exception;

    void orgRegister(OrgVO vo) throws Exception;

}
