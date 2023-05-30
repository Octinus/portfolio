package com.portfolio.motors.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.motors.helpers.WebHelper;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.MembersService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyController {
  
  private final MembersService membersService;

  private final WebHelper webHelper;
  
  @GetMapping("/my") // 나의 정보 페이지
  public ModelAndView my(){

    return new ModelAndView("/mypage/my");
  }

  @PostMapping("/my_edit_ok")
  public ModelAndView myEditOk(@RequestParam(value="id") int id,
                              @RequestParam(value="name") String name,
                              @RequestParam(value="mem_type") String memType,
                              @RequestParam(value="mem_id") String memid,
                              @RequestParam(value="mem_pw") String mempw,
                              @RequestParam(value="mem_pwre") String mempwre,
                              @RequestParam(value="tel") String tel,
                              @RequestParam(value="birthdate") String birthdate,
                              @RequestParam(value="email") String email,
                              @RequestParam(value="carno") String carno,
                              @RequestParam(value="carmo") String carmo,
                              @RequestParam(value="postcode") String postcode,
                              @RequestParam(value="addr1") String addr1,
                              @RequestParam(value="addr2") String addr2,
                              @RequestParam(value="is_out") String isOut){

    String totTel = tel.replace(",", "-");

    // try{
    //   regexHelper.isValue(mempw, "비밀번호를 입력하세요.");
    //   regexHelper.isMaxLength(mempw, "비밀번호는 16자를 넘을 수 없습니다.");
    //   regexHelper.isMinPwLength(mempw, "비밀번호는 10자 이상이어야 합니다..");
    //   regexHelper.isValue(totTel, "연락처를 입력하세요.");
    //   regexHelper.isValue(email, "E-mail을 입력하세요.");
    //   regexHelper.isEmail(email, "E-mail형식이 잘못되었습니다.");
    //   regexHelper.isValue(birthdate, "생년월일을 입력하세요.");
    //   regexHelper.isValue(carno, "자동차 번호를 입력하세요.");
    //   regexHelper.isValue(carmo, "차종을 입력하세요.");
    //   regexHelper.isValue(postcode, "우편번호를 입력하세요.");
    //   regexHelper.isValue(addr1, "기본주소를 입력하세요.");
    //   regexHelper.isValue(addr2, "상세주소를 입력하세요.");
    // }
    // catch(StringFormatException e){
    //   return webHelper.badRequest(e);
    // }

    Members input = new Members();
    input.setId(id);
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
    input.setIs_out(isOut);

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      membersService.update(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }


    return webHelper.redirect("/my", "회원정보 수정이 완료되었습니다.");
  }

  @GetMapping("/reservation") // 예약 페이지
  public ModelAndView reservation(){

    return new ModelAndView("/mypage/reservation");
  }
}
