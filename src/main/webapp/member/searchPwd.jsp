<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="member.dao.MemberDAO"%>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("name", name);	
	String[] emailSP = email.split("@");
	if (emailSP.length == 2) {
	    String email1 = emailSP[0];
	    String email2 = emailSP[1];
	    
	    System.out.println("email1 : " + email1);
		System.out.println("email2 : " + email2);
		
		map.put("email1", email1);
		map.put("email2", email2);
	} else {
	    // 이메일 형식이 잘못된 경우 처리
	    out.print("유효하지 않은 이메일 형식입니다.");
	    return;
	}
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	String pwd = memberDAO.searchPwd(map);
	
	if (pwd != null) {
        out.print(pwd);
    } else {
        out.print("가입 정보가 없습니다.");
    }
%>