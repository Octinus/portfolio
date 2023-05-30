package com.portfolio.motors.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyController {
  
  @GetMapping("/my") // 나의 정보 페이지
  public ModelAndView my(){

    return new ModelAndView("/mypage/my");
  }

  @GetMapping("/reservation") // 예약 페이지
  public ModelAndView reservation(){

    return new ModelAndView("/mypage/reservation");
  }
}
