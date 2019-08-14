<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="../js/jquery-3.js"></script>
<script>
	var v = '';
	$(".genre").on('click', function() {
	var v = $(this).attr('value');
	
	$.ajax({
		url : '../shop/control',
		async: false,
		success : function(result) {
			$('#jb-content').html(result)
		},
		data : {
			menu : 'info',
			detail: v
			
		

		}
	}) //ajax

})//영화정보 click	

</script>

	<h3>${param.genreT}추천DVD</h3>	
	<hr>
	<table>
      		<tr>
      			<c:forEach items="${genre }" var="i">
      					<td align="center"><a class="genre" value="${i.dvd_num }">${i.dvd_photo}<br>${i.dvd_title }</a></td>
       			</c:forEach>
       		</tr>
       		

      	</table>
