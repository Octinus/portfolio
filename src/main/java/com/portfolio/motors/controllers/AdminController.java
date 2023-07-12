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
import com.portfolio.motors.models.Booking;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.BookingService;
import com.portfolio.motors.services.MembersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
  
  private final MembersService membersService;

  private final BookingService bookingService;

  private final WebHelper webHelper;

  private final RegexHelper regexHelper;

  @GetMapping("/customermanagement") // 고객 관리
  public ModelAndView adCust(Model model,
                            @RequestParam(value="keyword", required = false) String keyword,
                            @RequestParam(value="page", defaultValue = "1") int nowPage) {

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<Members> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Members input = new Members();
    input.setName(keyword);
    input.setMem_id(keyword);

    try {
      // 전체 게시글 수 조회
      totalCount = membersService.onlyCustCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      Members.setOffset(pagenation.getOffset());
      Members.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = membersService.onlyCustList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);
    
    return new ModelAndView("admin/cust/list");
  }

  @GetMapping("/cust/read.do") // 고객 상세 정보 페이지
  public ModelAndView readCust(Model model,
                          @RequestParam(value="id", defaultValue = "") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Members input = new Members();
    input.setId(id);

    // 조회결과를 저장할 객체 선언
    Members output = null;

    try {
      //데이터 조회
      output = membersService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);

    return new ModelAndView("admin/cust/read");
  }

  @GetMapping("/cust/edit.do")
  public ModelAndView editCust(Model model,
                              @RequestParam(value="id") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Members input = new Members();
    input.setId(id);

    // 수정할 데이터의 원본 조회하기
    Members output = null;

    try {
      output = membersService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // View 처리
    model.addAttribute("output", output);

    return new ModelAndView("admin/cust/edit");
  }

  @PostMapping("/cust/edit_ok.do")
  public ModelAndView editCustOk(Model model,
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


  @GetMapping("/techmanagement") // 정비사 관리
  public ModelAndView adTech(Model model,
                            @RequestParam(value="keyword", required = false) String keyword,
                            @RequestParam(value="page", defaultValue = "1") int nowPage) {

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<Members> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Members input = new Members();
    input.setName(keyword);
    input.setLevel(keyword);

    try {
      // 전체 게시글 수 조회
      totalCount = membersService.onlyTechCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      Members.setOffset(pagenation.getOffset());
      Members.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = membersService.onlyTechList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);

    return new ModelAndView("admin/tech/list");
  }

  @GetMapping("/tech/add.do") // 자유게시판 작성 페이지
  public ModelAndView addTech(){

    return new ModelAndView("/admin/tech/add");
  }

  @PostMapping("/tech/add_ok.do") // 자유게시판 작성 액션 페이지
  public ModelAndView addTechOk(@RequestParam(value="name") String name,
                              @RequestParam(value="mem_type") String memType,
                              @RequestParam(value="mem_id") String memid,
                              @RequestParam(value="mem_pw") String mempw,
                              @RequestParam(value="mem_pwre") String mempwre,
                              @RequestParam(value="level") String level,
                              @RequestParam(value="tel") String tel,
                              @RequestParam(value="birthdate") String birthdate,
                              @RequestParam(value="email") String email,
                              @RequestParam(value="postcode") String postcode,
                              @RequestParam(value="addr1") String addr1,
                              @RequestParam(value="addr2") String addr2,
                              @RequestParam(value="reg_date") String regDate,
                              @RequestParam(value="is_out") String isOut){

    String totTel = tel.replace(",", "-");
    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    regDate = dateTime.format(formatter);
    
    try{
      regexHelper.isValue(name, "이름을 입력하세요.");
      regexHelper.isKor(name, "이름은 한글만 입력 가능합니다.");
      regexHelper.isValue(memid, "아이디를 입력하세요.");
      regexHelper.onlyNum(memid, "아이디는 숫자로만 이루어질 수 없습니다.");
      regexHelper.isMaxLength(memid, "아이디는 16자를 넘을 수 없습니다.");
      regexHelper.isMinLength(memid, "아이디는 4자 이상이어야 합니다.");
      regexHelper.isValue(mempw, "비밀번호를 입력하세요.");
      regexHelper.isMaxLength(mempw, "비밀번호는 16자를 넘을 수 없습니다.");
      regexHelper.isMinPwLength(mempw, "비밀번호는 10자 이상이어야 합니다..");
      regexHelper.isValue(mempwre, "비밀번호를 입력하세요.");
      regexHelper.isSame(mempw, mempwre, "비밀번호를 확인해주세요.");
      regexHelper.isValue(level, "등급을 선택하세요.");
      regexHelper.isValue(totTel, "연락처를 입력하세요.");
      regexHelper.isValue(email, "E-mail을 입력하세요.");
      regexHelper.isEmail(email, "E-mail형식이 잘못되었습니다.");
      regexHelper.isValue(birthdate, "생년월일을 입력하세요.");
      regexHelper.isValue(postcode, "우편번호를 입력하세요.");
      regexHelper.isValue(addr1, "기본주소를 입력하세요.");
      regexHelper.isValue(addr2, "상세주소를 입력하세요.");
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

    Members input = new Members();
    input.setName(name);
    input.setMem_type(memType);
    input.setMem_id(memid);
    input.setMem_pw(mempw);
    input.setLevel(level);
    input.setTel(totTel);
    input.setBirthdate(birthdate);
    input.setEmail(email);
    input.setPostcode(postcode);
    input.setAddr1(addr1);
    input.setAddr2(addr2);
    input.setReg_date(regDate);
    input.setIs_out(isOut);

    Members output = null;
    try {
      output = membersService.checkId(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      membersService.insert(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    return webHelper.redirect("/techmanagement", "정비사 추가가 완료 되었습니다.");
  }

  @GetMapping("/tech/read.do") // 정비사 상세 정보 페이지
  public ModelAndView readTech(Model model,
                          @RequestParam(value="id", defaultValue = "") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Members input = new Members();
    input.setId(id);

    // 조회결과를 저장할 객체 선언
    Members output = null;

    try {
      //데이터 조회
      output = membersService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);

    return new ModelAndView("admin/tech/read");
  }

  @GetMapping("/tech/edit.do")
  public ModelAndView editTech(Model model,
                              @RequestParam(value="id") int id){

    // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    Members input = new Members();
    input.setId(id);

    // 수정할 데이터의 원본 조회하기
    Members output = null;

    try {
      output = membersService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // View 처리
    model.addAttribute("output", output);

    return new ModelAndView("admin/tech/edit");
  }

  @PostMapping("/tech/edit_ok.do")
  public ModelAndView editTechOk(Model model,
                            @RequestParam(value="id") int id,
                            @RequestParam(value="name") String name,
                            @RequestParam(value="mem_id") String mem_id,
                            @RequestParam(value="mem_pw") String mem_pw,
                            @RequestParam(value="level") String level,
                            @RequestParam(value="tel") String tel,
                            @RequestParam(value="email") String email,
                            @RequestParam(value="birthdate") String birthdate,
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
      regexHelper.isValue(level, "등급을 설정하세요.");
      regexHelper.isNum(level, "등급은 숫자로만 구성하세요.");
      regexHelper.isValue(level, "등급을 설정하세요.");
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
    input.setLevel(level);
    input.setTel(totTel);
    input.setEmail(email);
    input.setBirthdate(birthdate);
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
    return webHelper.redirect("/tech/read.do?id=" + input.getId(), "수정 완료");
  }

  @GetMapping("/tech/drop.do")
  public ModelAndView deleteTech(Model model,
                            @RequestParam(value="id") int id){

    // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
    Members input = new Members();
    input.setId(id);
    input.setIs_out("Y");

    try {
      membersService.drop(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    return webHelper.redirect("/techmanagement", "정비사 삭제 완료");
  }

  @GetMapping("/reservationmanagement") // 예약 관리
  public ModelAndView adReservation(Model model,
                                  @RequestParam(value="keyword", required = false) String keyword,
                                  @RequestParam(value="page", defaultValue = "1") int nowPage) {

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<Booking> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체
    List<Members> tech = null;

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Booking input = new Booking();
    input.setBooking_date(keyword);
    input.setName(keyword);

    try {
      // 전체 게시글 수 조회
      totalCount = bookingService.noTechCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      Members.setOffset(pagenation.getOffset());
      Members.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = bookingService.noTechList(input);
      tech = membersService.onlyTech();
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("tech", tech);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);

    return new ModelAndView("admin/reservation/list");
  }

  @GetMapping("/reservationmanagement/tot") // 예약 관리
  public ModelAndView adTotReservation(Model model,
                                  @RequestParam(value="keyword", required = false) String keyword,
                                  @RequestParam(value="page", defaultValue = "1") int nowPage) {

    int totalCount = 0; // 전체 게시글 수
    int listCount = 10; // 한 페이지당 표시할 목록 수
    int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
    
    List<Booking> output = null; //조회결과가 저장될 객체
    Pagenation pagenation = null; // 페이지 번호를 계산한 결과가 저장될 객체
    List<Members> tech = null;

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Booking input = new Booking();
    input.setBooking_date(keyword);
    input.setName(keyword);

    try {
      // 전체 게시글 수 조회
      totalCount = bookingService.selectCount(input);
      //페이지 번호 계산 -> 계산결과를 로그로 출력될 것이다.
      pagenation = new Pagenation(nowPage, totalCount, listCount, pageCount);

      //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
      Members.setOffset(pagenation.getOffset());
      Members.setListCount(pagenation.getListCount());

      //데이터 조회하기
      output = bookingService.selectList(input);
      tech = membersService.onlyTech();
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    model.addAttribute("tech", tech);
    model.addAttribute("keyword", keyword);
    model.addAttribute("pagenation", pagenation);

    return new ModelAndView("admin/reservation/list");
  }

  @PostMapping("/reserv/tech_id_edit_ok.do")
  public ModelAndView editTechIdOk(Model model,
                                  @RequestParam(value="id") int id,
                                  @RequestParam(value="tech_id") int tech_id){

    //수정할 값들을 Beans에 담는다.
    Booking input = new Booking();
    input.setId(id);
    input.setTech_id(tech_id);

    try {
      //데이터 수정
      bookingService.techUpdate(input);
    }  catch (Exception e) {
      return webHelper.redirect(null, "데이터 수정에 실패했습니다. 관리자에게 문의해주세요.");
    }

    // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
    return webHelper.redirect("/reservationmanagement", "정비사 배정 완료");
  }

  @GetMapping("/drop")
  public ModelAndView adDrop(){

  }
}
