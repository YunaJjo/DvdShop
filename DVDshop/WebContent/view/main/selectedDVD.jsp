<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="../js/jquery-3.js"></script>
<script>
	$(function(){
		var code='';
		$('#rental').on('click',function(){
			code= '${info.dvd_num}'
			id='${sessionScope.id}'
	
			$.ajax({
				url: '../shop/control',
				success: function(result){
					$('#jb-content').html(result)
				},
				data: {
					
					menu: 'confirm',
					rentalcode: code,
					guest: id

				}
				
			})
			
			
			
			
		})//rental click
		
		
		
		
	})//ready

</script>


	<h3>영화정보</h3>
	<hr>
	<table style="table-layout: fixed">
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<tr>
			<td>${info.dvd_photo }</td>
		</tr>
		<tr>
			<td><strong>제목: </strong>${info.dvd_title }</td>
		</tr>
		<tr>
			<td><strong>감독: </strong>${info.dvd_director }</td>
		</tr>
		<tr>
			<td><strong>배우: </strong>${info.dvd_actor }</td>
		</tr>
		<tr>
			<td><strong>제작년도: </strong>
			<fmt:formatDate value="${info.dvd_year }" pattern='yyyy' /></td>
		</tr>
		<tr>
			<td><strong>장르: </strong>${info.dvd_genre }</td>
		</tr>
		<tr>
			<td><strong>제작국가: </strong>${info.dvd_country }</td>
		</tr>
		<tr>
			<td><strong>등급: </strong>${info.dvd_grade }</td>
		</tr>
		<tr>

			<td width='300px' style="word-break: break-all"><strong>줄거리:
			</strong>${info.dvd_story }</td>

		</tr>
		<tr>

			<c:if test="${info.dvd_stock>0 }">
				<td colspan="2" align="center"><input type="button" value="찜목록">
					<input type="button" id="rental" value="바로대여"></td>
			</c:if>
			<c:if test="${info.dvd_stock<=0 }">
				<td align="center"><input type="button" value="대여불가" disabled></td>
			</c:if>
		</tr>

	</table>
