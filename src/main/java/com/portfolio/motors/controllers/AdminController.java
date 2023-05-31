package com.portfolio.motors.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
  

  @GetMapping("/admin/adTech") // 홈으로
  public ModelAndView adTech() {

    return new ModelAndView("admin/adTech");
  }

  @GetMapping("/admin/adReservation") // 홈으로
  public ModelAndView adReservation() {

    return new ModelAndView("admin/adReservation");
  }
  
  @GetMapping("/admin/adCust") // 홈으로
  public ModelAndView adCust() {

    return new ModelAndView("admin/adCust");
  }
}
