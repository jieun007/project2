<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seoul Map</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/map.css">
    <link href="/resources/css/nav.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/btn.css" />
<body>
<div class="gtranslate_wrapper"></div>
<script>window.gtranslateSettings = {"default_language":"ko","languages":["ko","zh-CN","ja","es","en"],"wrapper_selector":".gtranslate_wrapper","switcher_horizontal_position":"left","switcher_vertical_position":"bottom","float_switcher_open_direction":"bottom"}</script>
<script src="https://cdn.gtranslate.net/widgets/latest/float.js" defer></script>


    <div id="map" style="width: 99vw; height: 92vh"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e8a6e5ea32f64e7db8062b80bca6e21"></script>
    <script>
        var locations = [
            {	
            	kind: '문화유산',
                name: '경복궁',
                x: 126.976924,
                y: 37.577644,
                imageUrl: '/resources/img/gyoung.jpg',
                link: '/map2?place=경복궁'
            },
            // Add more locations as needed
            {
            	kind:'공원',
                name: '서울숲',
                x: 127.037531,
                y: 37.544314,
                imageUrl: '/resources/img/Kidspark.jpg',
                link: '/map2?place=서울숲공원'
            },
            {
            	kind:'공원',
                name: '어린이대공원',
                x: 127.081881,
                y: 37.549355,
                imageUrl: '/resources/img/seoulforest.jpg',
                link: '/map2?place=어린이대공원'
            },
            {
            	kind: '발달상권',
                name: '동대문DDP',
                x: 127.009801,
                y: 37.567203,
                imageUrl: '/resources/img/DDP.jpg',
                link: '/map2?place=DDP(동대문디자인플라자)'
            },
            {
            	kind: '발달상권',
                name: '코엑스',
                x: 127.059108,
                y: 37.511815,
                imageUrl: '/resources/img/coex.jpg',
                link: '/map2?place=강남 MICE 관광특구'
            },
            {
            	kind: '문화유산',
                name: '선사유적지',
                x: 127.129902,
                y: 37.560183,
                imageUrl: '/resources/img/Historicalsite.jpg'
            },
            {
            	kind: '공원',
                name: '북한산둘레길',
                x: 126.994268,
                y: 37.661346,
                imageUrl: '/resources/img/Road.jpg',
                link: '/map2?place=북한산우이역'
            },
            {
            	kind: '공원',
                name: '낙성대공원',
                x: 126.959951,
                y: 37.471162,
                imageUrl: '/resources/img/Nakseongdae.jpg'
            },
            {
            	kind: '식물원',
                name: '푸른수목원',
                x: 126.825612,
                y: 37.483990,
                imageUrl: '/resources/img/Arboretum.jpg'
            },
            {
            	kind: '휴양림',
                name: '호암산 산림욕장',
                x: 126.924878,
                y: 37.450346,
                imageUrl: '/resources/img/aforestbath.jpg'
            },
            {
            	kind: '공원',
                name: '화랑대 철도공원',
                x: 127.093313,
                y: 37.624266,
                imageUrl: '/resources/img/Hwarangdae.jpg'
            },
            {
            	kind: '산',
                name: '도봉산',
                x: 127.015714,
                y: 37.700013,
                imageUrl: '/resources/img/MountDobong.jpg'
            },
            {
            	kind: '공원',
                name: '보라매공원',
                x: 126.919794,
                y: 37.493253,
                imageUrl: '/resources/img/BoramaePark.jpg',
                link: '/map2?place=신림역'
            },
            {
            	kind: '인구밀집지역',
                name: '홍대거리',
                x: 126.924230,
                y: 37.555849,
                imageUrl: '/resources/img/Hongdae.JPG',
                link: '/map2?place=홍대 관광특구'
            },
            {
            	kind: '박물관',
                name: '서대문 형무소',
                x: 126.956099,
                y: 37.574311,
                imageUrl: '/resources/img/prison.jpg'
            },
            {
            	kind: '공원',
                name: '반포 한강공원',
                x: 126.996013,
                y: 37.510651,
                imageUrl: '/resources/img/HanRiverPark.jpg',
                link: '/map2?place=반포한강공원'
            },
            {
            	kind: '유적지',
                name: '정릉',
                x: 127.006430,
                y: 37.602279,
                imageUrl: '/resources/img/aroyaltomb.jpg'
            },
            {
            	kind: '발달상권,빌딩',
                name: '롯데타워',
                x: 127.102559,
                y: 37.512454,
                imageUrl: '/resources/img/LotteTower.jpg',
                link: '/map2?place=잠실 관광특구'
            },
            {
            	kind: '공원',
                name: '서서울호수공원',
                x: 126.829856,
                y: 37.527728,
                imageUrl: '/resources/img/LakePark.jpg'
            },
            {
            	kind: '백화점',
                name: '더현대 서울',
                x: 126.928523,
                y: 37.525856,
                imageUrl: '/resources/img/DepartmentStore.jpg',
                link: '/map2?place=여의도'
            },
            {
            	kind: '복합문화공간',
                name: '남산서울타워',
                x: 126.988304,
                y: 37.551183,
                imageUrl: '/resources/img/NamsanTower.jpg',
                link: '/map2?place=남산공원'
            },
            {
            	kind: '체험마을',
                name: '은평한옥마을',
                x: 126.939105,
                y: 37.641674,
                imageUrl: '/resources/img/HanokVillage.jpg'
            },
            {
            	kind: '발달상권',
                name: '명동',
                x: 126.984513,
                y: 37.563769,
                imageUrl: '/resources/img/Myeongdong.jpg',
                link: '/map2?place=명동 관광특구'    	
            },
            {
            	kind: '놀이공원',
                name: '용마랜드',
                x: 127.105436,
                y: 37.594833,
                imageUrl: '/resources/img/YongmaLand.jpg'
            }
        ];

        var mapContainer = document.getElementById('map');
        var mapCenter = new kakao.maps.LatLng(locations[0].y, locations[0].x);
        var mapOption = {
            center: mapCenter,
            level: 3
        };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var markers = [];
        var infoOverlay = new kakao.maps.CustomOverlay({
            xAnchor: 0.5,
            yAnchor: 1.1
        });

        var currentLocation = null; // 현재 표시된 위치 추적

        for (var i = 0; i < locations.length; i++) {
            var markerPosition = new kakao.maps.LatLng(locations[i].y, locations[i].x);

         // 각 위치에 대한 마커 작성
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

         // 각 마커에 클릭 이벤트 수신기 추가
            kakao.maps.event.addListener(marker, 'click', createDisplayInfoFunction(locations[i]));

         // 마커 배열에 마커 저장
            markers.push(marker);

         // 지도에 마커 설정
            marker.setMap(map);
        }

        function createDisplayInfoFunction(location) {
        	// 각 위치에 맞는 함수 만들기
            return function () {
                displayInfo(location);
            };
        }

        function displayInfo(location) {
            if (currentLocation === location) {
            	// 오버레이가 이미 이 위치에 표시된 경우 숨기기
                infoOverlay.setMap(null);
                currentLocation = null;
            } else {
            	// 오버레이가 보이지 않으면 클릭한 위치에 대해 오버레이를 표시합니다
                var content = '<div class="overlay_info" style="width: 340px; height: 275px; padding:1px">';
                content += '<h5 style="color: #00D369; margin-top: 10px; margin-bottom: 5px; margin-left: 10px">' + location.kind +'</h5>';
                content += '<strong style="display: flex; justify-content: space-between; align-items: center;">' +
                '<span style="margin-left: 10px">' + location.name + '</span>' +
                '<button class = "custom-btn btn" style="margin-left: auto; margin-right: 20px;" onclick="redirectToLink(\'' + location.link + '\')">실시간 인구 ' + location.name + '</button>' +
                '</strong>';
                content += '<div class="desc">';
                content += '<img src="' + location.imageUrl + '" alt="' + location.name + '" style="width:305px; height:200px;">';

                infoOverlay.setContent(content);
                infoOverlay.setPosition(markers[locations.indexOf(location)].getPosition());
                infoOverlay.setMap(map);

                currentLocation = location;
            }
        }
        function redirectToLink(link) {
            window.location.href = link;
        }

    </script>
</body>
</html>
