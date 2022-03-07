<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">게시판</h6>
     <table id="board_table">
     	<thead>
     		<tr>
     			<th>번호</th>
     			<th>제목</th>
     			<th>작성자</th>
     			<th>날짜</th>
     			<th>조회수</th>
     		</tr>
     	</thead>
        <tbody>
         <c:forEach items="${listBoard}" var="list">
      	  <tr>
      	  	  <td><a href="boardView?no=${list.boardnum }">${list.boardnum}</a></td>
	      	  <td>${list.boardname}</td>
	     	  <td>${list.empid}</td>
	      	  <td>${list.boarddate}</td>
	      	  <td>${list.boardview}</td>                                              
     	  </tr>
      	  </c:forEach>
        </tbody>
     </table>
     <hr/>
     <button id="Crt_button"><a href="boardCreate">글쓰기</a></button>	
     
     <div id="board_number">
     		<a href="#"><</a>
     		<a href="1">1</a>
     		<a href="2">2</a>
     		<a href="3">3</a>
			<a href="4">4</a>
     		<a href="5">5</a>
     		<a href="#">></a>
     </div>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<%@ include file="../includes/footer.jsp" %>