package org.leedh.user.vo;

import lombok.Data;

@Data
public class EmpVO {
 /*
   번호            no
   사원번호         empNo;
   사원명           empNm;
   직원비밀번호      empPw;
   사원이메일        empEmail;
   사원휴대폰연락처   empPhoneNo;
   사원비상연락처     empEmerNo;
   사원입사일         empJoinDate;
   기술등급코드       pjtLvC;
   직위코드          pjtPosC;
*/

    private int no;
    private String empNo;
    private String empNm;
    private String empPw;
    private String empEmail;
    private String empPhoneNo;
    private String empEmerNo;
    private String empJoinDate;
    private String empSkillLvC;
    private String empPosC;
    private boolean rememberEmail;

}
