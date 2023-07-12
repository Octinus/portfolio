<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String today = dateTime.format(formatter);
    request.setAttribute("today", today);
%>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/home.css" />

<div class="ad-container">
  <div class="ad">
    <div class="ad-item">
      <img src="${contextPath}/assets/img/ad1.jpg" />
    </div>
    <div class="ad-item">
      <img src="${contextPath}/assets/img/ad2.jpg" />
    </div>
    <div class="ad-item">
      <img src="${contextPath}/assets/img/ad3.jpg" />
    </div>
    <div class="ad-item">
      <img src="${contextPath}/assets/img/ad4.jpg" />
    </div>
    <div class="ad-item">
      <img src="${contextPath}/assets/img/ad5.jpg" />
    </div>
  </div>
</div>

<div class="homemain">
  <div class="tip-container">
    <div class="login"> <!-- 메인 로그인 / 로그인시 환영인사 로그아웃 -->
      <c:choose>
        <c:when test="${login_info != null}">
          <p><a href="${contextPath}/my">${login_info.getName()}</a>님 안녕하세요.</p>
          <a href="${contextPath}/logout" class="golog">LOG OUT</a>
        </c:when>
        <c:otherwise>
          <a href="${contextPath}/login" class="golog">Log In</a>
        </c:otherwise>
      </c:choose>
    </div>
    <!-- 요령 slick 본체-->
    <div class="tip">
      <div class="tip-item">
        <img src="${contextPath}/assets/img/2.jpg" />
      </div>
      <div class="tip-item">
        <img src="${contextPath}/assets/img/3.jpg" />
      </div>
      <div class="tip-item">
        <img src="${contextPath}/assets/img/4.jpg" />
      </div>
      <div class="tip-item">
        <img src="${contextPath}/assets/img/5.jpg" />
      </div>
    </div>
  </div>

  

  <div class="booking">
    <h1>오늘의 예약 현황</h1>
    <table>
      <tr>
        <th>시간</th>
        <th>차종</th>
        <th>차번호</th>
        <th>이름</th>
      </tr>
      <c:choose>
      <%-- 조회 결과가 없는 경우 --%>
      <c:when test="${output == null || fn:length(output) == 0}">
      <tr>
        <td colspan="4" class="noreserv">오늘은 저희 영업소의 휴무일 입니다.</td>
      </tr>
        </c:when>
        <%-- 조회 결과가 있는 경우 --%>
        <c:otherwise>
            <%-- 조회 결과에 따른 반복 처리 --%>
            <c:forEach var="item" items="${output}" varStatus="status">

            <%-- 출력을 위해 준비한 컬럼들 --%>
            <c:set var="booking_time" value="${item.booking_time.substring(0, 5)}" />
            <c:set var="carmo" value="${item.carmo}" />
            <c:set var="carno" value="${item.carno}" />
            <c:set var="name" value='${item.name}' />

            <tr>
                <td>${booking_time}</td>
                <td>${carmo}</td>
                <td>${carno.substring(0, 2)}${carno.substring(2, 4)}X${carno.substring(4, 5)}X</td>
                <td>${name.substring(0, 1)}X${name.substring(2)}</td>
            </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
    </table>
  </div>
</div>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
  $(document).ready(function () {
    $('.ad').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: false,
      dots: false
    });
  });
  $(document).ready(function () {
    $('.tip').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 3000,
      dots: true,
      arrows: true,
      prevArrow: "<button type='button' class='slick-prev'><</button>",
      nextArrow: "<button type='button' class='slick-next'>></button>",
      dotsClass: "slick-dots"
    });
  });

</script>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />