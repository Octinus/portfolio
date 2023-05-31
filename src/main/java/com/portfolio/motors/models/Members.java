package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Members {
  private String id;
  private String mem_type;
  private String mem_id;
  private String mem_pw;
  private String mempwre;
  private String name;
  private String tel;
  private String email;
  private String birthdate;
  private String carno;
  private String carmo;
  private String postcode;
  private String addr1;
  private String addr2;
  private String level;
  private String reg_date;
  private String edit_date;
  private String is_out;

  private static int offset;
  private static int listCount;
  
  public static int getOffset() {
    return offset;
  }
  public static void setOffset(int offset) {
    Members.offset = offset;
  }
  public static int getListCount() {
    return listCount;
  }
  public static void setListCount(int listCount) {
    Members.listCount = listCount;
  }
}
