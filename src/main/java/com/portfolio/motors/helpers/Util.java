package com.portfolio.motors.helpers;

import org.springframework.stereotype.Component;

/** 
 * 기본적인 공통 기능들을 묶어 놓은 class
 */
@Component
public class Util {
	
	/**
	 * 조건 내에서 랜덤값 구해주는 메소드
	 * @param min - 조건 중 최소값
	 * @param max - 조건 중 최대값
	 * @return - 랜덤 결과값
	 */
	public int random(int min, int max) {
		int num = (int)((Math.random() * (max - min + 1)) + min);
		return num;
	}
}
