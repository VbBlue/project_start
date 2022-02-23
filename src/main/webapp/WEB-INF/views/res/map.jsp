<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">예약하기</h6>
      <h1>여기에 만들면 됨 form 하고 등등</h1>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">예약하기</h6>
      <h1>여기에 만들면 됨 form 하고 등등</h1>
      <table border="1">
		<thead>
			<tr>
				<th>헌혈의집</th><th>주소</th><th>전화번호</th><th>혈액원</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bh_list}" var="bh" >
				<tr>
					<td>${bh.bhname}</td><td>${bh.bhlocation}</td><td>${bh.bhphone}</td><td>${bh.bhone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
      <div id="map" style="width:100%;height:600px;"></div>
      
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=280f48cb94b34b4e389e403bc684ac31&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 주소 - 좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();


var positions =[];
<c:forEach items="${bh_list}" var="bh">
	positions.push({
		content:'<form action="resform" method="post">'+
      			'<div style="padding:5px;">'+
      			'<input type="text" name="name" id="name" value='+"${bh.bhname}"+'><br>'+
      			'<input type="text" name="location" id="location" value="'+"${bh.bhlocation}"+'"><br>'+
      			'<input type="submit" >'+
      			'<input type="button" name="bhlike" id="bhlike" value="즐겨찾기">'+
      			'</div></form>',
		adr:"${bh.bhlocation}",
		iwRemoveable: true
	});
</c:forEach>


positions.forEach(function(v,i) {
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch(positions[i].adr, function(result, status){
		if(status === kakao.maps.services.Status.OK){
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : coords
			// 마커의 위치
			});
			
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content, // 인포윈도우에 표시할 내용
				adr : positions[i].adr,
				removable : positions[i].iwRemoveable
			});
			
			kakao.maps.event.addListener(marker, 'click', function(){
				infowindow.open(map, marker);
			});
			
		}
	})
})

</script>
>>>>>>> branch 'master' of https://github.com/shshshrj/project_start.git
<%@ include file="../includes/footer.jsp" %>