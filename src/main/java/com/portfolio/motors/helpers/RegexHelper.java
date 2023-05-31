package com.portfolio.motors.helpers;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

import com.portfolio.motors.exception.StringFormatException;

@Component
public class RegexHelper {	

	/**
	 * 입력받은 문자열이 공백이거나 null인지 확인
	 * @param st - 검사할 문자열
	 * @param message - 조건 불충분시 표시할 메세지
	 * @throws StringFormatException
	 */
	public void isValue(String st, String message) throws StringFormatException {
		if(st == null || st.trim().equals("")) {
			throw new StringFormatException(message);
		}
	}

	/**
	 * 입력받은 비밀번호 재확인 문자열이 기존의 비밀번호와 같은지 확인
	 * @param st - 기존의 비밀번호
	 * @param stre - 비밀번호 재확인 문자열
	 * @param message - 조건 불충분시 표시할 메세지
	 * @throws StringFormatException
	 */
	public void isSame(String st, String stre, String message) throws StringFormatException {
		if(!st.equals(stre)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력받은 숫자가 0인지 검사
	 * @param num - 검사할 숫자
	 * @param message - 조건 불충분시 표시할 메세지
	 * @throws StringFormatException
	 */
	public void isZero(int num, String message) throws StringFormatException{
		if(num == 0){
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력받은 숫자가 지정된 값보다 작은지를 검사
	 * @param num - 검사할 숫자
	 * @param min - 최소값
	 * @param message - 조건 불충분시 표시할 메세지
	 * @throws StringFormatException
	 */
	public void isUnder(int num, int min, String message) throws StringFormatException {

		if(num < min){
			throw new StringFormatException(message);
		}
	}

	/**
	 * 입력받은 숫자가 지정된 값보다 큰지를 검사
	 * @param num - 검사할 숫자
	 * @param max - 최대값
	 * @param message - 조건 불충분시 표시할 메세지
	 * @throws StringFormatException
	 */
	public void isOver(int num, int max, String message) throws StringFormatException{

		if(num > max){
			throw new StringFormatException(message);
		}
	}

	/**
	 * 입력값이 숫자로만 구성되었는지 검사
	 * @param num - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isNum(String num, String message) throws StringFormatException {
		if(!Pattern.matches("^[0-9]*$", num)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값이 한글로만 구성되었는지 검사
	 * @param kor - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isKor(String kor, String message) throws StringFormatException {
		if(!Pattern.matches("^[ㄱ-ㅎ가-힣]*$", kor)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값이 영어로만 구성되었는지 검사
	 * @param num - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isEng(String eng, String message) throws StringFormatException {
		if(!Pattern.matches("^[a-zA-Z]*$", eng)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값이 한글과숫자로만 구성되었는지 검사
	 * @param korNum - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isKorNum(String korNum, String message) throws StringFormatException {
		if(!Pattern.matches("^[ㄱ-ㅎ가-힣0-9]*$", korNum)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값이 영어와숫자로만 구성되었는지 검사
	 * @param engNum - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringformatException
	 */
	public void isEngNum(String engNum, String message) throws StringFormatException {
		if(!Pattern.matches("^[a-zA-Z0-9]*$", engNum)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값이 이메일 형식으로 구성되었는지 검사
	 * @param email - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isEmail(String email, String message) throws StringFormatException {
		if(!Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", email)) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값이 '-'없이 집전화번호/핸드폰 번호 형식으로 구성되었는지 검사
	 * @param phone - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isPhone(String phone, String message) throws StringFormatException {		
		boolean cellPhone = Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", phone);
		boolean telPhone = Pattern.matches("^\\d{2,3}\\d{3,4}\\d{4}", phone);
		if(!cellPhone && !telPhone) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값의 길이가 12자 이내인지 검사
	 * @param value - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isMaxLength(String value, String message) throws StringFormatException {
		if(value.length() > 16) {
			throw new StringFormatException(message);
		}
	}

	/**
	 * 입력값의 길이가 4자 이상인지 검사
	 * @param value - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isMinLength(String value, String message) throws StringFormatException {
		if(value.length() < 4) {
			throw new StringFormatException(message);
		}
	}

	/**
	 * 입력값의 길이가 10자 이상인지 검사
	 * @param value - 입력값
	 * @param message - 조건 불충분시 발생할 메세지
	 * @throws StringFormatException
	 */
	public void isMinPwLength(String value, String message) throws StringFormatException {
		if(value.length() < 10) {
			throw new StringFormatException(message);
		}
	}
	
	/**
	 * 입력값에 포함되지 말아야 하는 단어가 포함되었는지 검사
	 * @param value - 입력값
	 * @param message - 조건 불충분시 발생한 메세지
	 * @throws StringFormatException
	 */
	public void isAdmin(String value, String message) throws StringFormatException {
		if(value.indexOf("admin") > -1 || value.indexOf("tech") > -1) {
			throw new StringFormatException(message);
		}
	}
}
