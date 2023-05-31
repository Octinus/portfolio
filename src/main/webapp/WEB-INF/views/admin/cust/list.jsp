<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <style>
    .adcusttop {
      width: 460px;
      border-bottom: 1px solid black;
      font-size: 40px;
      padding-bottom: 5px;
      margin: 50px auto 0 auto;
    }
    .adcusttop h1 {
      font-size: 40px;
      font-weight: 600;
    }

    .adcustsearch {
      margin: 10px auto 20px auto;
    }
    .adcustsearch form {
      text-align: left;
    }
    .adcustsearch input,
    .adcustsearch button {
      border: 1px solid #c5c5c5;
    }
    .adcustsearch input {
      width: 150px;
    }
    .adcustsearch button {
      cursor: pointer;
    }

    .adcustmain {
      margin: 100px auto 20px auto;
    }
    .adcustmain table {
      width: 1200px;
      border-top: 2px solid #c5c5c5;
      line-height: 2.5;
    }
    .adcustmain tr {
      border: 1px solid #c5c5c5;
    }
    .adcustmain tr:first-child th {
      background-color: #e2e1e1;
    }

    .adcustbottom {
      margin-bottom: 100px;
    }
  </style>

    <div class="adcusttop">
      <h1>Customer Management</h1>
    </div>    

    <div class="adcustmain">
      <!-- 조회 결과 목록 -->
      <table>
        <tr>
          <th>등록번호</th>
          <th>이름</th>
          <th>아이디</th>
          <th>연락처</th>
          <th>E-mail</th>
          <th>생년월일</th>
          <th>차번호</th>
          <th>차종</th>
        </tr>
        <c:choose>
        <%-- 조회 결과가 없는 경우 --%>
        <c:when test="${output == null || fn:length(output) == 0}">
        <tr>
          <td colspan="12">조회 결과가 없습니다.</td>
        </tr>
          </c:when>
          <%-- 조회 결과가 있는 경우 --%>
          <c:otherwise>
              <%-- 조회 결과에 따른 반복 처리 --%>
              <c:forEach var="item" items="${output}" varStatus="status">

              <%-- 출력을 위해 준비한 학과이름과 위치 --%>
              <c:set var="id" value="${item.id}" />
              <c:set var="name" value="${item.name}" />
              <c:set var="mem_id" value="${item.mem_id}" />
              <c:set var="tel" value="${item.tel}" />
              <c:set var="email" value="${item.email}" />
              <c:set var="birthdate" value="${item.birthdate}" />
              <c:set var="carno" value="${item.carno}" />
              <c:set var="carmo" value="${item.carmo}" />

              <%-- 검색어가 있다면? --%>
              <c:if test="${keyword != ''}">
              <%-- 검색어에 <mark> 태그를 적용한 문자열 변수를 준비 --%>
                  <c:set var="mark" value="<mark>${keyword}</mark>" />

                  <%-- 출력을 위해 준비한 학과이름과 위치에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
                  <c:set var="name" value="${fn:replace(name, keyword, mark)}" />
                  <c:set var="mem_id" value="${fn:replace(mem_id, keyword, mark)}" />
              </c:if> 
                      
              <%-- 상세페이지로 이동하기 위한 URL --%>
              <c:url value="/cust/read.do" var="viewUrl">
                  <c:param name="id" value="${item.id}" />
              </c:url>

              <tr>
                  <td>${id}</td>
                  <td><a href="${viewUrl}">${name}</a></td>
                  <td>${mem_id}</td>
                  <td>${tel}</td>
                  <td>${email}</td>
                  <td>${birthdate}</td>
                  <td>${carno}</td>
                  <td>${carmo}</td>
              </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </table>
      </div>

      <div class="adcustsearch">
        <!-- 검색 form -->
        <form method="get" action="${contextPath}/customermanagement">
          <label for="keyword">검색</label>
            <input type="search" name="keyword" id="keyword" value="${keyword}" />
            <button type="submit">SEARCH</button>
        </form>
      </div>

    <div class="adcustbottom">
    <!-- 페이지 번호 구현 -->
    <%-- 이전 그룹에 대한 링크 --%>
    <c:choose>
        <%-- 이전 그룹으로 이동 가능하다면? --%>
        <c:when test="${pagenation.prevPage > 0}">
            <%-- 이동할 URL 생성--%>
            <c:url value="/customermanagement" var="prevPageUrl">
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
        <c:url value="/customermanagement" var="pageUrl">
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
            <c:url value="/customermanagement" var="nextPageUrl">
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
