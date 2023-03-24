<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="aDo" class="restaurantDB_java.restaurantDo">
	<jsp:setProperty name="aDo" property="*" />
</jsp:useBean>

<jsp:useBean id="aDao" class="restaurantDB_java.restaurantDao" scope="application" />

<%
	aDao.modifyRestaurant(aDo); //수정된 데이터 저장
	response.sendRedirect("restaurantList.jsp"); //수정 데이터 확인
%>
</body>
</html>