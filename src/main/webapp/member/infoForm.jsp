<%@page import="java.util.List"%>
<%@page import="member.dto.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	
	System.out.println("session id: " + id);
	System.out.println("session name: " + name);
	System.out.println("session email: " + email);
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	List<MemberDTO> list = memberDAO.getInfo(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구름: 회원정보</title>
<link rel="stylesheet" type="text/css" href="../css/infoForm.css">
</head>
<body>
	<div id="headerwrap">
		<div id="header">
			<div id="topnav">
				<div id="topawrap">
					<%if (id != null) {%>
						<a href="./logout.jsp">로그아웃</a> |
						<a href="./infoForm.jsp">회원정보</a> |
						<a href="../index.jsp">홈</a>
					<%} else {%>
					    <a href="./loginForm.jsp">로그인</a> |
						<a href="../index.jsp">홈</a>
					<%}%>
				</div>
			</div>
			<div id="logowrap">
				<div id="logo">
					<img src="../image/logo.png" alt="logo">
					<br/><span>구름</span>
				</div>
			</div>
			<div id="menunav">
				<ul>
					<li>여행지정보</li>
					<li>커뮤니티</li>
					<li>일정관리</li>
				</ul> 
			</div>
		</div>
	</div>
		
	<div id="wrap">
	    <div id="container">
	        <div id="topcontent">
	            <%if(id != null) {%>
	            	<div id="userinfo">
	            	<form id="updateForm">
	            		<div id="inputwrap">
							<div id="inputid">
								<input type="text" id="id" name="id" placeholder="아이디" required="required" maxlength="15" readonly="readonly" value="<%=id%>">
							</div>
							<div id="inputpwd">
								<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required="required">
							</div>
							<div id="inputrepwd">
								<input type="password" id="repwd" name="repwd" placeholder="비밀번호 재입력" required="required">
							</div>
							<div id="inputname">
								<input type="text" id="name" name="name" placeholder="이름" required="required" required="required" value="<%=name%>">
							</div>
							<div id="checkinput"></div>
							<div id="inputgender">
								<label>
								    <input type="radio" name="gender" value="M" <% if ("M".equals(list.get(0).getGender())) { %> checked <% } %>/>
								    <div class="radio-btn">남자</div>
								</label>
								<label>
								    <input type="radio" name="gender" value="F" <% if ("F".equals(list.get(0).getGender())) { %> checked <% } %>/>
								    <div class="radio-btn">여자</div>
								</label>
							</div>
							<div id="inputemail">
								<input type="email" id="email1" name="email1" placeholder="이메일 아이디" value="<%=list.get(0).getEmail1()%>"><span>@</span>
								<input type="email" id="email2" name="email2" placeholder="이메일 주소" value="<%=list.get(0).getEmail2()%>">
					            <input id="email3" type="email" name="email3" list="email3_list">
					            <datalist id="email3_list">
					               <option value="직접입력"/>
					               <option value="naver.com"/>
					               <option value="hanmail.net"/>	               
					               <option value="gmail.com"/>
					            </datalist>
							</div>
							<div id="inputtel">
								<select id="tel1" name="tel1">
						            <option value="010" <% if (list.get(0).getTel1() == "010") { %> selected <% } %>>010</option>
									<option value="011" <% if (list.get(0).getTel1() == "011") { %> selected <% } %>>011</option>
									<option value="016" <% if (list.get(0).getTel1() == "016") { %> selected <% } %>>016</option>
						         </select><span>-</span> 
						         <input id="tel2" type="text" name="tel2" maxlength="4" placeholder="0000" value="<%=list.get(0).getTel2() %>"/><span>-</span> 
						         <input id="tel3" type="text" name="tel3" maxlength="4" placeholder="0000" value="<%=list.get(0).getTel3() %>"/>
							</div>
							<div id="inputaddr">
								<div id="zipcode-container">
							        <input type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="<%=list.get(0).getZipcode()%>">
							        <button type="button">우편번호 검색</button>
							    </div>
					            <input type="text" id="addr1" name="addr1" size="60" placeholder="주소" value="<%=list.get(0).getAddr1()%>"/><br/>
					            <input type="text" id="addr2" name="addr2" size="60" placeholder="상세주소" value="<%=list.get(0).getAddr2()%>"/>
							</div>
	            		</div>
	            		<div id="btnwrap">
	            			<input type="button" id="updatebtn" value="회원정보수정">
	            			<input type="button" id="resetbtn" value="다시입력">
	            		</div>
	            		</form>
					</div>
					<%} else {%>
					<div id="noid">
						<a href="../index.jsp">로그인이 필요합니다.</a>
					</div>
				<%}%>
			</div>
	    </div>	
	</div>
	
	<div id="footer">
		<div id="copyligth">
            나는 카피라이트
    	</div>
	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/update.js"></script>
</body>
</html>
