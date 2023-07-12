<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/q_list.css" />

<div class="qnatop">
  <h1>Q & A</h1>
  <p>자유롭게 이용하시는 게시판입니다.</p>
</div>

<table class="qnamain">
  <tr>
    <th>NO</th>
    <th>TYPE</th>
    <th>SUBJECT</th>
    <th>NAME</th>
    <th>DATE</th>
  </tr>
  <c:choose>
    <%-- 조회 결과가 없는 경우 --%>
    <c:when test="${noti == null || fn:length(noti) == 0}">
      <tr>
      </tr>
    </c:when>
    <%-- 조회 결과가 있는 경우 --%>
    <c:otherwise>
    <%-- 조회 결과에 따른 반복 처리 --%>
    <c:forEach var="noti" items="${noti}" varStatus="status">

    <%-- 상세페이지로 이동하기 위한 URL --%>
    <c:url value="/qna/read.do" var="viewUrl">
      <c:param name="id" value="${noti.id}" />
    </c:url>

      <tr>
        <td>공&nbsp;&nbsp;&nbsp;지</td>
        <c:if test="${noti.q_type == null}">
          <td>공&nbsp;&nbsp;&nbsp;지</td>
        </c:if>
        <td><a href="${viewUrl}">${noti.subject}</a></td>
        <c:if test="${noti.name.equals('관리자')}">
          <td>C.MOTORS</td>
        </c:if>
        <td>${noti.reg_date}</td>
        </tr>
      </c:forEach>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <%-- 조회 결과가 없는 경우 --%>
    <c:when test="${output == null || fn:length(output) == 0}">
      <tr>
        <td colspan="5">검색하신 결과는 없습니다.</td>
      </tr>
      </c:when>
      <%-- 조회 결과가 있는 경우 --%>
      <c:otherwise>
      <%-- 조회 결과에 따른 반복 처리 --%>
        <c:forEach var="item" items="${output}" varStatus="status">

        <%-- 출력을 위해 준비한 컬럼들 --%>
        <c:set var="id" value="${item.id}" />
        <c:set var="subject" value="${item.subject}" />
        <c:set var="q_type" value="${item.q_type}" />
        <c:set var="members_id" value="${item.members_id}" />
        <c:set var="reg_date" value="${item.reg_date}" />
        <c:set var="name" value="${item.name}" />

        <%-- 검색어가 있다면? --%>
        <c:if test="${keyword != ''}">
        <%-- 검색어에 <mark> 태그를 적용한 문자열 변수를 준비 --%>
        <c:set var="mark" value="<mark>${keyword}</mark>" />

        <%-- 출력을 위해 준비한 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
        <c:set var="subject" value="${fn:replace(subject, keyword, mark)}" />
        </c:if> 

        <%-- 상세페이지로 이동하기 위한 URL --%>
        <c:url value="/qna/read.do" var="viewUrl">
          <c:param name="id" value="${item.id}" />
        </c:url>

      <tr>
        <td>${id}</td>
        <c:choose>
          <c:when test="${q_type.equals('R')}">
            <td>예약문의</td>
          </c:when>
        <c:when test="${q_type.equals('P')}">
          <td>부품문의</td>
        </c:when>
        <c:otherwise>
          <td>기타문의</td>
        </c:otherwise>
          </c:choose>
          <td><a href="${viewUrl}">${subject}</a></td>
          <td>${name}</td>
          <td>${reg_date}</td>
        </tr>
      </c:forEach>
    </c:otherwise>
  </c:choose>
</table>

<div class="adcustbottom">
  <!-- 페이지 번호 구현 -->
  <%-- 이전 그룹에 대한 링크 --%>
  <c:choose>
      <%-- 이전 그룹으로 이동 가능하다면? --%>
      <c:when test="${pagenation.prevPage > 0}">
          <%-- 이동할 URL 생성--%>
          <c:url value="/qna" var="prevPageUrl">
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
      <c:url value="/qna" var="pageUrl">
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
          <c:url value="/qna" var="nextPageUrl">
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

<div class="qnabottom">
  <div class="qnasearch">
    <form method="get" action="${contextPath}/qna">
      <select name="field">
        <option value="subject">제목</option>
        <option value="content">내용</option>
        <option value="name">작성자</option>
      </select>
      <input type="search" id="keyword" name="keyword" value="${keyword}" />
      <button type="submit">SEARCH</button>
    </form>
  </div>

  <div class="gowriter">
    <c:if test="${login_info != null}">
      <a href="${contextPath}/qna/add.do">WIRTER</a>
    </c:if>
  </div>
</div>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />