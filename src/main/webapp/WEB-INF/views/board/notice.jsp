<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

  <style>
    .main .notop {
      display: inline;
      width: 150px;
      border-bottom: 1px solid black;
    }
    
    .main .notop h1 {
      display: contents;
      font-size: 30px;
    }

    .main .notop p {
      font-size: 15px;
      color: #8b8b8b;
      margin: 20px 0 50px 0;
    }

    .main .nomain {
      border: 1px solid  #b9b8b8;
      width: 1200px;
      line-height: 3;
      margin-bottom: 20px;
    }
    .main .nomain tr:first-child {
      border-bottom: 1px dotted #8b8b8b;
    }
    .main .nomain tr {
      border-bottom: 1px dotted #8b8b8b;
    }
    .main .nomain tr:last-child {
      border: none;
    }
    .main .nomain tr th:first-child {
      width: 100px;
    }
    .main .nomain tr th:nth-child(2) {
      width: 900px;
    }
    .main .nomain tr th {
      width: 100px;
    }
    .main .nomain tr td {
      font-size: 12px;
    }
    .main .nomain tr td:last-child {
      color: #8b8b8b;
    }
    
    .main .nobottom {
      padding-bottom: 20px;
      display: flex;
      justify-content: space-between;
    }
    .main .nobottom .noticesearch {
      text-indent: 20px;
    }
    .main .nobottom .gowriter a {
      display: block;
      text-decoration: none;
      background-color: black;
      color: white;
      border: 1px solid black;
      font-size: 13px;
      padding: 10px;
      width: 150px;
    }
    .main .nobottom .gowriter a:hover {
      background-color: #f7f7f7;
      color: black;
      border: 1px solid black;
      transition: all 0.5s;
    }
  </style>
  <div class="notop">
    <h1>NOTICE</h1>
    <p>공지사항</p>
  </div>
  <table class="nomain">
    <tr>
      <th>NO</th>
      <th>SUBJECT</th>
      <th>NAME</th>
      <th>DATE</th>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2023 봄맞이 할인 이벤트</td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>

  </table>
  
  <div class="nobottom">
    <div class="noticesearch">
      <select>
        <option value="subject">제목</option>
        <option value="content">내용</option>
        <option value="writer">글쓴이</option>
      </select>
      <input type="text" id="input" name="input" />
      <button type="submit">SEARCH</button>
  </div>
  <div class="gowriter">
    <a href="${contextPath}/board/notice.do">WIRTER</a>
  </div>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />