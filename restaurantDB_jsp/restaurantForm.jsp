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
<h2> 5월 식당 예약 </h2>
<hr>

<form action="restaurantProc.jsp" method="post">
	<table border="1">
		<tr height="60" align="center">
			<td width="100"> 이름 </td>
			<td width="430"> <input type="text" name="name"> </td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 전화번호 </td>
			<td width="430"> <input type="text" name="tel"> </td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 이메일 </td>
			<td width="430"> <input type="text" name="email"> </td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 인원 수 </td>
			<td width="430">
				<select name="people">
					<option value="2"> 2명 </option>
					<option value="3"> 3명 </option>
					<option value="4"> 4명 </option>
					<option value="5"> 5명 </option>
					<option value="6"> 6명 </option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 알러지 </td>
			<td width="430">
				<input type ="checkbox" name="allergy" value="갑각류 알러지"> 갑각류 알러지
				<input type ="checkbox" name="allergy" value="달걀 알러지"> 달걀 알러지
				<input type ="checkbox" name="allergy" value="땅콩 알러지"> 땅콩 알러지
				<input type ="checkbox" name="allergy" value="조개 알러지"> 조개 알러지
				<input type ="checkbox" name="allergy" value="견과 알러지"> 견과 알러지
				<input type ="checkbox" name="allergy" value="없음"> 없음
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 예약 날짜 </td>
			<td width="430">
				<select name="date">
					<option value="24일"> 24일 </option>
					<option value="25일"> 25일 </option>
					<option value="26일"> 26일 </option>
					<option value="27일"> 27일 </option>
					<option value="28일"> 28일 </option>
					<option value="29일"> 29일 </option>
					<option value="30일"> 30일 </option>
					<option value="31일"> 31일 </option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100"> 예약 시간 </td>
			<td width="430">
				<select name="time">
					<option value="17시"> 17시 </option>
					<option value="18시"> 18시 </option>
					<option value="19시"> 19시 </option>
					<option value="20시"> 20시 </option>
					<option value="21시"> 21시 </option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td colspan="2">
			<input type="submit" value="확인">
			<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>