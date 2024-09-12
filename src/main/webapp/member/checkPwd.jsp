<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, member.dao.MemberDAO" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
    boolean exists = false;
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("pwd", pwd);
    
    if (pwd != null && !pwd.trim().isEmpty()) {
        MemberDAO memberdao = MemberDAO.getInstance();
        exists = memberdao.checkPwdExists(map);
        
        System.out.println("나는 비번 체크" + exists);
    }
    
    response.setContentType("application/json");
    java.io.PrintWriter jsonOut = response.getWriter(); // PrintWriter 객체 이름을 jsonOut으로 변경
    jsonOut.print("{\"exists\": " + (exists ? "true" : "false") + "}");
    jsonOut.flush();
    jsonOut.close();
%>
