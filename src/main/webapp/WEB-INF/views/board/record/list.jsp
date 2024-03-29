<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/r_list.css" />

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

<div class="pageno">
  <!-- 페이지 번호 구현 -->
  <%-- 이전 그룹에 대한 링크 --%>
  <c:choose>
      <%-- 이전 그룹으로 이동 가능하다면? --%>
      <c:when test="${pagenation.prevPage > 0}">
          <%-- 이동할 URL 생성--%>
          <c:url value="/record" var="prevPageUrl">
              <c:param name="page" value="${pagenation.prevPage}" />
              <c:param name="keyword" value="${keyword}"/>
              <c:param name="field" value="${field}" />
          </c:url>
          <a href="${prevPageUrl}">[이전]</a>
      </c:when>
      <c:otherwise>

      </c:otherwise>
  </c:choose>

  <%-- 페이지 번호 (시작 페이지부터 끝 페이지까지 반복) --%>
  <c:forEach var="i" begin="${pagenation.startPage}" end="${pagenation.endPage}" varStatus="status">
      <%-- 이동할 URL 생성 --%>
      <c:url value="/record" var="pageUrl">
          <c:param name="page" value="${i}" />
          <c:param name="keyword" value="${keyword}" />
          <c:param name="field" value="${field}" />
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
          <c:url value="/record" var="nextPageUrl">
              <c:param name="page" value="${pagenation.nextPage}" />
              <c:param name="keyword" value="${keyword}"/>
              <c:param name="field" value="${field}" />
          </c:url>
          <a href="${nextPageUrl}">[다음]</a>
      </c:when>
      <c:otherwise>
      </c:otherwise>
  </c:choose>
</div>

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