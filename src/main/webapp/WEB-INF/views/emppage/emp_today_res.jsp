<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
		<div class="center btmspace-80">
			<%@ include file="../emppage/emp_menu.jsp"%>
			<div class="list_main">
				<div class="list_search">
					<div class="date_top">
						<h6 class="heading underline font-x2" id="h_font">오늘 헌혈예정</h6>
					</div>
					<div id="result"></div>
					<table id="reslist">
					<tr id="reslist_head">
						<th>순번</th>
						<th>헌혈의집</th>
						<th>아이디</th>
						<th>예약일자</th>
						<th>예약시간</th>
						<th>기념품</th>
						<th>헌혈종류</th>
						<th>예약상태</th>
						<th>헌혈완료</th>
						<th>헌혈취소</th>
					</tr>
					<c:if test="${count == 0}">
					<tr>
						<td colspan="10">오늘 헌혈 예정내역이 없습니다.</td>
					</tr>
					</c:if>
					<c:if test="${count != 0}">
						<c:forEach items="reslist" var="list">
							<tr>
								<td>${list.r}</td>
								<td>${list.bhname}</td>
								<td>${list.userid}</td>
								<td>${list.resdate}</td>
								<td>${list.restime}</td>
								<td>${list.goods}</td>
								<td>${list.bhselect}</td>
								<td>${list.resstate}</td>
								<td><input type='button' id='res_confirm' value='예약확정'></td>
								<td><input type='button' id='res_cancel' value='예약취소'></td>
							</tr>
						</c:forEach>
					</c:if>
					</table>
					<c:if test="${count != 0}">
					<div id="page">
						<c:if test="${begin > pageNum}">
							<a href="findbhform?p=${begin-1}">[이전]</a>
						</c:if>
						<c:forEach begin="${begin}" end="${end}" var="i">
							<a href="findbhform?p=${i}">${i}</a>
						</c:forEach>
						<c:if test="${end < totalpages}">
							<a href="findbhform?p=${end+1}">[다음]</a>
						</c:if>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
<!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#reslist").on("click", "#res_confirm", function(data) {
			var resnum = $(this).parents("tr").find("#resnum").html();
			$.ajax({Type:"POST", url:"res_confirm", data:{"resnum":resnum}});
			alert("확정 완료");
			$("#page").trigger("click");
		});//예약확정 클릭
		$("#reslist").on("click", "#res_cancel", function() {
			var resnum = $(this).parents("tr").find("#resnum").html();
			$.ajax({Type:"POST", url:"res_cancel", data:{"resnum":resnum}});
			alert("취소 완료");
			$("#page").trigger("click");
		});//예약취소 클릭
	})
</script> 
</div>
<%@ include file="../includes/footer.jsp" %>