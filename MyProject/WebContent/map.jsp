<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>이음</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 100vh;"></div>

	<script
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=44faab59aac70e5d26dd9487eff5cce4&libraries=clusterer"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566270, 126.977908), // 지도의 중심좌표
			level : 4, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커 클러스터러를 생성합니다 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 10
		// 클러스터 할 최소 지도 레벨 
		});

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition

			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		var data = [

				[
						37.566270,
						126.977908,
						'<div style="padding: 5px">서울도서관</div><a href="https://map.kakao.com/link/to/서울도서관,37.566270, 126.977908" style="color:blue" target="_blank">길 찾기</a><br><a href="http://localhost:9009/MyProject/roadview.jsp">로드뷰</a>' ],
				[
						37.564069,
						126.973724,
						'<div style="padding: 5px">서울시립미술관</div><a href="https://map.kakao.com/link/to/서울시립미술관,37.564069, 126.973724" style="color:blue" target="_blank">길 찾기</a><br><a href="#">큐알코드</a>' ],
				[
						37.570654,
						126.970557,
						'<div style="padding: 5px">서울역사박물관</div><a href="https://map.kakao.com/link/to/서울역사박물관,37.570654, 126.970557" style="color:blue" target="_blank">길 찾기</a>' ],
				[
						37.566807,
						126.978177,
						'<div style="padding: 5px">서울시청 시민청</div><a href="https://map.kakao.com/link/to/서울시청 시민청,37.566807, 126.978177" style="color:blue" target="_blank">길 찾기</a>' ],
				[
						37.566793,
						127.009489,
						'<div style="padding: 5px">동대문디자인플라자</div><a href="https://map.kakao.com/link/to/동대문디자인플라자DDP,37.566793, 127.009489" style="color:blue" target="_blank">길 찾기</a>' ],
				[
						37.645991,
						127.006372,
						'<div style="padding: 5px">서울시립강북청소년수련관</div><a href="https://map.kakao.com/link/to/서울시립강북청소년수련관,37.645991, 127.006372" style="color:blue" target="_blank">길 찾기</a><br><a href="#">큐알코드</a>' ],
				[
						37.658070,
						127.050765,
						'<div style="padding: 5px">서울시립창동청소년수련관</div><a href="https://map.kakao.com/link/to/서울시립창동청소년수련관,37.658070, 127.050765" style="color:blue" target="_blank">길 찾기</a><br><a href="#">큐알코드</a>' ],

				[
						37.634651,
						127.025544,
						'<div style="padding: 5px">강북여성인력개발센터</div><a href="https://map.kakao.com/link/to/강북여성인력개발센터,37.634651, 127.025544" style="color:blue" target="_blank">길 찾기</a><br><a href="http://localhost:9009/MyProject/QRCodeImg.jpg">큐알코드</a>' ] ];

		var markers = [];
		for (var i = 0; i < data.length; i++) {

			var imageSrc = 'http://localhost:9009/MyProject/marker.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(27, 69)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커가 표시될 위치입니다 
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption), markerPosition = new kakao.maps.LatLng(
					data[i][0], data[i][1]);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition,
				image : markerImage
			// 마커이미지 설정 

			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);

			var iwContent = data[i][2], // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			iwPosition = new kakao.maps.LatLng(data[i][2]); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent,
				removable : iwRemoveable

			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
			markers.push(marker);
			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, infowindow) {
				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					// 마커 위에 인포윈도우를 표시합니다
					infowindow.open(map, marker);
				});

			})(marker, infowindow);

		}
		clusterer.addMarkers(markers);
	</script>
</body>
</html>