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
      	<h6 class="heading underline font-x2">게시판</h6>
     	<div align = "right"><a href="boardwrite">새글 등록</a></div>
			<table>
				<tr><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
				<c:if test="${count != 0}">
					<c:forEach items="${bList}" var="board">
						<tr><td><a href = "contents${board.boardnum}">${board.boardname}</a></td>
						    <td>${board.empid}</td>
						    <td><fmt:formatDate value="${board.boarddate}" dateStyle="short"/></td>
						    <td>${board.boardview}</td></tr>
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
	</section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<%@ include file="../includes/footer.jsp" %>