<%@page import="com.dvdshop.dao.DvdShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="../js/jquery-3.js"></script>
<script>
	function back(){
		location.href='../shop/control'
		
	}
	function logout(){
		
		location.href='../view/member/logout.jsp'
		
	}
	
	
	
</script>


	<%
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	DvdShopDAO dao = new DvdShopDAO();
	String dbPass = dao.memberLogin(id);
	if(dbPass!=null){
		if(dbPass.equals(pass)){
			session.setAttribute("login", "success");
			session.setAttribute("id", id);
			
			%>
		${param.id }님께서 로그인하셨습니다. <br><br>
		<input type="button" value="정보수정" onclick="movePage('up')">
        <input type="button" value="로그아웃" onclick="logout()"><br><br>
        <h3>찜리스트</h3>
        
			
		<% }else{%>
				<font size="2">로그인에 실패하였습니다.<br>확인하여주십시오.</font><br>
				<input type="button" value="되돌아가기" onclick="back()">
				 
				
			<% }%>
		<% }%>
		
	
	
