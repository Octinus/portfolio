<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />
<style>
  .recordEtop {
    margin-bottom: 50px;
  }
  .recordEtable {
    border: 1px solid #8b8b8b;
    width: 1200px;
  }
  .recordEtable tr {
    text-align: left;
    text-indent: 10px;
    line-height: 3;
    font-size: 13px;
  }
  .recordEtable input {
    border: 1px solid #8b8b8b;
    background-color: white;
  }
  .ck.ck-editor__editable_inline>:last-child {
    height: 600px;
    background-color: white;
  }
  .ck.ck-editor__editable_inline>p {
    background-color: white;
  }

  .recordEbottom {
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
  }
  .recordEbottom a {
    text-decoration: none;
    display: block;
    font-size: 13px;
    color: black;
    width: 140px;
    height: 35px;
    padding-top: 10px;
    background-color: #d5d5d5;
  }
  .recordEbottom button {
    width: 140px;
  }
</style>
<div class="recordEtop">
  <h class="recordEtop">RECORD</h>
</div>

  <form method="post" action="${contextPath}/notice/add_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="category" id="category" value="N" />
    <input type="hidden" name="reg_date" id="reg_date" value="" />
    <input type="hidden" name="members_id" id="members_id" value="${login_info.getId()}" />
  <table class="recordEtable">
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
      <td><input type="text" name="subject" id="subject" value="${output.subject}" readonly /></td>
      <th>작&nbsp;&nbsp;성&nbsp;&nbsp;자</th>
      <td><input type="text" name="writer_name" id="writer_name" value="${output.writer_name}" readonly /></td>
    </tr>
    <tr>
      <td colspan="4">
        <textarea name="content" id="content">${output.content}</textarea>
      </td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>
        <input type="file" name="file" id="file" />
      </td>
    </tr>
  </table>
  <div class="recordEbottom">
    <a href="${contextPath}/notice">LIST</a>
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