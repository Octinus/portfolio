<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/drop.css" />

<div class="adtechtop">
  <h1>Drop Management</h1>
</div> 

<div class="adtechmain">
  <!-- 조회 결과 목록 -->
  <table>
    <form action="${contextPath}/drop_ok.do" method="post">
    <tr>
      <th colspan="6">
        <button type="submit">DELETE</button>
      </th>
    </tr>
    <tr>
      <th></th>
      <th>등록번호</th>
      <th>이름</th>
      <th>아이디</th>
      <th>연락처</th>
      <th>E-mail</th>
    </tr>
    <c:choose>
    <%-- 조회 결과가 없는 경우 --%>
    <c:when test="${output == null || fn:length(output) == 0}">
    <tr>
      <td colspan="6">조회 결과가 없습니다.</td>
    </tr>
      </c:when>
      <%-- 조회 결과가 있는 경우 --%>
      <c:otherwise>
          <%-- 조회 결과에 따른 반복 처리 --%>
          <c:forEach var="item" items="${output}" varStatus="status">

          <%-- 출력을 위해 준비한 컬럼들 --%>
          <c:set var="id" value="${item.id}" />
          <c:set var="name" value="${item.name}" />
          <c:set var="mem_id" value="${item.mem_id}" />
          <c:set var="tel" value="${item.tel}" />
          <c:set var="email" value="${item.email}" />

          <%-- 검색어가 있다면? --%>
          <c:if test="${keyword != ''}">
          <%-- 검색어에 <mark> 태그를 적용한 문자열 변수를 준비 --%>
              <c:set var="mark" value="<mark>${keyword}</mark>" />

              <%-- 출력을 위해 준비한 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
              <c:set var="name" value="${fn:replace(name, keyword, mark)}" />
          </c:if> 
                  
          <%-- 상세페이지로 이동하기 위한 URL --%>
          <c:url value="/tech/read.do" var="viewUrl">
              <c:param name="id" value="${item.id}" />
          </c:url>

          
          <tr>
              <td><input type="checkbox" name="id" value="${id}" checked /></td>
              <td>${id}</td>
              <td><a href="${viewUrl}">${name}</a></td>
              <td>${mem_id}</td>
              <td>${tel}</td>
              <td>${email}</td>
          </tr>

          </c:forEach>
        </c:otherwise>
      </c:choose>
    </form>
    </table>
  </div>

  <div class="adtechsearch">
    <!-- 검색 form -->
    <form method="get" action="${contextPath}/techmanagement">
      <input type="search" name="keyword" id="keyword" value="${keyword}" placeholder="이름"/>
      <button type="submit">SEARCH</button>
    </form>
  </div>

<div class="adtechbottom">
<!-- 페이지 번호 구현 -->
<%-- 이전 그룹에 대한 링크 --%>
<c:choose>
    <%-- 이전 그룹으로 이동 가능하다면? --%>
    <c:when test="${pagenation.prevPage > 0}">
        <%-- 이동할 URL 생성--%>
        <c:url value="/techmanagement" var="prevPageUrl">
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
    <c:url value="/techmanagement" var="pageUrl">
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
        <c:url value="/techmanagement" var="nextPageUrl">
          <c:param name="page" value="${pagenation.nextPage}" />
          <c:param name="keyword" value="${keyword}"/>
        </c:url>
        <a href="${nextPageUrl}">[다음]</a>
    </c:when>
    <c:otherwise>
    </c:otherwise>
  </c:choose>
</div>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />
