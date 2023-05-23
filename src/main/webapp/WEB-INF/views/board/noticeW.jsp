<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <style>
    .noticeWtop {
      margin-bottom: 50px;
    }
    .noticetable {
      border: 1px solid #8b8b8b;
      width: 1200px;
    }
    .noticetable tr {
      text-align: left;
      text-indent: 10px;
      line-height: 3;
      font-size: 13px;
    }
    .noticetable input {
      border: 1px solid #8b8b8b;
      background-color: white;
    }
    .ck.ck-editor__editable_inline>:last-child {
      height: 600px;
      background-color: white;
    }
    .noticeWbottom {
      display: flex;
      justify-content: space-between;
      padding-top: 30px;
    }
    .noticeWbottom a {
      text-decoration: none;
      display: block;
      font-size: 13px;
      color: black;
      width: 140px;
      height: 35px;
      padding-top: 10px;
      background-color: #d5d5d5;
    }
    .noticeWbottom button {
      width: 140px;
    }
  </style>
  <p class="noticeWtop">공지사항 작성 페이지</p>

  <form method="post" action="${contextPath}/notice_ok.do" enctype="multipart/form-data">
  <table class="noticetable">
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
        <input type="password" name="notipw" id="notipw" />
      </td>
    </tr>
  </table>
  <div class="noticeWbottom">
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