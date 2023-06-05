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

import com.portfolio.motors.models.BbsDocument;

@Mapper
public interface BbsDocumentMapper {
  
  @Insert("insert into bbs_document(category, subject, content, reg_date, members_id) values(#{category}, #{subject}, #{content}, #{reg_date}, #{members_id})")
  @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
  public int insert(BbsDocument input);

  @Update("update bbs_document set category=#{category}, subject=#{subject}, content=#{content}, reg_date=#{reg_date}, edit_date=#{edit_date}, members_id=#{members_id}")
  public int update(BbsDocument input);

  @Delete("delete from bbs_document where id=#{id}")
  public int delete(BbsDocument input);

  // SELECT문(단일행 조회)을 수행하는 메서드 정의
  @Select("select id, category, subject, content, reg_date, edit_date, members_id from bbs_document where id=#{id}")
  // 조회 결과와 MODEL 객체를 연결하기 위한 규칙 정의
  // -> property : MODEL 객체를 연결하기 위한 규칙 정의
  // -> column : SELECT문에 명시된 필드 이름(AS 옵션을 사용한 경우 별칭으로 명시)
  @Results(id = "myResultId", value = {
          @Result(property = "id", column = "id"),
          @Result(property = "category", column = "category"),
          @Result(property = "subject", column = "subject"), 
          @Result(property = "content", column = "content"), 
          @Result(property = "reg_date", column = "reg_date"),
          @Result(property = "edit_date", column = "edit_date"),
          @Result(property = "members_id", column = "members_id") 
          })
  public BbsDocument selectItem(BbsDocument input);

  // SELECT문(다중행 조회)을 수행하는 메서드 정의
  @Select("<script>" +
          "select id, category, subject, content, reg_date, members_id from bbs_document" +
          "<where>" +
          "<if test='subject != null'>subject like concat('%', #{subject}, '%')</if>" +
          "</where>" +
          "order by id desc" +
          "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
          "</script>")
  // 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
  @ResultMap("myResultId")
  public List<BbsDocument> selectList(BbsDocument input);
  // TODO 질문 제목 관련이면 이거 따로 내용관련 이면 이거 따로 해야하는건가요?

  @Select("<script>" +
          "select count(*) as cnt from bbs_document" +
          "<where>" +
          "<if test='subject != null'>subject like concat('%', #{subject}, '%')</if>" +
          "</where>" +
          "</script>")
  public int selectCount(BbsDocument input);

}
