<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

  <style>
    .main .qnatop {
      display: inline;
      width: 150px;
      border-bottom: 1px solid black;
    }
    
    .main .qnatop h1 {
      display: contents;
      font-size: 30px;
    }

    .main .qnatop p {
      font-size: 15px;
      color: #8b8b8b;
      margin: 20px 0 50px 0;
    }

    .main .qnamain {
      border: 1px solid #b9b8b8;
      width: 1200px;
      line-height: 3;
      margin-bottom: 20px;
    }
    .main .qnamain tr:first-child {
      border-bottom: 1px dotted #8b8b8b;
    }
    .main .qnamain tr {
      border-bottom: 1px dotted #8b8b8b;
    }
    .main .qnamain tr:last-child {
      border: none;
    }
    .main .qnamain tr th:first-child {
      width: 100px;
    }
    .main .qnamain tr th:nth-child(3) {
      width: 800px;
    }
    .main .qnamain tr th {
      width: 100px;
    }
    .main .qnamain tr td {
      font-size: 12px;
    }
    .main .qnamain tr td:last-child {
      color: #8b8b8b;
    }

    .main .qnabottom {
      margin: 40px 0 80px 0;
      display: flex;
      justify-content: space-between;
    }
    .main .qnabottom .qnasearch {
      text-indent: 20px;
    }
    .qnasearch select {
      background-color: white;
    }
    .qnasearch input {
      border: 1px solid #8b8b8b;
      background-color: white;
    }
    .qnasearch button {
      border: 1px solid black;
      width: 100px;
      font-size: 12px;
      color: white;
      background-color: black;
      line-height: 1.6;
    }
    .qnasearch button:hover {
      background-color: #f7f7f7;
      color: black;
      border: 1px solid black;
      transition: all 0.5s;
    }
    .main .qnabottom .gowriter a {
      display: block;
      text-decoration: none;
      background-color: black;
      color: white;
      border: 1px solid black;
      font-size: 13px;
      padding: 10px;
      width: 150px;
    }
    .main .qnabottom .gowriter a:hover {
      background-color: #f7f7f7;
      color: black;
      border: 1px solid black;
      transition: all 0.5s;
    }
  </style>
  <div class="qnatop">
    <h1>Q & A</h1>
    <p>자유롭게 이용하시는 게시판입니다.</p>
  </div>

  <table class="qnamain">
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
            <c:set var="subject" value="${item.subject}" />
            <c:set var="q_type" value="${item.q_type}" />
            <c:set var="members_id" value="${item.members_id}" />
            <c:set var="reg_date" value="${item.reg_date}" />

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
                <td>${q_type}</td>
                <td><a href="${viewUrl}">${subject}</a></td>
                <td>${members_id}</td>
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
    <select>
      <option value="subject">제목</option>
      <option value="content">내용</option>
      <option value="writer">글쓴이</option>
    </select>
    <input type="text" id="input" name="input" />
    <button type="submit">SEARCH</button>
  </div>
  <div class="gowriter">
    <c:if test="${login_info != null}">
    <a href="${contextPath}/qna/add.do">WIRTER</a>
  </c:if>
  </div>
  </div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />