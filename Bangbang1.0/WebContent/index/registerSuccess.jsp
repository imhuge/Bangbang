<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${request.info}</title>
</head>
<body topmargin="200" leftmargin="0" bgcolor="#f3f3f3">
	<table align="center" width="400" border="1" cellpadding="0" cellspacing="0"
	style="BORDER-RIGHT:#cccccc 1px solid;BORDER-TOP:#cccccc 1px solid;
	BORDER-LEFT:#cccccc 1px solid;BORDER-BOTTOM:#cccccc 1px solid;
	BORDER-COLLAPSE:collapse;BACKGROUND-COLOR:#ffffff">
		<tr height="30">
			<th colspan="2">${request.info}</th>
		</tr>
		<tr height="150">
			<th>${request.info}</th>
		</tr>
		<form>
		
		</form>
		<% 
			String url = (String)request.getAttribute("url");
			String username = (String)request.getAttribute("username");
			String password = (String)request.getAttribute("password");
			response.setHeader("Refresh","3;");
			//response.s
			response.sendRedirect(""+url+"?username="+username+"&password="+password);
		%>
	</table>
</body>
</html>