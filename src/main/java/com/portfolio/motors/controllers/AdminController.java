package com.portfolio.motors.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.motors.helpers.Pagenation;
import com.portfolio.motors.helpers.RegexHelper;
import com.portfolio.motors.helpers.WebHelper;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.MembersService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
  
  private final MembersService membersService;

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
  public ModelAndView read(Model model,
                          @RequestParam(value="id", defaultValue = "") String id){

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
  public ModelAndView edit(Model model,
                          @RequestParam(value="id") String id){

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

  @GetMapping("/admin/adReservation") // 예약 관리
  public ModelAndView adReservation() {

    return new ModelAndView("admin/adReservation");
  }
}
