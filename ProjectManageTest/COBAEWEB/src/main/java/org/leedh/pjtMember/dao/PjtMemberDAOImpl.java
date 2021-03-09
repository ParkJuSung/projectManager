package org.leedh.pjtMember.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.leedh.pjtMember.vo.PjtMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PjtMemberDAOImpl implements PjtMemberDAO {
    private static final String NAMESPACE = "PjtMemberMapper";
    private final SqlSession sql;

    @Autowired
    public PjtMemberDAOImpl(SqlSession sql) {
        this.sql = sql;
    }
    
	@Override
    public List<PjtMemberVO> pjtMemberShow() throws Exception {

        return sql.selectList(NAMESPACE + ".pjtMemberShow");
    }
	
    @Override
    public void pjtMemberEdit(PjtMemberVO vo) throws Exception {
       
        sql.update(NAMESPACE + ".pjtMemberEdit", vo);
    }
    
    @Override
    public void pjtMemberRegister(PjtMemberVO vo) throws Exception {
        sql.insert(NAMESPACE + ".pjtMemberRegister", vo);
    }
}
