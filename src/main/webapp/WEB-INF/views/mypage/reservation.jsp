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

  System.out.printf("[%d]년 [%d]월\n", yy, mm);
  html.append("<table>");
  for (int i = 0; i < cal.length; i++) {
    html.append("<tr>");
      for (int j = 0; j < cal[i].length; j++) {
          if (i == 0) {
            html.append("<th>" + dayName[j] + "</th>");
          } else if (cal[i][j] == 0) {
              html.append("<td></td>");
          } else {
              html.append("<td>" + cal[i][j] + "</td>");
          }
      }
      html.append("</tr>");
      System.out.println();
  }
  html.append("</table>");
%>

<c:import url="/WEB-INF/views/inc/top.jsp" />

  <h1>예약 페이지</h1>
  <br />
  <br />
  
    <%
    out.println(html.toString());
    %>
    <br />
    <br />
  <div class="calendar">
    <table>
      <tr>
        <th colspan="7"><h3>${yy}년 ${mm}월</h3></th>
      </tr>
      <tr>
        <c:forEach var="i" items="${dayName}">
          <td>${i}</td>
        </c:forEach>
      </tr>
      
        <c:forEach var="j" items="${cal}">
          <tr>
          <c:forEach var="k" items="${j}">
            <c:choose>
              <c:when test="${k == 0}">
                <td>.</td>
              </c:when>
              <c:otherwise>
                <td>${k}</td>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </tr>
        </c:forEach>
      
    </table>
    
  </div>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />