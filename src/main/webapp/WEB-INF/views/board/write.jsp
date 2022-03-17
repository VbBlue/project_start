<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="wrapper row2">
	<section class="hoc container clear"> 
    	<div class="center btmspace-80">
      	<h6 class="heading underline font-x2">공지사항 작성</h6>
      		<div style="width: 50%;">
				<form method="post" action="boardinsert">
						<div class="board_write_div">
							<label>제목</label>
							<input name="boardname" id="boardname"/>
							<small class="error_next_box" id="error_title" style="color: red; align-self: center; padding: 5px;">
						</small>
						</div>
						<div class="board_write_div">
							<label>작성자</label>
							<input name="empid" value="${dto.empid}" readonly>
						</div>
						<div class="board_write_div">
							<label>헌혈센터 명</label>
							<input name="bhname" value="${dto.bhname}" readonly>
						</div>
						<div class="board_write_div">
							<label>내용</label>
							<textarea name="inboard" cols="40" rows="10" id="inboard"></textarea>
						</div>
					<div style="text-align: -webkit-right;">
						<input id="con_w_submit" type="submit" value="새글 등록"> 
					</div>	
				</form>
			</div>
		</div>
	</section>
</div>
<script>
	$("#con_w_submit").click(function(){
		$("#error_title").empty();
		let boardname = $("#boardname").val();
		
		if(boardname == ''){
			$("#error_title").append("제목은 필수사항입니다.")
			return false;
		}
	})
</script>
<%@ include file="../includes/footer.jsp" %>