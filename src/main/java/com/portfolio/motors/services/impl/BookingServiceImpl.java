package com.portfolio.motors.services.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.portfolio.motors.mappers.BookingMapper;
import com.portfolio.motors.models.Booking;
import com.portfolio.motors.services.BookingService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookingServiceImpl implements BookingService{

  private final BookingMapper bookingMapper;
  @Override
  public Booking insert(Booking input) throws NullPointerException, Exception {
    int rows = bookingMapper.insert(input);

    if (rows == 0) {
      throw new NullPointerException("저장된 데이터가 없습니다.");
    }
    return bookingMapper.selectItem(input);
  }

  @Override
  public Booking update(Booking input) throws NullPointerException, Exception {
    int rows = bookingMapper.update(input);

    if (rows == 0) {
      throw new NullPointerException("수정된 데이터가 없습니다.");
    }
    return bookingMapper.selectItem(input);
  }

  @Override
  public void delete(Booking input) throws NullPointerException, Exception {
    Booking booking = new Booking();
    booking.setId(input.getId());
    bookingMapper.delete(booking);

    int rows = bookingMapper.delete(input);

    if(rows == 0){
      throw new NullPointerException("삭제된 데이터가 없습니다.");
    }
  }

  @Override
  public Booking selectItem(Booking input) throws NullPointerException, Exception {
    Booking output = bookingMapper.selectItem(input);

    if(output == null){
      throw new NullPointerException("조회된 데이터가 없습니다.");
    }

    return output;
  }

  @Override
  public List<Booking> selectList(Booking input) throws NullPointerException, Exception {
    return bookingMapper.selectList(input);
  }

  @Override
  public int selectCount(Booking input) throws NullPointerException, Exception {
    return  bookingMapper.selectCount(input);
  }
  
}
