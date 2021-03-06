package org.leedh.organization.dao;


import org.leedh.organization.vo.OrgVO;

import java.util.List;

public interface OrgDAO {

    List<OrgVO> orgShow() throws Exception;

    void orgEdit(OrgVO vo) throws Exception;
    
    void orgRegister(OrgVO vo) throws Exception;


}
