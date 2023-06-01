package com.portfolio.motors.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.portfolio.motors.models.Booking;

@Mapper
public interface BookingMapper {
  
  @Insert("insert into booking(booking_date, booking_time, subject, content, reg_date, is_done, customer_id, tech_id) " +
          "values(#{booking_date}, #{booking_time}, #{subject}, #{content}, #{reg_date}, #{is_done}, #{customer_id}, #{tech_id})")
  @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
  public int insert(Booking input);

  @Update("update booking set booking_date=#{booking_date}, booking_time=#{booking_time}, subject=#{subject}, content=#{content}, reg_date=#{reg_date},  is_done=#{is_done}, customer_id=#{customer_id}, tech_id=#{tech_id} " +
          "where id=#{id}")
  public int update(Booking input);

  @Delete("delete from booking where id=#{id}")
  public int delete(Booking input);

  // SELECT문(단일행 조회)을 수행하는 메서드 정의
  @Select("<script>" +
          "select booking_date, booking_time, subject, content, reg_date, is_done, customer_id, tech_id from booking " +
          "WHERE id=#{id} " +
          "ORDER BY id DESC LIMIT 0, 1" +
          "</script>")
  // 조회 결과와 MODEL 객체를 연결하기 위한 규칙 정의
  // -> property : MODEL 객체를 연결하기 위한 규칙 정의
  // -> column : SELECT문에 명시된 필드 이름(AS 옵션을 사용한 경우 별칭으로 명시)
  @Results(id = "myResultId", value = {
          @Result(property = "booking_date", column = "booking_date"),
          @Result(property = "booking_time", column = "booking_time"),
          @Result(property = "subject", column = "subject"),
          @Result(property = "content", column = "content"),
          @Result(property = "reg_date", column = "reg_date"),
          @Result(property = "is_done", column = "is_done"),
          @Result(property = "customer_id", column = "customer_id"),
          @Result(property = "tech_id", column = "tech_id")})
  public Booking selectItem(Booking input);

  @Select("<script>" +
          "select booking_date, booking_time, subject, content, reg_date, is_done, customer_id, tech_id from booking " +
          "WHERE booking_date=#{booking_date} and booking_time=#{booking_time} " +
          "ORDER BY id DESC LIMIT 0, 1" +
          "</script>")
  @ResultMap("myResultId")
  public Booking selectCheckDate(Booking input);

  // SELECT문(다중행 조회)을 수행하는 메서드 정의
  @Select("<script>" +
          "select booking_date, booking_time, subject, content, reg_date, is_done, customer_id, tech_id from booking" +
          "<where>" +
          "<if test='name != null'>name like concat('%', #{name}, '%')</if>" +
          "</where>" +
          "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
          "</script>")
  // 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
  @ResultMap("myResultId")
  public List<Booking> selectList(Booking input);

  @Select("select booking_time, carmo, carno, name from booking " +
        "inner join members m on m.id = customer_id and booking_date =#{booking_date}")
// 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
@ResultMap("myResultId")
public List<Booking> selectTodayList(Booking input);

  @Select("<script>" +
          "select count(*) as cnt from booking" +
          "<where>" +
          "<if test='name != null'>name like concat('%', #{name}, '%')</if>" +
          "</where>" +
          "</script>")
  public int selectCount(Booking input);
}
