<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<div id="map" style="width: 500px; height: 400px;"></div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44faab59aac70e5d26dd9487eff5cce4">
	var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
	var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
		center : new kakao.maps.LatLng(33.450701, 126.570667), //������ �߽���ǥ.
		level : 3
	//������ ����(Ȯ��, ��� ����)
	};

	var map = new kakao.maps.Map(container, options); //���� ���� �� ��ü ����
</script>
	
	

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8" />
<title>Kakao ���� �����ϱ�</title>
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

//callback�� �� ��° ���ڷ� Pagination�� �ν��Ͻ��� �Ѿ�´�.
var callback = function(result, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
		// do something

		// Ư�� ������Ʈ�� Ŭ������ ��� ���� ������ �˻��� �õ��ϴ� ����
		var nextBtn = document.getElementById('nextBtn');

		nextBtn.click(function() {
			// �Ӽ� ������ ���� �������� �ִ��� Ȯ���ϰ�
			if (pagination.hasNextPage) {
				// ������ ���� �������� �˻��Ѵ�.
				pagination.nextPage();
			}
		});
	}
};

places.keywordSearch('�Ǳ� ġŲ', callback);

</script>
</body>
</html>