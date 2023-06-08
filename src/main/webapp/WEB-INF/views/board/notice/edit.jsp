<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>

.noticeEtop {
  display: inline;
  width: 150px;
  border-bottom: 1px solid black;
}
.noticeEtop h1 {
  display: contents;
  font-size: 30px;
}
.noticeEtop p {
  font-size: 15px;
  color: #8b8b8b;
  margin: 20px 0 50px 0;
}

.noticeEmain .noticetable {
  width: 1200px;
}
.noticeEmain .noticetable tr {
  text-align: left;
  text-indent: 10px;
  line-height: 3;
  font-size: 13px;
}
.noticeEmain .noticetable tr:first-child {
    text-align: right;
    border: none;
}
.noticeEmain .noticetable tr:first-child a {
  text-decoration: none;
  border: 1px solid black;
  color: white;
  background-color: black;
  padding: 5px;
  transition: all 0.5s;
}
.noticeEmain .noticetable tr:first-child a:hover {
  border: 1px solid #f7f7f7;
  color: black;
  background-color: #f7f7f7;
}
.noticeEmain .noticetable tr:nth-child(2) input {
width: 300px;
background-color: white;
border: 1px solid #d5d5d5;
}
.noticeEmain .noticetable tr:nth-child(2) th,
.noticeEmain .noticetable tr:nth-child(2) td {
  border-top: 2px solid #d5d5d5;
}
.noticeEmain .noticetable tr:nth-child(2) th {
  border-left: 1px solid #d5d5d5;
  width: 120px;
  text-align: center;
}
.noticeEmain .noticetable tr:nth-child(2) td {
  border-right: 1px solid #d5d5d5;
}
.ck.ck-editor__editable_inline {
  min-height: 600px;
  background-color: white;
}
.ck.ck-editor__editable_inline p {
  background-color: white;
}
.noticeEbottom {
  display: flex;
  justify-content: space-between;
  padding-top: 30px;
  margin-bottom: 80px;
}
.noticeEbottom a {
  text-decoration: none;
  display: block;
  font-size: 13px;
  color: black;
  width: 140px;
  height: 35px;
  padding-top: 10px;
  background-color: #d5d5d5;
  transition: all 0.5s;
}
.noticeEbottom a:hover {
  border: 1px solid black;
  background-color: white;
  color: black;
}
.noticeEbottom button {
  width: 140px;
  border: 1px solid black;
  background-color: black;
  color: white;
  cursor: pointer;
  transition: all 0.5s;
}
.noticeEbottom button:hover {
  border: 1px solid black;
  background-color: white;
  color: black;
}
</style>

<div class="noticeEtop">
  <h1>NOTICE</h1>
  <p>공지사항</p>
</div>

<div class="noticeEmain">
  <form method="post" action="${contextPath}/notice/edit_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="${output.id}" />
    <input type="hidden" name="category" id="category" value="${output.category}" />
    <input type="hidden" name="reg_date" id="reg_date" value="${output.reg_date}" />
    <input type="hidden" name="edit_date" id="edit_date" value="" />
    <input type="hidden" name="members_id" id="members_id" value="${output.members_id}" />
  <table class="noticetable">
    <tr>
      <th colspan="2"><a href="${contextPath}/notice/delete.do?id=${output.id}">게시물삭제</a></th>
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

  <div class="noticeEbottom">
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