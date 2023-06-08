<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>

  .qnaEtop {
  display: inline;
  width: 150px;
  border-bottom: 1px solid black;
  }
  .qnaEtop h1 {
    display: contents;
    font-size: 30px;
  }
  .qnaEtop p {
    font-size: 15px;
    color: #8b8b8b;
    margin: 20px 0 50px 0;
  }

  .qnaEmain .qnatable {
    width: 1200px;
  }
  .qnaEmain .qnatable tr {
    text-align: left;
    text-indent: 10px;
    line-height: 3;
    font-size: 13px;
  }
  .qnaEmain .qnatable tr:first-child {
    text-align: right;
    border: none;
  }
  .qnaEmain .qnatable tr:first-child a {
    text-decoration: none;
    border: 1px solid black;
    color: white;
    background-color: black;
    padding: 5px;
    transition: all 0.5s;
  }
  .qnaEmain .qnatable tr:first-child a:hover {
    border: 1px solid #f7f7f7;
  color: black;
  background-color: #f7f7f7;
  }
  .qnaEmain .qnatable tr:nth-child(2) th,
  .qnaEmain .qnatable tr:nth-child(2) td {
    border-top: 2px solid #d5d5d5;
  }
  .qnaEmain .qnatable tr:nth-child(2) th {
  border-left: 1px solid #d5d5d5;
  width: 120px;
  text-align: center;
  }
  .qnaEmain .qnatable tr:nth-child(2) td {
  border-right: 1px solid #d5d5d5;
  }
  .qnaEmain .qnatable tr:nth-child(2) input {
    width: 300px;
    border: 1px solid #d5d5d5;
    background-color: white;
  }
  .qnaEmain .qnatable tr:last-child th,
  .qnaEmain .qnatable tr:last-child td {
    border-bottom: 1px solid #d5d5d5;
  }
  .qnaEmain .qnatable tr:last-child th {
  border-left: 1px solid #d5d5d5;
  width: 120px;
  text-align: center;
  }
  .qnaEmain .qnatable tr:last-child td {
  border-right: 1px solid #d5d5d5;
  }
  .ck.ck-editor__editable_inline {
    min-height: 600px;
    background-color: white;
  }
  .ck.ck-editor__editable_inline p {
    background-color: white;
  }
  .qnaEbottom {
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
    margin-bottom: 80px;
  }
  .qnaEbottom a {
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
  .qnaEbottom a:hover {
    border: 1px solid black;
    background-color: white;
    color: black;
  }
  .qnaEbottom button {
    width: 140px;
    border: 1px solid black;
    background-color: black;
    color: white;
    cursor: pointer;
    transition: all 0.5s;
  }
  .qnaEbottom button:hover {
    border: 1px solid black;
    background-color: white;
    color: black;
  }
</style>

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