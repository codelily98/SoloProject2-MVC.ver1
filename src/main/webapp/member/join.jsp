<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.dto.MemberDTO" %>

<%
    try {
        // 폼 데이터 가져오기
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email1 = request.getParameter("email1");
        String email2 = request.getParameter("email2");
        String tel1 = request.getParameter("tel1");
        String tel2 = request.getParameter("tel2");
        String tel3 = request.getParameter("tel3");
        String zipcode = request.getParameter("zipcode");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");

        // DTO 객체 생성 및 데이터 설정
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setId(id);
        memberDTO.setPwd(pwd);
        memberDTO.setName(name);
        memberDTO.setGender(gender);
        memberDTO.setEmail1(email1);
        memberDTO.setEmail2(email2);
        memberDTO.setTel1(tel1);
        memberDTO.setTel2(tel2);
        memberDTO.setTel3(tel3);
        memberDTO.setZipcode(zipcode);
        memberDTO.setAddr1(addr1);
        memberDTO.setAddr2(addr2);

        // DAO 객체를 사용하여 회원가입 처리
        MemberDAO memberDAO = MemberDAO.getInstance();
        boolean result = memberDAO.joinMember(memberDTO);

        if (result) {
            out.print("<script>alert('회원가입이 완료되었습니다.'); location.href='./index.do';</script>");
        } else {
            out.print("<script>alert('회원가입에 실패했습니다.'); location.href='./joinForm.do';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("<script>alert('오류가 발생했습니다.'); location.href='./joinForm.do';</script>");
    }
%>