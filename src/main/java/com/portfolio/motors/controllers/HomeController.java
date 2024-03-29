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
public class HomeController {

  private final MembersService membersService;

  private final BookingService bookingService;
  
  private final WebHelper webHelper;

  private final RegexHelper regexHelper;

  @GetMapping("/") // 홈으로
  public ModelAndView home(Model model) {

    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String today = dateTime.format(formatter);
    
    List<Booking> output = null; //조회결과가 저장될 객체

    // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
    Booking input = new Booking();
    input.setBooking_date(today);
    try {
      //데이터 조회하기
      output = bookingService.selectTodayList(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    // view 처리
    model.addAttribute("output", output);
    
    return new ModelAndView("home");
  }

  @GetMapping("/introcenter") // 센터 소개
  public ModelAndView introCenter() {

    return new ModelAndView("/intro/center");
  }

  @GetMapping("/introtech") // 정비사 소개
  public ModelAndView introTech() {

    return new ModelAndView("/intro/tech");
  }

  @GetMapping("/login") // 회원가입 페이지
  public ModelAndView login() {

    return new ModelAndView("/home/login");
  }

  @PostMapping("/login_ok") // 로그인 처리 메서드
  public ModelAndView loginOk(HttpServletRequest request,
      @RequestParam(value = "mem_id") String memid,
      @RequestParam(value = "mem_pw") String mempw) {

    HttpSession session = request.getSession();

    try {
      regexHelper.isValue(memid, "아이디를 입력하세요.");
      regexHelper.isValue(mempw, "비밀번호를 입력하세요.");
    } catch (StringFormatException e) {
      return webHelper.badRequest(e);
    }

    Members output = null;
    Members input = new Members();
    input.setMem_id(memid);
    input.setMem_pw(mempw);

    try {
      output = membersService.selectInfoItem(input);
    } catch (Exception e) {
      try {
        output = membersService.selectItem(input);
      } catch (Exception e1) {
        return webHelper.serverError(e);
      }
    }

    if (!input.getMem_pw().equals(output.getMem_pw())) {
      return webHelper.badRequest("비밀번호가 잘못되었습니다.");
    }
    if(output.getIs_out().equals("Y")) {
      return webHelper.badRequest("입력하신 계정 정보가 없습니다.");
    }

    session.setAttribute("login_info", output);
    return webHelper.redirect("/", "환영합니다");
  }

  @GetMapping("/logout") // 로그아웃
  public ModelAndView logout(HttpServletRequest request) {

    HttpSession session = request.getSession();

    session.invalidate();

    return webHelper.redirect("/", "안녕히가세요.");
  }

  @GetMapping("/email") // 메일 문의
  public ModelAndView email() {

    return new ModelAndView("/board/email");
  }

}
