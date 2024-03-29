<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/center.css" />

<div class="centertop">
<h1>ABOUT 최씨네</h1>
</div>

<div class="centermain">
<div id="img">
  <a data-fslightbox="intro" href="${contextPath}/assets/img/1.jpg">
    <img src="${contextPath}/assets/img/1.jpg" width="350px" />
  </a>

  <a data-fslightbox="intro" href="${contextPath}/assets/img/1.jpg">
    <img src="${contextPath}/assets/img/1.jpg" width="350px" />
  </a>

  <a data-fslightbox="intro" href="${contextPath}/assets/img/1.jpg">
    <img src="${contextPath}/assets/img/1.jpg" width="350px" />
  </a>
</div>
</div>
<div class="centerbottom">
<div id="map"></div>
<div id="way">
  <h3>[오시는 길]</h3>
  <p><span>버스</span> - 1000번, 1001번, 1002번, 1003번, 1004번 버스(서울빌딩 정류소 하차)</p>
  <p><span>지하철</span> - 12호선 이용(민국역 하차 후 서울빌딩 방면 400m 도보)</p>
  <p><span>자가용</span> - (네비이용시) 서울구 서울동 서울로 1 최씨네 모터스 검색</p>
</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=357c088c2821e8fadc329da564217b55"></script>
<script>
  var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
  var options = { // 지도를 생성할 떄 필요한 기본 옵션
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 레벨(확대, 축소 정도)
  };
  
  var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
  </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fslightbox/3.4.1/index.min.js"></script>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />