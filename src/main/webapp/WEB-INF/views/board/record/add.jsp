<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
.recordtop {
  width: 460px;
  border-bottom: 1px solid black;
  font-size: 40px;
  padding-bottom: 5px;
  margin: 50px auto 50px auto;
}
.recordtop h1 {
  font-size: 40px;
  font-weight: 600;
}

.recordmain input {
  border: none;
}
.recordmain .recordtable {
  border: 1px solid #c5c5c5;
  width: 1200px;
}
.recordmain .recordtable tr {
  text-align: left;
  text-indent: 10px;
  line-height: 3;
  font-size: 13px;
}
.recordmain .recordtable tr th {
  width: 80px;
}
.recordmain .recordtable tr:nth-child(5) input {
  width: 300px;
  border: 1px solid #d5d5d5;
  background-color: white;
}
.recordmain .recordtable select,
.recordmain .recordtable option {
  background-color: white;
}
.ck.ck-editor__editable_inline>:last-child {
  max-height: 600px;
  min-height: 600px;
  background-color: white;
}
.ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners {
    max-height: 600px;
}
.recordbottom {
  display: flex;
  justify-content: space-between;
  margin: 30px 0 100px 0;
}
.recordbottom a {
  text-decoration: none;
  display: block;
  font-size: 13px;
  color: white;
  width: 140px;
  height: 35px;
  padding-top: 10px;
  background-color: #d5d5d5;
  transition: all 0.5s;
}
.recordbottom a:hover {
  background-color: #c5c5c5;
  color: black;
  border: 1px solid #c5c5c5;
}
.recordbottom button {
  cursor: pointer;
  width: 140px;
  background-color: black;
  color: white;
  border: 1px solid black;
  transition: all 0.5s;
}
.recordbottom button:hover {
  background-color: #c5c5c5;
  color: black;
  border: 1px solid #c5c5c5;
}
</style>
<div class="recordtop">
  <h1>모두를 위한 정비 이력</h1>
</div>  

<div class="recordmain">
  <form method="post" action="${contextPath}/record/add_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="reg_date" id="reg_date" value="" />
    <input type="hidden" name="is_done" id="is_done" value="Y" />
    <input type="hidden" name="id" id="id" value="${output.id}" />
    <input type="hidden" name="customer_id" id="customer_id" value="${output.customer_id}" />
    <input type="hidden" name="tech_id" id="tech_id" value="${output.tech_id}" />
  <table class="recordtable">
    <tr>
      <th>고객 이름</th>
      <td><input type="text" name="name" id="name" value="${output.name}" readonly /></td>
    </tr>
    <tr>
      <th>예약 날짜</th>
      <td><input type="text" name="booking_date" id="booking_date" value="${output.booking_date}" readonly /></td>
      <th>예약 시간</th>
      <td><input type="text" name="booking_time" id="booking_time" value="${output.booking_time}" readonly /></td>
    </tr>
    <tr>
      <th>차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
      <td><input type="text" name="carmo" id="carmo" value="${output.carmo}" readonly /></td>
      <th>차량 번호</th>
      <td><input type="text" name="carno" id="carno" value="${output.carno}" readonly /></td>
    </tr>
    <tr>
      <th>입고 사유</th>
      <td><input type="text" name="problem" id="problem" value="${output.problem}" readonly /></td>
      <th>작&nbsp;&nbsp;업&nbsp;&nbsp;자</th>
      <td><input type="text" name="tech_name" id="tech_name" value="${output.tech_name}" readonly /></td>
    </tr>
    <tr>
    <th>SUBJECT</th>
      <td><input type="text" name="subject" id="subject" /></td>
      <th>작&nbsp;&nbsp;성&nbsp;&nbsp;자</th>
      <td>
        <select name="writer_name">
          <c:forEach var="tech" items="${tech}" varStatus="status">
            <option value="${tech.name}">${tech.name}</option>
          </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="4">
        <textarea name="content" id="content"></textarea>
      </td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>
        <input type="file" name="file" id="file" />
      </td>
    </tr>
  </table>
</div>

<div class="recordbottom">
  <a href="${contextPath}/record">LIST</a>
  <button type="submit">OK</button>
</div>
</form>

<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/translations/ko.js"></script>
  <script>
    ClassicEditor.create( document.querySelector( '#content' ), {

      toolbar: [
                'heading',
                '|',
                'bold',
                'italic',
                'bulletedList',
                'numberedList',
                '|',
                'undo',
                'redo',
                ],
      language: "ko"
} );
  </script>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />