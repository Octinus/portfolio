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
    <tr>
      <th>NO</th>
      <th>TYPE</th>
      <th>SUBJECT</th>
      <th>NAME</th>
      <th>DATE</th>
    </tr>
    <tr>
      <td>공지</td>
      <td></td>
      <td><a href="">최근공지1</a></td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>공지</td>
      <td></td>
      <td><a href="">최근공지2</a></td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>공지</td>
      <td></td>
      <td><a href="">최근공지3</a></td>
      <td>C.MOTORS</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>예약문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>부품문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>기타문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>예약문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>부품문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>기타문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>예약문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>부품문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>기타문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>예약문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>부품문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>
    <tr>
      <td>1</td>
      <td>기타문의</td>
      <td><a href="">이게궁금해요</a></td>
      <td>누군가</td>
      <td>2023-03-01</td>
    </tr>

    


  </table>

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
    <a href="${contextPath}/qna.do">WIRTER</a>
  </div>
  </div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />