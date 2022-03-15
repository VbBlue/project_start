<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
	<section class="hoc container clear"> 
    	<div class="center btmspace-80">
      	<h6 class="heading underline font-x2">글쓰기</h6>
			<table border="1">
				<tr><td>제목</td><td>${dto.boardname}</td></tr>
				<tr><td>작성자</td><td>${dto.empid}</td></tr>
				<tr><td>내용</td><td>${dto.inboard}</td></tr>
				<tr><td>등록일</td><td><fmt:formatDate value="${board.boarddate}" dateStyle="short"/></td></tr>
				<tr><td>조회수</td><td>${dto.boardview}</td></tr>
				<tr><td colspan="2" align="right">
				<c:if test="${emp.empid == dto.empid}">
				<a href="/update${dto.boardnum}">글 수정</a>
				<a id="${dto.boardnum}" href="#">글 삭제</a>
				</c:if>
				<a href="../boardform">목록 이동</a>
				</td></tr>
			</table><br>
			
			<%-- <table id="${dto.no}">
				<tr><td>댓글</td><td><input type="text" name="content" id="content"></td><td><input type="button" id="commbtn" value="등록"></td></tr>
				<c:forEach items="${commlist}" var="comm">
						<tr><td>${comm.id}</td>
						    <td>${comm.content}</td>
						    <td><fmt:formatDate value="${comm.regdate}" dateStyle="short"/></td>
						    <c:if test="${user.id==comm.id}"><td><input type="button" class="delbtn" title="${comm.cno}" value="삭제"></td></c:if></tr>
				</c:forEach>
			</table> --%>
		</div>
	</section>
</div>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			$.ajax({url:"/board/delete", data:"boardnum="+boardnum, method:"delete"}
			).done(function(){
				location.href="/boardform";
			})
			return false;
		})//idclick
	})//ready

</script>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<%@ include file="../includes/footer.jsp" %>