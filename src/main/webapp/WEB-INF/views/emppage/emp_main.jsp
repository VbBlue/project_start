<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>
	      <div class="main">

	      	<div class="main_h">

	<div class="mypage_h" style="text-align: left;">
	<h6 class="heading underline font-x2" id="h6_login">나의 헌혈 정보</h6>
	</div>
<div class="contents">

	      			<div class="main_left">
	      			<div class="top_left"><div class="title">예약대기: </div><div class="content" id="res_count"></div></div>
	      			</div>
	      			<div class="main_right">
					<div class="top_right"><div class="title">오늘 헌혈예정: </div><div class="content" id="today_count"></div></div>
					</div>
</div>
<div class="contents_1">
<h6 class="heading underline font-x2" id="h6_login">혈액 보유량</h6>
</div>
<div class="res_center" style="background-color: transparent; text-align: -webkit-center;">
    				<div id="blood_count"></div>
    				<canvas id="blood_Chart" width="500" height="500"></canvas>
</div>

</div>

	</div>
		</div>
  </section>
  </div>
  <!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#res_count").append("<a href='/empres'>" + "${resCount}" + "명</a>")
		$("#today_count").append("<a href='/today_res'>" + "${todayCount}" + "명</a>")
		/* $("#blood_count").append("<div class='stat_bottom'><div class='title_bottom'>A</div><div class='content_bottom'>"+"${A}"+"</div></div>" +
								 "<div class='stat_bottom'><div class='title_bottom'>B</div><div class='content_bottom'>"+"${B}"+"</div></div>" +
								 "<div class='stat_bottom'><div class='title_bottom'>O</div><div class='content_bottom'>"+"${O}"+"</div></div>" +
								 "<div class='stat_bottom'><div class='title_bottom'>AB</div><div class='content_bottom'>"+"${AB}"+"</div></div>"); */
		
	});//ready
</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
<script>
const ctx = document.getElementById('blood_Chart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['A', 'B', 'AB', 'O'],
        datasets: [{
            label: '혈액형',
            data: ['${A}','${B}','${AB}','${O}'],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'
                
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)'
                
            ],
            datalabels: {
            	labels: {
            		value: {
            			borderWidth: 2,
            			borderRadius: 4,
            			font: {size: 15},
            			formatter: function(value, ctx) {
            				var value = ctx.dataset.data[ctx.dataIndex];
            				return value > 0 ? ctx.chart.data.labels[ctx.dataIndex]+'형 : '+value : null;
            			},
            			color: function(ctx) {
            				var value = ctx.dataset.data[ctx.dataIndex];
            				return value > 0 ? 'black' : null;
            			},
            			padding: 4
            			}
        		}
        	}
        }]
    },
    options: {
    	responsive: false,
    	hoverOffset: 4,
		plugins:{
			legend: {
				position: 'left'
			},
			title: {
				display: true,
				text: 'Pie Chart - Count',
				font: { size: 50 },
				fontstyle: 'bold',
				position: 'top'
			},
			title: {
				display: true,
				text: '혈액 보유량',
				font: {
					size: 25
				}
			}
		}
	}
});
</script>

<%@ include file="../includes/footer.jsp" %>