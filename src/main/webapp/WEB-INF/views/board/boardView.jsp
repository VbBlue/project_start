<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">글 작성</h6>
     <form method="post">
     <table id="board_table">
     	<thead>
     		<tr>
     			<th>번호</th><td>${dept.boardnum }</td>
     		</tr>
     		<tr>
     			<th>제목</th><td>${dept.boardname }</td>
     		</tr>
     		<tr>
     			<th>작성자</th><td>${dept.empid }</td>
     		</tr>
     		<tr>
     			<th>날짜</th><td>${dept.boarddate }</td>
     		</tr>
     		<tr>
     			<th>조회수</th><td>${dept.boardview }</td>
     		</tr>
     		<tr>
     			<th>내용</th><td>${dept.inboard }</td>
     		</tr>
     	</thead>
     	<tbody>
     		
     	</tbody>
     </table>
     <hr/>
    	<a href="boardUpdate?no=${dept.boardnum }" role="button" class="btn btn-outline-info">수정</a>
     	<a href="boardDelete?no=${dept.boardnum }" role="button" class="btn btn-outline-info">삭제</a>
     </form>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>