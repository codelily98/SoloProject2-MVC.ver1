<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>

<%
    String id = request.getParameter("id");
    boolean exists = false;

    if (id != null && !id.isEmpty()) {
        MemberDAO dao = MemberDAO.getInstance();
        exists = dao.checkIdExists(id);
    }
%>
<%=exists ? "true" : "false" %>