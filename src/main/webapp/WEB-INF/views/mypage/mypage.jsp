<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">마이페이지</h6>
      <!-- 마이페이지 내용(테이블) -->
			<table style='text-align:left;'>
				<tr>
					<td><input type='button' value='개인정보변경' id='mem_update'></td>
				</tr>
				<tr>
					<td><span id="Dday"></span><td>
				</tr>
				<tr>
					<td id="blood_cycle"><td>
				</tr>
				<tr>
					<td><input type='button' value='헌혈내역' id='bloodlist'>
				</tr>
				<tr id="reserve_stat"></tr>
				<tr>
					<td>보유 포인트: ${user.point}점</td>
					<td><input type='button' value='게임하기'></td>
				</tr>
				<tr>
					<td><input type='button' value='당첨내역' id='goodslist'></td>
				</tr>
				<tr>
					<td><input type='button' value='회원탈퇴' id='mem_delete'></td>
				</tr>
			</table>
    </div>
  </section>
  <!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var Dday = "${lastDay['Dday']}";
		var bhselect = "${lastDay['bhselect']}"
		$("#Dday").html("현재날짜 - 지난 헌혈일: " + Dday + "<br>지난 헌혈타입: " + bhselect);

		$.getJSON("reserv_stat", {"userid":"${user.userid}"}, function(data) {
			$("#reserve_stat").empty();
			if(data != null) {
				$("#reserve_stat").append("<td>헌혈의집: "+data.bhname+"<br>예약날짜: "+data.resdate+"<br>예약시간: "+data.restime+"<br>기념품: "+data.goods+"<br>헌혈종류: "+data.bhselect+"<br>예약상태: "+data.resstate+"</td><td><input type='button' value='예약변경' id='change'</td><td><input type='button' value='예약취소' id='cancel'></td>");
				$('#change').click(function() {
					location.href="/reservation_updateForm";
				});//예약변경 클릭
				$('#cancel').click(function() {
					window.open("/pass_chk?resnum="+data.resnum, "reservation_delete", "width=400px, height=400px");
				});//예약취소 클릭
			}else {
				$("#reserve_stat").append("<td><input type='button' value='예약하기' id='reservation'</td>")
				$('#reservation').click(function() {
					location.href="/mapform";
				});//예약하기 클릭
			}
		});//ajax
		$('#mem_update').click(function() {
			window.open("/pass_chk", "mem_update", "width=400px, height=400px");
		});//개인정보변경 클릭
		$('#mem_delete').click(function() {
			window.open("/pass_chk", "mem_delete", "width=400px, height=400px");
		});//회원탈퇴 클릭
		$('#bloodlist').click(function() {
			location.href="/bloodlist";
		});//헌혈내역 클릭
		$('#goodslist').click(function() {
			location.href="/goodslist";
		});//당첨내역 클릭
	});//ready
</script>
  </div>
<%@ include file="../includes/footer.jsp" %>
