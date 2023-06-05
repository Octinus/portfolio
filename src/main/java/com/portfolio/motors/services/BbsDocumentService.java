package com.portfolio.motors.services;

import java.util.List;

import com.portfolio.motors.models.BbsDocument;

public interface BbsDocumentService {
  
  /**
     * 게시판 정보를 새로 저장하고 저장된 정보를 조회하여 리턴한다.
     * 저장된 행의 수가 '0'이거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input - 저장될 정보를 담고 있는 Beans
     * @return - 저장된 데이터
     * @throws NullPointerException - 저장된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public BbsDocument insert(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 게시판 정보를 수정하고, 수정된 정보를 조회하여 리턴한다.
     * 수정 후 영향을 받은 행 수가 없거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input - 수정될 정보를 담고 있는 Beans
     * @return - 수정된 데이터
     * @throws NullPointerException - 수정된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public BbsDocument update(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 게시판 정보는 삭제한다.
     * 이 때, 게시판에 소속되어 있는 학생과 교수도 일괄 삭제한다.
     * 삭제 후 department 테이블에서 영향을 받은 행 수가 없거나,
     * SQL에 에러가 있는 경우는 예외를 발생시켜서
     * 이 메서드를 호출하는 위치에서 try~catch 구문을 강제적으로
     * 사용하도록 throws를 명시한다.
     * 
     * @param input - 삭제될 게시판의 정보를 담고 있는 Beans
     * @return - Void
     * @throws NullPointerException - 삭제된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public void delete(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 게시판 하나의 정보를 조회하여 리턴한다.
     * 
     * @param input - 조회할 대상의 정보를 담고 있는 Beans
     * @return - 조회결과를 담고 있는 Beans
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public BbsDocument selectItem(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 게시판 목록을 조회하여 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 컬렉션
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public List<BbsDocument> selectList(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 게시판 목록의 개수를 조회하여 개수를 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 정수
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL처리에 실패한 경우
     */
    public int selectCount(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 자유게시판 목록을 조회하여 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<BbsDocument> qnaList(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 자유게시판 목록의 개수를 조회하여 개수를 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public int qnaCount(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 공지사항게시판 목록을 조회하여 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<BbsDocument> noticeList(BbsDocument input) throws NullPointerException, Exception;

    /**
     * 공지사항게시판 목록의 개수를 조회하여 개수를 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public int noticeCount(BbsDocument input) throws NullPointerException, Exception;
}
