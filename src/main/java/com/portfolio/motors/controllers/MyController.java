package com.portfolio.motors.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
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
import com.portfolio.motors.models.Cal;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.BookingService;
import com.portfolio.motors.services.MembersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyController {
  
  private final MembersService membersService;

  private final BookingService bookingService;

  private final WebHelper webHelper;

  private final RegexHelper regexHelper;
  
  @GetMapping("/my") // 나의 정보 페이지
  public ModelAndView my(Model model){

    

    return new ModelAndView("/mypage/my");
  }

  @PostMapping("/myEdit.ok")
  public ModelAndView myEditOk(HttpServletRequest request,
                              @RequestParam(value="id") int id,
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

    HttpSession session = request.getSession();
    
    String totTel = tel.replace(",", "-");

    try{
      regexHelper.isValue(mempw, "비밀번호를 입력하세요.");
      regexHelper.isMaxLength(mempw, "비밀번호는 16자를 넘을 수 없습니다.");
      regexHelper.isMinPwLength(mempw, "비밀번호는 10자 이상이어야 합니다..");
      regexHelper.isValue(mempwre, "비밀번호를 입력하세요.");
      regexHelper.isSame(mempw, mempwre, "비밀번호를 확인해주세요.");
      regexHelper.isValue(totTel, "연락처를 입력하세요.");
      regexHelper.isValue(email, "E-mail을 입력하세요.");
      regexHelper.isEmail(email, "E-mail형식이 잘못되었습니다.");
      regexHelper.isValue(birthdate, "생년월일을 입력하세요.");
      regexHelper.isValue(carno, "자동차 번호를 입력하세요.");
      regexHelper.isValue(carmo, "차종을 입력하세요.");
      regexHelper.isValue(postcode, "우편번호를 입력하세요.");
      regexHelper.isValue(addr1, "기본주소를 입력하세요.");
      regexHelper.isValue(addr2, "상세주소를 입력하세요.");
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

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

    session.setAttribute("login_info", input);
    return webHelper.redirect("/my", input.getName() + "님의 정보 수정이 완료되었습니다.");
  }

  @GetMapping("/my/drop.do")
  public ModelAndView delete(Model model,
                            HttpServletRequest request,
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

    HttpSession session = request.getSession();

    session.invalidate();

    return webHelper.redirect("/", "회원 탈퇴 완료");
  }

  @GetMapping("/reservation") // 예약 페이지
  public ModelAndView reservation(Model model,
                                @RequestParam(value="booking_date", defaultValue="") String booking_date){
    Calendar c = Calendar.getInstance();

    int yy = c.get(Calendar.YEAR);
    int month = c.get(Calendar.MONTH) + 1;
    String mm = String.format("%02d", month);
    int weekCnt = c.getActualMaximum(Calendar.WEEK_OF_MONTH);
    int dayCnt = c.getActualMaximum(Calendar.DAY_OF_MONTH);
    c.set(Calendar.DAY_OF_MONTH, 1);
    int first = c.get(Calendar.DAY_OF_WEEK);
    String[] dayName = { "일", "월", "화", "수", "목", "금", "토" };
    int[][] calen = new int[weekCnt + 1][7];
    int cnt = 1;
    for (int i = 0; i < calen.length; i++) {
        for (int j = 0; j < calen[i].length; j++) {
            if ((i == 0) || (i == 1 && j < first - 1) || cnt > dayCnt) {
              calen[i][j] = 0;
            } else {
              calen[i][j] = cnt++;
            }
        }
    }
    
    LocalDateTime dateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String today = dateTime.format(formatter);

    if(booking_date.length() == 0) {
      booking_date = today;
    }
    
    Cal cal = new Cal(yy, mm, weekCnt, dayCnt, first, dayName, calen, today);
    
    List<Booking> count = null;
    Booking input = new Booking();
    input.setBooking_date(booking_date);
    List<Booking> output = null;

    try {
      count = bookingService.bookingCount(yy, month);
      output = bookingService.checkTime(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }
    
    model.addAttribute("cal", cal);
    model.addAttribute("count", count);
    model.addAttribute("output", output);
    model.addAttribute("input", input);

    return new ModelAndView("/mypage/reservation");
  }

  @PostMapping("/myReservation.ok")
  public ModelAndView reservationOk(@RequestParam(value="booking_date") String booking_date,
                                  @RequestParam(value="booking_time") String booking_time,
                                  @RequestParam(value="problem") String problem,
                                  @RequestParam(value="is_done") String is_done,
                                  @RequestParam(value="customer_id") int customer_id
                                  ){

    try{
      regexHelper.isValue(booking_date, "예약 일자를 선택하세요.");
      regexHelper.isValue(booking_time, "예약 시간을 선택하세요.");
      regexHelper.isValue(problem, "예약 사유를 입력하세요.");
    }
    catch(StringFormatException e){
      return webHelper.badRequest(e);
    }

    Booking input = new Booking();
    input.setCustomer_id(customer_id);
    input.setBooking_date(booking_date);
    input.setBooking_time(booking_time);
    input.setProblem(problem);
    input.setIs_done(is_done);

    Booking output = null;
    try {
      output = bookingService.checkdate(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    try {
      // 데이터 저장 -> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
      bookingService.insert(input);
    } catch (Exception e) {
      return webHelper.serverError(e);
    }

    return webHelper.redirect("/my", input.getBooking_date() + " " +input.getBooking_time() + " 예약이 완료되었습니다.");
  }
}
