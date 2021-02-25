package org.leedh.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.leedh.user.vo.EmpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class MemberDAOImpl implements MemberDAO {

    private static final String NAMESPACE = "UserMapper";
    private final SqlSession sql;

    @Autowired
    public MemberDAOImpl(SqlSession sql) {
        this.sql = sql;
    }

    // 회원가입
    @Override
    public void register(EmpVO vo) throws Exception {
        sql.insert(NAMESPACE + ".register", vo);
    }

    // 로그인
    @Override
    public EmpVO login(EmpVO vo) throws Exception {
        return sql.selectOne(NAMESPACE + ".login", vo);
    }

    // 비밀번호 변경
    @Transactional
    public int update_pw(EmpVO vo) throws Exception {
        return sql.update(NAMESPACE + ".update_pw", vo);
    }

    //서비스에서 보낸 파라미터들을 memberUpdate(EmpVO vo)에 담습니다.
    @Override
    public void empEdit(EmpVO vo) throws Exception {
       
        sql.update(NAMESPACE + ".empEdit", vo);
    }

    // 업데이트와 마찬가지로 흐름은 같습니다.
    @Override
    public void memberDelete(EmpVO vo) throws Exception {
      
        sql.delete(NAMESPACE + ".memberDelete", vo);

    }

    // 아이디 중복 체크
    @Override
    public int idChk(EmpVO vo) throws Exception {
        return sql.selectOne(NAMESPACE + ".idChk", vo);
    }

    @Override
    public String getPw(String id) throws Exception {
        return sql.selectOne(NAMESPACE + ".getPw", id);
    }

    //직원 정보(한명) 조회
    @Override
    public EmpVO selectEmp() throws Exception {
        return sql.selectOne(NAMESPACE + ".selectEmp");
    }

    //직원 정보(전체) 조회
    @Override
    public List<EmpVO> empShow() throws Exception {

        return sql.selectList(NAMESPACE + ".empShow");
    }

    @Override
    public void deleteEmp(String no) {
        sql.delete(NAMESPACE + ".deleteEmp", no);
    }

    @Override
    public void deleteEmpAdmin(String no) {
        sql.delete(NAMESPACE + ".deleteEmpAdmin", no);
    }
    
    
}









