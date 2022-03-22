<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>
<div>
    	<h6 class="heading underline font-x2">관리자게시판</h6>
    	<div style="width: 1000px;">
     		<div id="new_write"><a href="boardwrite">새글 등록</a></div>
			<table>
				<tr><th class="board_th" style="width: 60px;"></th><th class="board_th" style="width: 640px;">제목</th><th class="board_th" style="width: 150px;">작성자</th><th class="board_th" style="width: 200px;">작성일</th><th class="board_th" style="width: 70px;">조회수</th></tr>
				<c:if test="${count != 0}">
					<c:forEach items="${emp_blist}" var="board">
						<tr>
							<td class="board_td">${board.r}</td>
							<td class="board_td" id="board_title"><a href = "contents${board.boardnum}" style="color: black;">${board.boardname}</a></td>
						    <td class="board_td">${board.empid}</td>
						    <td class="board_td"><fmt:formatDate value="${board.boarddate}" dateStyle="short"/></td>
						    <td class="board_td">${board.boardview}</td></tr>
					</c:forEach>
				</c:if>
				<c:if test="${count == 0}">
					<tr>게시글이 존재하지 않습니다.</tr>
				</c:if>
			</table>
			
			<div id="page">
				<c:if test="${begin > pageNum}">
					<a href="boardform?p=${begin-1}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<a href="boardform?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end > totalpages}">
					<a href="boardform?p=${end+1}">[다음]</a>
				</c:if>
			</div>
		</div>
    	</div>
    </div>
  </section>
</div>
<%@ include file="../includes/footer.jsp" %>