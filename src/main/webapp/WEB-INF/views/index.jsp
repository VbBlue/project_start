<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp" %>
<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<script>
	$(document).ready(
			function() {
				setInterval(function() {
					$('div.slidebanner ul').animate(
							{
								top : "-500"
							},
							1000,
							function() {
								$('div.slidebanner ul').append(
										$('div.slidebanner ul li').eq(0));
								$('div.slidebanner ul').css("top", 0);
							})
				}, 3000);
			})
</script>
<div class="wrapper bgded overlay">
	<div id="pageintro" class="hoc clear" >
		<div>
		가나다라
		</div>
		<div id="slide">
    		<div class="slidebanner">
        		<ul class="slide_left">
            		<li><img src="images/43944462-9380-491E-BB0B-3125A4301B96.jpeg"></li>
		    		<li><img src="images/496EF8B0-4083-44CB-A86D-9F0C57AD03E1.jpeg"></li>
		    		<li><img src="images/887A235F-20EC-4CA6-9006-D8309BFF2EE3.jpeg"></li>
		    		<li><img src="images/CAC686C6-4C1C-483E-8721-E58A8C622DEA.jpeg"></li>
		    		<li><img src="images/FDACFE0C-72D0-412C-A30C-EF0D846630D0.jpeg"></li>
        		</ul>
			</div>
		</div>
	</div>
</div>
      <footer>
        <ul class="nospace inline pushright">

        </ul>
      <h3 class="heading">헌혈의 집</h3>
      </footer>
<%@ include file="./includes/footer.jsp" %>
