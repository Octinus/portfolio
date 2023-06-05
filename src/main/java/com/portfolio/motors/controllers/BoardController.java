package com.portfolio.motors.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.motors.exception.StringFormatException;
import com.portfolio.motors.helpers.Pagenation;
import com.portfolio.motors.helpers.RegexHelper;
import com.portfolio.motors.helpers.WebHelper;
import com.portfolio.motors.models.BbsDocument;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.BbsDocumentService;
import com.portfolio.motors.services.MembersService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
  
  private final BbsDocumentService bbsDocumentService;

  private final MembersService membersService;

  private final WebHelper webHelper;

  private final RegexHelper regexHelper;
  
  @GetMapping("/qna") // 자유게시판 페이지
  public ModelAndView qnaboard(Model model,
                              @RequestParam(value="field", required = false) String field,
                              @RequestParam(value="keyword", required = false) String keyword,
                              @RequestParam(value="page", defaultValue = "1") int nowPage){

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<BbsDocument> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체
    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    BbsDocument input = new BbsDocument();
    input.setSubject(keyword);
    input.setField(field);

    try {
      // 전체 게시글 수 조회
      totalCount = bbsDocumentService.qnaCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      BbsDocument.setOffset(pagenation.getOffset());
      BbsDocument.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = bbsDocumentService.qnaList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }
    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);
    
    return new ModelAndView("/board/qna/list");
  }

  @GetMapping("/qna/add.do") // 자유게시판 작성 페이지
  public ModelAndView qna(){

    return new ModelAndView("/board/qna/add");
  }

  @PostMapping("/qna/add_ok.do") // 공지사항 페이지
  public ModelAndView qnaAddOk(Model model,
                            @RequestParam(value="category") String category,
                            @RequestParam(value="writer_pw") String writer_pw,
                            @RequestParam(value="q_type") String q_type,
                            @RequestParam(value="subject") String subject,
                            @RequestParam(value="content") String content,
                            @RequestParam(value="reg_date") String reg_date,
                            @RequestParam(value="members_id") int members_id
                            ){

    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String today = dateTime.format(formatter);

    try{
      regexHelper.isValue(subject, "제목을 입력하세요.");
      regexHelper.isValue(content, "내용이 없이는 작성을 완료 할 수 없습니다.");
      
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

    BbsDocument input = new BbsDocument();
    input.setCategory(category);
    input.setWriter_pw(writer_pw);
    input.setQ_type(q_type);
    input.setSubject(subject);
    input.setContent(content);
    input.setReg_date(today);
    input.setMembers_id(members_id);

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      bbsDocumentService.insert(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    return webHelper.redirect("/qna", "작성이 완료 되었습니다.");
  }

  @GetMapping("/qna/read.do") // 고객 상세 정보 페이지
  public ModelAndView qnaRead(Model model,
                          @RequestParam(value="id", defaultValue = "") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    BbsDocument input = new BbsDocument();
    input.setId(id);

    // 조회결과를 저장할 객체 선언
    BbsDocument output = null;

    try {
      //데이터 조회
      output = bbsDocumentService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);

    return new ModelAndView("board/qna/read");
  }

  @GetMapping("/notice") // 공지사항 페이지
  public ModelAndView noticeboard(Model model,
                                  @RequestParam(value="field", required = false) String field,
                                  @RequestParam(value="keyword", required = false) String keyword,
                                  @RequestParam(value="page", defaultValue = "1") int nowPage){

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<BbsDocument> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    BbsDocument input = new BbsDocument();
    input.setSubject(keyword);
    input.setField(field);

    try {
      // 전체 게시글 수 조회
      totalCount = bbsDocumentService.noticeCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      BbsDocument.setOffset(pagenation.getOffset());
      BbsDocument.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = bbsDocumentService.noticeList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);
    
    return new ModelAndView("/board/notice/list");
  }

  @GetMapping("/notice/add.do")
  public ModelAndView notiAdd(){

    return new ModelAndView("/board/notice/add");
  }

  @PostMapping("/notice/add_ok.do") // 공지사항 페이지
  public ModelAndView notiAddOk(Model model,
                            @RequestParam(value="category") String category,
                            @RequestParam(value="subject") String subject,
                            @RequestParam(value="content") String content,
                            @RequestParam(value="reg_date") String reg_date,
                            @RequestParam(value="members_id") int members_id
                            ){

    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String today = dateTime.format(formatter);

    try{
      regexHelper.isValue(subject, "제목을 입력하세요.");
      regexHelper.isValue(content, "내용이 없이는 작성을 완료 할 수 없습니다.");
      
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

    BbsDocument input = new BbsDocument();
    input.setCategory(category);
    input.setSubject(subject);
    input.setContent(content);
    input.setReg_date(today);
    input.setMembers_id(members_id);

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      bbsDocumentService.insert(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    return webHelper.redirect("/notice", "작성이 완료 되었습니다.");
  }

  @GetMapping("/notice/read.do") // 고객 상세 정보 페이지
  public ModelAndView notiRead(Model model,
                          @RequestParam(value="id", defaultValue = "") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    BbsDocument input = new BbsDocument();
    input.setId(id);

    // 조회결과를 저장할 객체 선언
    BbsDocument output = null;

    try {
      //데이터 조회
      output = bbsDocumentService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);

    return new ModelAndView("board/notice/read");
  }

  @GetMapping("/notice/edit.do")
  public ModelAndView notiEdit(Model model,
                              @RequestParam(value="id") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    BbsDocument input = new BbsDocument();
    input.setId(id);

    // 수정할 데이터의 원본 조회하기
    BbsDocument output = null;

    try {
      output = bbsDocumentService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // View 처리
    model.addAttribute("output", output);

    return new ModelAndView("board/notice/edit");
  }



























  @GetMapping("/record") // 공지사항 페이지
  public ModelAndView recordboard(){

    return new ModelAndView("/board/record/list");
  }

  @GetMapping("/record/add.do") // 공지사항 페이지
  public ModelAndView record(){

    return new ModelAndView("/board/record/add");
  }
}
