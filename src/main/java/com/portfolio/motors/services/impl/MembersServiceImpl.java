package com.portfolio.motors.services.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.portfolio.motors.mappers.MembersMapper;
import com.portfolio.motors.models.Members;
import com.portfolio.motors.services.MembersService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembersServiceImpl implements MembersService{
  
  private final MembersMapper membersMapper;
  
  @Override
  public Members insert(Members input) throws NullPointerException, Exception {
    int rows = membersMapper.insert(input);

    if (rows == 0) {
      throw new NullPointerException("저장된 데이터가 없습니다.");
    }
    return membersMapper.selectItem(input);
  }

  @Override
  public Members update(Members input) throws NullPointerException, Exception {
    int rows = membersMapper.update(input);

    if (rows == 0) {
      throw new NullPointerException("수정된 데이터가 없습니다.");
    }
    return membersMapper.selectItem(input);
  }

  @Override
  public void delete(Members input) throws NullPointerException, Exception {
    Members members = new Members();
    members.setId(input.getId());
    membersMapper.delete(members);

    int rows = membersMapper.delete(input);

    if(rows == 0){
      throw new NullPointerException("삭제된 데이터가 없습니다.");
    }
  }

  @Override
  public Members selectItem(Members input) throws NullPointerException, Exception {
    Members output = membersMapper.selectItem(input);

    if(output == null){
      throw new NullPointerException("조회된 데이터가 없습니다.");
    }

    return output;
  }

  @Override
  public List<Members> selectList(Members input) throws NullPointerException, Exception {
    return membersMapper.selectList(input);
  }

  @Override
  public int selectCount(Members input) throws NullPointerException, Exception {
    return  membersMapper.selectCount(input);
  }
  
}
