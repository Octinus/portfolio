package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Members {
  private int id;
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
  private int postcode;
  private String addr1;
  private String addr2;
  private String level;
  private String reg_date;
  private String edit_date;
  private String who_is;
  private String is_out;
}
