<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  .resertop {
    margin: 20px auto 80px auto;
    font-size: 25px;
    width: 180px;
    border-bottom: 1px solid black;
  }
  .resertop h1 {
    padding-bottom: 10px;
  }

  .calendar {
    width: 500px;
    margin-bottom: 100px;
  }
  .calendar, .time {
    display: inline-flex;
  }
  .calendar table {
    margin: auto;
    line-height: 3;
    border: 2px solid #8b8b8b;
    text-align: center;
  }
  .calendar th {
    width: 400px;
    font-size: 25px;
    
  }
  .month {
    border-bottom: 1px dotted #8b8b8b;
    background-color: #b5d1fa;
    font-weight: 600;
  }
  .calendar .day td {
    font-size: 25px;
    line-height: 2;
  }
  .calendar .day td:first-child {
    color: red;
  }
  .calendar .day td:last-child {
    color: blue;
  }
  
  .date td .opendatebtn {
    border: none;
    width: 40px;
    font-size: 20px;
    font-weight: 300;
    text-align: center;
    background-color: #ccf8ced3;
    margin: 10px;
  }
  .date td .opendatebtn:hover {
    background-color: #b5d1fa;
  }
  .date td:nth-child(1) .opendatebtn,
  .date td:nth-child(7) .opendatebtn,
  .closedatebtn {
    font-size: 20px;
    font-weight: 300;
    background-color: #e9e9e9;
    border: none;
    width: 40px;
    text-align: center;
    margin: 10px;
  }
  .time table {
    line-height: 3;
    border: 2px solid #8b8b8b;
    text-align: center;
  }
  .time table th {
    font-size: 25px;
    width: 300px;
    border-bottom: 1px dotted #8b8b8b;
  }
  .time table td:first-child {
    padding-top: 10px;
  }
  .time td button{
    font-size: 20px;
    margin-bottom: 10px;
    border: none;
    font-weight: 300;
    background-color: #ccf8ced3;
  }
  .time td button:hover {
    background-color: #b5d1fa;
  }

  .reserbottom {
    margin-bottom: 100px;
    display: inline-flex;
  }
  .reserbottom input {
    border: 1px solid #8b8b8b;
    width: 120px;
  }
  .reserbottom button {
    border: 1px solid #8b8b8b;
  }
</style>
<c:import url="/WEB-INF/views/inc/top.jsp" />

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
            <c:forEach var="k" items="${j}">
              <c:choose>
                <c:when test="${k == 0}">
                  <td></td>
                </c:when>
                <c:otherwise>
                  <c:choose>
                    <c:when test="${cal.today.substring(8) >= k}">
                      <td><button class="closedatebtn" type="button" value="">${k}</button></td>
                    </c:when>
                    <c:otherwise>
                      <td><button class="opendatebtn" type="button" value="${String.format('%02d',k)}">${k}</button></td>
                    </c:otherwise>
                  </c:choose>
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
          <td><button class="timebtn" type="button" value="09:00">09:00</button></td>
          <td><button class="timebtn" type="button" value="09:30">09:30</button></td>
          <td><button class="timebtn" type="button" value="10:00">10:00</button></td>
          <td><button class="timebtn" type="button" value="10:30">10:30</button></td>
        </tr>
        <tr>
          <td><button class="timebtn" type="button" value="11:00">11:00</button></td>
          <td><button class="timebtn" type="button" value="11:30">11:30</button></td>
          <td><button class="timebtn" type="button" value="13:00">13:00</button></td>
          <td><button class="timebtn" type="button" value="13:30">13:30</button></td>
        </tr>
        <tr>
          <td><button class="timebtn" type="button" value="14:00">14:00</button></td>
          <td><button class="timebtn" type="button" value="14:30">14:30</button></td>
          <td><button class="timebtn" type="button" value="15:00">15:00</button></td>
          <td><button class="timebtn" type="button" value="15:30">15:30</button></td>
        </tr>
        <tr>
          <td><button class="timebtn" type="button" value="16:00">16:00</button></td>
          <td><button class="timebtn" type="button" value="16:30">16:30</button></td>
          <td><button class="timebtn" type="button" value="17:00">17:00</button></td>
          <td><button class="timebtn" type="button" value="17:30">17:30</button></td>
        </tr>
      </table>
    </div>
  </div>

  <div class="reserbottom">
    <form method="post" action="${contextPath}/myReservation.ok">
      <input type="hidden" name="customer_id" id="customer_id" value="${login_info.getId()}"/>
      <input type="hidden" name="is_done" id="is_done" value="N"/>
      <label for="booking_date">예약일자</label>
      <input type="text" name="booking_date" id="booking_date" value="" readonly/>
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
        return
      }
      const date = $(e.currentTarget).attr('value')
      $('#booking_date').attr('value', '${cal.yy}-${cal.mm}-' + date)
      $('#booking_time').attr('value', '')
    });
    $('.timebtn').on('click', (e) => {
      const time = $(e.currentTarget).attr('value')
      $('#booking_time').attr('value', time)
    });
  </script>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />