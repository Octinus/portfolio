package com.portfolio.motors.services.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.portfolio.motors.mappers.BbsDocumentMapper;
import com.portfolio.motors.models.BbsDocument;
import com.portfolio.motors.services.BbsDocumentService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BbsDocumentServiceImpl implements BbsDocumentService{
  
  private final BbsDocumentMapper bbsDocumentMapper;

  @Override
  public BbsDocument insert(BbsDocument input) throws NullPointerException, Exception {
    int rows = bbsDocumentMapper.insert(input);

    if (rows == 0) {
      throw new NullPointerException("저장된 데이터가 없습니다.");
    }
    return bbsDocumentMapper.selectItem(input);
  }

  @Override
  public BbsDocument update(BbsDocument input) throws NullPointerException, Exception {
    int rows = bbsDocumentMapper.update(input);

    if (rows == 0) {
      throw new NullPointerException("수정된 데이터가 없습니다.");
    }
    return bbsDocumentMapper.selectItem(input);
  }

  @Override
  public void delete(BbsDocument input) throws NullPointerException, Exception {
    BbsDocument output = new BbsDocument();
    output.setId(input.getId());
    bbsDocumentMapper.delete(output);

    int rows = bbsDocumentMapper.delete(input);

    if(rows == 0){
      throw new NullPointerException("삭제된 데이터가 없습니다.");
    }
  }

  @Override
  public BbsDocument selectItem(BbsDocument input) throws NullPointerException, Exception {
    BbsDocument output = bbsDocumentMapper.selectItem(input);

    if(output == null){
      throw new NullPointerException("등록되지 않은 계정입니다.");
    }

    return output;
  }

  @Override
  public List<BbsDocument> selectList(BbsDocument input) throws NullPointerException, Exception {
    return bbsDocumentMapper.selectList(input);
  }

  @Override
  public int selectCount(BbsDocument input) throws NullPointerException, Exception {
    return  bbsDocumentMapper.selectCount(input);
  }

  @Override
  public List<BbsDocument> qnaList(BbsDocument input) throws NullPointerException, Exception {
    return bbsDocumentMapper.qnaList(input);
  }

  @Override
  public int qnaCount(BbsDocument input) throws NullPointerException, Exception {
    return  bbsDocumentMapper.qnaCount(input);
  }

  @Override
  public List<BbsDocument> noticeList(BbsDocument input) throws NullPointerException, Exception {
    return bbsDocumentMapper.noticeList(input);
  }

  @Override
  public int noticeCount(BbsDocument input) throws NullPointerException, Exception {
    return  bbsDocumentMapper.noticeCount(input);
  }
}
