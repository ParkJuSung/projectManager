-- 유저 생성 / 권한

-- 계정 생성
CREATE USER PRGMGTEST IDENTIFIED BY 12345;

-- 각종 테이블,인덱스,시퀀스 등등 권한 허용
GRANT CREATE SESSION TO PRGMGTEST;
GRANT CREATE DATABASE LINK TO PRGMGTEST;
GRANT CREATE MATERIALIZED VIEW TO PRGMGTEST;
GRANT CREATE PROCEDURE TO PRGMGTEST;
GRANT CREATE PUBLIC SYNONYM TO PRGMGTEST;
GRANT CREATE ROLE TO PRGMGTEST;
GRANT CREATE SEQUENCE TO PRGMGTEST;
GRANT CREATE SYNONYM TO PRGMGTEST;
GRANT CREATE TABLE TO PRGMGTEST;
GRANT DROP ANY TABLE TO PRGMGTEST;
GRANT CREATE TRIGGER TO PRGMGTEST;
GRANT CREATE TYPE TO PRGMGTEST;
GRANT CREATE VIEW TO PRGMGTEST;

GRANT CREATE ANY INDEX, ALTER ANY INDEX, DROP ANY INDEX TO PRGMGTEST;

----------------------------------------------------------------------------------

-- 공통 코드 테이블




/*----------------------------------------------------------------------------------*/

-- 직원 테이블

CREATE TABLE FL_EMP(
	EMP_NO VARCHAR2(30) PRIMARY KEY,
	EMP_FIRST_REGISTRANT 	VARCHAR2(30) NOT NULL, --최초 등록자
	EMP_FIRST_REGISTER_DATE VARCHAR2(30) NOT NULL, --최조 등록일
	EMP_EDITER_NM 			VARCHAR2(30),          --마지막 수정자
	EMP_EDITED_DATE 		VARCHAR2(30),          --마지막 수정일
	EMP_NM 					VARCHAR2(30) NOT NULL, 
	EMP_EMAIL 				VARCHAR2(50) NOT NULL,
	EMP_PW					VARCHAR2(100) NOT NULL,
	EMP_PHONE_NO 			VARCHAR2(30) NOT NULL,
	EMP_EMER_NO 			VARCHAR2(30) NOT NULL,
	EMP_JOIN_DATE			VARCHAR2(30) NOT NULL,
	EMP_SKILL_LV_C 			VARCHAR2(10) NOT NULL,
	EMP_POS_C 				VARCHAR2(10) NOT NULL
)

/*----------------------------------------------------------------------------------*/
-- 프로젝트 테이블

CREATE TABLE FL_PJT(
	PJT_SEQ						NUMBER PRIMARY KEY,			--프로젝트일련번호
	PJT_CD						VARCHAR2(30) NOT NULL,		--프로젝트관리코드
	PJT_NM						VARCHAR2(50) NOT NULL,		--프로젝트명
	ORG_SEQ						NUMBER, NOT NULL			--회사(기관)일련번호
	PRE_STR_DAY					VARCHAR2(30) NOT NULL,		--예상시작일
	PRE_END_DAY					VARCHAR2(30) NOT NULL,		--예상종료일
	REL_STR_DAY					VARCHAR2(30),				--실제시작일
	REL_END_DAY					VARCHAR2(30),				--실제종료일
	PJT_STAT_CD					VARCHAR2(20)NOT NULL,		--프로젝트상태
	REG_ID						VARCHAR2(20)NOT NULL,		--등록자(사번)
	REG_DT						VARCHAR2(30)NOT NULL,		--등록일
	CHG_ID						VARCHAR2(20),				--수정자(사번)
	CHG_DT						VARCHAR2(30)				--수정일
)
/*----------------------------------------------------------------------------------*/
--프로세스 테이블

CREATE TABLE FL_PROCESS(
	PJT_SEQ						NUMBER,						--프로젝트 일련번호
	PROC_CD						VARCHAR2(30),				--프로세스 코드
	PRE_STR_DAY					VARCHAR2(30) NOT NULL,		--예상 시작일
	PRE_END_DAY					VARCHAR2(30) NOT NULL,		--예상 종료일
	REL_STR_DAY					VARCHAR2(30),				--실제 시작일
	REL_END_DAY					VARCHAR2(30),				--실제 종료일
	CURR_YN						VARCHAR2(1) NOT NULL,		--진행 여부(Y/N)
	STAT_CD						VARCHAR2(20) NOT NULL,		--상태코드
	REAMARK						VARCHAR2(4000),				--비고 프로세스진행 상황 설명
	REG_ID						VARCHAR2(20) NOT NULL,		--등록자(사번)
	REG_DT						VARCHAR2(30) NOT NULL,		--등록일
	CHG_ID						VARCHAR2(20),				--수정자(사번)
	CHG_DT						VARCHAR2(30)				--수정일
	CONSTRAINT FL_PJT_MEMBER_PK
        PRIMARY KEY (PJT_SEQ, PROC_CD)
)
/*----------------------------------------------------------------------------------*/
--기관 테이블
CREATE TABLE FL_ORG(
	ORG_SEQ						NUMBER PRIMARY KEY, 		--회사(기관)일련번호
	ORG_CD 						VARCHAR2(30) NOT NULL, 		--회사(기관)코드
	ORG_NM						VARCHAR2(100) NOT NULL, 	--회사(기관)명
	ORG_DIV_CD					VARCHAR2(30) NOT NULL, 		--회사(기관)구분
	BIZ_NO						VARCHAR2(12) NOT NULL, 		--사업자번호
	CEO_NM						VARCHAR(50)  NOT NULL, 		--대표자명
	ORG_TELL_NO					VARCHAR2(20),				--회사(기관)대표전화
	ORG_FAX_NO					VARCHAR2(20),				--회사(기관)팩스번호
	ORG_ZIP						VARCHAR2(5) NOT NULL,		--회사(기관)우편번호
	ORG_ADDR1					VARCHAR2(200) NOT NULL,		--회사(기관)주소1
	ORG_ADDR2					VARCHAR2(200),				--회사(기관)주소2
	ORG_SAIL_NM					VARCHAR2(50) NOT NULL,		--영업대표명
	ORG_SAIL_PHONE				VARCHAR2(20) NOT NULL,		--영업대표전화번호
	REG_ID						VARCHAR2(30) NOT NULL,		--등록자(사번)
	REG_DT						VARCHAR2(30) NOT NULL,		--등록일시
	CHG_ID						VARCHAR2(30),				--수정자(사번)
	CHG_DT						VARCHAR2(30)				--수정일시
)
/*----------------------------------------------------------------------------------*/
--프로젝트 참여자 테이블
CREATE TABLE FL_PJT_MEMBER(
	PJT_SEQ						NUMBER,						--프로젝트일련번호
	EMP_SEQ						NUMBER,						--사원일련번호
	BIZ_DIV_CD					VARCHAR2(20) NOT NULL,		--참여업무구분
	PRE_STR_DAY					VARCHAR2(30) NOT NULL,		--예상시작일
	PRE_END_DAY					VARCHAR2(30) NOT NULL,		--예상종료일
	PRE_MM						NUMBER NOT NULL,			--예상투입인원
	REL_STR_DAY					VARCHAR2(30),				--실제시작일
	REL_END_DAY					VARCHAR2(30),				--실제종료일
	SKILL_CD					VARCHAR2(20) NOT NULL,		--기술등급코드
	POS_CD						VARCHAR2(20) NOT NULL,		--직위코드
	STAT_CD						VARCHAR2(20) NOT NULL,		--상태코드
	REG_ID						VARCHAR2(20) NOT NULL,		--등록자(사번)
	REG_DT						VARCHAR2(30) NOT NULL,		--등록일
	CHG_ID						VARCHAR2(20),				--수정자(사번)
	CHG_DT						VARCHAR2(30)				--수정일
	CONSTRAINT FL_PJT_MEMBER_PK
        PRIMARY KEY (PJT_SEQ, EMP_SEQ)
)

-- 시퀀스 생성

-- 사번 시퀀스
CREATE SEQUENCE SEQ_FLEMP_NO --시퀀스이름
    INCREMENT BY 1 -- 증감숫자 1
    START WITH 10001 -- 시작숫자 10001
    MINVALUE 10001 -- 최소값 10001
    MAXVALUE 99999 -- 최대값 99999
    NOCYCLE; -- 순환하지않음

--프로젝트 시퀀스
CREATE SEQUENCE SEQ_PJT_NO --시퀀스이름
    INCREMENT BY 1 -- 증감숫자 1
    START WITH 10001 -- 시작숫자 10001
    MINVALUE 10001 -- 최소값 10001
    MAXVALUE 99999 -- 최대값 99999
    NOCYCLE; -- 순환하지않음

--기관 시퀀스
CREATE SEQUENCE SEQ_ORG_NO --시퀀스이름
    INCREMENT BY 1 -- 증감숫자 1
    START WITH 10001 -- 시작숫자 10001
    MINVALUE 10001 -- 최소값 10001
    MAXVALUE 99999 -- 최대값 99999
    NOCYCLE; -- 순환하지않음
    
-- 프로시저


-- 로그인 프로시저




-- 프로젝트 업데이트 프로시저



