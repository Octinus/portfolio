package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Booking {
  
  private String id;
  private String booking_date;
  private String booking_time;
  private String subject;
  private String content;
  private String reg_date;

  private String custid; // 참조한 고객 일련번호
  private String techid; // 참조한 정비사 일련번호
}
