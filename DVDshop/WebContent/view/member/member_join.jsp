<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
	function back(){
		location.href='../shop/control'
	}
</script>


<h3>회원가입</h3>
<hr>

<form method="post" action="../shop/control?menu=join" >
	<table>
		<tr>
		<td>아이디:</td>
		<td> <input type="text" name="id" placeholder="아이디6-9자리 영문/숫자" size="30">
		<input type="button" id="idcheck" value="아이디중복확인">
		</td>
	</tr>
	<tr>
		<td>비밀번호: </td>
		<td><input type="password" name="pass" placeholder="비밀번호6-14자리 영문/숫자" size="30"></td>
	</tr>
	<tr>
		<td>생년월일 :</td> 
		<td><input type="text" size="4"  name="year">년
		<select name="month" id="month">
			<c:forEach begin="1" end="12" var="i">
			<option> ${i } </option>
			</c:forEach>
		</select> 월
		<select name="day" id="day">
			<c:forEach begin="1" end="31" var="i">
			<option> ${i } </option>
			</c:forEach>
		</select>일</td>
	</tr>
	<tr> 
		<td>전화번호 : </td>
		<td> <input type="text" size="4" name="phone1"> - <input type="text" size="4" name="phone2"> 
		- <input type="text" size="4" name="phone3"> </td>
	</tr>
	<tr>
		<td>이메일: </td><td>  <input type="text" name="email" size="15"> @ 
		<select name="domain" id="domain"> 
			<option>==선택==</option>
			<option>naver.com</option>
			<option>gmail.com</option>
			<option>hanmail.net</option>
			
		</select></td>
	</tr>
	<tr >
		<td colspan="2" align="center"><button>회원가입</button>
		<input type="button" value="취소" onclick="back()" ></td> 
	</tr>
</table>
</form>
