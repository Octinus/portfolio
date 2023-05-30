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

    input.setMem_id(memid);
    input.setMem_pw(mempw);
    try {
      output = membersService.selectItem(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }      

    if(!memid.equals("")){
      if(input.getMem_id().equals(output.getMem_pw())){
        session.setAttribute("login_info", input);
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
  
  @GetMapping("/join") // 회원가입 페이지
  public ModelAndView join(){

    return new ModelAndView("/home/join");
  }

  @PostMapping("/join_ok")
  public ModelAndView joinOk(@RequestParam(value="name") String name,
                            @RequestParam(value="mem_type") String memType,
                            @RequestParam(value="mem_id") String memid,
                            @RequestParam(value="mem_pw") String mempw,
                            @RequestParam(value="mem_pwre") String mempwre,
                            @RequestParam(value="tel") String tel,
                            @RequestParam(value="birthdate") String birthdate,
                            @RequestParam(value="email") String email,
                            @RequestParam(value="carno") String carno,
                            @RequestParam(value="carmo") String carmo,
                            @RequestParam(value="postcode") int postcode,
                            @RequestParam(value="addr1") String addr1,
                            @RequestParam(value="addr2") String addr2,
                            @RequestParam(value="reg_date") String regDate,
                            @RequestParam(value="is_out") String isOut){

    String totTel = tel.replace(",", "");

    try{
      regexHelper.isValue(name, "이름을 입력하세요.");
      regexHelper.isKor(name, "이름은 한글만 입력 가능합니다.");
      regexHelper.isAdmin(memid, "아이디에 포함할 수 없는 단어가 포함되어 있습니다.");
      regexHelper.isLength(memid, "아이디는 12자를 넘을 수 없습니다.");
      regexHelper.isValue(email, "E-mail을 입력하세요.");
      regexHelper.isEmail(email, "E-mail형식이 잘못되었습니다.");
      regexHelper.isValue(totTel, "연락처를 입력하세요.");
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

    Members input = new Members();
    input.setName(name);
    input.setMem_type(memType);
    input.setMem_id(memid);
    input.setMem_pw(mempw);
    input.setTel(totTel);
    input.setBirthdate(birthdate);
    input.setEmail(email);
    input.setCarno(carno);
    input.setCarmo(carmo);
    input.setPostcode(postcode);
    input.setAddr1(addr1);
    input.setAddr2(addr2);
    input.setReg_date(regDate);
    input.setIs_out(isOut);

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      membersService.insert(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }
    
    return webHelper.redirect("/", "회원 등록이 완료되었습니다.");
  }
  

  @GetMapping("/email") // 공지사항 페이지
  public ModelAndView email(){

    return new ModelAndView("/board/email");
  }

  
}
