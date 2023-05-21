<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <style>

    .techtable {
      border: 1px solid black;
      width: 600px;
      line-height: 3;
      margin: auto;
      padding-bottom: 50px;
    }

    .techtable th {
      border: 1px solid black;
    }

    .techtable td {
      border: 1px solid black;
    }
  </style>
  <div class="techtop">
    <h1>정비사 소개 페이지</h1>
  </div>
  <div class="techmain">
    <table class="techtable">
      <tr>
        <th rowspan="2">사진</th>
        <th>이름</th>
        <td>김정비사</td>
      <tr>
        <th>등급</th>
        <td>4</td>
      </tr>
      </tr>
      <tr>
        <th rowspan="2">사진</th>
        <th>이름</th>
        <td>김정비사</td>
      <tr>
        <th>등급</th>
        <td>4</td>
      </tr>
      </tr>
      <tr>
        <th rowspan="2">사진</th>
        <th>이름</th>
        <td>김정비사</td>
      <tr>
        <th>등급</th>
        <td>4</td>
      </tr>
      </tr>
      <tr>
        <th rowspan="2">사진</th>
        <th>이름</th>
        <td>김정비사</td>
      <tr>
        <th>등급</th>
        <td>4</td>
      </tr>
      </tr>
      <tr>
        <th rowspan="2">사진</th>
        <th>이름</th>
        <td>김정비사</td>
      <tr>
        <th>등급</th>
        <td>4</td>
      </tr>
      </tr>
    </table>
  </div>
  <c:import url="/WEB-INF/views/inc/bottom.jsp" />