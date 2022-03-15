<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<style>
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	.onoff {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
	}
</style>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
    	<h6 class="heading underline font-x2">영업시간 설정</h6>
    	<form action='/bhtime_set' method='post'>
    		<table>
    			<tr>
		    		<td>영업시간 설정</td>
		    		<td>오픈시간: </td>
		    		<td><select id='opentime' name='opentime'></select></td>
		    		<td>마감시간: </td>
		    		<td><select id='closetime' name='closetime'></select></td>
		    	</tr>
		    	<tr>
		    		<td>휴식시간 설정</td>
		    		<td>휴식시간: </td>
		    		<td><select id="resttime" name="resttime"></select></td>
		    	</tr>
		    	<tr>
		    		<td>ON/OFF 설정</td>
		    		<td>
			    		<label class="switch">
		  					<input type="checkbox">	
		  					<span class="slider round"></span>
						</label>
					</td>
					<td><p class="onoff">OFF</p><p class="onoff" style="display:none;">ON</p></td>
					<td><input style="display:none;" id="onoff" name="onoff"></td>
		    	</tr>
    	</table>
    	<input type="submit" value="설정완료">
    	</form>

    </div>
  </section>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {

		var opentime = "${bhtime.opentime}";
		var closetime = "${bhtime.closetime}";
		var resttime = "${bhtime.resttime}";
		var onoff = "${bhtime.onoff}";
		
		$("#onoff").val(onoff);
		
		if(onoff == "ON") {
			$("input[type=checkbox]").prop("checked", true);
			$(".onoff").toggle();
		}
		
		
		//시간 리스트
		var times = ['10:00', '11:00', '13:00', '14:00', '15:00'];
		
		//시간 기본값 입력
		$("#resttime").append("<option value=''>설정안함</option>")
		for(i in times) {
			if(times[i] == opentime) {
				$("#opentime").append("<option selected>" + times[i] + "</option>")
			}else if(times[i] == closetime) {
				$("#closetime").append("<option selected>" + times[i] + "</option>")
			}else if(times[i] == resttime) {
				$("#resttime").append("<option selected>" + times[i] + "</option>")
			}else {
				$("#opentime").append("<option>" + times[i] + "</option>")
				$("#closetime").append("<option>" + times[i] + "</option>")
				$("#resttime").append("<option>" + times[i] + "</option>")
			}
		}
		
		var check = $("input[type='checkbox']");
		check.click(function(){
			$(".onoff").toggle();
			if(check.is(":checked")) {
				$("#onoff").val("ON");
			}else {
				$("#onoff").val("OFF");
			}
			
		});
		
		//오픈시간 선택
		$("#opentime").on("change", function() {
			var open = $("#opentime").val();
			var close = $("#closetime").val();
			$("#closetime").empty();
			$("#resttime").empty();
			$("#resttime").append("<option value=''>설정안함</option>")
			for(i in times) {
				if(times[i] == close) {
					$("#closetime").append("<option selected>" + times[i] + "</option>")
				}else if(times[i] > open) {
					$("#closetime").append("<option>" + times[i] + "</option>")
					$("#resttime").append("<option>" + times[i] + "</option>")
				}
			}
		});//오픈시간 선택 end
		
		//마감시간 선택
		$("#closetime").on("change", function() {
			var open = $("#opentime").val();
			var close = $("#closetime").val();
			$("#opentime").empty();
			$("#resttime").empty();
			$("#resttime").append("<option value=''>설정안함</option>")
			for(i in times) {
				if(times[i] == open) {
					$("#opentime").append("<option selected>" + times[i] + "</option>")
				}else if(times[i] < close) {
					$("#opentime").append("<option>" + times[i] + "</option>")
					$("#resttime").append("<option>" + times[i] + "</option>")
				}
			}
		});//마감시간 선택 end
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>