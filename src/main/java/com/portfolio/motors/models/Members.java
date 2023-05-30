package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Members {
  private int id;
  private String memType;
  private String memid;
  private String mempw;
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
  private String regDate;
  private String editDate;
  private String whois;
  private String isOut;
}
