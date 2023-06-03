package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Booking {
  
  private int id;
  private String booking_date;
  private String booking_time;
  private String subject;
  private String content;
  private String reg_date;
  private String is_done;

  private int customer_id; // 참조한 고객 일련번호
  private Integer tech_id; // 참조한 정비사 일련번호

  private String carno;
  private String carmo;
  private String name;
  private String tech_name;

  private static int offset;
  private static int listCount;
  
  public static int getOffset() {
    return offset;
  }
  public static void setOffset(int offset) {
    Booking.offset = offset;
  }
  public static int getListCount() {
    return listCount;
  }
  public static void setListCount(int listCount) {
    Booking.listCount = listCount;
  }
}
