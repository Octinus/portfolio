<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <style>
    .techtop {
    margin: 20px auto 80px auto;
    font-size: 25px;
    width: 100px;
    border-bottom: 1px solid black;
    }
    .techtop h1 {
      padding-bottom: 10px;
    }

    .techmain {
      margin-bottom: 100px;
    }
    .techtable {
      border: 1px solid black;
      width: 600px;
      line-height: 3;
      margin: auto;
    }

    .techtable th {
      border: 1px solid black;
      
    }

    .techtable td {
      border: 1px solid black;
    }
  </style>

  <div class="techtop">
    <h1>정비사</h1>
  </div>

  <div class="techmain">
    <table class="techtable">
      <tr>
        <th colspan="4"><img src="${contextPath}/assets/img/tech1.png" alt="직원" /></th>
      </tr>
        <th>이름</th>
        <td>김정비사</td>
        <th>레벨</th>
        <td>4</td>
      <tr>
        <th colspan="4"><img src="${contextPath}/assets/img/tech1.png" alt="직원" /></th>
      </tr>
      <th>이름</th>
      <td>김정비사</td>
      <th>레벨</th>
      <td>4</td>
      <tr>
        <th colspan="4"><img src="${contextPath}/assets/img/tech1.png" alt="직원" /></th>
      </tr>
        <th>이름</th>
        <td>김정비사</td>
        <th>레벨</th>
        <td>4</td>
      <tr>
        <th colspan="4"><img src="${contextPath}/assets/img/tech1.png" alt="직원" /></th>
      </tr>
        <th>이름</th>
        <td>김정비사</td>
        <th>레벨</th>
        <td>4</td>
      <tr>
        <th colspan="4"><img src="${contextPath}/assets/img/tech1.png" alt="직원" /></th>
      </tr>
        <th>이름</th>
        <td>김정비사</td>
        <th>레벨</th>
        <td>4</td>
      <tr>
        <th colspan="4"><img src="${contextPath}/assets/img/tech1.png" alt="직원" /></th>
      </tr>
        <th>이름</th>
        <td>김정비사</td>
        <th>레벨</th>
        <td>4</td>
    </table>
  </div>
  <c:import url="/WEB-INF/views/inc/bottom.jsp" />