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
import com.portfolio.motors.models.Booking;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.BbsDocumentService;
import com.portfolio.motors.services.BookingService;
import com.portfolio.motors.services.MembersService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
  
  private final BbsDocumentService bbsDocumentService;

  private final MembersService membersService;

  private final BookingService bookingService;

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
    List<BbsDocument> noti = null; //조회결과가 저장될 객체
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
      noti = bbsDocumentService.notiQnaList();
    } catch (Exception e) {
      return webHelper.serverError(e);
    }
    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("noti", noti);
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

    // ------------------------------------------------------------------------------------------------------------------------

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

  // ------------------------------------------------------------------------------------------------------------------------

  @GetMapping("/record") // 정비이력 페이지
  public ModelAndView recordboard(Model model,
                                @RequestParam(value="keyword", required = false) String keyword,
                                @RequestParam(value="page", defaultValue = "1") int nowPage){

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

    List<Booking> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Booking input = new Booking();
    input.setName(keyword);
    input.setCarno(keyword);

    try {
      // 전체 게시글 수 조회
      totalCount = bookingService.doneCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      Members.setOffset(pagenation.getOffset());
      Members.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = bookingService.doneList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);

    return new ModelAndView("/board/record/list");
  }

  @GetMapping("/record/add_list") // 공지사항 페이지
  public ModelAndView recordAddList(Model model,
                              @RequestParam(value="keyword", required = false) String keyword,
                              @RequestParam(value="page", defaultValue = "1") int nowPage){

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<Booking> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Booking input = new Booking();
    input.setBooking_date(keyword);
    input.setName(keyword);

    try {
      // 전체 게시글 수 조회
      totalCount = bookingService.yetDoneCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      Members.setOffset(pagenation.getOffset());
      Members.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = bookingService.yetDoneList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);

    return new ModelAndView("/board/record/add_list");
  }

  @GetMapping("/record/add_list.do") // 고객 상세 정보 페이지
  public ModelAndView recordAddListDo(Model model,
                          @RequestParam(value="id", defaultValue = "") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Booking input = new Booking();
    List<Members> tech = null;
    input.setId(id);

    // 조회결과를 저장할 객체 선언
    Booking output = null;

    try {
      //데이터 조회
      output = bookingService.yetDoneItem(input);
      tech = membersService.onlyTech();
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("tech", tech);

    return new ModelAndView("board/record/add");
  }

  @PostMapping("/record/add_ok.do") // 공지사항 페이지
  public ModelAndView recordAddOk(Model model,
                            @RequestParam(value="id") int id,
                            @RequestParam(value="booking_date") String booking_date,
                            @RequestParam(value="booking_time") String booking_time,
                            @RequestParam(value="subject") String subject,
                            @RequestParam(value="content") String content,
                            @RequestParam(value="reg_date") String reg_date,
                            @RequestParam(value="is_done") String is_done,
                            @RequestParam(value="problem") String problem,
                            @RequestParam(value="customer_id") int customer_id,
                            @RequestParam(value="tech_id") int tech_id,
                            @RequestParam(value="writer_name") String writer_name
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

    Booking input = new Booking();
    input.setId(id);
    input.setBooking_date(booking_date);
    input.setBooking_time(booking_time);
    input.setSubject(subject);
    input.setContent(content);
    input.setReg_date(today);
    input.setCustomer_id(customer_id);
    input.setTech_id(tech_id);
    input.setIs_done(is_done);
    input.setProblem(problem);
    input.setWriter_name(writer_name);

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      bookingService.update(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    return webHelper.redirect("/record", "작성이 완료 되었습니다.");
  }

  @GetMapping("/record/read.do") // 고객 상세 정보 페이지
  public ModelAndView recordRead(Model model,
                          @RequestParam(value="id", defaultValue = "") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Booking input = new Booking();
    input.setId(id);

    // 조회결과를 저장할 객체 선언
    Booking output = null;

    try {
      //데이터 조회
      output = bookingService.doneItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);

    return new ModelAndView("board/record/read");
  }

  @GetMapping("/record/edit.do")
  public ModelAndView editRecord(Model model,
                              @RequestParam(value="id") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Booking input = new Booking();
    input.setId(id);

    // 수정할 데이터의 원본 조회하기
    Booking output = null;

    try {
      output = bookingService.doneItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // View 처리
    model.addAttribute("output", output);

    return new ModelAndView("board/record/edit");
  }

  @PostMapping("/record/edit_ok.do")
  public ModelAndView editRecordOk(Model model,
                            @RequestParam(value="id") int id,
                            @RequestParam(value="name") String name,
                            @RequestParam(value="mem_id") String mem_id,
                            @RequestParam(value="mem_pw") String mem_pw,
                            @RequestParam(value="tel") String tel,
                            @RequestParam(value="email") String email,
                            @RequestParam(value="birthdate") String birthdate,
                            @RequestParam(value="carno") String carno,
                            @RequestParam(value="carmo") String carmo,
                            @RequestParam(value="postcode") String postcode,
                            @RequestParam(value="addr1") String addr1,
                            @RequestParam(value="addr2") String addr2,
                            @RequestParam(value="mem_type") String mem_type,
                            @RequestParam(value="is_out") String is_out,
                            @RequestParam(value="reg_date") String reg_date,
                            @RequestParam(value="edit_date") String edit_date){

    String totTel = tel.replace(",", "-");
    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    edit_date = dateTime.format(formatter);      

    try {
      regexHelper.isValue(tel, "연락처를 설정하세요.");
      regexHelper.isValue(email, "이메일을 설정하세요.");
      regexHelper.isValue(birthdate, "생년월일을 설정하세요.");
      regexHelper.isValue(postcode, "우편번호를 설정하세요.");
      regexHelper.isValue(addr1, "기본주소를 설정하세요.");
      regexHelper.isValue(addr2, "상세주소를 설정하세요.");
    } catch (StringFormatException e) {
      return webHelper.badRequest(e);
    }

    //수정할 값들을 Beans에 담는다.
    Members input = new Members();
    input.setId(id);
    input.setName(name);
    input.setMem_type(mem_type);
    input.setMem_id(mem_id);
    input.setMem_pw(mem_pw);
    input.setTel(totTel);
    input.setEmail(email);
    input.setBirthdate(birthdate);
    input.setCarno(carno);
    input.setCarmo(carmo);
    input.setPostcode(postcode);
    input.setAddr1(addr1);
    input.setAddr2(addr2);
    input.setReg_date(reg_date);
    input.setEdit_date(edit_date);
    input.setIs_out(is_out);

    try {
      //데이터 수정
      membersService.update(input);
    }  catch (Exception e) {
      return webHelper.redirect(null, "데이터 수정에 실패했습니다. 관리자에게 문의해주세요.");
    }

    // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
    return webHelper.redirect("/cust/read.do?id=" + input.getId(), "수정 완료");
  }
}
