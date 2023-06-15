package com.portfolio.motors.services;

import java.util.List;

import com.portfolio.motors.models.Members;

public interface MembersService {
    
    /**
     * 멤버 정보를 새로 저장하고 저장된 정보를 조회하여 리턴한다.
     * 저장된 행의 수가 '0'이거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input - 저장될 정보를 담고 있는 Beans
     * @return - 저장된 데이터
     * @throws NullPointerException - 저장된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public Members insert(Members input) throws NullPointerException, Exception;

    /**
     * 멤버 정보를 수정하고, 수정된 정보를 조회하여 리턴한다.
     * 수정 후 영향을 받은 행 수가 없거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input - 수정될 정보를 담고 있는 Beans
     * @return - 수정된 데이터
     * @throws NullPointerException - 수정된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public Members update(Members input) throws NullPointerException, Exception;

    /**
     * 맴버의 탈퇴 여부를 'Y'로 수정한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public Members drop(Members input) throws NullPointerException, Exception;
    /**
     * 멤버 정보는 삭제한다.
     * 이 때, 멤버에 소속되어 있는 학생과 멤버도 일괄 삭제한다.
     * 삭제 후 Professor 테이블에서 영향을 받은 행 수가 없거나,
     * SQL에 에러가 있는 경우는 예외를 발생시켜서
     * 이 메서드를 호출하는 위치에서 try~catch 구문을 강제적으로
     * 사용하도록 throws를 명시한다.
     * 
     * @param input - 삭제될 멤버의 정보를 담고 있는 Beans
     * @return - Void
     * @throws NullPointerException - 삭제된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public void delete(Members input) throws NullPointerException, Exception;

    /**
     * 멤버 하나의 정보를 조회하여 리턴한다.
     * 
     * @param input - 조회할 대상의 정보를 담고 있는 Beans
     * @return - 조회결과를 담고 있는 Beans
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public Members selectItem(Members input) throws NullPointerException, Exception;

    /**
     * 
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public Members selectInfoItem(Members input) throws NullPointerException, Exception;

    /**
     * 회원 가입시 아이디의 중복을 확인하여 리턴한다.
     * @param input - 조회할 대상의 정보를 담고 있는 Beans
     * @return - 조회 결과를 담고 있는 Beans
     * @throws Exception - 회원 아이디 조회시 이미 등록되어있는 아이디일 경우 
     */
    public Members checkId(Members input) throws Exception;

    /**
     * 멤버 목록을 조회하여 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 컬렉션
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public List<Members> selectList(Members input) throws NullPointerException, Exception;

    /**
     * 멤버 목록의 개수를 조회하여 개수를 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 정수
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL처리에 실패한 경우
     */
    public int selectCount(Members input) throws NullPointerException, Exception;

    /**
     * 오로지 고객의 목록을 조회하여 리턴한다.
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회 결과를 담고 있는 컬렉션
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL 처리에 실패한 경우
     */
    public List<Members> onlyCustList(Members input) throws NullPointerException, Exception;

    /**
     * 고객 목록의 개수를 조회하여 개수를 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 정수
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL처리에 실패한 경우
     */
    public int onlyCustCount(Members input) throws NullPointerException, Exception;

    /**
     * 오로지 정비사의 목록을 조회하여 리턴한다.
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회 결과를 담고 있는 컬렉션
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL 처리에 실패한 경우
     */
    public List<Members> onlyTechList(Members input) throws NullPointerException, Exception;
    /**
     * 오로지 정비사의 목록을 조회하여 리턴한다.
     * @return - 조회 결과를 담고 있는 컬렉션
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL 처리에 실패한 경우
     */
    public List<Members> onlyTech() throws NullPointerException, Exception;

    /**
     * 오로지 고객의 목록을 조회하여 리턴한다.
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<Members> onlyCust() throws NullPointerException, Exception;

    /**
     * 정비사 목록의 개수를 조회하여 개수를 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 정수
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL처리에 실패한 경우
     */
    public int onlyTechCount(Members input) throws NullPointerException, Exception;
}
