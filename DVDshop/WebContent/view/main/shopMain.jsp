<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
}

#jb-header {
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #bcbcbc;
	text-align: center;
}

#jb-sidebar-left {
	width: 160px;
	padding: 20px;
	margin-right: 20px;
	margin-bottom: 20px;
	float: left;
}

#jb-content {
	width: 450px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
}

#jb-sidebar-right {
	width: 160px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
}

a {
	cursor: pointer;
}
</style>
<script src="../js/jquery-3.js"></script>
<script>
	$(function() {
		$('#join').click(function() {
			$.ajax({
				url : '../view/member/member_join.jsp',
				success : function(result) {
					$('#jb-content').html(result)
				}

			})//ajax

		})//click

		$('#login').click(function() {
			$.ajax({
				url : '../view/member/login_confirm.jsp',
				success : function(result) {
					$('#loginDiv').html(result)
				},
				data : {
					id : $('#loginId').val(),
					pass : $('#loginPass').val()
				}
			})

		})//click

		$('#action').bind('click', function() {
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'movie',
					genre : 'ac',
					genreT : '액션/블록버스터'

				}
			}) //ajax

		})//click

		$('#comedy').bind('click', function() {
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'movie',
					genre : 'cm',
					genreT : '코미디'

				}
			}) //ajax

		})//click

		$('#drama').bind('click', function() {
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'movie',
					genre : 'dm',
					genreT : '드라마/로맨스'

				}
			}) //ajax

		})//click

		$('#fantasy').bind('click', function() {
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'movie',
					genre : 'sf',
					genreT : 'SF/판타지'

				}
			}) //ajax

		})//click

		$('#ani').bind('click', function() {
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'movie',
					genre : 'ani',
					genreT : '애니메이션'

				}
			}) //ajax

		})//click

		$('#mys').bind('click', function() {
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'movie',
					genre : 'my',
					genreT : '공포/스릴러'

				}
			}) //ajax

		})//click	
		
		var v = '';
		$(".dvd").on('click', function() {
			var v = $(this).attr('value');
			
			$.ajax({
				url : '../shop/control',
				success : function(result) {
					$('#jb-content').html(result)
				},
				data : {
					menu : 'info',
					detail: v
					
				

				}
			}) //ajax

		})//영화정보 click	
		
		
		
		
		

	})//ready
</script>

</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<h2>Blockbuster</h2>
		</div>

		<div id="jb-sidebar-left">
			<img src="../image/monitor.png"><br>
			<br>
			<div id="loginDiv">
				<form method="POST" action="login_confirm.jsp">
					<input type="text" size="16" id="loginId" placeholder="ID"><br>
					<input type="password" size="16" id="loginPass" placeholder="비밀번호"><br>
					<br> <input type="button" value="회원가입" id="join"> <input
						type="button" value="로그인" id="login">
				</form>

			</div>


		</div>

		<div id="jb-content">

			<h3>추천DVD</h3>
			<hr>
			<table>
				<tr>
					<c:forEach items="${list }" var="i">
						<td align="center"><a class="dvd" value="${i.dvd_num }">${i.dvd_photo}</a><br>${i.dvd_title }</td>
					</c:forEach>

				</tr>


			</table>


		</div>

		<div id="jb-sidebar-right">

			<br> <br> <a id="action">액션/블록버스터</a><br>
			<br> <a id="drama">드라마/로맨스</a><br>
			<br> <a id="comedy">코미디</a><br>
			<br> <a id="fantasy">SF/판타지</a><br>
			<br> <a id="ani">애니메이션</a><br>
			<br> <a id="mys">공포/스릴러</a><br>
		</div>
	</div>
</body>
</html>