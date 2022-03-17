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
      	<h6 class="heading underline font-x2">상세보기</h6>
      		<div style="width: 800px; height: 500px;">
      			<div id="contents_t_d">
					<div style="width: 690px;" id="con_title">
						<div class="con_t_id">제목 </div>
						<div style="width: 570px; margin-left: 10px;">${dto.boardname}</div>
					</div>
					<div class="con_d_v">날짜 : <fmt:formatDate value="${dto.boarddate}" dateStyle="short"/></div>
      			</div>
      			<div id="contents_id_v">
					<div style="width: 690px;" id="con_title">
						<div class="con_t_id">작성자 </div>
						<div style="width: 570px; margin-left: 10px; text-align: left; ">${dto.empid}</div>
					</div>
					<div class="con_d_v">조회수 :  ${dto.boardview}</div>
      			</div>
				<div id="con_inboard"><textarea >${dto.inboard}</textarea></div>
				<div style="text-align: right; margin-top: 10px;">
				<c:if test="${emp.empid == dto.empid}">
				<a href="/update${dto.boardnum}">글 수정</a>
				<a id="${dto.boardnum}" href="#">글 삭제</a>
				</c:if>
				<a href="javascript:history.back();">목록 이동</a>
				</div>
			</div>
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