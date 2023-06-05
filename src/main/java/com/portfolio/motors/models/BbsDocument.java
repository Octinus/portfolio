package com.portfolio.motors.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbsDocument {
  
  private int id;
  private String category;
  private String writer_pw;
  private String q_type;
  private String subject;
  private String content;
  private String reg_date;
  private String edit_date;
  private String field;

  private int members_id;
  private String name;

  private static int offset;
  private static int listCount;
  
  public static int getOffset() {
    return offset;
  }
  public static void setOffset(int offset) {
    BbsDocument.offset = offset;
  }
  public static int getListCount() {
    return listCount;
  }
  public static void setListCount(int listCount) {
    BbsDocument.listCount = listCount;
  }
}
