<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		//System.out.println(application.getRealPath(request.getRequestURI()));	
		//System.out.println(request.getServletContext());
		//System.out.println(request.getRealPath("/"));
		System.out.println(ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/"));
	%>
</body>
</html>