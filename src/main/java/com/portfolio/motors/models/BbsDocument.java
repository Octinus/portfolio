package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbsDocument {
  
  private String id;
  private String category;
  private String writer_name;
  private String writer_pw;
  private String subject;
  private String content;
  private String reg_date;
  private String edit_date;
}
