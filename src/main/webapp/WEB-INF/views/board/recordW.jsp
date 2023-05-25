<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  
  <style>
    .recordtop {
      padding-bottom: 40px;
    }
    .recordtable {
      border: 1px solid black;
      width: 1200px;
    }
    .recordtable tr {
      text-align: left;
      text-indent: 10px;
      line-height: 3;
      font-size: 13px;
    }
    .ck.ck-editor__editable_inline>:last-child {
      height: 600px;
      background-color: white;
    }
    .recordbottom {
      display: flex;
      justify-content: space-between;
      padding-top: 30px;
    }
    .recordbottom a {
      text-decoration: none;
      display: block;
      font-size: 13px;
      color: black;
      width: 140px;
      height: 35px;
      padding-top: 10px;
      background-color: #d5d5d5;
    }
    .recordbottom button {
      width: 140px;
    }
  </style>
  <p class="recordtop">모두를 위한 정비 이력</p>

  <form method="post" action="${contextPath}/record_ok.do" enctype="multipart/form-data">
  <table class="recordtable">
    <tr>
      <th>SUBJECT</th>
      <td><input type="text" name="subject" id="subject" /></td>
    </tr>
    <tr>
      <td colspan="2">
        <textarea name="content" id="content"></textarea>
      </td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>
        <input type="file" name="file" id="file" />
      </td>
    </tr>
    <tr>
      <th>게시글비밀번호</th>
      <td>
        <input type="password" name="recordpw" id="recordpw" />
      </td>
    </tr>
  </table>
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