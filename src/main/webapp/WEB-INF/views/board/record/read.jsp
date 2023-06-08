<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />
<style>
  .recordRtop {
    font-weight: 900;
    margin: 20px 0 50px 0;
  }
  .recordRtop h1 {
    display: contents;
    font-size: 30px;
  }

  .recordRtable {
    border: 1px solid #8b8b8b;
    width: 1200px;
  }
  .recordRtable tr {
    text-align: left;
    text-indent: 10px;
    line-height: 3;
    font-size: 13px;
    border-bottom: 1px dotted #d5d5d5;
  }
  .recordRtable tr th {
    width: 120px;
    text-align: center;
  }
  .recordRtable tr td,
  .recordRtable tr td p {
    width: 250px;
    background-color: white;
  }
  .recordRtable tr:nth-child(6) td {
    height: 600px;
  }
  .recordRtable tr:nth-child(6) td p {
    width: 1180px;
    margin: 5px auto 5px auto;
  }

  .recordRbottom {
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
    margin-bottom: 80px;
  }
  .recordRbottom a {
    text-decoration: none;
    display: block;
    font-size: 13px;
    color: black;
    width: 140px;
    height: 35px;
    padding-top: 10px;
    background-color: #d5d5d5;
  }
  .recordRbottom button {
    width: 140px;
  }
</style>

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
