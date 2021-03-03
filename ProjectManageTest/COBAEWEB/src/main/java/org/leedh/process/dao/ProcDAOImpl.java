package org.leedh.process.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.leedh.process.vo.ProcVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProcDAOImpl implements ProcDAO {

    private static final String NAMESPACE = "ProcMapper";
    private final SqlSession sql;

    @Autowired
    public ProcDAOImpl(SqlSession sql) {
        this.sql = sql;
    }
    
	@Override
    public List<ProcVO> procShow() throws Exception {

        return sql.selectList(NAMESPACE + ".procShow");
    }
	
    @Override
    public void procEdit(ProcVO vo) throws Exception {
       
        sql.update(NAMESPACE + ".procEdit", vo);
    }
    
    @Override
    public void procRegister(ProcVO vo) throws Exception {
        sql.insert(NAMESPACE + ".procRegister", vo);
    }
}

