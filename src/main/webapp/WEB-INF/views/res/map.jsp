<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .bh {border: none; background-color: transparent; width:100%;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 30px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
    .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
<div class="wrapper row2">
	<section class="hoc container clear">
		<div class="center btmspace-80">
			<h6 class="heading underline font-x2">예약하기</h6>
			<c:if test="${count != 0}">
				<table>
					<tr>
						<th>헌혈의집</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>혈액원</th>
					</tr>
					<c:forEach items="${bh_page_list}" var="bh">
						<tr id="${bh.bhname}">
							<td>${bh.bhname}</td>
							<td>${bh.bhlocation}</td>
							<td>${bh.bhphone}</td>
							<td>${bh.bhone}</td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
					<c:if test="${begin > pageNum}">
						<a href="mapform?p=${begin-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<a href="mapform?p=${i}">${i}</a>
					</c:forEach>
					<c:if test="${end < totalpages}">
						<a href="mapform?p=${end+1}">[다음]</a>
					</c:if>
				</div>
			</c:if>
			<c:if test="${count == 0}">
			</c:if>
			<div id="map" style="width: 100%; height: 600px;"></div>

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
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//내 위치 표시 코드
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        
        // 마커를 표시합니다
        displayMarker(locPosition);
            
      });
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667)
        
    displayMarker(locPosition);
}

function displayMarker(locPosition) {
	var imageSrc = '/icon/user_icon.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(54, 59), // 마커이미지의 크기입니다
	imageOption = locPosition;
	
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	markerPosition = locPosition; // 마커가 표시될 위치입니다
	
    var marker = new kakao.maps.Marker({
        position: markerPosition, 
        image: markerImage // 마커이미지 설정 
    });
    
    marker.setMap(map);
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);  
}

//지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 주소 - 좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

var positions =[];
<c:forEach items="${bh_list}" var="bh">
	positions.push({
		name:"${bh.bhname}",
		content:'<div class="wrap">' + 
		        '    <div class="info">' + 
		        '		<form action="resform" method="get">'+
		        '        <div class="title">' + 
		        '            <input type="text" class="bh" name="bhname" value="${bh.bhname}">' + 
		        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		        '        </div>' + 
		        '        <div class="body">' + 
		        '            <div class="desc">' + 
		        '                <div class="ellipsis"><input type="text" class="bh" name="bhlocation" value="${bh.bhlocation}"></div>' + 
		        '                <div><input type="submit" value="예약"></div>' + 
		        '            </div>' + 
		        '        </div>' + 
		        '		</form>'+
		        '    </div>' +    
		        '</div>',
		adr:"${bh.bhlocation}",
	});
</c:forEach>

var markers=[];
var overlay = new kakao.maps.CustomOverlay({
	content: null,
	map:map,
	position:null
});

function displayPlaces(positions) {
	positions.forEach(function(v,i) {
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(positions[i].adr, function(result, status){
			if(status === kakao.maps.services.Status.OK){
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var content = positions[i].content;

				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : coords
				})
				
				kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(content,coords);
                });
				
				marker.setMap(map); // 지도 위에 마커를 표출합니다
    			markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			}
		})
	})
}

function displayPlaceInfo (content,position) {
	overlay.setContent(content);
	overlay.setPosition(position);
    overlay.setMap(map);  
}

displayPlaces(positions);

function closeOverlay() {
    overlay.setMap(null);
}

$(".heart-click").click(function(){
	let bhname=$(this).attr('idx');
	alert("bhname");
})

</script>
<%@ include file="../includes/footer.jsp" %>