--[ORACLE TABLE] CLOUDMEMBER
CREATE TABLE CLOUDMEMBER (
    id VARCHAR2(15) PRIMARY KEY,  -- 아이디, 필수, 기본키
    pwd VARCHAR2(255) NOT NULL,   -- 비밀번호, 필수
    name VARCHAR2(50) NOT NULL,   -- 이름, 필수
    gender CHAR(1) NOT NULL,       -- 성별, 필수
    email1 VARCHAR2(100),          -- 이메일 아이디
    email2 VARCHAR2(100),          -- 이메일 주소
    tel1 VARCHAR2(3),              -- 전화번호 앞자리
    tel2 VARCHAR2(4),              -- 전화번호 중간자리
    tel3 VARCHAR2(4),              -- 전화번호 뒷자리
    zipcode VARCHAR2(20),          -- 우편번호
    addr1 VARCHAR2(255),           -- 주소
    addr2 VARCHAR2(255),            -- 상세주소
    logtime DATE
);

select * from cloudmember;

SELECT ID FROM CLOUDMEMBER WHERE NAME = '김태훈' AND EMAIL1 = 'codelily' AND EMAIL2 = 'naver';