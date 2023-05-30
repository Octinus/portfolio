package com.portfolio.motors.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.motors.exception.StringFormatException;
import com.portfolio.motors.helpers.RegexHelper;
import com.portfolio.motors.helpers.WebHelper;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.MembersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
  
  private final MembersService membersService;

  private final WebHelper webHelper;

  private final RegexHelper regexHelper;
  
  @GetMapping("/")  // 홈으로
  public ModelAndView home(){

    return new ModelAndView("home");
  }

  @GetMapping("/introcenter") // 센터 소개
  public ModelAndView introCenter(){

    return new ModelAndView("/intro/center");
  }

  @GetMapping("/introtech") // 정비사 소개
  public ModelAndView introTech(){

    return new ModelAndView("/intro/tech");
  }

  @GetMapping("/login") // 회원가입 페이지
  public ModelAndView login(){

    return new ModelAndView("/home/login");
  }

  @PostMapping("/login_ok") // 로그인 처리 메서드
  public ModelAndView loginOk(HttpServletRequest request,
                              @RequestParam(value="mem_id") String memid,
                              @RequestParam(value="mem_pw") String mempw){

    HttpSession session = request.getSession();

    Members input = new Members();

    Members output = null;

    try{
      regexHelper.isValue(memid, "아이디를 입력하세요.");
      regexHelper.isValue(mempw, "비밀번호를 입력하세요.");
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

    input.setMem_id(memid);
    input.setMem_pw(mempw);
    try {
      output = membersService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }      

    if(!memid.equals("")){
      if(input.getMem_pw().equals(output.getMem_pw())){
        session.setAttribute("login_info", output);
      } else {
        return webHelper.redirect("/login", "비밀번호가 틀렸습니다.");
      }      
    } else {
      session.removeAttribute("login_info");
    }

    return webHelper.redirect("/", "환영합니다");
  }

  @GetMapping("/logout") // 로그아웃
  public ModelAndView logout(HttpServletRequest request){

    HttpSession session = request.getSession();

    session.invalidate();

    return webHelper.redirect("/", "안녕히가세요.");
  }

  @GetMapping("/email") // 메일 문의
  public ModelAndView email(){

    return new ModelAndView("/board/email");
  }

  
}
