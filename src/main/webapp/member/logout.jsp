<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	//세션
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	session.removeAttribute("memEmail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web: Logout</title>
</head>
<body>
<script type="text/javascript">
window.onload = function() {
	location.href="../index.do";
}
</script>
</body>
</html>