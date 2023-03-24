<%@page import="restaurantDB_java.restaurantDo"%>
<%@page import="java.util.ArrayList"%>
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
	request.setCharacterEncoding("UTF-8");
	String searchlist = request.getParameter("searchlist");
	String searchvalue = request.getParameter("searchvalue");
	ArrayList<restaurantDo> v = aDao.getAllRestaurant(searchlist, searchvalue);
%>
<center>
<h2> 5월 예약 목록 보기 </h2>
<hr>
<a href="restaurantForm.jsp"> 추가로 예약하기 </a>
<hr>

<form action="restaurantList.jsp" method="post">
	<select name="searchlist">
		<option value="name">이름</option>
		<option value="date">예약날짜</option>
	</select>
	<input type="text" name="searchvalue">
	<input type="submit" value="검색 ">
</form>

<table border="1">
	<tr height="60" align="center">
		<td width="150"> 이름 </td>
		<td width="150"> 전화번호 </td>
		<td width="150"> 이메일 </td>
		<td width="150"> 인원 수 </td>
		<td width="300"> 알러지 </td>
		<td width="300"> 예약 날짜 </td>
		<td width="300"> 예약 시간 </td>
	</tr>

<%
for(int i=0; i < v.size(); i++)
{
	restaurantDo aDo = v.get(i);
%>

<tr height="60" align="center">
	<td width="150"> <a href="restaurantInfo.jsp?num=<%= aDo.getNum() %>"><%= aDo.getName() %></a></td>
	<td width="150"> <%= aDo.getTel() %> </td>
	<td width="150"> <%= aDo.getEmail() %> </td>
	<td width="150"> <%= aDo.getPeople() %></td>
	<td width="300"> <%= aDo.getAllergy() %></td>
	<td width="300"> <%= aDo.getDate() %></td>
	<td width="300"> <%= aDo.getTime() %></td>
</tr>

<%
}
%>
</table>
</center>
</body>
</html>