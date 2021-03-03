package org.leedh.process.dao;

import java.util.List;


import org.leedh.process.vo.ProcVO;


public interface ProcDAO {

    List<ProcVO> procShow() throws Exception;

    void procEdit(ProcVO vo) throws Exception;
    
    void procRegister(ProcVO vo) throws Exception;
}
