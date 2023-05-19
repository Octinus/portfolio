<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
  .main .recordtop {
    font-weight: 900;
    margin: 20px 0 50px 0;
  }
  
  .main .recordtop h1 {
    display: contents;
    font-size: 30px;
  }

  .main .recordmain {
    border: 1px solid #b9b8b8;
    width: 1200px;
    line-height: 3;
    margin-bottom: 20px;
  }
  .main .recordmain tr:first-child {
    border-bottom: 1px dotted #8b8b8b;
  }
  .main .recordmain tr {
    border-bottom: 1px dotted #8b8b8b;
  }
  .main .recordmain tr:last-child {
    border: none;
  }
  .main .recordmain tr th:first-child {
    width: 100px;
  }
  .main .recordmain tr th:nth-child(3) {
    width: 800px;
  }
  .main .recordmain tr th {
    width: 100px;
  }
  .main .recordmain tr td {
    font-size: 12px;
  }
  .main .recordmain tr td:last-child {
    color: #8b8b8b;
  }

  .main .recordbottom {
    padding-bottom: 20px;
    display: flex;
    justify-content: space-between;
  }
  .main .recordbottom .recordresearch {
    text-indent: 20px;
  }
  .main .recordbottom .gowriter a {
    display: block;
    text-decoration: none;
    background-color: black;
    color: white;
    border: 1px solid black;
    font-size: 13px;
    padding: 10px;
    width: 150px;
  }
  .main .recordbottom .gowriter a:hover {
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
    <th>CAR No</th>
    <th>SUBJECT</th>
    <th>TECH</th>
    <th>NAME</th>
    <th>DATE</th>
  </tr>
  <tr>
    <td>1</td>
    <td>11가1111</td>
    <td>메인터넌스</td>
    <td>김정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>22가2222</td>
    <td>터보교환</td>
    <td>이정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>33가3333</td>
    <td>하부 로우암 소음 관련 작업</td>
    <td>박정비사</td>
    <td>최정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>11가1111</td>
    <td>메인터넌스</td>
    <td>김정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>22가2222</td>
    <td>터보교환</td>
    <td>이정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>33가3333</td>
    <td>하부 로우암 소음 관련 작업</td>
    <td>박정비사</td>
    <td>최정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>11가1111</td>
    <td>메인터넌스</td>
    <td>김정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>22가2222</td>
    <td>터보교환</td>
    <td>이정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>33가3333</td>
    <td>하부 로우암 소음 관련 작업</td>
    <td>박정비사</td>
    <td>최정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>11가1111</td>
    <td>메인터넌스</td>
    <td>김정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>22가2222</td>
    <td>터보교환</td>
    <td>이정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>33가3333</td>
    <td>하부 로우암 소음 관련 작업</td>
    <td>박정비사</td>
    <td>최정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>11가1111</td>
    <td>메인터넌스</td>
    <td>김정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>22가2222</td>
    <td>터보교환</td>
    <td>이정비사</td>
    <td>김정비사</td>
    <td>2023-03-01</td>
  </tr>
  <tr>
    <td>1</td>
    <td>33가3333</td>
    <td>하부 로우암 소음 관련 작업</td>
    <td>박정비사</td>
    <td>최정비사</td>
    <td>2023-03-01</td>
  </tr>
  


</table>

<div class="recordbottom">
  <div class="recordresearch">
  <select>
    <option value="subject">제목</option>
    <option value="content">내용</option>
    <option value="writer">글쓴이</option>
  </select>
  <input type="text" id="input" name="input" />
  <button type="submit">SEARCH</button>
</div>
<div class="gowriter">
  <a href="${contextPath}/board/record.do">WIRTER</a>
</div>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />