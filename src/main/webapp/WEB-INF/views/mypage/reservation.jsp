<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  StringBuffer html = new StringBuffer();

  Calendar c = Calendar.getInstance();

  int yy = c.get(Calendar.YEAR);
  request.setAttribute("yy", yy);

  int mm = c.get(Calendar.MONTH) + 1;
  request.setAttribute("mm", mm);

  int weekCnt = c.getActualMaximum(c.WEEK_OF_MONTH);
  request.setAttribute("weekCnt", weekCnt);
  int dayCnt = c.getActualMaximum(c.DAY_OF_MONTH);
  request.setAttribute("dayCnt", dayCnt);

  c.set(c.DAY_OF_MONTH, 1);
  int first = c.get(c.DAY_OF_WEEK);
  request.setAttribute("first", first);

  String[] dayName = { "일", "월", "화", "수", "목", "금", "토" };
  request.setAttribute("dayName", dayName);

  int[][] cal = new int[weekCnt + 1][7];
  
  int cnt = 1;

  for (int i = 0; i < cal.length; i++) {
      for (int j = 0; j < cal[i].length; j++) {
          if ((i == 0) || (i == 1 && j < first - 1) || cnt > dayCnt) {
              cal[i][j] = 0;
          } else {
              cal[i][j] = cnt++;
          }
      }
  }
  request.setAttribute("cal", cal);
%>
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
  }
  .calendar .day td {
    font-size: 25px;
    padding: 10px;
  }
  .calendar .day td:first-child {
    color: red;
  }
  .calendar .day td:last-child {
    color: blue;
  }
  
  .date td button {
    border: none;
    width: 40px;
    font-size: 20px;
    font-weight: 300;
    text-align: center;
    background-color: #ccf8ced3;
  }
  .date td button:hover {
    background-color: #b5d1fa;
  }
  .date td span {
    font-size: 20px;
    font-weight: 300;
    background-color: #e9e9e9;
    padding: 2px 9px 2px 9px;
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
    background-color: #ccf8ced3;
  }
  .time td button:hover {
    background-color: #b5d1fa;
  }

  .reserbottom {
    margin-bottom: 100px;
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
    <!-- <%    out.println(html.toString());    %> -->
  <div class="resermain">
    <div class="calendar">
      <table>
        <tr class="month">
          <th colspan="7"><h3>${yy}년 ${mm}월</h3></th>
        </tr>
        <tr class="day">
          <c:forEach var="i" items="${dayName}">
            <td>${i}</td>
          </c:forEach>
        </tr>
          <c:forEach var="j" items="${cal}">
            <tr class="date">
            <c:forEach var="k" items="${j}">
              <c:choose>
                <c:when test="${k == 0}">
                  <td></td>
                </c:when>
                <c:otherwise>
                  <c:choose>
                    <c:when test="${k % 7 == 0 || k % 7 == 6}">
                      <td><span>${k}</span></td>
                    </c:when>
                    <c:otherwise>
                      <td><button class="datebtn" type="button" value="${k}">${k}</button></td>
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
    <form>
      <label for="reserdate">예약일자</label>
      <input type="text" name="reserdate" id="reserdate" value="" readonly/>
      <label for="resertiem">예약시간</label>
      <input type="text" name="resertiem" id="resertiem" value="" readonly/>
      <button type="submit">예약</button>
    </form>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script>
    $('.datebtn').on('click', (e) => {
      const date = $(e.currentTarget).attr('value')
      $('#reserdate').attr('value', '${yy}-${mm}-' + date)
      $('#resertiem').attr('value', '')
    });
    $('.timebtn').on('click', (e) => {
      const time = $(e.currentTarget).attr('value')
      $('#resertiem').attr('value', time)
    });
  </script>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />