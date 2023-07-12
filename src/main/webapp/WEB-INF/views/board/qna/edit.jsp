<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/q_edit.css" />

<div class="qnaEtop">
  <h1>Q & A</h1>
  <p>자유롭게 이용하시는 게시판입니다.</p>
</div>

<div class="qnaEmain">
  <form method="post" action="${contextPath}/qna/edit_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="${output.id}" />
    <input type="hidden" name="category" id="category" value="${output.category}" />
    <input type="hidden" name="reg_date" id="reg_date" value="${output.reg_date}" />
    <input type="hidden" name="edit_date" id="edit_date" value="" />
    <input type="hidden" name="members_id" id="members_id" value="${output.members_id}" />
  <table class="qnatable">
    <tr>
      <th colspan="2"><a href="${contextPath}/qna/delete.do?id=${output.id}">게시물삭제</a></th>
    </tr>
    <tr>
      <th>SUBJECT</th>
      <td><input type="text" name="subject" id="subject" value="${output.subject}"/></td>
    </tr>
    <tr>
      <td colspan="2">
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
</div>

  <div class="qnaEbottom">
    <a href="${contextPath}/qna">LIST</a>
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