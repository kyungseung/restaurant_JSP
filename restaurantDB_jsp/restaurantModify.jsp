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
<h2> 주소록 수정 </h2>
<hr>

<form action="restaurantModifyProc.jsp" method="post">
	<table border="1">
		<tr height="60" align="center">
			<td width="100"> 이름 </td>
			<td width="200">
			<input type="text" name="name" value="<%= aDo.getName() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 전화번호 </td>
			<td width="200">
			<input type="text" name="tel" value="<%= aDo.getTel() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 이메일 </td>
			<td width="200">
			<input type="text" name="email" value="<%= aDo.getEmail() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 인원 수 </td>
			<td width="200">
			<input type="text" name="people" value="<%= aDo.getPeople() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 알러지 </td>
			<td width="200">
			<input type="text" name="allergy" value="<%= aDo.getAllergy() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 예약 날짜 </td>
			<td width="200">
			<input type="text" name="date" value="<%= aDo.getDate() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 예약 시간 </td>
			<td width="200">
			<input type="text" name="time" value="<%= aDo.getTime() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td colspan="2">
			<input type="hidden" name="num" value="<%= aDo.getNum() %>">
			<input type="submit" value="예약수정">
			<input type="button" value="예약목록"
			onclick="location.href='restaurantList.jsp'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>