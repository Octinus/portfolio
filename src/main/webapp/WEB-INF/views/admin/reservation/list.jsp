<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/reser_list.css" />

<div class="adreservtop">
  <h1>Customer Management</h1>
</div>    

<div class="adreservmain">
  <!-- 조회 결과 목록 -->
  <table>
    <tr>
      <td><a href="${contextPath}/reservationmanagement/tot">전체예약보기</a></td>
      <td><a href="${contextPath}/reservationmanagement">정비사 배정받지 못한 예약보기</a></td>
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
      <td colspan="6">정비사를 배정하지 않은 예약건은 없습니다.</td>
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
          <c:url value="/reservation/read.do" var="viewUrl">
              <c:param name="id" value="${item.id}" />
          </c:url>

          <tr>
              <td>${status.index + 1}</td>
              <td><a href="${viewUrl}">${name}</a></td>
              <td>${booking_date}</td>
              <td>${booking_time}</td>
              <td>${carno}</td>
              <td>${carmo}</td>
              <td>
                <c:choose>
                  <c:when test="${tech_id == null}">
                    <form method="post" action="/reserv/tech_id_edit_ok.do">
                      <input type="hidden" name="id" id="id" value="${id}" />
                      <select name="tech_id">
                      <option value="">--선택하세요--</option>
                      <c:forEach var="notech" items="${tech}" varStatus="status">
                        <option value="${notech.id}">${notech.name}</option>
                      </c:forEach>
                      </select>
                      <button type="submit">배정</button>
                    </form>
                  </c:when>
                  <c:otherwise>
                    <form method="post" action="/reserv/tech_id_edit_ok.do">
                      <input type="hidden" name="id" id="id" value="${id}" />
                      <select name="tech_id">
                      <option value="${tech_id}">${tech_name}</option>
                      <c:forEach var="yestech" items="${tech}" varStatus="status">
                        <option value="${yestech.id}">${yestech.name}</option>
                      </c:forEach>
                      </select>
                      <button type="submit">재배정</button>
                    </form>
                  </c:otherwise>
                </c:choose>
                
              </td>
          </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </table>
  </div>

  <div class="adreservsearch">
    <!-- 검색 form -->
    <form method="get" action="${contextPath}/reservationmanagement">
      <label for="keyword">검색</label>
        <input type="search" name="keyword" id="keyword" value="${keyword}" />
        <button type="submit">SEARCH</button>
    </form>
  </div>

<div class="adreservbottom">
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

<c:import url="/WEB-INF/views/inc/bottom.jsp" />
