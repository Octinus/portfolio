<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/reservation.css" />

  <div class="resertop">
    <h1>RESERVATIOM</h1>
  </div>

  <div class="resermain">
    <div class="calendar">
      <table>
        <tr class="month">
          <th colspan="7"><h3>${cal.yy}년 ${cal.mm}월</h3></th>
        </tr>
        <tr class="day">
          <c:forEach var="i" items="${cal.dayName}">
            <td>${i}</td>
          </c:forEach>
        </tr>
          <c:forEach var="j" items="${cal.calen}">
            <tr class="date">
            <c:forEach var="k" items="${j}" varStatus="status">
              <c:choose>
                <c:when test="${k == 0}">
                  <td></td>
                </c:when>
                <c:otherwise>
                  <td>
                    <c:choose>
                        <c:when test="${cal.today.substring(8) >= k || status.index == 0 || status.index == 6}">
                            <button class="closedatebtn" type="button" value="">${k}</button>
                        </c:when>
                        <c:otherwise>
                            <c:set var="find" value="0"/>
                            <c:forEach var="count" items="${count}">
                                <c:if test="${count.dd == k && count.cnt == 16}">
                                    <c:set var="find" value="1"/>
                                    <button class="donedatebtn" type="button" value="">${k}</button>
                                </c:if> 
                            </c:forEach>

                            <c:if test="${find == 0}">
                                <button class="opendatebtn" type="button" value="${String.format('%02d',k)}"><a href="${contextPath}/reservation?booking_date=${cal.yy}-${cal.mm}-${k}">${k}</a></button>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                  </td>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </tr>
          </c:forEach>
      </table>
    </div>

    <div class="time">
      <table>
        <tr>
          <th colspan="4">
            <h3>예약 가능 시간</h3>
          </th>
        </tr>
        <tr>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('09:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">09:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="09:00">09:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('09:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">09:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="09:30">09:30</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('10:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">10:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="10:00">10:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('10:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">10:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="10:30">10:30</button>
            </c:if>
          </td>
        </tr>
        <tr>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('11:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">11:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="11:00">11:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('11:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">11:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="11:30">11:30</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('13:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">13:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="13:00">13:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('13:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">13:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="13:30">13:30</button>
            </c:if>
          </td>
        </tr>
        <tr>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('14:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">14:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="14:00">14:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('14:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">14:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="14:30">14:30</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('15:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">15:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="15:00">15:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('15:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">15:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="15:30">15:30</button>
            </c:if>
          </td>
        </tr>
        <tr>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('16:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">16:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="16:00">16:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('16:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">16:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="16:30">16:30</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('17:00:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">17:00</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="17:00">17:00</button>
            </c:if>
          </td>
          <td>
            <c:set var="find" value="0"/>
            <c:forEach var="output" items="${output}" varStatus="status">
                <c:if test="${output.booking_time.equals('17:30:00')}">
                  <c:set var="find" value="1"/>
                  <button class="closetimebtn" type="button" value="">17:30</button>
                </c:if> 
            </c:forEach>

            <c:if test="${find == 0}">
              <button class="opentimebtn" type="button" value="17:30">17:30</button>
            </c:if>
          </td>
        </tr>
      </table>
    </div>
  </div>

  <div class="reserbottom">
    <form method="post" action="${contextPath}/myReservation.ok">
      <input type="hidden" name="customer_id" id="customer_id" value="${login_info.getId()}"/>
      <input type="hidden" name="is_done" id="is_done" value="N"/>
      <label for="booking_date">예약일자</label>
      <input type="text" name="booking_date" id="booking_date" value="${input.booking_date}" readonly/>
      <label for="booking_time">예약시간</label>
      <input type="text" name="booking_time" id="booking_time" value="" readonly/>
      <label for="problem">입고 사유</label>
      <input type="text" name="problem" id="problem" placeholder="ex)오일 교환, 차량 소음"/>
      <button type="submit">예약</button>
    </form>
  </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

  $('.opendatebtn').on('click', (e) => {
    const idx = $(e.currentTarget).parent().index()
    if(idx == 0 || idx == 6) {
      $('#booking_date').attr('value', '')
      $('.closetimebtn').attr('href', '')
      return
    }
    const date = $(e.currentTarget).attr('value')
    $('#booking_date').attr('value', '${cal.yy}-${cal.mm}-' + date)
    $('#booking_time').attr('value', '')
  });
  $('.opentimebtn').on('click', (e) => {
    const time = $(e.currentTarget).attr('value')
    $('#booking_time').attr('value', time)
  });
</script>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />