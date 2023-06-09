package com.portfolio.motors.services;

import java.util.List;

import com.portfolio.motors.models.Booking;

public interface BookingService {
  
  /**
     * 예약 정보를 새로 저장하고 저장된 정보를 조회하여 리턴한다.
     * 저장된 행의 수가 '0'이거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input - 저장될 정보를 담고 있는 Beans
     * @return - 저장된 데이터
     * @throws NullPointerException - 저장된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public Booking insert(Booking input) throws NullPointerException, Exception;

    /**
     * 예약 정보를 수정하고, 수정된 정보를 조회하여 리턴한다.
     * 수정 후 영향을 받은 행 수가 없거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input - 수정될 정보를 담고 있는 Beans
     * @return - 수정된 데이터
     * @throws NullPointerException - 수정된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public Booking update(Booking input) throws NullPointerException, Exception;

    /**
     * 예약 정보를 수정하고, 수정된 정보를 조회하여 리턴한다.
     * 수정 후 영향을 받은 행 수가 없거나, SQL에 에러가 있는 경우는
     * 예외를 발생시켜서, 이 메서드를 호출하는 위치에서 try~catch
     * 구문을 강제적으로 사용하도록 throws를 명시한다.
     * 
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public Booking techUpdate(Booking input) throws NullPointerException, Exception;

    /**
     * 예약 정보는 삭제한다.
     * 이 때, 예약에 소속되어 있는 학생과 예약도 일괄 삭제한다.
     * 삭제 후 Professor 테이블에서 영향을 받은 행 수가 없거나,
     * SQL에 에러가 있는 경우는 예외를 발생시켜서
     * 이 메서드를 호출하는 위치에서 try~catch 구문을 강제적으로
     * 사용하도록 throws를 명시한다.
     * 
     * @param input - 삭제될 예약의 정보를 담고 있는 Beans
     * @return - Void
     * @throws NullPointerException - 삭제된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public void delete(Booking input) throws NullPointerException, Exception;

    /**
     * 예약 하나의 정보를 조회하여 리턴한다.
     * 
     * @param input - 조회할 대상의 정보를 담고 있는 Beans
     * @return - 조회결과를 담고 있는 Beans
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public Booking selectItem(Booking input) throws NullPointerException, Exception;

    /**
     * 작업이 완료 되지 않은 예약 정보 하나를 조회하여 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public Booking yetDoneItem(Booking input) throws NullPointerException, Exception;
    /**
     * 예약시 예약일자의 중복을 확인하여 리턴한다.
     * @param input - 조회할 대상의 정보를 담고 있는 Beans
     * @return - 조회 결과를 담고 있는 Beans
     * @throws Exception - 예약 일자 조회시 이미 예약이 완료된 일자일 경우 
     */
    public Booking checkdate(Booking input) throws Exception;

    /**
     * 예약 목록을 조회하여 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 컬렉션
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception            - SQL처리에 실패한 경우
     */
    public List<Booking> selectList(Booking input) throws NullPointerException, Exception;

    /**
     * 예약 목록의 개수를 조회하여 개수를 리턴한다.
     * 
     * @param input - 검색이 필요한 경우 검색어를 저장하고 있는 Beans
     * @return - 조회결과를 담고 있는 정수
     * @throws NullPointerException - 조회된 데이터가 없는 경우
     * @throws Exception - SQL처리에 실패한 경우
     */
    public int selectCount(Booking input) throws NullPointerException, Exception;

    /**
     * 메인 화면에 보여줄 오늘 날짜의 예약 현황을 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<Booking> selectTodayList(Booking input) throws NullPointerException, Exception;

    /**
     * 해당 하는 날짜의 예약 개수를 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public int todayBookingCount(Booking input) throws NullPointerException, Exception;

    /**
     * 정비사를 배정 받지 못한 예약 현황을 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<Booking> noTechList(Booking input) throws NullPointerException, Exception;

    /**
     * 정비사를 배정 받지 못한 예약 개수를 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public int noTechCount(Booking input) throws NullPointerException, Exception;

    /**
     * 작업이 완료되지 않은 예약 현황을 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<Booking> yetDoneList(Booking input) throws NullPointerException, Exception;

    /**
     * 작업이 완료되지 않은 예약 개수를 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public int yetDoneCount(Booking input) throws NullPointerException, Exception;

    /**
     * 정비 이력 작성이 완료된 예약 한건을 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public Booking doneItem(Booking input) throws NullPointerException, Exception;

    /**
     * 정비 이력 작성이 완료된 예약 현황을 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public List<Booking> doneList(Booking input) throws NullPointerException, Exception;

    /**
     * 정비 이력 작성이 완료된 예약 개수를 리턴한다.
     * @param input
     * @return
     * @throws NullPointerException
     * @throws Exception
     */
    public int doneCount(Booking input) throws NullPointerException, Exception;

    public List<Booking> bookingCount(int year, int month) throws NullPointerException, Exception;
}
