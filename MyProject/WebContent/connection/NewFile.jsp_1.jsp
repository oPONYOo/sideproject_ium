<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<div id="map" style="width: 500px; height: 400px;"></div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44faab59aac70e5d26dd9487eff5cce4">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
	
	

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44faab59aac70e5d26dd9487eff5cce4"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
		var places = new kakao.maps.services.Places();
		places.setMap(map);
		var places = new kakao.maps.services.Places();

		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result);
		    }
		};


	</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44faab59aac70e5d26dd9487eff5cce4&libraries=services">
var places = new kakao.maps.services.Places();

//callback의 세 번째 인자로 Pagination의 인스턴스가 넘어온다.
var callback = function(result, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
		// do something

		// 특정 엘리먼트를 클릭했을 경우 다음 페이지 검색을 시도하는 예제
		var nextBtn = document.getElementById('nextBtn');

		nextBtn.click(function() {
			// 속성 값으로 다음 페이지가 있는지 확인하고
			if (pagination.hasNextPage) {
				// 있으면 다음 페이지를 검색한다.
				pagination.nextPage();
			}
		});
	}
};

places.keywordSearch('판교 치킨', callback);

</script>
</body>
</html>