<%@page import="restaurantDB_java.restaurantDo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="aDao" class="restaurantDB_java.restaurantDao" scope="application" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	restaurantDo aDo = aDao.getRestaurantOne(num);
%>

<center>
<h2> 선택한 예약내용 보기 </h2>
<hr>
<table border="1">
	<tr height="60" align="center">
		<td width="100"> 이름 </td>
		<td width="200"> <%= aDo.getName() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 전화번호 </td>
		<td width="200"> <%= aDo.getTel() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 이메일 </td>
		<td width="200"> <%= aDo.getEmail() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 인원 수 </td>
		<td width="200"> <%= aDo.getPeople() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 알러지 </td>
		<td width="200"> <%= aDo.getAllergy() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 예약 날짜 </td>
		<td width="200"> <%= aDo.getDate() %> </td>
	</tr>
	<tr height="60" align="center">
		<td width="100"> 예약시간 </td>
		<td width="200"> <%= aDo.getTime() %> </td>
	</tr>
	<tr height="60" align="center">
		<td colspan="2">
			<input type="button" value="예약수정"
			onclick="location.href='restaurantModify.jsp?num=<%= aDo.getNum() %>'">
			<input type="button" value="예약취소"
			onclick="location.href='restaurantDelete.jsp?num=<%= aDo.getNum() %>'">
			<input type="button" value="예약목록"
			onclick="location.href='restaurantList.jsp?num=<%= aDo.getNum() %>'">
		</td>
	</tr>
</table>
</center>
</body>
</html>