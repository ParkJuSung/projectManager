package org.leedh.organization.dao;


import org.apache.ibatis.session.SqlSession;
import org.leedh.organization.vo.OrgVO;
import org.leedh.user.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class OrgDAOImpl implements OrgDAO{

    private static final String NAMESPACE = "OrgMapper";
    private final SqlSession sql;

    @Autowired
    public OrgDAOImpl(SqlSession sql) {
        this.sql = sql;
    }
    
	@Override
    public List<OrgVO> orgShow() throws Exception {

        return sql.selectList(NAMESPACE + ".orgShow");
    }
}
