<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="member.dto.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page trimDirectiveWhitespaces="true"%>

<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    MemberDAO memberDAO = MemberDAO.getInstance();
    Map<String, String> map = new HashMap<String, String>();
    map.put("id", id);
    map.put("pwd", pwd);
    List<MemberDTO> list = memberDAO.loginMember(map);

    if (!list.isEmpty()) {
        String email = list.get(0).getEmail1() + "@" + list.get(0).getEmail2();
        String name = list.get(0).getName();

        session.setAttribute("memId", id);
        session.setAttribute("memName", name);
        session.setAttribute("memEmail", email);

        out.print(id + "|" + name + "|" + email);  // 로그인 성공시 정보 반환
    } else {
        out.print("err");  // 로그인 실패시 에러 반환
    }
%>
