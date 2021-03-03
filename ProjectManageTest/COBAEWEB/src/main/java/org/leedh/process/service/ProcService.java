package org.leedh.process.service;

import java.util.List;

import org.leedh.process.vo.ProcVO;

public interface ProcService {

	List<ProcVO> procShow() throws Exception;
	
    void procEdit(ProcVO vo) throws Exception;

    void procRegister(ProcVO vo) throws Exception;
}
