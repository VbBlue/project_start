<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="wrapper row2">
	<section class="hoc container clear"> 
    	<div class="center btmspace-80">
      	<h6 class="heading underline font-x2">글쓰기</h6>
			<form method="post" action="boardinsert">
				<table border="1">
				<tr>
					<td class="orange">제목</td>
					<td><input name="boardname"/></td>
				</tr>
				<tr>
					<td class="orange">작성자</td>
					<td><input name="empid" value="없다" readonly></td>
				</tr>
				<tr>
					<td class="orange">내용</td>
					<td><textarea name="inboard" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="새글 등록"> 
					</td>
				</tr>
				</table>
			</form>
		</div>
	</section>
</div>
<%@ include file="../includes/footer.jsp" %>