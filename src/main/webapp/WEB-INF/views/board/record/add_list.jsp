<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <style>
    .requiredrecordtop {
      width: 520px;
      border-bottom: 1px solid black;
      font-size: 40px;
      padding-bottom: 5px;
      margin: 50px auto 0 auto;
    }
    .requiredrecordtop h1 {
      font-size: 40px;
      font-weight: 600;
    }

    .requiredrecordsearch {
      margin: 10px auto 100px auto;
    }
    .requiredrecordsearch form {
      text-align: left;
    }
    .requiredrecordsearch input,
    .requiredrecordsearch button {
      border: 1px solid #c5c5c5;
    }
    .requiredrecordsearch input {
      width: 150px;
      background-color: white;
    }
    .requiredrecordsearch button {
      cursor: pointer;
      border: 1px solid black;
      background-color: black;
      color: white;
      transition: all 0.5s;
    }
    .requiredrecordsearch button:hover {
      background-color: #f7f7f7;
      color: black;
      border: 1px solid black;
    }

    .requiredrecordmain {
      margin: 100px auto 20px auto;
    }
    .requiredrecordmain table {
      width: 1200px;
      line-height: 2.5;
    }
    .requiredrecordmain tr td {
      background-color: white;
    }
    .requiredrecordmain tr td a {
      text-decoration: none;
      background-color: white;
    }
    .requiredrecordmain tr:first-child {
      text-align: right;
      border: none;
    }
    .requiredrecordmain tr:first-child td {
      font-size: 12px;
      color: #acacac;
      background-color: #f7f7f7;
    }
    .requiredrecordmain tr:nth-child(2) {
      border-top: 2px solid #c5c5c5;
    }
    .requiredrecordmain tr {
      border: 1px solid #c5c5c5;
    }
    .requiredrecordmain tr:nth-child(2) th {
      background-color: #e2e1e1;
    }

    .requiredrecordbottom {
      margin-bottom: 10px;
    }
  </style>
  <div class="requiredrecordtop">
    <h1>이력 작성이 필요한 예약건</h1>
  </div>    

  <div class="requiredrecordmain">
    <!-- 조회 결과 목록 -->
    <table>
      <tr>
        <td colspan="7">※고객이름 클릭시 정비이력 작성페이지로 이동합니다.</td>
      </tr>
      <tr>
        <th>No</th>
        <th>이름</th>
        <th>예약일자</th>
        <th>예약시간</th>
        <th>차번호</th>
        <th>차종</th>
        <th>정비사</th>
      </tr>
      <c:choose>
      <%-- 조회 결과가 없는 경우 --%>
      <c:when test="${output == null || fn:length(output) == 0}">
      <tr>
        <td colspan="7">정비사를 배정하지 않은 예약건은 없습니다.</td>
      </tr>
        </c:when>
        <%-- 조회 결과가 있는 경우 --%>
        <c:otherwise>
            <%-- 조회 결과에 따른 반복 처리 --%>
            <c:forEach var="item" items="${output}" varStatus="status">

            <%-- 출력을 위해 준비한 컬럼들 --%>
            <c:set var="name" value="${item.name}" />
            <c:set var="id" value="${item.id}" />
            <c:set var="booking_date" value="${item.booking_date}" />
            <c:set var="booking_time" value="${item.booking_time}" />
            <c:set var="carno" value="${item.carno}" />
            <c:set var="carmo" value="${item.carmo}" />
            <c:set var="tech_id" value="${item.tech_id}" />
            <c:set var="tech_name" value="${item.tech_name}" />

            <%-- 검색어가 있다면? --%>
            <c:if test="${keyword != ''}">
            <%-- 검색어에 <mark> 태그를 적용한 문자열 변수를 준비 --%>
                <c:set var="mark" value="<mark>${keyword}</mark>" />

                <%-- 출력을 위해 준비한 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
                <c:set var="name" value="${fn:replace(name, keyword, mark)}" />
                <c:set var="booking_date" value="${fn:replace(booking_date, keyword, mark)}" />
            </c:if> 
                    
            <%-- 상세페이지로 이동하기 위한 URL --%>
            <c:url value="/record/add_list.do" var="viewUrl">
                <c:param name="id" value="${item.id}" />
            </c:url>

            <tr>
                <td>${id}</td>
                <td><a href="${viewUrl}">${name}</a></td>
                <td>${booking_date}</td>
                <td>${booking_time}</td>
                <td>${carno}</td>
                <td>${carmo}</td>
                <td>${tech_name}</td>
            </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </table>
    </div>

  <div class="requiredrecordbottom">
  <!-- 페이지 번호 구현 -->
  <%-- 이전 그룹에 대한 링크 --%>
  <c:choose>
      <%-- 이전 그룹으로 이동 가능하다면? --%>
      <c:when test="${pagenation.prevPage > 0}">
          <%-- 이동할 URL 생성--%>
          <c:url value="/reservationmanagement" var="prevPageUrl">
              <c:param name="page" value="${pagenation.prevPage}" />
              <c:param name="keyword" value="${keyword}"/>
          </c:url>
          <a href="${prevPageUrl}">[이전]</a>
      </c:when>
      <c:otherwise>
      </c:otherwise>
  </c:choose>


  <%-- 페이지 번호 (시작 페이지부터 끝 페이지까지 반복) --%>
  <c:forEach var="i" begin="${pagenation.startPage}" end="${pagenation.endPage}" varStatus="status">
      <%-- 이동할 URL 생성 --%>
      <c:url value="/reservationmanagement" var="pageUrl">
          <c:param name="page" value="${i}" />
          <c:param name="keyword" value="${keyword}" />
      </c:url>

      <%-- 페이지 번호 출력--%>
      <c:choose>
          <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
          <c:when test="${pagenation.nowPage == i}">
              <b>[${i}]</b>
          </c:when>
          <%-- 나머지 페이지의 경우 링크 적용함 --%>
          <c:otherwise>
              <a href="${pageUrl}">[${i}]</a>
          </c:otherwise>
      </c:choose>
  </c:forEach>

  <%-- 다음 그룹에 대한 링크 --%>
  <c:choose>
      <%-- 다음 그룹으로 이동 가능하다면? --%>
      <c:when test="${pagenation.nextPage > 0}">
          <%-- 이동할 URL 생성--%>
          <c:url value="/reservationmanagement" var="nextPageUrl">
              <c:param name="page" value="${pagenation.nextPage}" />
              <c:param name="keyword" value="${keyword}"/>
          </c:url>
          <a href="${nextPageUrl}">[다음]</a>
      </c:when>
      <c:otherwise>
      </c:otherwise>
  </c:choose>
</div>


<div class="requiredrecordsearch">
  <!-- 검색 form -->
  <form method="get" action="${contextPath}/reservationmanagement">
    <label for="keyword">검색</label>
    <input type="search" name="keyword" id="keyword" value="${keyword}" />
    <button type="submit">SEARCH</button>
  </form>
</div>

  <c:import url="/WEB-INF/views/inc/bottom.jsp" />
