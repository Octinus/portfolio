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
}
