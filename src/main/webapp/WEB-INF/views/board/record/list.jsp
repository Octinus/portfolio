<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
  .recordtop {
    font-weight: 900;
    margin: 20px 0 50px 0;
  }
  .recordtop h1 {
    display: contents;
    font-size: 30px;
  }

  .recordmain {
    border: 1px solid #b9b8b8;
    width: 1200px;
    line-height: 3;
    margin-bottom: 20px;
  }
  .recordmain tr:first-child {
    border-bottom: 1px dotted #8b8b8b;
  }
  .recordmain tr {
    border-bottom: 1px dotted #8b8b8b;
  }
  .recordmain tr:last-child {
    border: none;
  }
  .recordmain tr th:first-child {
    width: 100px;
  }
  .recordmain tr th:nth-child(3) {
    width: 800px;
  }
  .recordmain tr th {
    width: 100px;
  }
  .recordmain tr td {
    font-size: 12px;
  }
  .recordmain tr td:last-child {
    color: #8b8b8b;
    line-height: 1.2;
  }

  .recordbottom {
    margin: 40px 0 80px 0;
    display: flex;
    justify-content: space-between;
  }
  .recordbottom .recordresearch {
    text-indent: 20px;
  }
  .recordresearch select {
    background-color: white;
  }
  .recordresearch input {
    border: 1px solid #8b8b8b;
    background-color: white;
  }
  .recordresearch button {
    border: 1px solid black;
    width: 100px;
    font-size: 12px;
    color: white;
    background-color: black;
    line-height: 1.6;
  }
  .recordresearch button:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
    transition: all 0.5s;
  }
  .recordbottom .gowriter a {
    display: block;
    text-decoration: none;
    background-color: black;
    color: white;
    border: 1px solid black;
    font-size: 13px;
    padding: 10px;
    width: 150px;
  }
  .recordbottom .gowriter a:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
    transition: all 0.5s;
  }
</style>

<div class="recordtop">
  <h1>잊지 말자 정비 이력</h1>
</div>

<table class="recordmain">
  <tr>
    <th>NO</th>
    <th>CAR NO</th>
    <th>SUBJECT</th>
    <th>WRITER</th>
    <th>TECH</th>
    <th>DATE</th>
  </tr>
  <c:choose>
      <%-- 조회 결과가 없는 경우 --%>
      <c:when test="${output == null || fn:length(output) == 0}">
      <tr>
        <td colspan="4">검색하신 결과는 없습니다.</td>
      </tr>
        </c:when>
        <%-- 조회 결과가 있는 경우 --%>
        <c:otherwise>
          <%-- 조회 결과에 따른 반복 처리 --%>
          <c:forEach var="item" items="${output}" varStatus="status">

          <%-- 출력을 위해 준비한 컬럼들 --%>
          <c:set var="id" value="${item.id}" />
          <c:set var="carno" value="${item.carno}" />
          <c:set var="subject" value="${item.subject}" />
          <c:set var="writer_name" value="${item.writer_name}" />
          <c:set var="reg_date" value="${item.reg_date}" />
          <c:set var="tech_name" value="${item.tech_name}" />

          <%-- 검색어가 있다면? --%>
          <c:if test="${keyword != ''}">
          <%-- 검색어에 <mark> 태그를 적용한 문자열 변수를 준비 --%>
            <c:set var="mark" value="<mark>${keyword}</mark>" />

            <%-- 출력을 위해 준비한 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
            <c:set var="subject" value="${fn:replace(subject, keyword, mark)}" />
          </c:if> 

          <%-- 상세페이지로 이동하기 위한 URL --%>
          <c:url value="/record/read.do" var="viewUrl">
            <c:param name="id" value="${item.id}" />
          </c:url>

      <tr>
        <td>${id}</td>
        <td>${carno}</td>
        <td><a href="${viewUrl}">${subject}</a></td>
        <td>${writer_name}</td>
        <td>${tech_name}</td>
        <td>${reg_date}</td>
      </tr>
    </c:forEach>
  </c:otherwise>
</c:choose>
</table>

<div class="recordbottom">
  <div class="recordresearch">
  <select>
    <option value="subject">제목</option>
    <option value="carno">차량번호</option>
    <option value="writer_name">작성자</option>
  </select>
  <input type="text" id="input" name="input" />
  <button type="submit">SEARCH</button>
</div>
<div class="gowriter">
  <a href="${contextPath}/record/add_list">WIRTER</a>
</div>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />