<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/r_read.css" />

<div class="recordRtop">
  <h1>RECORD</h1>
</div>

<div class="recordRmain">
  <table class="recordRtable">
    <tr>
      <th>고객 이름</th>
      <td colspan="3">${output.name}</td>
    </tr>
    <tr>
      <th>예약 날짜</th>
      <td>${output.booking_date}</td>
      <th>예약 시간</th>
      <td>${output.booking_time}</td>
    </tr>
    <tr>
      <th>차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
      <td>${output.carmo}</td>
      <th>차량 번호</th>
      <td>${output.carno}</td>
    </tr>
    <tr>
      <th>입고 사유</th>
      <td>${output.problem}</td>
      <th>작&nbsp;&nbsp;업&nbsp;&nbsp;자</th>
      <td>${output.tech_name}</td>
    </tr>
    <tr>
    <th>SUBJECT</th>
      <td>${output.subject}</td>
      <th>작&nbsp;&nbsp;성&nbsp;&nbsp;자</th>
      <td>${output.writer_name}</td>
    </tr>
    <tr>
      <td colspan="4">${output.content}</td>
    </tr>
  </table>
</div>

<div class="recordRbottom">
  <a href="${contextPath}/record">LIST</a>
  <c:if test="${login_info.getMem_type().equals('A') || login_info.getMem_type().equals('T')}">
    <a href="${contextPath}/record/edit.do?id=${output.id}">EDIT</a>
  </c:if>
</div>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />
