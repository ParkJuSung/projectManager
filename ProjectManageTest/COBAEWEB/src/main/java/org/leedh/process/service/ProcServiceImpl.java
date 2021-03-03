package org.leedh.process.service;

import java.util.List;


import org.leedh.process.dao.ProcDAO;
import org.leedh.process.vo.ProcVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProcServiceImpl implements ProcService {

	private final ProcDAO dao;
	
    @Autowired
    public ProcServiceImpl(ProcDAO dao) {
        this.dao = dao;
    }
    
    @Override
    public List<ProcVO> procShow() throws Exception{
    	return dao.procShow();
    }
    
    @Override
    public void procEdit(ProcVO vo) throws Exception {
    	
        //받은 vo를 DAO로 보내줍니다.
        dao.procEdit(vo);
    }
    
    @Override
    public void procRegister(ProcVO vo) throws Exception {
    	dao.procRegister(vo);
    }
    
   
}
