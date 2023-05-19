package com.portfolio.motors.helpers;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class RestHelper {
  
  private final HttpServletResponse response;

  /**
   * 전달받은 Map객체에 rt와 pubDate값을 추가한 후 리턴한다.
   * 
   * @param status - Http 결과코드(200, 400, 500)
   * @param message - 결과메세지(성공일 경우 OK, 그 밖의 경우 에러메세지)
   * @param data - JSON으로 변환할 데이터 컬렉션
   * @return Map<String, Object>
   */
  public Map<String, Object> sendJson(int status, String message, Map<String, Object> data){
    
    // 1) JSON형식 출력을 위한 HTTP 헤더 설정
    // JSON 형식임을 명시함
    response.setContentType("application/json");

    // HTTP 상태 코드 설정(200, 400, 500)
    response.setStatus(status);

    //CrossDomain에 의한 접근 허용
    // (보안에 좋지 않기 때문에 이 옵션을 허용할 경우 인증키 등의 보안장치가 필요함)
    // 현재는 실습을 위해 허용함
    response.setHeader("Access-Control-Allow-Mathods", "POST, GET, PUT, DELETE"); // 접근 제어를 허용하는 메서드
    response.setHeader("Access-Control-Max-Age", "3600"); // 3600초 동안 결과가가 나오지 않을 경우 에러로 처리하겠다.
    response.setHeader("Access-Control-Allow-Headers", "x-request-with"); // 요청들어오는 데이터를 허용하겠다.
    response.setHeader("Access-Control-Allow-Origin", "*"); // 모든 Domain으로부터의 접속을 허용하겠다.

    // 2) 파라미터로 전달된 Map 객체에 rt와 pubDate값을 추가한 새로운 Map 생성하기
    // JSON 생성일시를 위한 현재 시각 문자열 만들기 -> JAVA8 이상에서 추가된 기능
    // ex) 2021-05-25T15:00:00.000
    String timestamp = LocalDateTime.now().toString();

    // JSON 구성을 위한 컬렉션 객체 생성
    Map<String, Object> map = new LinkedHashMap<String, Object>();

    // 생성일시 추가
    map.put("timestamp", timestamp);
    // 결과코드 추가
    map.put("status", status);

    if(status != 200){
      switch(status){
        case 404:
          map.put("error", "Page Not Found");
          break;
        case 400:
          map.put("error", "Bad Request");
          break;
        case 500:
          map.put("error", "Server Error");
          break;
        default:
          map.put("error", "Unknown Error");
          break;
      }
    }

    // 메세지 추가
    map.put("message", message);

    // data가 전달되었다면 map에 병합한다.    
    if(data != null){
      map.putAll(data);
    }

    return map;
  }

  /**
   * JSON 형식으로 결과 메세지 리턴하기 위한 메서드 오버로드 HTTP 상태코드는 200으로 설정하고, 결과 메세지는 OK라는 값을
   * 설정하여 getJsonData(int statusCode, String rtm Map<String, Object> data)를 호출한다.
   * 
   * JSON으로 표현하고자 하는 컬렉션이 있을 때 사용하는 가장 일반적은 메서드이다.
   * @param data - data JSON으로 변환할 데이터 컬렉션
   * @return Map<String, Object>
   */
  public Map<String, Object> sendResult(Map<String, Object> data){
    return this.sendJson(200, "OK", data);
  }

  /**
   * JSON 형식으로 결과 메세지 리턴하기 위한 메서드 오버로드 HTTP 상태코드는 200으로 설정하고, 결과 메세지는 OK라는 값을
   * 설정하여 getJsonData(int statusCode, String rtm Map<String, Object> data)를 호출한다.
   * 
   * JSON으로 표현하고자 하는 컬렉션이 없지만 처리 결과는 성공인 경우 사용한다.
   * Ex) 데이터 입력, 수정, 삭제 등을 수행하고 특별히 조회 결과를 반환하지 않을 경우
   * 
   * @return Map<String, Object>
   */
  public Map<String, Object> sendResult(){
    return this.sendJson(200, "OK", null);
  }

  /**
   * JSON 형식으로 에러메세지를 리턴한다. HTTP 상태코드는 500으로 설정하고, 결과 메세지는 파라미터로 전돨되는 값을 설정하여 JSON 문자열을 리턴한다.
   * 
   * @param message - 에러 메세지
   * @return Map<String, Object>
   */
  public Map<String, Object> serverError(String message){
    return this.sendJson(500, message, null);
  }

  /**
   * JSON 형식으로 에러 메세지를 리턴한다. HTTP 상태코드는 500으로 설정하고, 결과 메세지는 에러 객체에 포함된 메세지 내용을 사용하여 전달한다.
   * 
   * @param e - 에러 객체
   * @return Map<String, Object>
   */
  public Map<String, Object> serverError(Exception e){
    return this.sendJson(500, e.getMessage(), null);
  }

  /**
   * JSON 형식으로 잘못된 접근에 대한 경고 메세지를 리턴한다. HTTP 상태코드는 400으로 설정하고, 결과 메세지는 파라미터로 전달되는 값을 설정하여 JSON 문자열을 리턴한다.
   * 파라미터 점검 과정에서 유효성 검증에 통과하지 못한 경우 사용.
   * 
   * @param message - 에러 메세지
   * @return Map<String, Object>
   */
  public Map<String, Object> badRequest(String message){
    return this.sendJson(400, message, null);
  }

  /**
   * JSON 형식으로 잘못된 접근에 대한 경고 메세지를 리턴한다. HTTP 상태코드는 400으로 설정하고, 결과 메세지를 파라미터로 전달되는 값을 설정하여 JSON 문자열을 리턴한다.
   * 파라미터 점검 과정에서 유효성 검증에 통과하지 못한 경우 사용.
   * 
   * @param e - 에러 객체
   * @return Map<String, Object>
   */
  public Map<String, Object> badRequest(Exception e){
    return this.sendJson(400, e.getMessage(), null);
  }
}
