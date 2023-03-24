<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2> 예약 정보 </h2>
<hr>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="aDo" class="restaurantDB_java.restaurantDo">
	<jsp:setProperty name="aDo" property="*"/>
</jsp:useBean>

<jsp:useBean id="aDao" class="restaurantDB_java.restaurantDao" scope="application" />
<%
	String[] allergy = request.getParameterValues("allergy");
	String allergyText = " ";
	for (int i=0; i<allergy.length; i++)
		allergyText += allergy[i] + " ";
	aDo.setAllergy(allergyText);
	 
	aDao.insertRestaurant(aDo);
%>

<table border="1">
	<tr height="60" align="center">
		<td width="100"> 이름 </td>
		<td width="300"> <%= aDo.getName() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 전화번호 </td>
		<td width="300"> <%= aDo.getTel() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 이메일 </td>
		<td width="300"> <%= aDo.getEmail() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 인원 수 </td>
		<td width="300"> <%= aDo.getPeople() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 알러지 </td>
		<td width="300"> <%= aDo.getAllergy() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 예약 날짜 </td>
		<td width="300"> <%= aDo.getDate() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 예약 시간 </td>
		<td width="300"> <%= aDo.getTime() %> </td>
	</tr>
</table>
<br>
<br>
<a href="restaurantList.jsp"> 5월 예약 목록 보기  </a>
</center>
</body>
</html>