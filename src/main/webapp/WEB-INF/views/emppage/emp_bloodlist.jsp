<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>
<div class="list_main">
				<div class="list_search">
					<div class="date_top">
						<h6 class="heading underline font-x2" id="h6_login">헌혈리스트</h6>

						<div class="date_btn_main">
							<div class="date_btn">
								<input type="button" class="emp_list_btn" id="last_year" value="작년">
							</div>
							<div class="date_btn">
								<input type="button" class="emp_list_btn" id="this_year" value="올해">
							</div>
							<div class="date_btn">
								<input type="button" class="emp_list_btn" id="recent_year" value="최근 1년">
							</div>
						</div>


						<div class="cal">
							<div class="cal_in">
								<input type="date" id="cal1" name="cal1" max="">
							</div>
							<p>~</p>
							<div class="cal_in">
								<input type="date" id="cal2" name="cal2" max="">
							</div>
						</div>


						<div>
							<div class="search_btn">
								<input type="button" value="조회"class="page_btn" id="page" >
							</div>
						</div>
					</div>
						<table id="blist">
							<tr id="blist_tr">
								<th>순번</th>
								<th>헌혈의집</th>
								<th>사용자아이디</th>
								<th>헌혈일자</th>
								<th>헌혈종류</th>
								<th>직원아이디</th>
							</tr>
						</table>
					<div id="pages"></div>
				</div>
			</div>


    </div>
  </section>
<!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var today = new Date().toISOString().split("T")[0];
  		$("#cal1").attr("max", today);
  		$("#cal2").attr("max", today);
  		var year = new Date();
  		var last_year = year.getFullYear()-1;
  		var this_year = year.getFullYear();

  		$("#last_year").click(function() {
  			$("#cal1").val(new Date(last_year, 0, 2).toISOString().split("T")[0]);
  			$("#cal2").val(new Date(this_year, 0).toISOString().split("T")[0]);
  		});//last_year 버튼 클릭
  		$("#this_year").click(function() {
  	  		$("#cal1").val(new Date(this_year, 0, 2).toISOString().split("T")[0]);
  	  		$("#cal2").val(new Date(this_year + 1, 0).toISOString().split("T")[0]);
  		});//this_year 버튼 클릭
  		$("#recent_year").click(function() {
  	  		$("#cal1").val(new Date(year.setFullYear(last_year)).toISOString().split("T")[0]);
  	  		$("#cal2").val(today);
  		});//최근 1년 버튼 클릭
  		$("#recent_year").trigger("click");
  		$(".wrapper").on("click", "#page", function() {
  			$("#blist_tr").nextAll().remove();
  			$("div[id='pages']").empty();
  			var cal1 = $("#cal1").val();
  	  		var cal2 = $("#cal2").val();
  	  		var p = $(this).prop("name");
  			$.getJSON("empblist_search", {"p":p, "cal1":cal1, "cal2":cal2}, function(data) {
  				if(data['count'] != 0) {
  	  				for(i in data['list']) {
  	  					var resdate = new Date(data['list'][i]['BHDATE']);
  	  					var year = resdate.getFullYear();
  	  					var month = ('0' + (resdate.getMonth() + 1)).slice(-2);
  	  					var day = ('0' + resdate.getDate()).slice(-2);
  	  					var dateString = year + '-' + month  + '-' + day;
  	  					$("#blist").append("<tr><td id='data'>" + data['list'][i]['R'] + "</td><td id='data'>" + 
  	  												  data['list'][i]['BHNAME'] + "</td><td id='data'>" +
  	  												  data['list'][i]['USERID'] + "</td><td id='data'>" +
  	  												  dateString + "</td><td id='data'>" +
  	  												  data['list'][i]['BHSELECT'] + "</td><td id='data'>" +
  	  												  data['list'][i]['EMPID'] + "</td></tr>");
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
  				}else {
  					$("#blist").append("<tr><td colspan='6'>다시 검색해주세요</td></tr>");
  	  			}
  			})//JSON
  		});//조회버튼 클릭
  		$(".page_btn").trigger("click");
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>