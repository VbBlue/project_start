<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
	<section class="hoc container clear"> 
    	<div class="center btmspace-80">
      	<h6 class="heading underline font-x2">공지사항 수정</h6>
      		<div style="width: 50%;">
				<form method="post" id="writeform" action="/update">
						<div class="board_write_div">
							<label>제목</label>
							<input name="boardname" id="boardname" value="${dto.boardname}"/>
							<small class="error_next_box" id="error_title" style="color: red; align-self: center; padding: 5px;">
						</small>
						</div>
						<div class="board_write_div">
							<label>작성자</label>
							<input name="empid" value="${dto.empid}" readonly>
						</div>
						<div class="board_write_div">
							<label>헌혈센터 명</label>
							<input name="bhname" value="${dto.bhname}" readonly>
						</div>
						<div class="board_write_div">
							<label>내용</label>
							<textarea name="inboard" cols="40" rows="10" id="inboard">${dto.inboard}</textarea>
						</div>
					<div style="text-align: -webkit-right;">
						<input id="con_w_submit" type="submit" value="수정 완료"> 
					</div>	
				</form>
			</div>
		</div>
	</section>
</div>

<%-- <form method="post" id="writeform" action="/update" >
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
	</form> --%>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<%@ include file="../includes/footer.jsp" %>