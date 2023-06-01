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

import com.portfolio.motors.models.Members;

@Mapper
public interface MembersMapper {

        @Insert("insert into members(name, mem_type, mem_id, mem_pw, tel, email, birthdate, carno, carmo, postcode, addr1, addr2, level, reg_date, edit_date, is_out) " +
                "values(#{name}, #{mem_type}, #{mem_id}, #{mem_pw}, #{tel}, #{email}, #{birthdate}, #{carno}, #{carmo}, #{postcode}, #{addr1}, #{addr2}, #{level}, #{reg_date}, #{edit_date}, #{is_out})")
        @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
        public int insert(Members input);

        @Update("update members set name=#{name}, mem_type=#{mem_type}, mem_id=#{mem_id}, mem_pw=#{mem_pw}, tel=#{tel}, email=#{email}, " +
                "birthdate=#{birthdate}, carno=#{carno}, carmo=#{carmo}, postcode=#{postcode}, addr1=#{addr1}, addr2=#{addr2}, level=#{level}, reg_date=#{reg_date}, edit_date=#{edit_date}, is_out=#{is_out} " +
                "where id=#{id}")
        public int update(Members input);

        @Delete("delete from members where id=#{id}")
        public int delete(Members input);

        // SELECT문(단일행 조회)을 수행하는 메서드 정의
        @Select("<script>" +
                "select id, name, mem_type, mem_id, mem_pw, tel, email, birthdate, carno, carmo, postcode, addr1, addr2, level, is_out, reg_date, edit_date from members " +
                "WHERE mem_id=#{mem_id} or id=#{id} " +
                "ORDER BY id DESC LIMIT 0, 1" +
                "</script>")
        // 조회 결과와 MODEL 객체를 연결하기 위한 규칙 정의
        // -> property : MODEL 객체를 연결하기 위한 규칙 정의
        // -> column : SELECT문에 명시된 필드 이름(AS 옵션을 사용한 경우 별칭으로 명시)
        @Results(id = "myResultId", value = {
                @Result(property = "id", column = "id"),
                @Result(property = "name", column = "name"),
                @Result(property = "mem_type", column = "mem_type"),
                @Result(property = "mem_id", column = "mem_id"),
                @Result(property = "mem_pw", column = "mem_pw"),
                @Result(property = "tel", column = "tel"),
                @Result(property = "email", column = "email"),
                @Result(property = "birthdate", column = "birthdate"),
                @Result(property = "carno", column = "carno"),
                @Result(property = "carmo", column = "carmo"),
                @Result(property = "postcode", column = "postcode"),
                @Result(property = "addr1", column = "addr1"),
                @Result(property = "addr2", column = "addr2"),
                @Result(property = "level", column = "level"),
                @Result(property = "is_out", column = "is_out"),
                @Result(property = "reg_date", column = "reg_date"),
                @Result(property = "edit_date", column = "edit_date"),
                @Result(property = "booking-date", column = "booking-date"),
                @Result(property = "booking-date", column = "booking-date"),
                @Result(property = "tech_name", column = "tech_name")
                })
        public Members selectItem(Members input);

        @Select("<script>" +
                "select m.id, name, mem_type, mem_id, mem_pw, tel, email, birthdate, carno, carmo, postcode, addr1, addr2, level, is_out, m.reg_date, edit_date, booking_date, booking_time from members m " +
                "inner join booking on m.id = customer_id " +
                "WHERE mem_id=#{mem_id} or m.id=#{id} " +
                "ORDER BY booking_date DESC LIMIT 0, 1" +
                "</script>")
        @ResultMap("myResultId")
        public Members selectInfoItem(Members input);

        // SELECT문(다중행 조회)을 수행하는 메서드 정의
        @Select("<script>" +
                "select id, name, mem_type, mem_id, mem_pw, tel, email, birthdate, carno, carmo, postcode, addr1, addr2, is_out from members" +
                "<where>" +
                "<if test='name != null'>name like concat('%', #{name}, '%')</if>" +
                "</where>" +
                "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
                "</script>")
        // 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
        @ResultMap("myResultId")
        public List<Members> selectList(Members input);

        @Select("<script>" +
        "select count(*) as cnt from members" +
        "<where>" +
        "<if test='name != null'>name like concat('%', #{name}, '%')</if>" +
        "</where>" +
        "</script>")
        public int selectCount(Members input);

        @Select("<script>" +
                "select id, name, mem_type, mem_id, mem_pw, tel, email, birthdate, carno, carmo, postcode, addr1, addr2, is_out from members " +
                "<where>" +
                "mem_type ='C'" +
                "<if test='name != null'> and (name like concat('%', #{name}, '%')</if>" +
                "<if test='mem_id != null'> or mem_id like concat('%', #{mem_id}, '%'))</if>" +
                "</where>" +
                "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
                "</script>")
        // 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
        @ResultMap("myResultId")
        public List<Members> onlyCustList(Members input);

        @Select("<script>" +
                "select count(*) as cnt from members" +
                "<where>" +
                "mem_type ='C'" +
                "<if test='name != null'> and (name like concat('%', #{name}, '%')</if>" +
                "<if test='mem_id != null'> or mem_id like concat('%', #{mem_id}, '%'))</if>" +
                "</where>" +
                "</script>")
        public int onlyCustCount(Members input);

        @Select("<script>" +
                "select id, name, mem_type, mem_id, mem_pw, tel, email, birthdate, postcode, addr1, addr2, level, is_out from members " +
                "<where>" +
                "mem_type = 'T' " +
                "and is_out = 'N'" +
                "<if test='name != null'> and (name like concat('%', #{name}, '%')</if>" +
                "<if test='level != null'> or level like concat('%', #{level}, '%'))</if>" +
                "</where>" +
                "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
                "</script>")
        // 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
        @ResultMap("myResultId")
        public List<Members> onlyTechList(Members input);

        @Select("<script>" +
                "select count(*) as cnt from members" +
                "<where>" +
                "mem_type ='T' " +
                "and is_out = 'N'" +
                "<if test='name != null'> and (name like concat('%', #{name}, '%')</if>" +
                "<if test='level != null'> or level like concat('%', #{level}, '%'))</if>" +
                "</where>" +
                "</script>")
        public int onlyTechCount(Members input);
}
