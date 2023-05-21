package com.portfolio.motors.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
  
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

  @GetMapping("/join") // 회원가입 페이지
  public ModelAndView join(){

    return new ModelAndView("/home/join");
  }

  @GetMapping("/qna") // 자유게시판 페이지
  public ModelAndView qnaboard(){

    return new ModelAndView("/board/qna");
  }

  @GetMapping("/qna.do") // 자유게시판 페이지
  public ModelAndView qna(){

    return new ModelAndView("/board/qnaW");
  }

  @GetMapping("/notice") // 공지사항 페이지
  public ModelAndView noticeboard(){

    return new ModelAndView("/board/notice");
  }

  @GetMapping("/notice.do") // 공지사항 페이지
  public ModelAndView notice(){

    return new ModelAndView("/board/noticeW");
  }

  @GetMapping("/record") // 공지사항 페이지
  public ModelAndView recordboard(){

    return new ModelAndView("/board/record");
  }

  @GetMapping("/record.do") // 공지사항 페이지
  public ModelAndView record(){

    return new ModelAndView("/board/recordW");
  }

  @GetMapping("/email") // 공지사항 페이지
  public ModelAndView email(){

    return new ModelAndView("/board/email");
  }

  @GetMapping("/my") // 나의 정보 페이지
  public ModelAndView my(){

    return new ModelAndView("/mypage/my");
  }

  @GetMapping("/reservation") // 예약 페이지
  public ModelAndView reservation(){

    return new ModelAndView("/mypage/reservation");
  }
}
