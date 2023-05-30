package com.portfolio.motors.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
  
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
}
