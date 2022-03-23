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
					<div id="result">
					
						<input type='button' id='check_confirm' value='선택 헌혈완료'>
						<input type='button' id='check_cancel' value='선택 헌혈취소'>
						<table id="reslist">
							<tr id="reslist_head">
								<th><input type='checkbox' id='all_check'></th>
								<th>순번</th>
								<th>헌혈의집</th>
								<th>아이디</th>
								<th>예약일자</th>
								<th>예약시간</th>
								<th>기념품</th>
								<th>헌혈종류</th>
								<th>예약상태</th>
								<th>예약확정</th>
								<th>예약취소</th>
							</tr>
						</table>
						<div id="pages"><input type='button' id='page' style="display:none"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	$(".wrapper").on("click", "#page", function() {
		$("#reslist_head").nextAll().remove();
			$("div[id='pages']").empty();
  	  	var p = $(this).prop("name");
  		$.getJSON("today_res_list", {"p":p}, function(data) {
  			if(data['count'] != 0) {
  	  			for(i in data['list']) {
  	  				var resdate = new Date(data['list'][i]['RESDATE']);
  	  				var year = resdate.getFullYear();
  	  				var month = ('0' + (resdate.getMonth() + 1)).slice(-2);
  	  				var day = ('0' + resdate.getDate()).slice(-2);
  	  				var dateString = year + '-' + month  + '-' + day;
  	  				$("#reslist").append("<tr><td><input type='checkbox' id='chk'></td><td id='data'>" +
  	  											  data['list'][i]['R'] + "</td><td id='data' name='bhname'>" + 
  	  											  data['list'][i]['BHNAME'] + "</td><td id='data' name='userid'>" +
  	  											  data['list'][i]['USERID'] + "</td><td id='data'>" +
  	  											  dateString + "</td><td id='data'>" +
  	  											  data['list'][i]['RESTIME'] + "</td><td id='data'>" +
  	  											  data['list'][i]['GOODS'] + "</td><td id='data' name='bhselect'>" +
  	  											  data['list'][i]['BHSELECT'] + "</td><td id='data'>" +
  	  											  data['list'][i]['RESSTATE'] + "</td><td style='display:None' id='resnum'>" + 
  	  											  data['list'][i]['RESNUM'] + "</td><td>" +
  	  											  "<input type='button' id='b_complete' value='헌혈완료'></td><td>" +
  	  											  "<input type='button' id='b_cancel' value='헌혈취소'></td>");
  	  			}
  	  			if(data['begin'] != 1) {
  	  				$("div[id='pages']").append("<a href='javascript:void(0);' id='page' name=" + (data['begin'] - 5) + ">" + "[이전]" + " " + "</a>")
  	  			}
  	  			for(i = data['begin']; i < data['end'] + 1; i++) {
  	  				$("div[id='pages']").append("<a href='javascript:void(0);' id='page' name=" + i + ">" + i + " " + "</a>");
  	  			}
  	  			if(data['count'] / 10 > data['end']) {
  	  				$("div[id='pages']").append("<a href='javascript:void(0);' id='page' name=" + (data['begin'] + 5) + ">" + "[다음]" + " " + "</a>")
  	  			}
  			}else if(data['count'] == 0) {
				$("#reslist").append("<tr><td colspan='10'>해당 기간에 헌혈 예정이 없습니다.</td></tr>");
	  		}
  		})//JSON
	});//페이지 클릭
	$("#page").trigger("click");
	$("#reslist").on("click", "#b_complete", function() {
		var bhname = $(this).parents("tr").find("td[name='bhname']").html();
		var userid = $(this).parents("tr").find("td[name='userid']").html();
		var bhselect = $(this).parents("tr").find("td[name='bhselect']").html();
		var resnum = $(this).parents("tr").find("#resnum").html();
		data = {
				"bhname":bhname,
				"userid":userid,
				"bhselect":bhselect,
				"resnum":resnum
		}
		$.ajax({Type:"POST", url:"b_complete", data});
		alert("헌혈 완료");
		$("#page").trigger("click");
	});//헌혈완료
	$("#reslist").on("click", "#b_cancel", function() {
		var resnum = $(this).parents("tr").find("#resnum").html();
		$.ajax({Type:"POST", url:"res_cancel", data:{"resnum":resnum}});
		alert("취소 완료");
		$("#page").trigger("click");
	});//예약취소 클릭
	$("#reslist").on("click", "#all_check", function() {
		if($("#all_check").is(":checked")) {
			$("input[id='chk']").prop("checked", true);
			
		}else {
			$("input[id='chk']").prop("checked", false);
		}	
	});//체크박스 전체선택
	$("#reslist").on("click", "#data", function() {
		if($(this).parents("tr").find("#chk").is(":checked")) {
			$(this).parents("tr").find("#chk").prop("checked", false);
		}else {
			$(this).parents("tr").find("#chk").prop("checked", true);
		}
	});//체크박스 하나 선택
	$("#check_confirm").on("click", function() {
		var test = $('#reslist').find('input[id="chk"]');
		for(i = 0; i < test.length; i++) {
			if(test.eq(i).is(":checked")) {
				var bhname = $(test.eq(i)).parents("tr").find("td[name='bhname']").html();
				var userid = $(test.eq(i)).parents("tr").find("td[name='userid']").html();
				var bhselect = $(test.eq(i)).parents("tr").find("td[name='bhselect']").html();
				var resnum = $(test.eq(i)).parents("tr").find("#resnum").html();
				data = {
						"bhname":bhname,
						"userid":userid,
						"bhselect":bhselect,
						"resnum":resnum
				}
				$.ajax({Type:"POST", url:"b_complete", data:{"resnum":resnum}});
			}
		}
		alert("확정 완료");
		$("#page").trigger("click");
	});//선택 예약확정
	$("#check_cancel").on("click", function() {
		var test = $('#reslist').find('input[id="chk"]');
		for(i = 0; i < test.length; i++) {
			if(test.eq(i).is(":checked")) {
				var resnum = $(test.eq(i)).parents("tr").find("#resnum").html();
				$.ajax({Type:"POST", url:"res_cancel", data});
			}
		}
		alert("취소 완료");
		$("#page").trigger("click");
	});//선택 예약취소
	
});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>