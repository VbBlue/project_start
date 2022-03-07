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
     <form action="insert" method="post">
     <table id="board_table">
     	<thead>
     		<tr>
     			<th>제목</th>
     			<th><input type="text" name="boardname" id="boardname" size="50"></th>
     		</tr>
     	</thead>
     	<tbody>
     		<tr>
				<th>내용</th>
     			<th><input type="text" name="inboard" id="inboard" size="50"></th>
    		</tr>
     	</tbody>
     </table>
     <hr/>
    	<button style="float: right" onclick="submit">작성</button> 	
     	<button style="float: right" onclick="history.back()">취소</button>	
     </form>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>