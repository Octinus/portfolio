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

@Insert("insert into bbs_document(category, q_type, subject, content, reg_date, members_id) " +
        "values(#{category}, #{q_type}, #{subject}, #{content}, #{reg_date}, #{members_id})")
@Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
public int insert(BbsDocument input);

@Update("update bbs_document set category=#{category}, subject=#{subject}, content=#{content}, reg_date=#{reg_date}, edit_date=#{edit_date}, members_id=#{members_id} where id=#{id}")
public int update(BbsDocument input);

@Delete("delete from bbs_document where id=#{id}")
public int delete(BbsDocument input);

// SELECT문(단일행 조회)을 수행하는 메서드 정의
@Select("select bbs.id, category, q_type, subject, content, bbs.reg_date, bbs.edit_date, members_id, name from bbs_document bbs inner join members m on members_id = m.id where bbs.id=#{id}")
// 조회 결과와 MODEL 객체를 연결하기 위한 규칙 정의
// -> property : MODEL 객체를 연결하기 위한 규칙 정의
// -> column : SELECT문에 명시된 필드 이름(AS 옵션을 사용한 경우 별칭으로 명시)
@Results(id = "myResultId", value = {
        @Result(property = "id", column = "id"),
        @Result(property = "category", column = "category"),
        @Result(property = "q_type", column = "q_type"),
        @Result(property = "subject", column = "subject"), 
        @Result(property = "content", column = "content"), 
        @Result(property = "reg_date", column = "reg_date"),
        @Result(property = "edit_date", column = "edit_date"),
        @Result(property = "members_id", column = "members_id"),
        @Result(property = "name", column = "name"),
        })
public BbsDocument selectItem(BbsDocument input);

// SELECT문(다중행 조회)을 수행하는 메서드 정의
@Select("<script>" +
        "select id, category, subject, content, reg_date, members_id from bbs_document" +
        "<where>" +
        "<if test='subject != null'>${field} like concat('%', #{subject}, '%')</if>" +
        "<if test='content != null'>or ${field} like concat('%', #{content}, '%')</if>" +
        "</where>" +
        "order by id desc" +
        "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
        "</script>")
// 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
@ResultMap("myResultId")
public List<BbsDocument> selectList(BbsDocument input);

@Select("<script>" +
        "select count(*) as cnt from bbs_document" +
        "<where>" +
        "<if test='subject != null'>${field} like concat('%', #{subject}, '%')</if>" +
        "<if test='content != null'>or ${field} like concat('%', #{content}, '%')</if>" +
        "</where>" +
        "</script>")
public int selectCount(BbsDocument input);

@Select("<script>" +
        "select bbs.id, category, subject, content, bbs.reg_date, members_id, c.name from bbs_document bbs " +
        "inner join members c on c.id = members_id and category = 'N' " +
        "<where>" +
        "<if test='subject != null'>and ${field} like concat('%', #{subject}, '%')</if>" +
        "<if test='content != null'>or ${field} like concat('%', #{content}, '%')</if>" +
        "</where>" +
        "order by id desc" +
        "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
        "</script>")
// 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
@ResultMap("myResultId")
public List<BbsDocument> noticeList(BbsDocument input);

@Select("<script>" +
        "select bbs.id, category, subject, content, bbs.reg_date, members_id, c.name from bbs_document bbs " +
        "inner join members c on c.id = members_id and category = 'N'" +
        "order by id desc limit 0, 3" +
        "</script>")
// 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
@ResultMap("myResultId")
public List<BbsDocument> notiQnaList();

@Select("<script>" +
        "select count(*) as cnt from bbs_document " +
        "<where>" +
        "category = 'N' " +
        "<if test='subject != null'>and (${field} like concat('%', #{subject}, '%')</if>" +
        "<if test='content != null'>or ${field} like concat('%', #{content}, '%'))</if>" +
        "</where>" +
        "</script>")
public int noticeCount(BbsDocument input);

@Select("<script>" +
        "select bbs.id, category, q_type, subject, content, bbs.reg_date, members_id, c.name from bbs_document bbs " +
        "inner join members c on c.id = members_id and category = 'Q' " +
        "<where>" +
        "<if test='subject != null'>and ${field} like concat('%', #{subject}, '%')</if>" +
        "<if test='content != null'>or ${field} like concat('%', #{content}, '%')</if>" +
        "<if test='name != null'>or ${field} like concat('%', #{name}, '%')</if>" +
        "</where>" +
        "order by id desc" +
        "<if test='listCount > 0'>limit #{offset}, #{listCount}</if>" +
        "</script>")
// 조회 결과와 MODEL의 맵핑이 이전 규칙과 동일한 경우 id값으로 이전 규칙을 재사용
@ResultMap("myResultId")
public List<BbsDocument> qnaList(BbsDocument input);

@Select("<script>" +
        "select count(*) as cnt from bbs_document " +
        "inner join members c on c.id = members_id " +
        "<where>" +
        "and category = 'Q' " +
        "<if test='subject != null'>and (${field} like concat('%', #{subject}, '%')</if>" +
        "<if test='content != null'>or ${field} like concat('%', #{content}, '%')</if>" +
        "<if test='name != null'>or ${field} like concat('%', #{name}, '%'))</if>" +
        "</where>" +
        "</script>")
public int qnaCount(BbsDocument input);
}
