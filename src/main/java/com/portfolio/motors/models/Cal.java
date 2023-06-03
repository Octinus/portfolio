package com.portfolio.motors.models;

import lombok.Data;

@Data
public class Cal {
  private int yy;
  private String mm;
  private int weekCnt;
  private int dayCnt;
  private int first;
  private String[] dayName;
  private int[][] calen;
  private String today;

  public Cal(int yy, String mm, int weekCnt, int dayCnt, int first, String[] dayName, int[][] calen, String today) {
    this.yy = yy;
    this.mm = mm;
    this.weekCnt = weekCnt;
    this.dayCnt = dayCnt;
    this.first = first;
    this.dayName = dayName;
    this.calen = calen;
    this.today = today;
  }
  
}
