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
     <table name="update" id="board_table">
     	<thead>
     		<tr>
     			<th>제목</th>
     			<th><input type="text" value="${dept.boardname }" name="boardname" id="boardname" size="50"></th>
     		</tr>
     	</thead>
     	<tbody>
     		<tr>
				<th>내용</th>
     			<th><input type="text" value="${dept.inboard }" name="inboard" id="inboard" size="50"></th>
    		</tr>
     	</tbody>

     </table>
     <hr/>
    	<a href="update?no=${dept.boardnum }" role="button" class="btn btn-outline-info">수정</a>	
     	<button style="float: right" onclick="history.back()">취소</button>	
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>