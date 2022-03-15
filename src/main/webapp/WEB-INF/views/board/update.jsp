<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<form method="post" id="writeform" action="/update" >
		<input type="hidden" name="_method" value="put">
		<table border="1">
			<tr>	
				<td class="orange">제목</td>
				<td><input name="title" value="${dto.boardname }"/>
				<input name="no" value="${dto.boardnum}" type="hidden"> 
				</td>
			</tr>
			<tr>
				<td class="orange">작성자</td>
				<td><input name="id" value="${dto.empid}" readonly></td>
			</tr>
			<tr>
				<td class="orange">내용</td>
				<td><textarea name="content" cols="40" rows="10">
				${dto.inboard}
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글 수정 완료"> 
				</td>
			</tr>
		</table>
	</form>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<%@ include file="../includes/footer.jsp" %>