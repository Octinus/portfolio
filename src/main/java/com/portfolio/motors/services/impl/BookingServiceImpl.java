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
  public Booking techUpdate(Booking input) throws NullPointerException, Exception {
    int rows = bookingMapper.techUpdate(input);

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

  @Override
  public Booking checkdate(Booking input) throws Exception {
    Booking output = bookingMapper.selectCheckDate(input);

    if(output != null){
      throw new Exception(output.getBooking_date() + " " + output.getBooking_time() + " 는 예약이 완료된 날짜입니다.");
    }

    return output;
  }

  @Override
  public List<Booking> selectTodayList(Booking input) throws NullPointerException, Exception {
    return bookingMapper.selectTodayList(input);
  }

  @Override
  public int todayBookingCount(Booking input) throws NullPointerException, Exception {
    return  bookingMapper.todayBookingCount(input);
  }

  @Override
  public List<Booking> noTechList(Booking input) throws NullPointerException, Exception {
    return bookingMapper.noTechList(input);
  }

  @Override
  public int noTechCount(Booking input) throws NullPointerException, Exception {
    return  bookingMapper.noTechCount(input);
  }

  @Override
  public Booking yetDoneItem(Booking input) throws NullPointerException, Exception {
    Booking output = bookingMapper.yetDoneItem(input);

    if(output == null){
      throw new NullPointerException("조회된 데이터가 없습니다.");
    }

    return output;
  }

  @Override
  public List<Booking> yetDoneList(Booking input) throws NullPointerException, Exception {
    return bookingMapper.yetDoneList(input);
  }

  @Override
  public int yetDoneCount(Booking input) throws NullPointerException, Exception {
    return  bookingMapper.yetDoneCount(input);
  }

  @Override
  public Booking doneItem(Booking input) throws NullPointerException, Exception {
    Booking output = bookingMapper.doneItem(input);

    if(output == null){
      throw new NullPointerException("조회된 데이터가 없습니다.");
    }

    return output;
  }

  @Override
  public List<Booking> doneList(Booking input) throws NullPointerException, Exception {
    return bookingMapper.doneList(input);
  }

  @Override
  public int doneCount(Booking input) throws NullPointerException, Exception {
    return  bookingMapper.yetDoneCount(input);
  }

  @Override
  public List<Booking> bookingCount(int yy, int mm) throws NullPointerException, Exception {
    return  bookingMapper.bookingCount(yy, mm);
  }

  @Override
  public List<Booking> checkTime(Booking input) throws NullPointerException, Exception {
    return bookingMapper.checkTime(input);
  }

}
